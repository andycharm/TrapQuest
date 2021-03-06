Perception by Monster Framework begins here.

Part 1 - Perception

A monster has a number called favour. The favour of a monster is usually 13. [The favour of an NPC determines when it turns unfriendly.]
A monster has a number called latest-appearance. [The last time the NPC saw the player, what did they look like? We only update this when the player looked worse than before, or the NPC gets bored then rediscovers the player. So flashing an NPC 5 times in quick succession is not any worse than flashing them once.]
A monster has a number called latest-cringe. [The last time the NPC saw the player, how childish did they look?]

perceiving is a number that varies. [We want to suppress some text while we are in the middle of perception.]
 
To FavourReset (M - a monster):
	now the favour of M is the default favour of M.

To decide which number is the default favour of (M - a monster):
	decide on 13.


Chapter 1 - Check Perception

hypno-curtsey-trigger is a number that varies.

To check perception of (M - a monster):
	if M is aware:
		if M is interested:
			if M is uniquely unfriendly and M is normally annoyed, resolve sudden appearance change of M;
		otherwise:
			now M is interested;
			now the last-tripped of M is 0;
			now the last-interaction of M is 0;
			if M is the father:
				calm M;
				say "[BigNameDesc of M] notices you![line break][BigNameDesc of M] seems to be waiting for something..."; [Waiting for you to give birth to their baby]
			otherwise if the scared of M > 0:
				say "[if the class of the player is cheerleader][BigNameDesc of M] notices you and awkwardly starts to move in the other direction.[otherwise if the blue-balls of M > 0 and M is demoness][BigNameDesc of M] scoffs and starts to move in the other direction.[otherwise][BigNameDesc of M] notices you immediately and starts to run away![end if]";
			otherwise if the class of the player is vixen and there is a worn kimono and a random number between 1 and 4 > 1:
				do nothing;
			otherwise:
				compute correct perception of M;
			increase the times-met of M by 1;
			if M is unfriendly:
				now the previous-babification of M is 1;
				now the previous-objectification of M is 1;
			otherwise:
				now the previous-babification of M is the babification of M;
				now the previous-objectification of M is the objectification of M;
			if M is interested:
				[if the class of the player is cheerleader and a random number between 1 and 5 is 1:
					say "Your [printed name of a random worn pink scrunchie] feels warm, and you suddenly have the urge to open your mouth and say whatever comes to mind.";
					try greeting M; Caused some weird interactions with shocked monsters]
				if newbie tips is 1:
					if M is friendly, say "[one of][item style]Newbie tip: You have been noticed by an NPC!  Looks like this one is friendly, which means you could try using 'greet' and 'question' verbs to find out more from them. If thirsty, you could even 'ask [M] [item style]for drink'.[roman type][line break][or][stopping]";
					otherwise say "[one of][item style]Newbie tip: You have been noticed by an NPC!  Looks like this one is unfriendly, which usually always means [he of M] wants to [if diaper quest is 1]babify[otherwise]fuck[end if] you, or at the very least make your life more miserable in some way. You can either fight back with 'slap', 'knee' or 'kick' (you'll need to be standing), or you can run away!  If your delicateness is high enough, there's also a third option, just get on your knees and let it happen... Anyway, if you want to fight back, experiment with the different attacks. At the start of the game, kicking is usually the worst option as you risk falling over and do less damage.[roman type][line break][or][stopping]";
				reset orifice selection of M; [Otherwise they would be biased towards doing the same thing again, which is lame.]
			if hypno-curtsey-trigger is 1 and the player is upright and M is intelligent friendly monster and there is a worn knee-length or longer crotch-in-place clothing:
				let C be a random worn knee-length or longer crotch-in-place clothing;
				say "[bold type]You instinctively grab the sides of your [ShortDesc of C] and begin to curtsey.[roman type][line break]";
				now auto is 1;
				try displacing C;
				now auto is 0;
				if C is crotch-displaced, compute curtsey reaction of M.

To compute correct perception of (M - a monster):
	now the latest-appearance of M is the appearance of the player;
	if diaper quest is 1:
		now the latest-cringe of M is the cringe appearance of the player; [We only want to do that if we're playing DQ oherwise we're wasting CPU cycles]
		compute DQ perception of M;
	otherwise:
		compute perception of M.

To reset orifice selection of (M - a monster):
	now the chosen-orifice of M is nothing;
	now the selection-frustration of M is 0.

To compute DQ perception of (M - a monster):
	compute perception of M.

To resolve sudden appearance change of (M - a monster):
	if the babification of M is 1 and the previous-babification of M is 0:
		compute sudden babification of M; [The NPC is now unfriendly, because the player's appearance has changed. We need to make this obvious to the player by making them say something.]
		now the previous-babification of M is 1;
	otherwise if the objectification of M is 1 and the previous-objectification of M is 0:
		compute sudden objectification of M; [The NPC is now unfriendly, because the player's appearance has changed. We need to make this obvious to the player by making them say something.]
		now the previous-objectification of M is 1.

To compute curtsey reaction of (M - a monster):
	if vagina is exposed or penis is exposed or asshole is exposed or (diaper quest is 1 and there is a worn currently visible diaper):
		if diaper quest is 1, now the babification of M is 1;
		otherwise now the objectification of M is 1;
	if M is uniquely unfriendly and M is normally annoyed:
		resolve sudden appearance change of M;
	otherwise:
		say CurtseyReactionFlav of M;
		if M is unfriendly, say BecomesAggressive of M.

To say CurtseyReactionFlav of (M - a monster):
	if there are worn currently visible knickers:
		say "[BigNameDesc of M] rolls [his of M] eyes.[line break][speech style of M]'Erm, I can see your underwear.'[roman type][line break]";
	otherwise:
		say "[BigNameDesc of M] seems completely unaffected[one of] by your sudden display of submissive humility[or][or][cycling].".

		

Chapter 2 - Aggro Framework

Definition: a monster (called M) is aware:
	if the sleep of M > 0 or the boredom of M > 0, decide no;
	if the player is too high to see, decide no;
	if M is in the location of the player, decide yes;
	if M is nearby and magnetism-elixir-timer > 0, decide yes;
	decide no.

To decide which number is the aggro limit of (M - a monster): [The number at which they turn unfriendly]
	decide on 10.

To DifficultyUp (M - a monster) by (X - a number):
	while X > 0:
		increase the difficulty of M by 1;
		decrease X by 1.
	[if debugmode > 0, say "Now the difficulty of [M] is [the difficulty of M]".]

[This is coded as a loop, MG explained, in case something happens when a monster passes a certain threshold of difficulty(and only when passing that threshold of difficulty)]
To DifficultyDown (M - a monster) by (X - a number):
	while X > 0:
		decrease the difficulty of M by 1;
		decrease X by 1.

[
Aggro Ratings:
BELOW AGGRO LIMIT: Unfriendly
AGGRO LIMIT: Annoyed
AGGRO LIMIT + 2: Acquaintance
AGGRO LIMIT + 4: Buddy
AGGRO LIMIT + 7: Ally
AGGRO LIMIT + 10: Guardian
]

Definition: a monster (called M) is unfriendly:
	if the favour of M <= the aggro limit of M or M is uniquely unfriendly, decide yes;
	decide no.
	
Definition: a monster (called M) is friendly:
	if M is unfriendly, decide no;
	decide yes.

[Selkie: it might be easier to remember, if this was termed temporarily unfriendly?]
Definition: a monster (called M) is uniquely unfriendly: [We can use this to easily specify when a monster is pissed off regardless of usual stats.]
	if M is objectifying the player, decide yes;
	if M is babifying the player, decide yes;
	decide no.

A monster has a number called objectification. [If an NPC is objectifying the player, and that's the only reason they're unfriendly, we want to make this unfriendliness stick for the duration of their interaction. Otherwise, the NPC could start to have sex with the player but then the player's make up fades causing the NPC to suddenly become friendly mid-fuck.]
A monster has a number called previous-objectification. [Similarly, if the NPC is friendly and the player suddenly looks more slutty, we don't want the NPC to become unfriendly without saying something. Tracking whether the NPC was objectifying last turn will help us know when we need to make the NPC say something as they switch to hostile.]

A monster has a number called babification. [Diaper quest version of objectification.]
A monster has a number called previous-babification.

To compute sudden objectification of (M - a monster):
	if M is intelligent:
		if M is raunchy, say "Something seems to change in the way [NameDesc of M] is looking at you. [line break][speech style of M]'[if M is penetrating a body part]Yeah [slut], take it!'[otherwise if the player is monster fucked]You're going to just do that without asking me to join in?!'[otherwise]We should fuck.'[end if][roman type][line break]";
		otherwise say "Something seems to change in the way [NameDesc of M] is looking at you. [line break][speech style of M]'Hmm, I've changed my mind...'[roman type][line break]";
	otherwise:
		say "[BigNameDesc of M] suddenly turns hostile!".

Definition: a monster (called M) is objectifying the player:
	if diaper quest is 1, decide no;
	if M is not interested:
		now the objectification of M is 0;
		decide no;
	if the objectification of M is 1, decide yes;
	if the class of the player is cheerleader, decide no;
	if the bimbo of the player >= 20 or the appearance of the player >= 20 or the appearance of the player > the bimbo tolerance of M:
		now the objectification of M is 1;
		decide yes;
	decide no.

To decide which number is the bimbo tolerance of (M - a monster): [What number of outrage they become immediately unfriendly.]
	if M is wenchy and there is a worn demon codpiece, decide on 1;
	decide on 16.

To decide which number is the outrage tolerance of (M - a monster): [What number of outrage they are unimpressed and lose favour. Set to 20 by default so that it isn't used.]
	decide on 20.
	

To compute sudden babification of (M - a monster):
	if M is intelligent:
		say "Something seems to change in the way [NameDesc of M] is looking at you. [line break][speech style of M]'Aww, you really do look just like a little baby now... I think it's time for me to treat you like one, don't you?'[roman type][line break]";
	otherwise:
		say "[BigNameDesc of M] suddenly turns hostile!".

Definition: a monster (called M) is babifying the player:
	if diaper quest is 0, decide no;
	if M is not interested:
		now the babification of M is 0;
		decide no;
	if the babification of M is 1, decide yes;
	if the bimbo of the player >= 20 or the cringe appearance of the player >= 20 or the cringe appearance of the player > the bab tolerance of M:
		now the babification of M is 1;
		decide yes;
	decide no.

To decide which number is the bab tolerance of (M - a monster): [What number of cringe they become immediately unfriendly.]
	decide on 16.

To decide which number is the cringe tolerance of (M - a monster): [What number of cringe they are unimpressed and lose favour. Set to 20 by default so that it isn't used.]
	decide on 20.

To say BecomesAggressive of (M - a monster):
	say "[big he of M] takes an offensive stance![if M is intelligent][line break][speech style of M]'[one of]There's only one thing for it.'[or]There's only one thing to do, then...'[or]Okay then, let's do this.'[or]You do realise what I'm going to do now, right?'[in random order][roman type][line break][end if]".

Definition: a monster (called M) is outrage disapproving:
	if the outrage tolerance of M < 20: [for efficiency we'll make this check first]
		let A be the appearance of the player;
		let L be the latest-appearance of M;
		now the latest-appearance of M is A;
		if A > L and A > the outrage tolerance of M, decide yes;
	decide no.

Definition: a monster (called M) is cringe disapproving:
	if diaper quest is 1 and the cringe tolerance of M < 20:
		let C be the cringe appearance of the player;
		let L be the latest-cringe of M;
		now the latest-cringe of M is C;
		if C > L and C > the cringe tolerance of M, decide yes;
	decide no.

To check disapproval of (M - a monster):
	if M is outrage disapproving, compute disapproval of M;
	if M is cringe disapproving, compute cringe disapproval of M.

To compute disapproval of (M - a monster):
	FavourDown M;
	say "[DisapprovalFlav of M]";
	if M is unfriendly, say BecomesAggressive of M.

To compute cringe disapproval of (M - a monster):
	FavourDown M;
	say "[CringeDisapprovalFlav of M]";
	if M is unfriendly, say BecomesAggressive of M.

To say DisapprovalFlav of (M - a monster):
	if M is intelligent, say "[BigNameDesc of M] [one of]narrows [his of M] eyes[or]widens [his of M] eyes[or]purses [his of M] lips[or]tuts[in random order].[line break][speech style of M]'[one of]I see, that's how it is.'[or]Wow.'[or]You really are something else...'[or]You're really begging for it, aren't you?'[or]I can't believe what I'm seeing!'[or]Gosh!'[in random order][roman type][line break]";
	otherwise say "[BigNameDesc of M] seems to react badly to your new appearance! ".

To say CringeDisapprovalFlav of (M - a monster):
	if M is intelligent, say "[BigNameDesc of M] [one of]coughs[or]purses [his of M] lips[or]tuts[or]smirks[or]smiles[in random order].[line break][speech style of M]'[one of]Do you realise how childish you look right now?'[or]You're looking more and more like a baby, you know.'[or]An adult wouldn't let me catch [if the player is male]him[otherwise]her[end if] looking like that...'[or]You're really begging to be treated like a child, aren't you?'[or]I can't believe how immature you look right now!'[or]You aren't exactly a beacon of [maturity] right now, you know.'[or]That is NOT how you go about getting me to respect your [maturity].'[or]You're discarding all semblance of [maturity] then, are you?'[in random order][roman type][line break]";
	otherwise say "[BigNameDesc of M] seems to react badly to your new appearance! ".


Section - Aggro Stages

Definition: a monster (called M) is normally annoyed:
	if the favour of M > the aggro limit of M, decide yes;
	decide no.

Definition: a monster (called M) is annoyed:
	if M is unfriendly, decide no;
	if M is normally annoyed, decide yes;
	decide no.

Definition: a monster (called M) is normally acquaintance:
	if the favour of M > the aggro limit of M + 2, decide yes;
	decide no.

Definition: a monster (called M) is acquaintance:
	if M is unfriendly, decide no;
	if M is normally acquaintance, decide yes;
	decide no.

Definition: a monster (called M) is normally buddy:
	if the favour of M > the aggro limit of M + 4, decide yes;
	decide no.

Definition: a monster (called M) is buddy:
	if M is unfriendly, decide no;
	if M is normally buddy, decide yes;
	decide no.

Definition: a monster (called M) is normally ally:
	if the favour of M > the aggro limit of M + 7, decide yes;
	decide no.

Definition: a monster (called M) is ally:
	if M is unfriendly, decide no;
	if M is normally ally, decide yes;
	decide no.

Definition: a monster (called M) is normally guardian:
	if the favour of M > the aggro limit of M + 10, decide yes;
	decide no.

Definition: a monster (called M) is guardian:
	if M is unfriendly, decide no;
	if M is normally guardian, decide yes;
	decide no.

To compute appearance assessment of (M - a monster):
	say "[big he of M] ";
	if M is intelligent, say "looks you up and down.";
	otherwise say "pauses, taking notice of you.".


Chapter 3 - Modifying Aggro

To anger (M - a monster): [This should bring the monster just into unfriendly territory.]
	if the diaper-duration of M > 0, now the diaper-duration of M is the diaper punishment length of M;
	if the favour of M > the aggro limit of M:
		now the favour of M is the aggro limit of M.

To calm (M - a monster): [This should bring the monster just into friendly territory.]
	if the favour of M <= the aggro limit of M:
		now the favour of M is the aggro limit of M + 1.
	
To permanently anger (M - a monster): [This should bring the monster far far into unfriendly territory.]
	now the favour of M is -100.

To FavourUp (M - a monster):
	increase the favour of M by 1.

To FavourDown (M - a monster):
	decrease the favour of M by 1.

To FavourUp (M - a monster) by (N - a number):
	if the class of the player is cheerleader, increase N by 1;
	repeat with X running from 1 to N:
		FavourUp M.
		
To FavourDown (M - a monster) by (N - a number):
	if the class of the player is cheerleader and a random number between 1 and 2 is 1, decrease N by 1;
	if N > 0:
		repeat with X running from 1 to N:
			FavourDown M.


Part 2 - Reflection

[!<shockedMonsters:Integer>*

REQUIRES COMMENTING

*!]
shocked-monsters is a number that varies. [The number of monsters that have noticed the player right now, if the player is humiliated]

[!<arousedMonsters:Integer>*

REQUIRES COMMENTING

*!]
aroused-monsters is a number that varies. [The number of monsters that have noticed the player right now, if the player is aroused]

[!<NumberIsTooHumiliating>+

REQUIRES COMMENTING

+!]
Definition: a number (called N) is too humiliating:
	if N * 2000 > the humiliation of the player + 2000, decide yes;
	decide no.


[!<PersonIsOutraged>+

REQUIRES COMMENTING

+!]
Definition: a person (called P) is outraged:
	update appearance level;
	if calculated-appearance-outrage-level is too humiliating, decide yes;
	decide no.

[!<PersonIsNearlyOutraged>+

REQUIRES COMMENTING

+!]
Definition: a person (called P) is nearly outraged:
	if the humiliation of the player < 20000, decide no;
	if calculated-appearance-outrage-level + 5 is too humiliating, decide yes;
	decide no.


[We use this at the appropriate point during a 'say' command during the perception computation of an intelligent monster to trigger the humiliation and the extra text]
[!<PersonIsSluttilyDressed>+

REQUIRES COMMENTING

+!]
Definition: a person (called P) is sluttily dressed:
	increase shocked-monsters by 1;
	if shocked-monsters > 1:
		say " at the same time, [one of]worsening the situation[or]making the humiliation even worse[or]making you feel even more self-conscious[or]turning you an even brighter shade of red[purely at random]";
		humiliate 50;
		decide yes;
	otherwise if 17 is too humiliating and the player is outraged: [We consider the player no longer embarrassed about appearance after outrage 16]
		say ", which makes you very self-conscious about your [if the number of worn rings > 1 and outrage-target is ring][number of worn rings] rings[otherwise][MediumDesc of appearance-outrage-target][end if]";
		humiliate 10 * appearance-outrage-level;
		if appearance-outrage-level - 4 is too humiliating, say ", and [one of]sends shivers of mortifying humiliation down your spine[or]feel even more nervous about who might be watching you in this awkward situation[or]feel extremely self-conscious[or]feel so uneasy that blood rushes to your head[if the player is upright] and you almost lose your balance[otherwise] and you shudder uncontrollably[end if][or]consumes you with an overwhelming sense of shame[or]find yourself in disbelief that you've allowed yourself to be demeaned like this[or]for a moment feel so bashful and vulnerable that you lose your composure[or]for a moment feel so incredibly shy that you almost want to just hide in a dark corner until the time runs out[or]causes you to cringe with humiliation[in random order]";
		otherwise say ", and [one of]feel a little uneasy[or]causes you to wince with shyness[or]makes your cheeks flush[in random order]";
		decide yes;
	decrease shocked-monsters by 1; [if we're deciding no, then we remove the shocked monster count]
	increase aroused-monsters by 1;
	if aroused-monsters > 1:
		say " at the same time, [one of]making you even more aroused[or]turning you on even more[or]turning you an even brighter shade of red[at random]";
		arouse 100;
		decide yes;
	otherwise if the player is nearly outraged: [The player no longer feels embarrassed about clothing, only aroused at being seen!  But if their clothing is too boring, they won't even be aroused.]
		say ", and you find yourself feeling [one of]thrillingly nervous[or]getting a little [if the player is a bit horny]more [end if]turned on[or]blushing with shyness and pride[or]shivering with nervous excitement[at random] because [he of current-monster] can see your [if the number of worn rings > 1 and outrage-target is ring][number of worn rings] rings[otherwise][MediumDesc of appearance-outrage-target][end if]";
		arouse 25 * appearance-outrage-level;
		decide yes;
	decrease aroused-monsters by 1;
	decide no.


Perception ends here.


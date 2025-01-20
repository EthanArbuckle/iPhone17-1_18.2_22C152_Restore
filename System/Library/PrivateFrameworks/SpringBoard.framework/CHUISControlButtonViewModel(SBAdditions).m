@interface CHUISControlButtonViewModel(SBAdditions)
- (id)sb_actionHintTextWithType:()SBAdditions;
- (id)sb_keyColor;
- (id)sb_secondaryTextColor;
@end

@implementation CHUISControlButtonViewModel(SBAdditions)

- (id)sb_secondaryTextColor
{
  v2 = [a1 tint];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  v5 = v4;

  if ([a1 isAnimating])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v7 = v6;

  return v7;
}

- (id)sb_keyColor
{
  v2 = [a1 tint];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  v5 = v4;

  if (([a1 isAnimating] & 1) != 0 || objc_msgSend(a1, "isLauncher")) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)sb_actionHintTextWithType:()SBAdditions
{
  v5 = [a1 actionHint];
  id v6 = v5;
  if (v5)
  {
    *a3 = 1;
    id v7 = v5;
  }
  else
  {
    if ([a1 isLauncher])
    {
      *a3 = 1;
      v8 = [MEMORY[0x1E4F28B50] mainBundle];
      v9 = [v8 localizedStringForKey:@"CONTROL_OPEN" value:&stru_1F3084718 table:@"SpringBoard"];

      goto LABEL_7;
    }
    *a3 = 0;
    id v7 = [a1 title];
  }
  v9 = v7;
LABEL_7:

  return v9;
}

@end
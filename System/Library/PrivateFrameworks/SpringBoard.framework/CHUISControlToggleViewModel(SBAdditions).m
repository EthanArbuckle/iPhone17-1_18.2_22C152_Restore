@interface CHUISControlToggleViewModel(SBAdditions)
- (id)sb_actionHintTextWithType:()SBAdditions;
- (id)sb_secondaryText;
- (id)sb_secondaryTextColor;
@end

@implementation CHUISControlToggleViewModel(SBAdditions)

- (id)sb_secondaryText
{
  v2 = [a1 subtitle];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    int v5 = [a1 state];
    if (v5) {
      [a1 onOption];
    }
    else {
    v6 = [a1 offOption];
    }
    v7 = [v6 value];
    v8 = v7;
    if (v7)
    {
      id v4 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F28B50] mainBundle];
      v10 = v9;
      if (v5) {
        v11 = @"CONTROL_ON";
      }
      else {
        v11 = @"CONTROL_OFF";
      }
      id v4 = [v9 localizedStringForKey:v11 value:&stru_1F3084718 table:@"SpringBoard"];
    }
  }

  return v4;
}

- (id)sb_secondaryTextColor
{
  int v2 = [a1 state];
  v3 = [a1 onOption];
  id v4 = [v3 tint];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  v7 = v6;

  if (v2)
  {
    id v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F428B8], "sbui_inactiveColor");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)sb_actionHintTextWithType:()SBAdditions
{
  int v5 = [a1 state];
  if (v5) {
    [a1 offOption];
  }
  else {
  id v6 = [a1 onOption];
  }
  v7 = [v6 actionHint];
  id v8 = v7;
  if (v7)
  {
    *a3 = 1;
    id v9 = v7;
  }
  else
  {
    v10 = [v6 value];
    v11 = v10;
    if (v10)
    {
      *a3 = 0;
      id v9 = v10;
    }
    else
    {
      *a3 = 1;
      v12 = [MEMORY[0x1E4F28B50] mainBundle];
      v13 = v12;
      if (v5) {
        v14 = @"TURN_OFF";
      }
      else {
        v14 = @"TURN_ON";
      }
      id v9 = [v12 localizedStringForKey:v14 value:&stru_1F3084718 table:@"SpringBoard"];
    }
  }

  return v9;
}

@end
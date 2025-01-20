@interface SBSUserNotificationColorDefinition(SBUserNotificationColorResolving)
- (id)sb_resolvedColor;
@end

@implementation SBSUserNotificationColorDefinition(SBUserNotificationColorResolving)

- (id)sb_resolvedColor
{
  v2 = [a1 colorName];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F428B8], "sbui_systemColorNamed:", v2);
  }
  else
  {
    v3 = 0;
  }
  v4 = [a1 color];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F428B8];
    [v4 red];
    double v8 = v7;
    [v5 green];
    double v10 = v9;
    [v5 blue];
    double v12 = v11;
    [v5 alpha];
    uint64_t v14 = [v6 colorWithRed:v8 green:v10 blue:v12 alpha:v13];

    v3 = (void *)v14;
  }

  return v3;
}

@end
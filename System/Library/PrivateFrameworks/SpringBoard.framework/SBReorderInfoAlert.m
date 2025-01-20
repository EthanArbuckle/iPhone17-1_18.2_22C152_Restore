@interface SBReorderInfoAlert
- (SBReorderInfoAlert)init;
- (void)didDeactivateForReason:(int)a3;
@end

@implementation SBReorderInfoAlert

- (SBReorderInfoAlert)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBReorderInfoAlert;
  v2 = [(SBAlertItem *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"REORDER_INFO_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
    title = v2->super.super._title;
    v2->super.super._title = (NSString *)v4;

    uint64_t v6 = SBFEffectiveHomeButtonType();
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    v8 = v7;
    if (v6 == 2)
    {
      v9 = @"REORDER_INFO_BODY_NO_HOME_BUTTON";
      v10 = @"Late_Fall_2017_iOS_Strings";
    }
    else
    {
      v9 = @"REORDER_INFO_BODY";
      v10 = @"SpringBoard";
    }
    uint64_t v11 = [v7 localizedStringForKey:v9 value:&stru_1F3084718 table:v10];
    body = v2->super.super._body;
    v2->super.super._body = (NSString *)v11;
  }
  return v2;
}

- (void)didDeactivateForReason:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBReorderInfoAlert;
  -[SBAlertItem didDeactivateForReason:](&v5, sel_didDeactivateForReason_);
  if (SBAlertItemIsUserDeactivate())
  {
    v3 = +[SBDefaults localDefaults];
    uint64_t v4 = [v3 iconDefaults];
    [v4 setDidShowIconReorderAlert:1];
  }
}

@end
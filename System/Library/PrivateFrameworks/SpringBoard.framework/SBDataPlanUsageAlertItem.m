@interface SBDataPlanUsageAlertItem
- (NSNumber)remainingPortion;
- (SBDataPlanUsageAlertItem)initWithAccountURL:(id)a3 usage:(id)a4;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setRemainingPortion:(id)a3;
@end

@implementation SBDataPlanUsageAlertItem

- (SBDataPlanUsageAlertItem)initWithAccountURL:(id)a3 usage:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBDataPlanUsageAlertItem;
  v7 = [(SBDataPlanAccountAlertItem *)&v10 initWithAccountURL:a3];
  v8 = v7;
  if (v7) {
    [(SBDataPlanUsageAlertItem *)v7 setRemainingPortion:v6];
  }

  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SBDataPlanUsageAlertItem;
  [(SBDataPlanAccountAlertItem *)&v16 configure:a3 requirePasscodeForActions:a4];
  v5 = [(SBAlertItem *)self alertController];
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"DATA_PLAN_ADD_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];
  v8 = [(SBDataPlanUsageAlertItem *)self remainingPortion];
  [v8 floatValue];
  float v10 = v9;

  if (v10 <= 0.01)
  {
    v15 = [v6 localizedStringForKey:@"DATA_PLAN_ADD_EMPTY_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    v11 = [v6 localizedStringForKey:@"DATA_PLAN_ADD_LOW_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
    v12 = (void *)SBApp;
    v13 = [(SBDataPlanUsageAlertItem *)self remainingPortion];
    v14 = [v12 formattedPercentStringForNumber:v13];

    v15 = objc_msgSend(NSString, "stringWithFormat:", v11, v14);
  }
  [v5 setMessage:v15];
}

- (NSNumber)remainingPortion
{
  return self->_remainingPortion;
}

- (void)setRemainingPortion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
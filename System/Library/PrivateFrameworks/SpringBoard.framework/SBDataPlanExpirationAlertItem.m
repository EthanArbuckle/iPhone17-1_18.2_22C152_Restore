@interface SBDataPlanExpirationAlertItem
- (NSDate)expirationDate;
- (SBDataPlanExpirationAlertItem)initWithAccountURL:(id)a3 expirationDate:(id)a4;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setExpirationDate:(id)a3;
@end

@implementation SBDataPlanExpirationAlertItem

- (SBDataPlanExpirationAlertItem)initWithAccountURL:(id)a3 expirationDate:(id)a4
{
  id v6 = a4;
  v7 = [(SBDataPlanAccountAlertItem *)self initWithAccountURL:a3];
  v8 = v7;
  if (v7) {
    [(SBDataPlanExpirationAlertItem *)v7 setExpirationDate:v6];
  }

  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SBDataPlanExpirationAlertItem;
  [(SBDataPlanAccountAlertItem *)&v17 configure:a3 requirePasscodeForActions:a4];
  v5 = [(SBAlertItem *)self alertController];
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"DATA_PLAN_ADD_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];
  [(NSDate *)self->_expirationDate timeIntervalSinceNow];
  if (v8 >= 3600.0)
  {
    if (v8 <= 84600.0)
    {
      unint64_t v9 = (unint64_t)fmax(floor(v8 / 3600.0), 1.0);
      v10 = NSString;
      v11 = [MEMORY[0x1E4F28B50] mainBundle];
      v12 = v11;
      v13 = @"DATA_PLAN_ADD_EXPIRATION_BODY_HOURS";
    }
    else
    {
      unint64_t v9 = (unint64_t)fmax(ceil(v8 / 86400.0), 1.0);
      float v14 = -(v8 - (double)v9 * 86400.0) / 86400.0;
      if (v14 >= 0.75)
      {
        --v9;
        v10 = NSString;
        v11 = [MEMORY[0x1E4F28B50] mainBundle];
        v12 = v11;
        v13 = @"DATA_PLAN_ADD_EXPIRATION_BODY_DAYS";
      }
      else
      {
        v10 = NSString;
        v11 = [MEMORY[0x1E4F28B50] mainBundle];
        v12 = v11;
        v13 = @"DATA_PLAN_ADD_EXPIRATION_BODY_LESS_THAN_DAYS";
      }
    }
  }
  else
  {
    unint64_t v9 = vcvtad_u64_f64(fmax(v8 / 60.0, 2.0));
    v10 = NSString;
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = v11;
    v13 = @"DATA_PLAN_ADD_EXPIRATION_BODY_MINUTES";
  }
  v15 = [v11 localizedStringForKey:v13 value:&stru_1F3084718 table:@"SpringBoardPlurals"];
  v16 = objc_msgSend(v10, "localizedStringWithFormat:", v15, v9);

  [v5 setMessage:v16];
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
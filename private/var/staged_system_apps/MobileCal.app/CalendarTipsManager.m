@interface CalendarTipsManager
+ (id)sharedManager;
- (CalendarTipsManager)init;
- (void)addObserversForController:(id)a3 todayButton:(id)a4;
- (void)configureTipsCenter;
- (void)dismissTipDueToUserNavigationWithCompletionBlock:(id)a3;
- (void)donateIsPortraitOrientation:(BOOL)a3;
- (void)donateIsSelectedDateFiveDaysAwayFromToday:(BOOL)a3;
- (void)donateShouldDisplayTip:(BOOL)a3;
- (void)donateTodayButtonPressed;
- (void)updatePresentedControllerTo:(id)a3;
@end

@implementation CalendarTipsManager

- (void)configureTipsCenter
{
  id v2 = +[TipsManager shared];
  [v2 configureTipsCenter];
}

- (void)donateIsPortraitOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TipsManager shared];
  [v4 setIsPortraitOrientationTo:v3];
}

- (void)addObserversForController:(id)a3 todayButton:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TipsManager shared];
  [v7 addTipObserversFor:v6 todayButton:v5];
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023F2C;
  block[3] = &unk_1001D2FA8;
  block[4] = a1;
  if (qword_1002165E8 != -1) {
    dispatch_once(&qword_1002165E8, block);
  }
  id v2 = (void *)qword_1002165E0;

  return v2;
}

- (CalendarTipsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CalendarTipsManager;
  return [(CalendarTipsManager *)&v3 init];
}

- (void)updatePresentedControllerTo:(id)a3
{
  id v3 = a3;
  id v4 = +[TipsManager shared];
  [v4 updatePresentedController:v3];
}

- (void)dismissTipDueToUserNavigationWithCompletionBlock:(id)a3
{
  id v3 = a3;
  id v4 = +[TipsManager shared];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100059E48;
  v6[3] = &unk_1001D3038;
  id v7 = v3;
  id v5 = v3;
  [v4 dismissTipIfPresentedWithCompletionBlock:v6];
}

- (void)donateTodayButtonPressed
{
  id v2 = +[TipsManager shared];
  [v2 jumpToTodayActionPerformed];
}

- (void)donateIsSelectedDateFiveDaysAwayFromToday:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TipsManager shared];
  [v4 setIsSelectedDateFiveDaysAwayFromTodayTo:v3];
}

- (void)donateShouldDisplayTip:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TipsManager shared];
  [v4 setShouldDisplayJumpToTodayTipTo:v3];
}

@end
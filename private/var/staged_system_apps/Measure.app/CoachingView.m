@interface CoachingView
- (void)coachingOverlayViewDidDeactivate:(id)a3;
- (void)coachingOverlayViewDidRequestSessionReset:(id)a3;
- (void)coachingOverlayViewWillActivate:(id)a3;
@end

@implementation CoachingView

- (void)coachingOverlayViewWillActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004CB60();
}

- (void)coachingOverlayViewDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004CD20();
}

- (void)coachingOverlayViewDidRequestSessionReset:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004CEA8();
}

@end
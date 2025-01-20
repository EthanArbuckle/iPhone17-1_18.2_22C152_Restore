@interface TTRIRemindersListRouter
- (void)popPresentedViewController;
@end

@implementation TTRIRemindersListRouter

- (void)popPresentedViewController
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = (void *)Strong;
    swift_retain();
    id v4 = [v3 presentedViewController];

    if (v4)
    {
      [v4 dismissViewControllerAnimated:1 completion:0];
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

@end
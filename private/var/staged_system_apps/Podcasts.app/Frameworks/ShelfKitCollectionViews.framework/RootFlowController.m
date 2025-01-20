@interface RootFlowController
- (void)dismissWrappedControllerFrom:(id)a3;
@end

@implementation RootFlowController

- (void)dismissWrappedControllerFrom:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (id)Strong;
    id v5 = a3;
    swift_retain();
    [v6 dismissViewControllerAnimated:1 completion:0];

    swift_release();
  }
}

@end
@interface WFAddToHomeScreenActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIViewController)activityViewController;
- (WFAddToHomeScreenActivity)init;
- (WFAddToHomeScreenActivity)initWithReference:(id)a3;
- (id)_systemImageName;
- (void)activityDidFinish:(BOOL)a3;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation WFAddToHomeScreenActivity

- (WFAddToHomeScreenActivity)initWithReference:(id)a3
{
  return (WFAddToHomeScreenActivity *)AddToHomeScreenActivity.init(reference:)((uint64_t)a3);
}

- (NSString)activityType
{
  v2 = AddToHomeScreenActivity.activityType.getter();
  return (NSString *)v2;
}

- (NSString)activityTitle
{
  v2 = self;
  AddToHomeScreenActivity.activityTitle.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)_systemImageName
{
  v2 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  sub_22DC92B48();
  swift_bridgeObjectRelease();
}

- (UIViewController)activityViewController
{
  v2 = self;
  id v3 = AddToHomeScreenActivity.activityViewController.getter();

  return (UIViewController *)v3;
}

- (void)activityDidFinish:(BOOL)a3
{
  id v3 = self;
  AddToHomeScreenActivity.activityDidFinish(_:)(0);
}

- (WFAddToHomeScreenActivity)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WFAddToHomeScreenActivity_viewController);
}

@end
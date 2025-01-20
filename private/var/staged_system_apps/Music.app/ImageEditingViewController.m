@interface ImageEditingViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC11MusicCoreUI26ImageEditingViewController)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI26ImageEditingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC11MusicCoreUI26ImageEditingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11MusicCoreUI26ImageEditingViewController)initWithRootViewController:(id)a3;
@end

@implementation ImageEditingViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC11MusicCoreUI26ImageEditingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ImageEditingViewController();
  return [(ImageEditingViewController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC11MusicCoreUI26ImageEditingViewController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImageEditingViewController();
  return [(ImageEditingViewController *)&v5 initWithRootViewController:a3];
}

- (_TtC11MusicCoreUI26ImageEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ImageEditingViewController();
  v9 = [(ImageEditingViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC11MusicCoreUI26ImageEditingViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImageEditingViewController();
  return [(ImageEditingViewController *)&v5 initWithCoder:a3];
}

@end
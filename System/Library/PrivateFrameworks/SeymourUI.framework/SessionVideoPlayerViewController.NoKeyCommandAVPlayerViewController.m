@interface SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController
- (NSArray)keyCommands;
- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithCoder:(id)a3;
- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithPlayerLayerView:(id)a3;
@end

@implementation SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController

- (NSArray)keyCommands
{
  return (NSArray *)0;
}

- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_23A7FF988();
    id v6 = a4;
    v7 = (void *)sub_23A7FF948();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController();
  v9 = [(SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController();
  return [(SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController *)&v5 initWithCoder:a3];
}

- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController();
  return [(SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController *)&v5 initWithPlayerLayerView:a3];
}

@end
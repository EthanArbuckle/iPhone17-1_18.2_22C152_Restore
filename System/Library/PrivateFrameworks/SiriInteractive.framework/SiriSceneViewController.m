@interface SiriSceneViewController
- (_TtC15SiriInteractive23SiriSceneViewController)initWithCoder:(id)a3;
- (_TtC15SiriInteractive23SiriSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SiriSceneViewController

- (_TtC15SiriInteractive23SiriSceneViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25C993F44();
}

- (void)viewDidLoad
{
  v2 = self;
  SiriSceneViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SiriSceneViewController.viewDidLayoutSubviews()();
}

- (_TtC15SiriInteractive23SiriSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_25C9B8150();
  }
  id v5 = a4;
  SiriSceneViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
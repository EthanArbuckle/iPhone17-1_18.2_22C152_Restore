@interface PageHeaderContentViewController
- (_TtC16MusicApplication31PageHeaderContentViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication31PageHeaderContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PageHeaderContentViewController

- (_TtC16MusicApplication31PageHeaderContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  v9 = sub_368B18(v5, v7, (uint64_t)a4);

  return (_TtC16MusicApplication31PageHeaderContentViewController *)v9;
}

- (_TtC16MusicApplication31PageHeaderContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication31PageHeaderContentViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)loadView
{
  v2 = self;
  PageHeaderContentViewController.loadView()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  PageHeaderContentViewController.viewDidLayoutSubviews()();
}

- (void)viewDidLoad
{
  v2 = self;
  PageHeaderContentViewController.viewDidLoad()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  uint64_t v7 = v6;
  v9.value.super.isa = (Class)a3;
  PageHeaderContentViewController.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_pageHeaderContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_accessoryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end
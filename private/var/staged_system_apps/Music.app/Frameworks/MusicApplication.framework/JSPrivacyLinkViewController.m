@interface JSPrivacyLinkViewController
- (_TtC16MusicApplication27JSPrivacyLinkViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27JSPrivacyLinkViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)systemLayoutFittingSizeDidChangeForChildViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation JSPrivacyLinkViewController

- (_TtC16MusicApplication27JSPrivacyLinkViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSPrivacyLinkViewController_privacyLinkViewController) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication27JSPrivacyLinkViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  JSPrivacyLinkViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  JSPrivacyLinkViewController.viewDidLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[JSPrivacyLinkViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_4A2198;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_DCCD8;
  v11[3] = &block_descriptor_7_0;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.isa = (Class)a3;
  JSPrivacyLinkViewController.traitCollectionDidChange(_:)(v9);
}

- (void)systemLayoutFittingSizeDidChangeForChildViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(JSPrivacyLinkViewController *)&v6 systemLayoutFittingSizeDidChangeForChildViewController:v4];
  sub_4A1884();
}

- (_TtC16MusicApplication27JSPrivacyLinkViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication27JSPrivacyLinkViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSPrivacyLinkViewController_privacyLinkViewModel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication27JSPrivacyLinkViewController_privacyLinkViewController);
}

@end
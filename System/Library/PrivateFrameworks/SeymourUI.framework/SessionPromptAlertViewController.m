@interface SessionPromptAlertViewController
- (_TtC9SeymourUI32SessionPromptAlertViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI32SessionPromptAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)burnbarOffButtonTapped;
- (void)burnbarOnButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation SessionPromptAlertViewController

- (_TtC9SeymourUI32SessionPromptAlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EDF04C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239EDCB4C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_239EDCF20(a3);
}

- (void)burnbarOnButtonTapped
{
  v2 = self;
  sub_239EDD9C4();
}

- (void)burnbarOffButtonTapped
{
  v2 = self;
  sub_239EDDA38();
}

- (_TtC9SeymourUI32SessionPromptAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI32SessionPromptAlertViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_featureView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_primaryPhoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_secondaryPhoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_primaryTVButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_secondaryTVButton));
  long long v3 = *(_OWORD *)((char *)&self->super._editButtonItem
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[12] = *(_OWORD *)((char *)&self->super._savedHeaderSuperview
                      + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[13] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super._modalTransitionStyle
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[14] = *(_OWORD *)((char *)&self->super._searchDisplayController
                      + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[15] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._dimmingView
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[9] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super._externalObjectsTableForViewLoading
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[10] = *(_OWORD *)((char *)&self->super._currentAction
                      + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[11] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super._title
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[4] = *(_OWORD *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[5] = v7;
  long long v8 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[6] = *(_OWORD *)((char *)&self->super._nibBundle
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[7] = v8;
  long long v9 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[1] = v9;
  long long v10 = *(_OWORD *)((char *)&self->super._tab
                  + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[2] = *(_OWORD *)((char *)&self->super._view
                     + OBJC_IVAR____TtC9SeymourUI32SessionPromptAlertViewController_styleProvider);
  v11[3] = v10;
  sub_239EDF870((uint64_t)v11);
}

@end
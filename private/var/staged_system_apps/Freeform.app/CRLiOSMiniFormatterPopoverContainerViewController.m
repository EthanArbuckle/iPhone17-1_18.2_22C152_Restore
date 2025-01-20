@interface CRLiOSMiniFormatterPopoverContainerViewController
- (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController)initWithCoder:(id)a3;
- (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CRLiOSMiniFormatterPopoverContainerViewController

- (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_builder) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_widthAnchorConstraint) = 0;
  id v4 = a3;

  result = (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  id v4 = self;
  id v5 = [v3 init];
  [(CRLiOSMiniFormatterPopoverContainerViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100656D34();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterPopoverContainerViewController();
  id v4 = (char *)v9.receiver;
  [(CRLiOSMiniFormatterPopoverContainerViewController *)&v9 viewDidDisappear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_delegate])
  {
    uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_delegate + 8];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = *(void *)(v5 + 8);
    v8 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    swift_unknownObjectRetain();
    v8(v4, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterPopoverContainerViewController();
  swift_unknownObjectRetain();
  id v7 = v10.receiver;
  -[CRLiOSMiniFormatterPopoverContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = [v7 view];
  if (v8)
  {
    objc_super v9 = v8;
    [v8 setNeedsLayout];
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100657940();
}

- (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_contentView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_builder));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_widthAnchorConstraint);
}

@end
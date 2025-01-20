@interface FMNoLocationCalloutViewController
- (_TtC6FindMy33FMNoLocationCalloutViewController)init;
- (_TtC6FindMy33FMNoLocationCalloutViewController)initWithCoder:(id)a3;
- (_TtC6FindMy33FMNoLocationCalloutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)infoButtonPressed;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation FMNoLocationCalloutViewController

- (_TtC6FindMy33FMNoLocationCalloutViewController)init
{
  return (_TtC6FindMy33FMNoLocationCalloutViewController *)sub_100414A30();
}

- (_TtC6FindMy33FMNoLocationCalloutViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100416170();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMNoLocationCalloutViewController();
  id v2 = v3.receiver;
  [(FMNoLocationCalloutViewController *)&v3 viewDidLoad];
  sub_100414D88();
  sub_100415284();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_100414C30();
}

- (void)infoButtonPressed
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy33FMNoLocationCalloutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy33FMNoLocationCalloutViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_popoverView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_calloutView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_blurredBackground);
}

@end
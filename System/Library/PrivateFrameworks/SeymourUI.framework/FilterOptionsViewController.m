@interface FilterOptionsViewController
- (UILabel)subtitleLabel;
- (_TtC9SeymourUI27FilterOptionsViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI27FilterOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)onCancel;
- (void)onDone;
- (void)textSizeChanged:(id)a3;
- (void)updateTitleView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FilterOptionsViewController

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_subtitleLabel));
}

- (_TtC9SeymourUI27FilterOptionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A0240AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A021710();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A021D74(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A022008(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilterOptionsViewController();
  id v2 = v3.receiver;
  [(FilterOptionsViewController *)&v3 viewDidLayoutSubviews];
  sub_23A0223F4();
}

- (void)updateTitleView
{
  id v2 = self;
  sub_23A0221A8();
}

- (void)onDone
{
  id v2 = self;
  sub_23A02259C();
}

- (void)onCancel
{
  id v2 = self;
  sub_23A023114();
}

- (void)textSizeChanged:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  v8 = self;
  sub_23A0223F4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI27FilterOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI27FilterOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_titleLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_subtitleLabel);
}

@end
@interface MetadataEntriesView
- (BOOL)canBecomeFocused;
- (UIView)viewForFirstBaselineLayout;
- (UIView)viewForLastBaselineLayout;
- (_TtC9SeymourUI19MetadataEntriesView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19MetadataEntriesView)initWithFrame:(CGRect)a3;
@end

@implementation MetadataEntriesView

- (UIView)viewForFirstBaselineLayout
{
  v2 = self;
  sub_23A7AEE24();
  v4 = v3;

  return (UIView *)v4;
}

- (UIView)viewForLastBaselineLayout
{
  v2 = self;
  v3 = (void *)sub_23A7AEFAC();

  return (UIView *)v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (_TtC9SeymourUI19MetadataEntriesView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19MetadataEntriesView *)sub_23A7AF110(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19MetadataEntriesView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7AF850();
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19MetadataEntriesView_actionHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19MetadataEntriesView_stackView);
}

@end
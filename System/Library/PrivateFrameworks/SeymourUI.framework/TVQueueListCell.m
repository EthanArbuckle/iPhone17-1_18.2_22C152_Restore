@interface TVQueueListCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI15TVQueueListCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI15TVQueueListCell)initWithFrame:(CGRect)a3;
- (void)handleDelete;
- (void)handleGrab;
- (void)prepareForReuse;
@end

@implementation TVQueueListCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  sub_239F6FDC4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v2 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_TtC9SeymourUI15TVQueueListCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI15TVQueueListCell *)sub_239F6FF9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI15TVQueueListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F71F28();
}

- (void)handleGrab
{
  v2 = self;
  sub_239F70EAC();
}

- (void)handleDelete
{
  v2 = self;
  sub_239F7102C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239F71194();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_deleteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_grabButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_focusGuide);
}

@end
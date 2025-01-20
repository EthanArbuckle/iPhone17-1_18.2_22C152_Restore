@interface TVQueueEmptyListCell
- (_TtC9SeymourUI20TVQueueEmptyListCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI20TVQueueEmptyListCell)initWithFrame:(CGRect)a3;
@end

@implementation TVQueueEmptyListCell

- (_TtC9SeymourUI20TVQueueEmptyListCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20TVQueueEmptyListCell *)sub_23A17F9A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20TVQueueEmptyListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A18093C();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_secondaryLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_separator);
}

@end
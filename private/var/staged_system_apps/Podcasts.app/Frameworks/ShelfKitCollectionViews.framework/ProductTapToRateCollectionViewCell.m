@interface ProductTapToRateCollectionViewCell
- (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)ratingChangedWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductTapToRateCollectionViewCell

- (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell *)sub_1BE914(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)ratingChangedWithSender:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_385640();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1BF0CC();

  sub_E544((uint64_t)v6, &qword_472710);
}

- (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0560();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ProductTapToRateCollectionViewCell *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  sub_1BF00C(v6);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_ratingControl));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_stackView);
}

@end
@interface ProductReviewActionsCell
- (_TtC23ShelfKitCollectionViews24ProductReviewActionsCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews24ProductReviewActionsCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)supportWithSender:(id)a3;
- (void)tintColorDidChange;
- (void)writeReviewWithSender:(id)a3;
@end

@implementation ProductReviewActionsCell

- (_TtC23ShelfKitCollectionViews24ProductReviewActionsCell)initWithFrame:(CGRect)a3
{
  sub_21616C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(ProductReviewActionsCell *)&v5 tintColorDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_writeReviewButton];
  id v4 = [v2 tintColor];
  [v3 setTitleColor:v4 forState:0];
}

- (_TtC23ShelfKitCollectionViews24ProductReviewActionsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_217950();
}

- (void)writeReviewWithSender:(id)a3
{
}

- (void)supportWithSender:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_216BB8();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_writeReviewButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_supportButton));

  swift_release();
}

@end
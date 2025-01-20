@interface BaseTodayCardCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC8AppStore31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BaseTodayCardCollectionViewCell

- (void)layoutSubviews
{
  v2 = self;
  sub_100039A44();
}

- (_TtC8AppStore31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31BaseTodayCardCollectionViewCell *)sub_10004A788(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (_TtC8AppStore31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10050FE18();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10050DE78();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_10050E550((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_shadowView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_pageGrid, (uint64_t *)&unk_100983860);
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end
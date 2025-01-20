@interface VideoCardCollectionViewCell
- (_TtC8AppStore27VideoCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCardCollectionViewCell

- (_TtC8AppStore27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27VideoCardCollectionViewCell *)sub_1001D5A2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27VideoCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D68E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001D6068();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(VideoCardCollectionViewCell *)&v3 prepareForReuse];
  sub_10022F308();
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_videoCardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_avatarShowcase));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_shadowView);
}

@end
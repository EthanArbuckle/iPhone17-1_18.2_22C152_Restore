@interface CondensedAdLockupWithIconBackgroundCollectionViewCell
- (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CondensedAdLockupWithIconBackgroundCollectionViewCell

- (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell *)sub_1005672E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005684D4();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(CondensedAdLockupWithIconBackgroundCollectionViewCell *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_shadowView];
  [v2 bounds];
  [v3 setFrame:];
  v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView];
  [v2 bounds];
  [v4 setFrame:];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(CondensedAdLockupWithIconBackgroundCollectionViewCell *)&v4 prepareForReuse];
  ArtworkView.image.setter();
  id v3 = &v2[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess();
  *(void *)id v3 = 0;

  swift_release();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_shadowView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end
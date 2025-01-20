@interface MediumAdLockupWithScreenshotsBackgroundCollectionViewCell
- (_TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MediumAdLockupWithScreenshotsBackgroundCollectionViewCell

- (_TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)sub_1004E25F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004E3474();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView];
  [v2 bounds];
  [v3 setFrame:];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)&v4 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess();
  *(void *)id v3 = 0;

  swift_release();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self+ OBJC_IVAR____TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end
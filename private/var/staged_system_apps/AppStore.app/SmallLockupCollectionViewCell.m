@interface SmallLockupCollectionViewCell
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore29SmallLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallLockupCollectionViewCell

- (_TtC8AppStore29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29SmallLockupCollectionViewCell *)sub_100311978(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100312FC4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003123B0();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(SmallLockupCollectionViewCell *)&v5 prepareForReuse];
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC8AppStore14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v6, v4);
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_separatorView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_separator, (uint64_t *)&unk_1009A3840);
}

@end
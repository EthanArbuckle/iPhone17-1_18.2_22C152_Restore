@interface MixedMediaLockupCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel;
- (_TtC8AppStore15LockupMediaView)accessibilityMediaView;
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC8AppStore9VideoView)accessibilityVideoView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MixedMediaLockupCollectionViewCell

- (_TtC8AppStore34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34MixedMediaLockupCollectionViewCell *)sub_10014551C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001468EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100145BF4();
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8AppStore9VideoView *)Strong;
}

- (_TtC8AppStore15LockupMediaView)accessibilityMediaView
{
  return (_TtC8AppStore15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView));
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(MixedMediaLockupCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView];
  sub_100225FBC();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_100984688);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton);
}

@end
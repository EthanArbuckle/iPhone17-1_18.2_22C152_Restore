@interface InAppPurchaseLockupCollectionViewCell
- (_TtC8AppStore23InAppPurchaseLockupView)accessibilityLockupView;
- (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppPurchaseLockupCollectionViewCell

- (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell *)sub_1000CF5F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_spotlightView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separatorView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separator;
  uint64_t v8 = type metadata accessor for Separator();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_isPartOfSpotlightShelf) = 0;
  id v9 = a3;

  result = (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000D0244();
}

- (_TtC8AppStore23InAppPurchaseLockupView)accessibilityLockupView
{
  return (_TtC8AppStore23InAppPurchaseLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_spotlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separatorView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separator, (uint64_t *)&unk_1009A3840);
}

@end
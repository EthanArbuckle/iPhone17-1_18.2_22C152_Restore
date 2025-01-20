@interface PrivacyTypeCollectionViewCell
- (NSArray)accessibilityCategoryViews;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)lowMemoryWarning:(id)a3;
- (void)prepareForReuse;
@end

@implementation PrivacyTypeCollectionViewCell

- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29PrivacyTypeCollectionViewCell *)sub_1003AAA44();
}

- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003AB54C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003A93DC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003A6B90();
}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  v8 = self;
  sub_100082C28(&qword_1009934B0);
  ReusePool.drain()();
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_detailLabel));
}

- (NSArray)accessibilityCategoryViews
{
  swift_beginAccess();
  type metadata accessor for PrivacyCategoryView();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_detailLabel));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_shadowView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryReusePool;
  uint64_t v4 = sub_100082C28(&qword_1009934B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_style;
  uint64_t v6 = type metadata accessor for PrivacyTypeStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_separatorView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_separator, (uint64_t *)&unk_1009A3840);
}

@end
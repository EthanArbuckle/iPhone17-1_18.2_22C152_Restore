@interface PrivacyHeaderCollectionViewCell
- (NSArray)accessibilitySupplementaryItemLabels;
- (_TtC8AppStore22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyHeaderCollectionViewCell

- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31PrivacyHeaderCollectionViewCell *)sub_1004E97F4();
}

- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004E9DAC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004E8C30();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004E7ABC();
}

- (_TtC8AppStore22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC8AppStore22DynamicTypeLinkedLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyLabel));
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  swift_beginAccess();
  type metadata accessor for DynamicTypeLinkedLabel();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyText, &qword_10098F0A8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  uint64_t v4 = sub_100082C28(&qword_10099A8D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_topSeparator, (uint64_t *)&unk_1009A3840);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_middleSeparator, (uint64_t *)&unk_1009A3840);
}

@end
@interface PrivacyFooterCollectionViewCell
- (_TtC8AppStore22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC8AppStore31PrivacyFooterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31PrivacyFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PrivacyFooterCollectionViewCell

- (_TtC8AppStore31PrivacyFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31PrivacyFooterCollectionViewCell *)sub_1002EE914();
}

- (_TtC8AppStore31PrivacyFooterCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyText;
  uint64_t v8 = sub_100082C28(&qword_10098F0A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;

  result = (_TtC8AppStore31PrivacyFooterCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002EE350();
}

- (_TtC8AppStore22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC8AppStore22DynamicTypeLinkedLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyLabel));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyText, &qword_10098F0A8);
}

@end
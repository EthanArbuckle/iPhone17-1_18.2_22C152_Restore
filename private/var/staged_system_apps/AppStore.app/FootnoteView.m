@interface FootnoteView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC8AppStore12FootnoteView)initWithCoder:(id)a3;
- (_TtC8AppStore12FootnoteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FootnoteView

- (_TtC8AppStore12FootnoteView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore12FootnoteView *)sub_1000F4694(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore12FootnoteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12FootnoteView_chevronView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12FootnoteView_hasChevron) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12FootnoteView_textLightensOnHighlight) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12FootnoteView_isHighlighted) = 0;
  id v4 = a3;

  result = (_TtC8AppStore12FootnoteView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1000F4CAC();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000F4F98();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore12FootnoteView_textLabel));
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12FootnoteView_chevronView);
}

@end
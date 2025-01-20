@interface CountBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCountLabel;
- (_TtC8AppStore14CountBadgeView)initWithCoder:(id)a3;
- (_TtC8AppStore14CountBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CountBadgeView

- (_TtC8AppStore14CountBadgeView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14CountBadgeView_size) = 1;
  id v4 = a3;

  result = (_TtC8AppStore14CountBadgeView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_1004C4BF0();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CountBadgeView();
  v2 = (char *)v12.receiver;
  [(CountBadgeView *)&v12 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore14CountBadgeView_countLabel];
  [v2 bounds];
  [v3 sizeThatFits:v4, v5];
  double v7 = v6;
  double v9 = v8;
  double v10 = v8 * 0.5;
  LayoutMarginsAware<>.layoutFrame.getter();
  CGFloat v11 = CGRectGetMidX(v13) - v7 * 0.5;
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:v11, CGRectGetMidY(v14) - v10, v7, v9];
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCountLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14CountBadgeView_countLabel));
}

- (_TtC8AppStore14CountBadgeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore14CountBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
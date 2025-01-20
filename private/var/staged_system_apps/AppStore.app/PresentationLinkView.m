@interface PresentationLinkView
- (_TtC8AppStore20PresentationLinkView)initWithCoder:(id)a3;
- (_TtC8AppStore20PresentationLinkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PresentationLinkView

- (_TtC8AppStore20PresentationLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20PresentationLinkView *)sub_1001C5DC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20PresentationLinkView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore20PresentationLinkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  swift_getObjectType();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20PresentationLinkView_linkView);
  v12 = self;
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 sizeThatFits:v4, v5];
  double v7 = v6;
  LayoutMarginsAware<>.layoutFrame.getter();
  double v9 = v8;
  double v11 = v10;
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:v9, v11, CGRectGetWidth(v14), v7];
}

- (void).cxx_destruct
{
}

@end
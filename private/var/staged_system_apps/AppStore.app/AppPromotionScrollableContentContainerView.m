@interface AppPromotionScrollableContentContainerView
- (_TtC8AppStore42AppPromotionScrollableContentContainerView)init;
- (_TtC8AppStore42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3;
- (_TtC8AppStore42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation AppPromotionScrollableContentContainerView

- (_TtC8AppStore42AppPromotionScrollableContentContainerView)init
{
  return (_TtC8AppStore42AppPromotionScrollableContentContainerView *)sub_10013CCDC();
}

- (_TtC8AppStore42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_protectionMode) = (Class)1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_isCollapsing) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  uint64_t v6 = enum case for MediaOverlayStyle.matchSystem(_:);
  uint64_t v7 = type metadata accessor for MediaOverlayStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_contentBasedProtectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_fullProtectionView) = 0;
  id v8 = a3;

  result = (_TtC8AppStore42AppPromotionScrollableContentContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013DA04();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_10013DB08((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8AppStore42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore42AppPromotionScrollableContentContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10013E17C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_protectionMode));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  uint64_t v4 = type metadata accessor for MediaOverlayStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_contentBasedProtectionView));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore42AppPromotionScrollableContentContainerView_fullProtectionView);
}

@end
@interface TabSwitcherView
- (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView)initWithCoder:(id)a3;
- (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TabSwitcherView

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TabSwitcherView();
  v2 = (char *)v8.receiver;
  [(TabSwitcherView *)&v8 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v8.receiver, v8.super_class);
  v3 = &v2[OBJC_IVAR____TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView_lastLayoutBounds];
  *(void *)v3 = v4;
  *((void *)v3 + 1) = v5;
  *((void *)v3 + 2) = v6;
  *((void *)v3 + 3) = v7;
  v3[32] = 0;
}

- (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self
     + OBJC_IVAR____TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView_lastLayoutBounds;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  id v5 = a3;

  result = (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_18C6274C0((uint64_t)a3);
}

- (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView)initWithFrame:(CGRect)a3
{
  result = (_TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
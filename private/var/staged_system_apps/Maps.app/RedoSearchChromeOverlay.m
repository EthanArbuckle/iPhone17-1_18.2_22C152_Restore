@interface RedoSearchChromeOverlay
- (BOOL)isHidden;
- (ChromeOverlayHosting)host;
- (_TtC4Maps23RedoSearchChromeOverlay)init;
- (_TtP4Maps31RedoSearchChromeOverlayDelegate_)delegate;
- (void)setAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)shouldHideFloatingControl:(BOOL)a3 animated:(BOOL)a4;
- (void)updateContainerStyle:(unint64_t)a3;
- (void)updateSearchOverlayWithState:(unsigned __int8)a3;
@end

@implementation RedoSearchChromeOverlay

- (void)setHost:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_host) = (Class)a3;
  swift_unknownObjectRetain_n();
  v4 = self;
  swift_unknownObjectRelease();
  sub_100057BC8();

  swift_unknownObjectRelease();
}

- (void)setAlpha:(double)a3
{
  v4 = self;
  sub_1000CFAF8(a3);
}

- (_TtC4Maps23RedoSearchChromeOverlay)init
{
  return (_TtC4Maps23RedoSearchChromeOverlay *)sub_100014FB8();
}

- (void)setDelegate:(id)a3
{
}

- (void)shouldHideFloatingControl:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_10010DB88(a3, a4);
}

- (_TtP4Maps31RedoSearchChromeOverlayDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps31RedoSearchChromeOverlayDelegate_ *)Strong;
}

- (BOOL)isHidden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_isHidden) = a3;
}

- (ChromeOverlayHosting)host
{
  v2 = (void *)swift_unknownObjectRetain();

  return (ChromeOverlayHosting *)v2;
}

- (void)updateContainerStyle:(unint64_t)a3
{
  v4 = self;
  sub_100144D74(a3);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_10010DB88(a3, a4);
}

- (void)updateSearchOverlayWithState:(unsigned __int8)a3
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_redoSearchController);
  if (v3)
  {
    v5 = self;
    id v6 = v3;
    sub_10033EFDC(a3);
  }
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps23RedoSearchChromeOverlay_delegate);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end
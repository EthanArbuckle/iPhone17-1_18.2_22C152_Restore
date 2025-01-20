@interface TabSwitcher
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (_TtC12MobileSafari11TabSwitcher)initWithCoder:(id)a3;
- (_TtC12MobileSafari11TabSwitcher)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation TabSwitcher

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_18C363BFC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_18C36F050();
}

- (void)loadView
{
  v3 = (objc_class *)type metadata accessor for TabSwitcherView();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView_lastLayoutBounds];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 1;
  swift_unknownObjectUnownedInit();
  v8.receiver = v4;
  v8.super_class = v3;
  v6 = self;
  v7 = -[TabSwitcher initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[TabSwitcher setView:](v6, sel_setView_, v7, v8.receiver, v8.super_class);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18C377A20();
}

- (_TtC12MobileSafari11TabSwitcher)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C631824();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TabSwitcher(0);
  id v6 = a3;
  id v7 = v8.receiver;
  [(TabSwitcher *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  sub_18C613AE0();
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  id v3 = sub_18C3779EC();
  sub_18C39E51C();
  v5 = v4;

  LOBYTE(v3) = objc_msgSend(v5, sel_becomeFirstResponder);
  return (char)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_isVisible);
}

- (_TtC12MobileSafari11TabSwitcher)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12MobileSafari11TabSwitcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_borrowedContentViewRegistration, (uint64_t *)&unk_1E917A418);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_thumbnailMatchMoveViewOwningBorrowedContent));
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_currentTransaction, &qword_1E9177088);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_interactivelyInsertedPageID;
  uint64_t v4 = sub_18C6F8308();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_pendingMoveIntent, (uint64_t *)&unk_1E91770D0);
  sub_18C38F818((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_resolvedContent, _s7ContentVMa);
  swift_bridgeObjectRelease();
  sub_18C38F818((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_unresolvedContent, _s7ContentVMa);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_itemToPresentToAfterNextLayoutPass, &qword_1E917C740);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabSwitcher____lazy_storage___quickTabSwitcherDisplayItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabSwitcher____lazy_storage___tabOverviewDisplayItem));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_tabOverviewVisibilityObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18C57B508((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_presentationObserver);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end
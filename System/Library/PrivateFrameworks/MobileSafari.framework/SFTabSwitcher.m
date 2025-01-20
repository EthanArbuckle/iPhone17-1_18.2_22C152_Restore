@interface SFTabSwitcher
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isSelectingInteractivelyInsertedItem;
- (BOOL)isVisible;
- (BOOL)showsSidebarToggle;
- (BOOL)tabOverviewIsVisible;
- (CGRect)capsuleReferenceFrame;
- (CGRect)frameForLinkedPanningItemWithIdentifier:(id)a3;
- (NSArray)sortedSelectedItems;
- (SFTabOverviewDisplayItem)tabOverviewDisplayItem;
- (SFTabSwitcher)initWithCoder:(id)a3;
- (SFTabSwitcher)initWithNibName:(id)a3 bundle:(id)a4;
- (SFTabSwitcher)initWithTabIconPool:(id)a3 tabSnapshotPool:(id)a4;
- (SFTabSwitcherPage)visiblePage;
- (SFTabSwitcherPresentationObserving)presentationObserver;
- (UIBarButtonItem)sidebarToggleBarButtonItem;
- (UIEdgeInsets)browserContentInsets;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizerForTrackingPinchTranslationVelocity;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIView)transitionViewForReducedMotion;
- (double)linkedPanGesturePageWidth;
- (double)quickTabSwitcherPageWidth;
- (int64_t)presentationState;
- (int64_t)visibleSnapshotLimitForBounds:(CGRect)a3 traitCollection:(id)a4;
- (void)animateSwitchingToItem:(id)a3;
- (void)applyConfiguration:(id)a3;
- (void)applyContent:(id)a3;
- (void)applyContent:(id)a3 animated:(BOOL)a4;
- (void)beginAnimatedSizeTransition;
- (void)beginRetitlingVisiblePage;
- (void)beginSearching;
- (void)beginSearchingWithQuery:(id)a3;
- (void)cancelRetitlingVisiblePage;
- (void)clearHighlightedCapsule;
- (void)detachBorrowedCapsuleForItem:(id)a3;
- (void)didReceivePanGesture:(id)a3;
- (void)dismissToItem:(id)a3;
- (void)endAnimatedSizeTransition;
- (void)loadView;
- (void)performTransaction:(id)a3 withUpdates:(id)a4;
- (void)present;
- (void)scrollToNextPage;
- (void)scrollToPage:(id)a3;
- (void)scrollToPreviousPage;
- (void)scrollVisiblePageToTopWithoutAnimation;
- (void)setBorrowedContentSize:(CGSize)a3 obscuredInsets:(UIEdgeInsets)a4;
- (void)setBrowserContentInsets:(UIEdgeInsets)a3;
- (void)setCapsuleReferenceFrame:(CGRect)a3;
- (void)setLinkedPanGesturePageWidth:(double)a3;
- (void)setPresentationObserver:(id)a3;
- (void)setShowsSidebarToggle:(BOOL)a3;
- (void)setTransitionViewForReducedMotion:(id)a3;
@end

@implementation SFTabSwitcher

- (int64_t)presentationState
{
  return *(void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                   + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_presentationState);
}

- (void)applyContent:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return (UIPinchGestureRecognizer *)sub_18C376348(self, (uint64_t)a2, (uint64_t (*)(void))sub_18C37644C);
}

- (void)setBorrowedContentSize:(CGSize)a3 obscuredInsets:(UIEdgeInsets)a4
{
  v4 = (CGSize *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_borrowedContentMetrics);
  CGSize v5 = v4[1];
  v7[0] = *v4;
  v7[1] = v5;
  v7[2] = v4[2];
  *(UIEdgeInsets *)&v4->width = a4;
  v4[2] = a3;
  v6 = self;
  sub_18C36ADA8((double *)v7);
}

- (void)setShowsSidebarToggle:(BOOL)a3
{
  v4 = self;
  sub_18C36AF00(a3);
}

- (void)setLinkedPanGesturePageWidth:(double)a3
{
  v4 = self;
  sub_18C3757FC(a3);
}

- (void)setCapsuleReferenceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_18C375920(x, y, width, height);
}

- (UIBarButtonItem)sidebarToggleBarButtonItem
{
  v2 = self;
  id v3 = sub_18C3779EC();
  id v4 = sub_18C389614();
  CGSize v5 = (void *)sub_18C375CC0(0xAu);

  return (UIBarButtonItem *)v5;
}

- (int64_t)visibleSnapshotLimitForBounds:(CGRect)a3 traitCollection:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  id v11 = sub_18C3779EC();
  int64_t v12 = sub_18C3767E8(v9, x, y, width, height);

  return v12;
}

- (void)setBrowserContentInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                  + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_browserContentInsets) = a3;
  id v3 = self;
  sub_18C376CF8();
}

- (void)applyContent:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_18C382A38((uint64_t)v6, a4);
}

- (void)performTransaction:(id)a3 withUpdates:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_18C383294(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (BOOL)isVisible
{
  return (*(unsigned char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped))[OBJC_IVAR____TtC12MobileSafari11TabSwitcher_isVisible];
}

- (void)loadView
{
  v2 = self;
  SFTabSwitcher.loadView()();
}

- (void)applyConfiguration:(id)a3
{
  id v4 = a3;
  CGSize v5 = self;
  sub_18C3E20D0(v4);
}

- (UIPanGestureRecognizer)panGestureRecognizerForTrackingPinchTranslationVelocity
{
  return (UIPanGestureRecognizer *)sub_18C376348(self, (uint64_t)a2, (uint64_t (*)(void))sub_18C3766B8);
}

- (void)setPresentationObserver:(id)a3
{
}

- (SFTabSwitcherPage)visiblePage
{
  v2 = self;
  id v3 = sub_18C369414();

  return (SFTabSwitcherPage *)v3;
}

- (SFTabSwitcher)initWithTabIconPool:(id)a3 tabSnapshotPool:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (SFTabSwitcher *)sub_18C444F14((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (SFTabSwitcher)initWithCoder:(id)a3
{
  result = (SFTabSwitcher *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)animateSwitchingToItem:(id)a3
{
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped), sel_becomeFirstResponder);
}

- (void)beginAnimatedSizeTransition
{
  v2 = self;
  sub_18C5DB70C();
}

- (void)beginSearching
{
  v2 = self;
  sub_18C5DB854();
}

- (void)beginSearchingWithQuery:(id)a3
{
  uint64_t v4 = sub_18C6F9848();
  uint64_t v6 = v5;
  id v7 = self;
  id v8 = sub_18C3779EC();
  sub_18C557098(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)beginRetitlingVisiblePage
{
  v2 = self;
  sub_18C5DBA54();
}

- (UIEdgeInsets)browserContentInsets
{
  v2 = (double *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_browserContentInsets);
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped), sel_canBecomeFirstResponder);
}

- (void)cancelRetitlingVisiblePage
{
  v2 = self;
  id v3 = sub_18C3779EC();
  sub_18C55DE48();
}

- (CGRect)capsuleReferenceFrame
{
  v2 = (double *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_capsuleReferenceFrame);
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)clearHighlightedCapsule
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E91797D0);
  MEMORY[0x1F4188790](v3 - 8);
  double v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v12 = self;
  double v6 = (char *)sub_18C3779EC();
  id v7 = *(void **)&v6[OBJC_IVAR___SFTabOverviewDisplayItem_capsuleView];
  id v8 = v7;

  if (v7)
  {
    uint64_t v9 = _s4ItemVMa_0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
    sub_18C59B728((uint64_t)v5);
  }
  else
  {
    v10 = v12;
  }
}

- (void)detachBorrowedCapsuleForItem:(id)a3
{
}

- (void)didReceivePanGesture:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_18C620930(v4);
}

- (void)dismissToItem:(id)a3
{
}

- (void)endAnimatedSizeTransition
{
  v2 = self;
  sub_18C5DBF78();
}

- (BOOL)isSelectingInteractivelyInsertedItem
{
  v2 = self;
  uint64_t v3 = (char *)sub_18C3786B0();
  id v4 = *(id *)&v3[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  LOBYTE(v3) = v4[qword_1E9190FC8];
  return (char)v3;
}

- (double)linkedPanGesturePageWidth
{
  v2 = self;
  uint64_t v3 = (char *)sub_18C3786B0();
  id v4 = (char *)*(id *)&v3[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  double v5 = *(double *)&v4[qword_1E9190FF0 + 112];
  LODWORD(v3) = v4[qword_1E9190FF0 + 120];

  double result = 0.0;
  if (!v3) {
    return v5;
  }
  return result;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)sub_18C376348(self, (uint64_t)a2, (uint64_t (*)(void))sub_18C376734);
}

- (void)present
{
  v2 = self;
  sub_18C5DC1E8();
}

- (SFTabSwitcherPresentationObserving)presentationObserver
{
  v2 = (void *)MEMORY[0x192F967B0](*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)+ OBJC_IVAR____TtC12MobileSafari11TabSwitcher_presentationObserver, a2);

  return (SFTabSwitcherPresentationObserving *)v2;
}

- (double)quickTabSwitcherPageWidth
{
  v2 = self;
  uint64_t v3 = (char *)sub_18C3786B0();
  id v4 = (char *)*(id *)&v3[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  CGFloat v5 = *(double *)&v4[qword_1E9190FF0 + 48];
  CGFloat v6 = *(double *)&v4[qword_1E9190FF0 + 56];
  CGFloat v7 = *(double *)&v4[qword_1E9190FF0 + 64];
  CGFloat v8 = *(double *)&v4[qword_1E9190FF0 + 72];
  double v9 = *(double *)&v4[qword_1E9190FF0 + 136];

  v12.origin.double x = v5;
  v12.origin.double y = v6;
  v12.size.double width = v7;
  v12.size.double height = v8;
  double Width = CGRectGetWidth(v12);

  return v9 + Width;
}

- (CGRect)frameForLinkedPanningItemWithIdentifier:(id)a3
{
  uint64_t v4 = sub_18C6F8308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  CGFloat v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F82E8();
  CGFloat v8 = self;
  double v9 = sub_18C5DC4F0((uint64_t)v7);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)scrollToNextPage
{
}

- (void)scrollToPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18C5DCA68((uint64_t)v4);
}

- (void)scrollToPreviousPage
{
}

- (void)scrollVisiblePageToTopWithoutAnimation
{
  v2 = self;
  sub_18C5DCD98();
}

- (BOOL)showsSidebarToggle
{
  v2 = self;
  uint64_t v3 = sub_18C3779EC();
  char v4 = v3[OBJC_IVAR___SFTabOverviewDisplayItem_showsSidebarToggle];

  return v4;
}

- (NSArray)sortedSelectedItems
{
  return (NSArray *)sub_18C5D612C(self, (uint64_t)a2, (void (*)(void))sub_18C5DCF84, (void (*)(void))type metadata accessor for SFTabSwitcherItem);
}

- (SFTabOverviewDisplayItem)tabOverviewDisplayItem
{
  v2 = self;
  id v3 = sub_18C3779EC();

  return (SFTabOverviewDisplayItem *)v3;
}

- (BOOL)tabOverviewIsVisible
{
  v2 = self;
  id v3 = sub_18C3779EC();
  char v4 = v3[OBJC_IVAR___SFTabOverviewDisplayItem_state + 8];
  double v5 = *(double *)&v3[OBJC_IVAR___SFTabOverviewDisplayItem_state + 16];

  return (v5 > 0.01) | v4 & 1;
}

- (UIView)transitionViewForReducedMotion
{
  v2 = (void *)MEMORY[0x192F967B0](*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)+ OBJC_IVAR____TtC12MobileSafari11TabSwitcher_transitionViewForReducedMotion, a2);

  return (UIView *)v2;
}

- (void)setTransitionViewForReducedMotion:(id)a3
{
}

- (SFTabSwitcher)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGRect result = (SFTabSwitcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
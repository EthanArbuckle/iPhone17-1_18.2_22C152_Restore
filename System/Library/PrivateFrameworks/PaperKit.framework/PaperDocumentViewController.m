@interface PaperDocumentViewController
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (_TtC8PaperKit27PaperDocumentViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit27PaperDocumentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didScreenEdgePan;
- (void)pageDidChange:(id)a3;
- (void)pageDidScroll:(id)a3;
- (void)pageLabelViewTapped:(id)a3;
- (void)pageWillScroll:(id)a3;
- (void)toolPickerIsRulerActiveDidChange:(id)a3;
- (void)toolPickerSelectedToolDidChange:(id)a3;
- (void)toolPickerSelectedToolItemDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PaperDocumentViewController

- (void)dealloc
{
  v2 = self;
  PaperDocumentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_paperDocumentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_paperDocumentThumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_scrollViewObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_thumbnailBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_thumbnailViewLeadingToSuperviewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_thumbnailViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_documentViewLeadingToThumbnailViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_screenEdgePanGestureRecognizer));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_pageOverlayViewProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController__toolPicker));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_paperDocumentTemp, (uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_passwordViewController));
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_assetPasswordToRemove), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_assetPasswordToRemove));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_backgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_thumbnailViewBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_bannerViewConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_plusButton));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_lastPasswordRequestDate, &demangling cache variable for type metadata for Date?);
  swift_release();
  swift_release();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_liveStreamMessenger);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_participantDetailsDataSource);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_textualContextProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_viewControllerForPresentingUI));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController__cachedToolPicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController____lazy_storage___pageLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_pageLabelViewTopToSuperviewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_pageLabelViewTopToBannerBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_pageLabelViewLeadingToThumbnailViewTrailingConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_pageLabelViewLeadingToPaperDocumentLeadingConstraint);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaperDocumentViewController(0);
  id v2 = v5.receiver;
  [(PaperDocumentViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setClipsToBounds_, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaperDocumentViewController(0);
  id v2 = v3.receiver;
  [(PaperDocumentViewController *)&v3 updateViewConstraints];
  PaperDocumentViewController.updateThumbnailViewConstraints()();
}

- (void)pageDidChange:(id)a3
{
  id v5 = a3;
  v4 = self;
  PaperDocumentViewController.pageDidChange(_:)(v5);
}

- (void)pageWillScroll:(id)a3
{
  id v5 = a3;
  v4 = self;
  PaperDocumentViewController.pageWillScroll(_:)(v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  id v5 = self;
  v8.value.super.isa = (Class)a3;
  PaperDocumentViewController.traitCollectionDidChange(_:)(v8);
}

- (BOOL)canBecomeFirstResponder
{
  return @objc PaperDocumentViewController.canBecomeFirstResponder.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_canBecomeFirstResponder);
}

- (BOOL)becomeFirstResponder
{
  return @objc PaperDocumentViewController.canBecomeFirstResponder.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  return @objc PaperDocumentViewController.canBecomeFirstResponder.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_resignFirstResponder);
}

- (_TtC8PaperKit27PaperDocumentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized PaperDocumentViewController.init(coder:)();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  UITraitCollection_optional v8 = self;
  PaperDocumentViewController.viewWillTransition(to:with:)(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)didScreenEdgePan
{
  id v3 = (char *)self
     + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_allowsUserInteractionToToggleThumbnailViewVisibility;
  swift_beginAccess();
  if (*v3 == 1)
  {
    v4 = (char *)self + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_isThumbnailViewCollapsed;
    swift_beginAccess();
    char v5 = *v4;
    char *v4 = 0;
    id v6 = self;
    PaperDocumentViewController.isThumbnailViewCollapsed.didset(v5);
  }
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4 = a3;
  char v5 = self;
  PaperDocumentViewController.toolPickerSelectedToolDidChange(_:)((PKToolPicker)v4);
}

- (void)toolPickerSelectedToolItemDidChange:(id)a3
{
  char v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_paperDocumentView);
  swift_beginAccess();
  id v6 = *v5;
  if (v6)
  {
    id v7 = a3;
    UITraitCollection_optional v8 = self;
    id v9 = v6;
    PaperDocumentView.updateTiledViewInk(for:)(v7);
  }
  else
  {
    id v9 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController__cachedToolPicker);
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController__cachedToolPicker) = (Class)a3;
    id v10 = a3;
  }
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4 = a3;
  char v5 = self;
  PaperDocumentViewController.toolPickerIsRulerActiveDidChange(_:)((PKToolPicker)v4);
}

- (void)pageLabelViewTapped:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    char v5 = self;
  }
  PaperDocumentViewController.pageLabelViewTapped(_:)();

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v6, &demangling cache variable for type metadata for Any?);
}

- (_TtC8PaperKit27PaperDocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKit27PaperDocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pageDidScroll:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.isa = (Class)a3;
  PaperDocumentViewController.pageDidScroll(_:)(v9);
}

@end
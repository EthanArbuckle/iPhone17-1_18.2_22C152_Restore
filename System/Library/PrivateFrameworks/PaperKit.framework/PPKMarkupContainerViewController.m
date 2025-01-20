@interface PPKMarkupContainerViewController
- (BOOL)acceptSingleTouch:(id)a3;
- (BOOL)allEditingDisabled;
- (BOOL)annotationEditingEnabled;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canEncryptDocument;
- (BOOL)documentIsLocked;
- (BOOL)encryptPrivateMetadata;
- (BOOL)findInteractionEnabled;
- (BOOL)formFillingEnabled;
- (BOOL)hasResultsForVisualSearch;
- (BOOL)isImageAnalysisEnabled;
- (BOOL)isInteractionActive;
- (BOOL)isTouchInBannerView:(id)a3;
- (BOOL)isTouchInPageLabelView:(id)a3;
- (BOOL)isTouchInThumbnailView:(id)a3;
- (BOOL)isVisualSearchEnabled;
- (BOOL)pencilAlwaysDraws;
- (BOOL)resignFirstResponder;
- (BOOL)shouldEnterVisualSearchAfterNextAnalysis;
- (BOOL)shouldUpliftSubjectAfterNextAnalysis;
- (BOOL)showBannerView;
- (BOOL)showThumbnailViewForMultipage;
- (BOOL)toolbarHidden;
- (BOOL)validateRedo:(id)a3;
- (BOOL)validateUndo:(id)a3;
- (BOOL)viewAcceptSingleTouch:(id)a3;
- (BOOL)writeTo:(id)a3 imageType:(id)a4 error:(id *)a5 embeddingSourceImageAndEditModel:(BOOL)a6;
- (BOOL)writeTo:(id)a3 imageType:(id)a4 error:(id *)a5 embeddingSourceImageAndEditModel:(BOOL)a6 options:(id)a7;
- (CGRect)pdfFrame;
- (NSString)filledInfoButtonGlyphName;
- (NSString)imageDescription;
- (NSString)infoButtonGlyphName;
- (NSUndoManager)undoManager;
- (PPKMarkupContainerViewController)initWithCoder:(id)a3;
- (PPKMarkupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PPKMarkupContainerViewControllerDelegate)delegate;
- (UIColor)backgroundColor;
- (UIColor)pdfBackgroundColor;
- (UIEdgeInsets)minimumContentInsets;
- (UIFindInteraction)findInteraction;
- (UIScrollView)contentViewScrollView;
- (UIScrollView)pdfScrollView;
- (UIView)bannerView;
- (id)archivedModelData;
- (id)dataRepresentationWithError:(id *)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)doubleTapped:(id)a3;
- (void)handleDidBecomeActive;
- (void)handleSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3;
- (void)infoButtonTapped;
- (void)loadFromData:(id)a3 with:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6;
- (void)loadFromURL:(id)a3 with:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6;
- (void)pdfViewScaleChanged:(id)a3;
- (void)redo:(id)a3;
- (void)revert:(id)a3;
- (void)setAllEditingDisabled:(BOOL)a3;
- (void)setAnnotationEditingEnabled:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptPrivateMetadata:(BOOL)a3;
- (void)setFindInteractionEnabled:(BOOL)a3;
- (void)setFormFillingEnabled:(BOOL)a3;
- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4;
- (void)setImageDescription:(id)a3;
- (void)setIsImageAnalysisEnabled:(BOOL)a3;
- (void)setMinimumContentInsets:(UIEdgeInsets)a3;
- (void)setPdfBackgroundColor:(id)a3;
- (void)setPencilAlwaysDraws:(BOOL)a3;
- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3;
- (void)setShouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldHighlightTextAndODAfterNextAnalysis:(BOOL)a3;
- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3;
- (void)setShowBannerView:(BOOL)a3;
- (void)setShowThumbnailViewForMultipage:(BOOL)a3;
- (void)setToolbarHidden:(BOOL)a3;
- (void)setupAndStartImageAnalysisIfNeeded;
- (void)showBannerViewWith:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)undo:(id)a3;
- (void)updateForFullscreen:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)writeTo:(NSURL *)a3 imageType:(UTType *)a4 embeddingSourceImageAndEditModel:(BOOL)a5 options:(NSDictionary *)a6 completionHandler:(id)a7;
@end

@implementation PPKMarkupContainerViewController

- (PPKMarkupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (PPKMarkupContainerViewController *)MarkupContainerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (PPKMarkupContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MarkupContainerViewController.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  MarkupContainerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_fileCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_placeholderImageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_imageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR___PPKMarkupContainerViewController_originalAsset, &demangling cache variable for type metadata for CRAsset?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_doubleTapGestureRecognizer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_loadContentOperationQueue));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR___PPKMarkupContainerViewController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfBackgroundColor);
}

- (void)didBecomeActive:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  objc_msgSend(v5, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v7, sel_handleDidBecomeActive, 0);
  [(PPKMarkupContainerViewController *)v7 performSelector:sel_handleDidBecomeActive withObject:0 afterDelay:0.25];
}

- (void)handleDidBecomeActive
{
  v2 = self;
  MarkupContainerViewController.updateFirstResponderIfNecessary()();
}

- (void)handleSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized MarkupContainerViewController.handleSqueezeInteractionDidChangePaletteViewVisibilityNotification(_:)();
}

- (UIEdgeInsets)minimumContentInsets
{
  v2 = (double *)((char *)self + OBJC_IVAR___PPKMarkupContainerViewController_minimumContentInsets);
  swift_beginAccess();
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

- (void)setMinimumContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v7 = self;
  MarkupContainerViewController.minimumContentInsets.setter(top, left, bottom, right);
}

- (BOOL)findInteractionEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_findInteractionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setFindInteractionEnabled:(BOOL)a3
{
}

- (BOOL)isImageAnalysisEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_isImageAnalysisEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsImageAnalysisEnabled:(BOOL)a3
{
}

- (UIFindInteraction)findInteraction
{
  v2 = self;
  id v3 = MarkupContainerViewController.findInteraction.getter();

  return (UIFindInteraction *)v3;
}

- (BOOL)documentIsLocked
{
  v2 = self;
  char v3 = MarkupContainerViewController.documentIsLocked.getter();

  return v3 & 1;
}

- (BOOL)canEncryptDocument
{
  v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.canEncryptDocument.getter();

  return v3 & 1;
}

- (PPKMarkupContainerViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PPKMarkupContainerViewController_delegate;
  swift_beginAccess();
  unsigned __int8 v3 = (void *)MEMORY[0x210550400](v2);
  return (PPKMarkupContainerViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  double v4 = self;
  MarkupContainerViewController.delegate.didset();
  swift_unknownObjectRelease();
}

- (BOOL)encryptPrivateMetadata
{
  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_encryptPrivateMetadata;
  swift_beginAccess();
  return *v2;
}

- (void)setEncryptPrivateMetadata:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_encryptPrivateMetadata;
  swift_beginAccess();
  *double v4 = a3;
}

- (NSString)imageDescription
{
  return (NSString *)@objc MarkupContainerViewController.imageDescription.getter(self, (uint64_t)a2, MarkupContainerViewController.imageDescription.getter);
}

- (void)setImageDescription:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  MarkupContainerViewController.imageDescription.setter(v4, v6);
}

- (BOOL)showThumbnailViewForMultipage
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (v2)
  {
    unsigned __int8 v3 = (unsigned char *)(v2 + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_isThumbnailViewCollapsed);
    swift_beginAccess();
    LOBYTE(v2) = *v3 ^ 1;
  }
  return v2 & 1;
}

- (void)setShowThumbnailViewForMultipage:(BOOL)a3
{
  uint64_t v4 = self;
  MarkupContainerViewController.showThumbnailViewForMultipage.setter(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v4 = self;
  MarkupContainerViewController.viewIsAppearing(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2 = self;
  MarkupContainerViewController.viewDidLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  MarkupContainerViewController.viewWillTransition(to:with:)(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  v8.value.super.isa = (Class)a3;
  MarkupContainerViewController.traitCollectionDidChange(_:)(v8);
}

- (void)loadFromData:(id)a3 with:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  v10 = (uint64_t (*)())_Block_copy(a6);
  id v11 = a3;
  v12 = self;
  id v18 = a4;
  id v13 = a5;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  if (v10)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v10;
    v10 = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  }
  else
  {
    uint64_t v17 = 0;
  }
  MarkupContainerViewController.load(fromData:with:placeholderImage:completionHandler:)(v14, v16, (uint64_t)v18, v13, (uint64_t)v10, v17);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?((uint64_t)v10);
  outlined consume of Data._Representation(v14, v16);
}

- (void)loadFromURL:(id)a3 with:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    uint64_t v14 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  }
  else
  {
    uint64_t v15 = 0;
  }
  unint64_t v16 = self;
  id v17 = a5;
  id v18 = a4;
  MarkupContainerViewController.load(fromURL:with:placeholderImage:completionHandler:)((uint64_t)v13, (uint64_t)a4, a5, (uint64_t)v14, v15);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?((uint64_t)v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (BOOL)writeTo:(id)a3 imageType:(id)a4 error:(id *)a5 embeddingSourceImageAndEditModel:(BOOL)a6
{
  BOOL v21 = a6;
  uint64_t v9 = type metadata accessor for UTType();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = a4;
  id v18 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a5) = MarkupContainerViewController.write(to:imageType:error:embeddingSourceImageAndEditModel:options:)((uint64_t)v16, (uint64_t)v12, (uint64_t)a5, v21, 0);
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v13);
  return a5 & 1;
}

- (BOOL)writeTo:(id)a3 imageType:(id)a4 error:(id *)a5 embeddingSourceImageAndEditModel:(BOOL)a6 options:(id)a7
{
  BOOL v23 = a6;
  v22 = a5;
  uint64_t v24 = type metadata accessor for UTType();
  uint64_t v10 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = a4;
  id v18 = a7;
  uint64_t v19 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a7) = MarkupContainerViewController.write(to:imageType:error:embeddingSourceImageAndEditModel:options:)((uint64_t)v16, (uint64_t)v12, (uint64_t)v22, v23, a7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return a7 & 1;
}

- (void)writeTo:(NSURL *)a3 imageType:(UTType *)a4 embeddingSourceImageAndEditModel:(BOOL)a5 options:(NSDictionary *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &async function pointer to partial apply for @objc closure #1 in MarkupContainerViewController.write(to:imageType:embeddingSourceImageAndEditModel:options:);
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &_sIeghH_IeAgH_TRTATu;
  v20[5] = v19;
  uint64_t v21 = a3;
  v22 = a4;
  BOOL v23 = a6;
  uint64_t v24 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v15, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v20);
  swift_release();
}

- (id)dataRepresentationWithError:(id *)a3
{
  uint64_t v4 = self;
  uint64_t v5 = MarkupContainerViewController.dataRepresentation(withError:)(a3);
  unint64_t v7 = v6;

  if (v7 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?((uint64_t)v5, v7);
  }
  return isa;
}

- (id)archivedModelData
{
  uint64_t v2 = self;
  uint64_t v3 = MarkupContainerViewController.archivedModelData()();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v3, v5);
  }
  return isa;
}

- (UIScrollView)contentViewScrollView
{
  uint64_t v2 = self;
  MarkupContainerViewController.contentViewScrollView.getter();
  unint64_t v4 = v3;

  return (UIScrollView *)v4;
}

- (BOOL)annotationEditingEnabled
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_annotationEditingEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
}

- (BOOL)allEditingDisabled
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_allEditingDisabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
}

- (BOOL)pencilAlwaysDraws
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_pencilAlwaysDraws;
  swift_beginAccess();
  return *v2;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
}

- (BOOL)formFillingEnabled
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_formFillingEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setFormFillingEnabled:(BOOL)a3
{
}

- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4
{
  unint64_t v6 = self;
  MarkupContainerViewController.setFormFillingEnabled(_:didUseBanner:)(a3, a4);
}

- (BOOL)toolbarHidden
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_toolbarHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setToolbarHidden:(BOOL)a3
{
  unint64_t v4 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_toolbarHidden;
  swift_beginAccess();
  *unint64_t v4 = a3;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager));
}

- (BOOL)validateUndo:(id)a3
{
  return @objc MarkupContainerViewController.validateUndo(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canUndo);
}

- (BOOL)validateRedo:(id)a3
{
  return @objc MarkupContainerViewController.validateUndo(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canRedo);
}

- (void)undo:(id)a3
{
}

- (void)redo:(id)a3
{
}

- (void)revert:(id)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager);
  if (v3)
  {
    swift_unknownObjectRetain();
    unint64_t v5 = self;
    id v6 = v3;
    if (objc_msgSend(v6, sel_canUndo))
    {
      do
        objc_msgSend(v6, sel_undo);
      while ((objc_msgSend(v6, sel_canUndo) & 1) != 0);
    }
    objc_msgSend(v6, sel_removeAllActions);
    swift_unknownObjectRelease();
  }
}

- (UIColor)backgroundColor
{
  uint64_t v2 = self;
  id v3 = MarkupContainerViewController.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  id v6 = self;
  MarkupContainerViewController.backgroundColor.setter(a3);
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = MarkupContainerViewController.isTouchInThumbnailView(_:)((UITouch)v4);

  return self & 1;
}

- (BOOL)isTouchInPageLabelView:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (!v3) {
    return 0;
  }
  id v5 = a3;
  id v6 = self;
  id v7 = v3;
  id v8 = PaperDocumentViewController.pageLabelView.getter();

  objc_msgSend(v5, sel_locationInView_, v8);
  LOBYTE(v7) = objc_msgSend(v8, sel_pointInside_withEvent_, 0);

  return (char)v7;
}

- (BOOL)isTouchInBannerView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = MarkupContainerViewController.isTouchInBannerView(_:)((UITouch)v4);

  return self & 1;
}

- (BOOL)viewAcceptSingleTouch:(id)a3
{
  id v4 = (objc_class *)a3;
  id v5 = self;
  v6.super.Class isa = v4;
  LOBYTE(self) = MarkupContainerViewController.viewAcceptSingleTouch(_:)(v6);

  return self & 1;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = MarkupContainerViewController.acceptSingleTouch(_:)((UITouch)v4);

  return self & 1;
}

- (UIView)bannerView
{
  uint64_t v2 = MarkupContainerViewController.bannerView.getter();
  return (UIView *)v2;
}

- (void)showBannerViewWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MarkupContainerViewController.showBannerView(with:)(v4);
}

- (BOOL)showBannerView
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_showBannerView;
  swift_beginAccess();
  return *v2;
}

- (void)setShowBannerView:(BOOL)a3
{
  id v4 = self;
  MarkupContainerViewController.showBannerView.setter(a3);
}

- (CGRect)pdfFrame
{
  uint64_t v2 = self;
  MarkupContainerViewController.pdfFrame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIScrollView)pdfScrollView
{
  uint64_t v2 = self;
  id v3 = MarkupContainerViewController.pdfScrollView.getter();

  return (UIScrollView *)v3;
}

- (UIColor)pdfBackgroundColor
{
  uint64_t v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfBackgroundColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setPdfBackgroundColor:(id)a3
{
  double v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfBackgroundColor);
  swift_beginAccess();
  double v6 = *v5;
  *double v5 = a3;
  id v7 = a3;
  double v8 = self;

  MarkupContainerViewController.updateBackgroundColor()();
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.canBecomeFirstResponder.getter((SEL *)&selRef_canBecomeFirstResponder);

  return v3 & 1;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.canBecomeFirstResponder.getter((SEL *)&selRef_becomeFirstResponder);

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.canBecomeFirstResponder.getter((SEL *)&selRef_resignFirstResponder);

  return v3 & 1;
}

- (void)pdfViewScaleChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  double v8 = self;
  MarkupContainerViewController.pdfViewScaleChanged(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)doubleTapped:(id)a3
{
  uint64_t v4 = (UITapGestureRecognizer *)a3;
  uint64_t v5 = self;
  MarkupContainerViewController.doubleTapped(_:)(v4);
}

- (BOOL)isInteractionActive
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.isInteractionActive.getter();

  return v3 & 1;
}

- (BOOL)hasResultsForVisualSearch
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.hasResultsForVisualSearch.getter();

  return v3 & 1;
}

- (BOOL)isVisualSearchEnabled
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.isVisualSearchEnabled.getter();

  return v3 & 1;
}

- (void)setShouldHighlightTextAndODAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  MarkupContainerViewController.shouldHighlightTextAndODAfterNextAnalysis.setter((char *)v3);
}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  uint64_t v2 = self;
  char v3 = MarkupContainerViewController.shouldEnterVisualSearchAfterNextAnalysis.getter();

  return v3 & 1;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  MarkupContainerViewController.shouldEnterVisualSearchAfterNextAnalysis.setter((char *)v3);
}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  uint64_t v2 = self;
  unsigned __int8 v3 = MarkupContainerViewController.shouldUpliftSubjectAfterNextAnalysis.getter();

  return v3 & 1;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  MarkupContainerViewController.shouldUpliftSubjectAfterNextAnalysis.setter((char *)v3);
}

- (NSString)infoButtonGlyphName
{
  return (NSString *)@objc MarkupContainerViewController.imageDescription.getter(self, (uint64_t)a2, MarkupContainerViewController.infoButtonGlyphName.getter);
}

- (NSString)filledInfoButtonGlyphName
{
  return (NSString *)@objc MarkupContainerViewController.imageDescription.getter(self, (uint64_t)a2, MarkupContainerViewController.filledInfoButtonGlyphName.getter);
}

- (void)updateForFullscreen:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (v4)
  {
    uint64_t v6 = self;
    id v7 = v4;
    PaperDocumentViewController.showPageNumberOverlayIfNeeded(animated:)(a4);
  }
}

- (void)setShouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  MarkupContainerViewController.setShouldHideMarkupOverlays(_:animated:)(a3, a4);
}

- (void)infoButtonTapped
{
  uint64_t v2 = self;
  MarkupContainerViewController.infoButtonTapped()();
}

- (void)setupAndStartImageAnalysisIfNeeded
{
  uint64_t v2 = self;
  MarkupContainerViewController.setupAndStartImageAnalysisIfNeeded()();
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_subviews);
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIView);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)_CocoaArrayWrapper.endIndex.getter();
    id result = (id)swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = *(void **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9) {
      goto LABEL_7;
    }
  }
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x21054E050](0, v7);
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v10 = *(id *)(v7 + 32);
  }
  uint64_t v9 = v10;
LABEL_7:

  swift_bridgeObjectRelease();
  return v9;
}

@end
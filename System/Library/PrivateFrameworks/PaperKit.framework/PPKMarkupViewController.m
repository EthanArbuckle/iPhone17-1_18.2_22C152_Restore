@interface PPKMarkupViewController
+ (BOOL)_isInLowMemoryEnvironment;
+ (BOOL)hasPrivateImageMetadata:(id)a3;
+ (id)_contentTypeForData:(id)a3;
+ (id)_contentTypeForImageSource:(CGImageSource *)a3;
+ (id)_contentTypeForURL:(id)a3;
+ (id)cleanImageMetadataFromData:(id)a3;
+ (id)supportedOutputTypes;
- (AKController)annotationController;
- (BOOL)_findInteractionEnabled;
- (BOOL)_hasPDFContent;
- (BOOL)allEditingDisabled;
- (BOOL)allowsThumbnailViewPageReordering;
- (BOOL)annotationEditingEnabled;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)centersIgnoringContentInsets;
- (BOOL)encryptPrivateMetadata;
- (BOOL)fixedThumbnailView;
- (BOOL)forcesPDFViewTopAlignment;
- (BOOL)formFillingEnabled;
- (BOOL)isNavigationModeHorizontal;
- (BOOL)isShapeDetectionEnabled;
- (BOOL)isThumbnailViewHidden;
- (BOOL)isToolbarHidden;
- (BOOL)isTouchInThumbnailView:(id)a3;
- (BOOL)markupContainerViewController:(id)a3 shouldOpenLink:(id)a4;
- (BOOL)needsToolPickerContentInsetActiveForTraitCollection:(id)a3;
- (BOOL)pencilAlwaysDraws;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAllowEditingContents:(id)a3;
- (BOOL)showShareButtonInToolbar;
- (BOOL)showThumbnailViewForMultipage;
- (BOOL)toolbarHidden;
- (BOOL)validateRedo:(id)a3;
- (BOOL)validateUndo:(id)a3;
- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 contentType:(id)a5 error:(id *)a6;
- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5;
- (CGSize)adjustedSourceImageSize;
- (MUContentViewControllerProtocol)contentViewController;
- (MarkupViewControllerDelegate)delegate;
- (NSArray)fullViewLayoutConstraints;
- (NSString)hostProcessBundleIdentifier;
- (NSString)imageDescription;
- (NSString)outputType;
- (NSUndoManager)akUndoManager;
- (PDFDocument)pdfDocument;
- (PDFView)pdfView;
- (PPKMarkupContainerViewController)markupContainerVC;
- (PPKMarkupViewController)init;
- (PPKMarkupViewController)initWithCoder:(id)a3;
- (PPKMarkupViewController)initWithImageAnalysisEnabled:(BOOL)a3;
- (UIEdgeInsets)activeMinimumContentInsetsForTraitCollection:(id)a3;
- (UIFindInteraction)_findInteraction;
- (UINavigationBar)navBar;
- (UIScrollView)contentViewScrollView;
- (UIView)imageViewCombinedContentView;
- (UIView)pageLabelView;
- (UIView)toolbar;
- (UTType)outputContentType;
- (UTType)sourceContentType;
- (id)_markupBlackColor;
- (id)createArchivedModelData;
- (id)dataRepresentationEmbeddingSourceImageAndEditModel:(BOOL)a3 error:(id *)a4;
- (id)dataRepresentationWithError:(id *)a3;
- (id)undoManager;
- (int64_t)thumbnailViewStyle;
- (int64_t)toolbarPosition;
- (unint64_t)currentPDFPageIndex;
- (unint64_t)inkStyle;
- (void)_ppkMarkupViewControllerCommonInit;
- (void)_setFindInteractionEnabled:(BOOL)a3;
- (void)loadWithData:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6;
- (void)loadWithURL:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6;
- (void)markupContainerViewController:(id)a3 wantsToEnterFullscreen:(BOOL)a4;
- (void)redo:(id)a3;
- (void)revert;
- (void)setAkUndoManager:(id)a3;
- (void)setAllEditingDisabled:(BOOL)a3;
- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3;
- (void)setAnnotationEditingEnabled:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCentersIgnoringContentInsets:(BOOL)a3;
- (void)setCurrentPDFPageIndex:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setData:(id)a3 withArchivedModelData:(id)a4;
- (void)setData:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setEncryptPrivateMetadata:(BOOL)a3;
- (void)setFileURL:(id)a3;
- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4;
- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5;
- (void)setFixedThumbnailView:(BOOL)a3;
- (void)setForcesPDFViewTopAlignment:(BOOL)a3;
- (void)setFormFillingEnabled:(BOOL)a3;
- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4;
- (void)setFullViewLayoutConstraints:(id)a3;
- (void)setHostProcessBundleIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 withArchivedModelData:(id)a4;
- (void)setImage:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5;
- (void)setImageDescription:(id)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setMarkupContainerVC:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setNavigationModeHorizontal:(BOOL)a3;
- (void)setPencilAlwaysDraws:(BOOL)a3;
- (void)setShapeDetectionEnabled:(BOOL)a3;
- (void)setShowShareButtonInToolbar:(BOOL)a3;
- (void)setShowThumbnailViewForMultipage:(BOOL)a3;
- (void)setSourceContentType:(id)a3;
- (void)setThumbnailViewHidden:(BOOL)a3;
- (void)setThumbnailViewStyle:(int64_t)a3;
- (void)setToolbarHidden:(BOOL)a3;
- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setToolbarPosition:(int64_t)a3;
- (void)undo:(id)a3;
- (void)updateContentInsets;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 contentType:(id)a5 options:(id)a6 completionHandler:(id)a7;
@end

@implementation PPKMarkupViewController

- (PPKMarkupViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PPKMarkupViewController;
  v2 = [(PPKMarkupViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PPKMarkupViewController *)v2 _ppkMarkupViewControllerCommonInit];
  }
  return v3;
}

- (PPKMarkupViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PPKMarkupViewController;
  v3 = [(PPKMarkupViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PPKMarkupViewController *)v3 _ppkMarkupViewControllerCommonInit];
  }
  return v4;
}

- (PPKMarkupViewController)initWithImageAnalysisEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PPKMarkupViewController *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    objc_super v6 = [(PPKMarkupViewController *)v4 markupContainerVC];
    [v6 setIsImageAnalysisEnabled:v3];
  }
  return v5;
}

- (void)_ppkMarkupViewControllerCommonInit
{
  BOOL v3 = objc_alloc_init(PPKMarkupContainerViewController);
  [(PPKMarkupViewController *)self setMarkupContainerVC:v3];

  v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setDelegate:self];

  id v6 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  objc_super v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 setPdfBackgroundColor:v6];
}

- (void)viewDidLoad
{
  v28[4] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)PPKMarkupViewController;
  [(PPKMarkupViewController *)&v26 viewDidLoad];
  BOOL v3 = [(PPKMarkupViewController *)self markupContainerVC];
  [(PPKMarkupViewController *)self addChildViewController:v3];

  v4 = [(PPKMarkupViewController *)self view];
  objc_super v5 = [(PPKMarkupViewController *)self markupContainerVC];
  id v6 = [v5 view];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v6];
  v24 = [v6 topAnchor];
  v23 = [v4 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v28[0] = v22;
  v21 = [v6 bottomAnchor];
  v20 = [v4 bottomAnchor];
  v7 = [v21 constraintEqualToAnchor:v20];
  v28[1] = v7;
  v8 = [v6 leadingAnchor];
  v25 = v4;
  v9 = [v4 leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v28[2] = v10;
  v11 = [v6 trailingAnchor];
  v12 = [v4 trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v28[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  [(PPKMarkupViewController *)self setFullViewLayoutConstraints:v14];

  v15 = (void *)MEMORY[0x263F08938];
  v16 = [(PPKMarkupViewController *)self fullViewLayoutConstraints];
  [v15 activateConstraints:v16];

  v17 = [(PPKMarkupViewController *)self markupContainerVC];
  [v17 didMoveToParentViewController:self];

  [(PPKMarkupViewController *)self updateContentInsets];
  uint64_t v27 = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  id v19 = (id)[(PPKMarkupViewController *)self registerForTraitChanges:v18 withAction:sel_horizontalSizeClassDidChange];
}

- (BOOL)canBecomeFirstResponder
{
  BOOL v3 = [(PPKMarkupViewController *)self markupContainerVC];
  char v4 = [v3 documentIsLocked];

  if (v4) {
    return 0;
  }
  id v6 = [(PPKMarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v5 = [v6 controllerCanBecomeFirstResponder:self];
  }
  else
  {
    v7 = [(PPKMarkupViewController *)self markupContainerVC];
    char v5 = [v7 canBecomeFirstResponder];
  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (UIFindInteraction)_findInteraction
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 findInteraction];

  return (UIFindInteraction *)v3;
}

- (void)_setFindInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setFindInteractionEnabled:v3];
}

- (BOOL)_findInteractionEnabled
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 findInteractionEnabled];

  return v3;
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4
{
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4
{
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4
{
}

- (void)loadWithData:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[PPKMarkupViewController _contentTypeForData:v13];
  [(PPKMarkupViewController *)self setSourceContentType:v14];

  v15 = [(PPKMarkupViewController *)self markupContainerVC];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__PPKMarkupViewController_loadWithData_archivedModelData_placeholderImage_completionHandler___block_invoke;
  v17[3] = &unk_2640D3A90;
  id v18 = v10;
  id v16 = v10;
  [v15 loadFromData:v13 with:v12 placeholderImage:v11 completionHandler:v17];
}

uint64_t __93__PPKMarkupViewController_loadWithData_archivedModelData_placeholderImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadWithURL:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[PPKMarkupViewController _contentTypeForURL:v13];
  [(PPKMarkupViewController *)self setSourceContentType:v14];

  v15 = [(PPKMarkupViewController *)self markupContainerVC];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __92__PPKMarkupViewController_loadWithURL_archivedModelData_placeholderImage_completionHandler___block_invoke;
  v17[3] = &unk_2640D3A90;
  id v18 = v10;
  id v16 = v10;
  [v15 loadFromURL:v13 with:v12 placeholderImage:v11 completionHandler:v17];
}

uint64_t __92__PPKMarkupViewController_loadWithURL_archivedModelData_placeholderImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PPKMarkupViewController *)self markupContainerVC];
  id v11 = [(PPKMarkupViewController *)self outputContentType];
  LOBYTE(a5) = [v10 writeTo:v9 imageType:v11 error:a5 embeddingSourceImageAndEditModel:1 options:v8];

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(PPKMarkupViewController *)self markupContainerVC];
  id v10 = [(PPKMarkupViewController *)self outputContentType];
  LOBYTE(a5) = [v9 writeTo:v8 imageType:v10 error:a5 embeddingSourceImageAndEditModel:v6];

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 contentType:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = [(PPKMarkupViewController *)self markupContainerVC];
  LOBYTE(a6) = [v12 writeTo:v11 imageType:v10 error:a6 embeddingSourceImageAndEditModel:v7];

  return (char)a6;
}

- (void)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 contentType:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(PPKMarkupViewController *)self markupContainerVC];
  [v16 writeTo:v15 imageType:v14 embeddingSourceImageAndEditModel:v9 options:v13 completionHandler:v12];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(PPKMarkupViewController *)self markupContainerVC];
  id v8 = [(PPKMarkupViewController *)self outputContentType];
  LOBYTE(a4) = [v7 writeTo:v6 imageType:v8 error:a4 embeddingSourceImageAndEditModel:1];

  return (char)a4;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  char v5 = [v4 dataRepresentationWithError:a3];

  return v5;
}

- (id)createArchivedModelData
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 archivedModelData];

  return v3;
}

- (id)dataRepresentationEmbeddingSourceImageAndEditModel:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)encryptPrivateMetadata
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 encryptPrivateMetadata];

  return v3;
}

- (void)setEncryptPrivateMetadata:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 setEncryptPrivateMetadata:v3];

  self->_encryptPrivateMetadata = v3;
}

- (UIScrollView)contentViewScrollView
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  BOOL v3 = [v2 contentViewScrollView];

  return (UIScrollView *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 setBackgroundColor:v4];
}

- (BOOL)annotationEditingEnabled
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 annotationEditingEnabled];

  return v3;
}

- (BOOL)_hasPDFContent
{
  v2 = [(PPKMarkupViewController *)self sourceContentType];
  char v3 = [v2 conformsToType:*MEMORY[0x263F1DBF0]];

  return v3;
}

- (BOOL)needsToolPickerContentInsetActiveForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(PPKMarkupViewController *)self annotationEditingEnabled])
  {
    if ([v4 userInterfaceIdiom]) {
      BOOL v5 = [v4 horizontalSizeClass] == 1;
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)viewSafeAreaInsetsDidChange
{
  v13.receiver = self;
  v13.super_class = (Class)PPKMarkupViewController;
  [(PPKMarkupViewController *)&v13 viewSafeAreaInsetsDidChange];
  char v3 = [(PPKMarkupViewController *)self traitCollection];
  [(PPKMarkupViewController *)self activeMinimumContentInsetsForTraitCollection:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(PPKMarkupViewController *)self markupContainerVC];
  objc_msgSend(v12, "setMinimumContentInsets:", v5, v7, v9, v11);
}

- (UIEdgeInsets)activeMinimumContentInsetsForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(PPKMarkupViewController *)self annotationEditingEnabled])
  {
    double v5 = [(PPKMarkupViewController *)self view];
    [v5 safeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    if ([(PPKMarkupViewController *)self needsToolPickerContentInsetActiveForTraitCollection:v4])
    {
      double v11 = v11 + 75.0;
    }
  }
  else
  {
    double v7 = *MEMORY[0x263F834E8];
    double v9 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v11 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v13 = *(double *)(MEMORY[0x263F834E8] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)updateContentInsets
{
  char v3 = [(PPKMarkupViewController *)self traitCollection];
  [(PPKMarkupViewController *)self activeMinimumContentInsetsForTraitCollection:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(PPKMarkupViewController *)self markupContainerVC];
  objc_msgSend(v12, "setMinimumContentInsets:", v5, v7, v9, v11);

  double v14 = *MEMORY[0x263F834E8];
  double v13 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v16 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v15 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v17 = [(PPKMarkupViewController *)self markupContainerVC];
  if ([v17 annotationEditingEnabled])
  {
    id v18 = [(PPKMarkupViewController *)self traitCollection];
    BOOL v19 = [(PPKMarkupViewController *)self needsToolPickerContentInsetActiveForTraitCollection:v18];

    if (v19)
    {
      double v15 = 0.0;
      double v16 = 75.0;
      double v13 = 0.0;
      double v14 = 0.0;
    }
  }
  else
  {
  }
  id v20 = [(PPKMarkupViewController *)self markupContainerVC];
  objc_msgSend(v20, "setAdditionalSafeAreaInsets:", v14, v13, v16, v15);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPKMarkupViewController;
  [(PPKMarkupViewController *)&v4 viewIsAppearing:a3];
  [(PPKMarkupViewController *)self updateContentInsets];
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 setAnnotationEditingEnabled:v3];

  [(PPKMarkupViewController *)self updateContentInsets];
}

- (void)setFormFillingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setFormFillingEnabled:v3];
}

- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PPKMarkupViewController *)self markupContainerVC];
  [v6 setFormFillingEnabled:v5 didUseBanner:v4];
}

- (BOOL)formFillingEnabled
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 formFillingEnabled];

  return v3;
}

- (BOOL)toolbarHidden
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 toolbarHidden];

  return v3;
}

- (void)setToolbarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setToolbarHidden:v3];
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 setToolbarHidden:v4];
}

- (BOOL)pencilAlwaysDraws
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 pencilAlwaysDraws];

  return v3;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setPencilAlwaysDraws:v3];
}

+ (id)supportedOutputTypes
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = [(id)*MEMORY[0x263F1DBF0] identifier];
  v8[0] = v2;
  BOOL v3 = [(id)*MEMORY[0x263F1DB40] identifier];
  v8[1] = v3;
  id v4 = [(id)*MEMORY[0x263F1DC08] identifier];
  v8[2] = v4;
  id v5 = [(id)*MEMORY[0x263F1DCE0] identifier];
  v8[3] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (CGSize)adjustedSourceImageSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)undoManager
{
  double v2 = [(PPKMarkupViewController *)self markupContainerVC];
  double v3 = [v2 undoManager];

  return v3;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setAllEditingDisabled:v3];
}

- (BOOL)shouldAllowEditingContents:(id)a3
{
  return 1;
}

- (UTType)outputContentType
{
  double v2 = [(PPKMarkupViewController *)self sourceContentType];
  BOOL v3 = (void *)*MEMORY[0x263F1DBF0];
  if ([v2 conformsToType:*MEMORY[0x263F1DBF0]]
    || (BOOL v3 = (void *)*MEMORY[0x263F1DC08], [v2 conformsToType:*MEMORY[0x263F1DC08]])
    || (BOOL v3 = (void *)*MEMORY[0x263F1DCE0], [v2 conformsToType:*MEMORY[0x263F1DCE0]])
    || (BOOL v3 = (void *)*MEMORY[0x263F1DB40], [v2 conformsToType:*MEMORY[0x263F1DB40]])
    || [v2 conformsToType:*MEMORY[0x263F1DB18]])
  {
    id v4 = v3;
  }
  else
  {
    id v6 = [v2 identifier];
    NSLog(&cfstr_SNullOutputcon.isa, "-[PPKMarkupViewController outputContentType]", v6);

    id v4 = 0;
  }

  return (UTType *)v4;
}

+ (id)_contentTypeForImageSource:(CGImageSource *)a3
{
  if (a3)
  {
    BOOL v3 = CGImageSourceGetType(a3);
    if (v3)
    {
      id v4 = [MEMORY[0x263F1D920] typeWithIdentifier:v3];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_contentTypeForURL:(id)a3
{
  CGImageSourceRef v3 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v3)
  {
    CGImageSourceRef v4 = v3;
    id v5 = +[PPKMarkupViewController _contentTypeForImageSource:v3];
    CFRelease(v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)_contentTypeForData:(id)a3
{
  CGImageSourceRef v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v3)
  {
    CGImageSourceRef v4 = v3;
    id v5 = +[PPKMarkupViewController _contentTypeForImageSource:v3];
    CFRelease(v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (BOOL)_isInLowMemoryEnvironment
{
  if (_isInLowMemoryEnvironment_onceToken != -1) {
    dispatch_once(&_isInLowMemoryEnvironment_onceToken, &__block_literal_global);
  }
  return _isInLowMemoryEnvironment_sIsLowMemoryEnvironment;
}

void __52__PPKMarkupViewController__isInLowMemoryEnvironment__block_invoke()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v2 arguments];
  v1 = [v0 firstObject];

  if (v1) {
    _isInLowMemoryEnvironment_sIsLowMemoryEnvironment = [v1 containsString:@".appex/"];
  }
}

- (void)setHostProcessBundleIdentifier:(id)a3
{
}

- (NSString)hostProcessBundleIdentifier
{
  hostProcessBundleIdentifier = self->_hostProcessBundleIdentifier;
  if (!hostProcessBundleIdentifier)
  {
    CGImageSourceRef v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v4 bundleIdentifier];
    id v6 = self->_hostProcessBundleIdentifier;
    self->_hostProcessBundleIdentifier = v5;

    hostProcessBundleIdentifier = self->_hostProcessBundleIdentifier;
  }
  return hostProcessBundleIdentifier;
}

- (id)_markupBlackColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.0901960784 green:0.0901960784 blue:0.0901960784 alpha:1.0];
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  id v3 = a3;
  CGImageSourceRef v4 = [getMUImageReaderClass() cleanImageMetadataFromData:v3];

  return v4;
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  id v3 = a3;
  char v4 = [getMUImageReaderClass() hasPrivateImageMetadata:v3];

  return v4;
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  char v6 = [v5 isTouchInThumbnailView:v4];

  return v6;
}

- (void)setShowThumbnailViewForMultipage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setShowThumbnailViewForMultipage:v3];
}

- (BOOL)showThumbnailViewForMultipage
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 showThumbnailViewForMultipage];

  return v3;
}

- (void)setImageDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 setImageDescription:v4];
}

- (NSString)imageDescription
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 imageDescription];

  return (NSString *)v3;
}

- (BOOL)validateRedo:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  char v6 = [v5 validateRedo:v4];

  return v6;
}

- (BOOL)validateUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  char v6 = [v5 validateUndo:v4];

  return v6;
}

- (void)undo:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 undo:v4];
}

- (void)redo:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 redo:v4];
}

- (void)revert
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  [v2 revert:0];
}

- (BOOL)markupContainerViewController:(id)a3 shouldOpenLink:(id)a4
{
  id v5 = a4;
  char v6 = [(PPKMarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 controller:self shouldOpenLinkAtURL:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)markupContainerViewController:(id)a3 wantsToEnterFullscreen:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PPKMarkupViewController *)self delegate];
  char v7 = (void *)v6;
  if (v6)
  {
    double v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    char v7 = v9;
    if (v8)
    {
      [v9 markupViewController:self didChangeShowingSignaturesUI:v4];
      char v7 = v9;
    }
  }
}

- (PDFDocument)pdfDocument
{
  return 0;
}

- (PDFView)pdfView
{
  return 0;
}

- (UIView)pageLabelView
{
  return 0;
}

- (NSString)outputType
{
  id v2 = [(PPKMarkupViewController *)self outputContentType];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setData:(id)a3
{
}

- (void)setFileURL:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (NSUndoManager)akUndoManager
{
  return self->_akUndoManager;
}

- (void)setAkUndoManager:(id)a3
{
}

- (BOOL)allEditingDisabled
{
  return self->_allEditingDisabled;
}

- (BOOL)allowsThumbnailViewPageReordering
{
  return self->_allowsThumbnailViewPageReordering;
}

- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3
{
  self->_allowsThumbnailViewPageReordering = a3;
}

- (AKController)annotationController
{
  return self->_annotationController;
}

- (BOOL)centersIgnoringContentInsets
{
  return self->_centersIgnoringContentInsets;
}

- (void)setCentersIgnoringContentInsets:(BOOL)a3
{
  self->_centersIgnoringContentInsets = a3;
}

- (MUContentViewControllerProtocol)contentViewController
{
  return (MUContentViewControllerProtocol *)objc_getProperty(self, a2, 1008, 1);
}

- (unint64_t)currentPDFPageIndex
{
  return self->_currentPDFPageIndex;
}

- (void)setCurrentPDFPageIndex:(unint64_t)a3
{
  self->_currentPDFPageIndex = a3;
}

- (MarkupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MarkupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)fixedThumbnailView
{
  return self->_fixedThumbnailView;
}

- (void)setFixedThumbnailView:(BOOL)a3
{
  self->_fixedThumbnailView = a3;
}

- (BOOL)forcesPDFViewTopAlignment
{
  return self->_forcesPDFViewTopAlignment;
}

- (void)setForcesPDFViewTopAlignment:(BOOL)a3
{
  self->_forcesPDFViewTopAlignment = a3;
}

- (UIView)imageViewCombinedContentView
{
  return self->_imageViewCombinedContentView;
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (BOOL)isNavigationModeHorizontal
{
  return self->_navigationModeHorizontal;
}

- (void)setNavigationModeHorizontal:(BOOL)a3
{
  self->_navigationModeHorizontal = a3;
}

- (BOOL)isShapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  self->_shapeDetectionEnabled = a3;
}

- (BOOL)showShareButtonInToolbar
{
  return self->_showShareButtonInToolbar;
}

- (void)setShowShareButtonInToolbar:(BOOL)a3
{
  self->_showShareButtonInToolbar = a3;
}

- (BOOL)isThumbnailViewHidden
{
  return self->_thumbnailViewHidden;
}

- (void)setThumbnailViewHidden:(BOOL)a3
{
  self->_thumbnailViewHidden = a3;
}

- (UIView)toolbar
{
  return self->_toolbar;
}

- (int64_t)toolbarPosition
{
  return self->_toolbarPosition;
}

- (void)setToolbarPosition:(int64_t)a3
{
  self->_toolbarPosition = a3;
}

- (int64_t)thumbnailViewStyle
{
  return self->_thumbnailViewStyle;
}

- (void)setThumbnailViewStyle:(int64_t)a3
{
  self->_thumbnailViewStyle = a3;
}

- (BOOL)isToolbarHidden
{
  return self->_toolbarHidden;
}

- (NSArray)fullViewLayoutConstraints
{
  return self->_fullViewLayoutConstraints;
}

- (void)setFullViewLayoutConstraints:(id)a3
{
}

- (PPKMarkupContainerViewController)markupContainerVC
{
  return self->_markupContainerVC;
}

- (void)setMarkupContainerVC:(id)a3
{
}

- (UTType)sourceContentType
{
  return self->_sourceContentType;
}

- (void)setSourceContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContentType, 0);
  objc_storeStrong((id *)&self->_markupContainerVC, 0);
  objc_storeStrong((id *)&self->_fullViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_imageViewCombinedContentView, 0);
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_storeStrong((id *)&self->_akUndoManager, 0);
}

@end
@interface PPKQuickLookContentEditorViewController
+ (CGSize)_suggestedContentSizeForImageSource:(CGImageSource *)a3;
+ (CGSize)_suggestedContentSizeForPDF:(id)a3;
+ (CGSize)suggestedContentSizeForData:(id)a3;
+ (CGSize)suggestedContentSizeForURL:(id)a3;
- (BOOL)acceptSingleTouch:(id)a3;
- (BOOL)canEncryptDocument;
- (BOOL)documentIsLocked;
- (BOOL)hasResultsForVisualSearch;
- (BOOL)isBannerVisible;
- (BOOL)isInteractionActive;
- (BOOL)isVisualSearchEnabled;
- (BOOL)needsToRestoreAnnotationEditingMode;
- (BOOL)shouldAllowEditingContents:(id)a3;
- (BOOL)shouldEnterVisualSearchAfterNextAnalysis;
- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis;
- (BOOL)shouldUpliftSubjectAfterNextAnalysis;
- (NSString)filledInfoButtonGlyphName;
- (NSString)infoButtonGlyphName;
- (PPKQuickLookBannerView)bannerView;
- (UIFindInteraction)findInteraction;
- (unint64_t)presentationMode;
- (void)find:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)flattenImageForAnalysis;
- (void)hideBanner;
- (void)infoButtonTapped;
- (void)markupContainerViewController:(id)a3 contentFrameDidChange:(CGRect)a4;
- (void)markupContainerViewController:(id)a3 detectedFormInContent:(BOOL)a4 withAutofill:(BOOL)a5;
- (void)markupContainerViewController:(id)a3 didDismissViewControllerWithAnimation:(BOOL)a4;
- (void)markupContainerViewController:(id)a3 openFormFilling:(BOOL)a4;
- (void)markupContainerViewController:(id)a3 thumbnailViewDidCollapse:(BOOL)a4;
- (void)markupContainerViewController:(id)a3 updateChromeWithAnimation:(BOOL)a4;
- (void)markupContainerViewController:(id)a3 willPresentViewControllerWithAnimation:(BOOL)a4;
- (void)markupContainerViewControllerActiveAnalysisInteractionTypesDidChange:(id)a3;
- (void)markupContainerViewControllerAvailableAnalysisResultTypesDidChange:(id)a3;
- (void)markupContainerViewControllerDidChangeContent:(id)a3 enablingMarkup:(BOOL)a4;
- (void)setBannerView:(id)a3;
- (void)setNeedsToRestoreAnnotationEditingMode:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3;
- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3;
- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3;
- (void)setupAndStartImageAnalysisIfNeeded;
- (void)shouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4;
- (void)showBannerWithConfiguration:(id)a3;
- (void)stopImageAnalysis;
- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation PPKQuickLookContentEditorViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PPKQuickLookContentEditorViewController;
  [(PPKMarkupViewController *)&v4 viewDidLoad];
  v3 = [(PPKMarkupViewController *)self markupContainerVC];
  [v3 setFindInteractionEnabled:1];
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4 = a3;
  v5 = [(PPKMarkupViewController *)self markupContainerVC];
  char v6 = [v5 acceptSingleTouch:v4];

  return v6;
}

+ (CGSize)suggestedContentSizeForURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v4)
  {
    v7 = +[PPKMarkupViewController _contentTypeForURL:v4];
    if ([v7 conformsToType:*MEMORY[0x263F1DBF0]])
    {
      v8 = (void *)[objc_alloc(MEMORY[0x263F14740]) initWithURL:v4];
      [a1 _suggestedContentSizeForPDF:v8];
      double v5 = v9;
      double v6 = v10;
    }
    else if ([v7 conformsToType:*MEMORY[0x263F1DB18]])
    {
      CGImageSourceRef v11 = CGImageSourceCreateWithURL(v4, 0);
      if (v11)
      {
        CGImageSourceRef v12 = v11;
        [a1 _suggestedContentSizeForImageSource:v11];
        double v5 = v13;
        double v6 = v14;
        CFRelease(v12);
      }
    }
  }
  double v15 = v5;
  double v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (CGSize)suggestedContentSizeForData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v4)
  {
    v7 = +[PPKMarkupViewController _contentTypeForData:v4];
    if ([v7 conformsToType:*MEMORY[0x263F1DBF0]])
    {
      v8 = (void *)[objc_alloc(MEMORY[0x263F14740]) initWithData:v4];
      [a1 _suggestedContentSizeForPDF:v8];
      double v5 = v9;
      double v6 = v10;
    }
    else if ([v7 conformsToType:*MEMORY[0x263F1DB18]])
    {
      CGImageSourceRef v11 = CGImageSourceCreateWithData(v4, 0);
      if (v11)
      {
        CGImageSourceRef v12 = v11;
        [a1 _suggestedContentSizeForImageSource:v11];
        double v5 = v13;
        double v6 = v14;
        CFRelease(v12);
      }
    }
  }
  double v15 = v5;
  double v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)documentIsLocked
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 documentIsLocked];

  return v3;
}

- (BOOL)canEncryptDocument
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 canEncryptDocument];

  return v3;
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PPKMarkupViewController *)self markupContainerVC];
  [v6 updateForFullscreen:v5 animated:v4];
}

- (void)shouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PPKMarkupViewController *)self markupContainerVC];
  [v6 setShouldHideMarkupOverlays:v5 animated:v4];
}

- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 shouldHighlightTextAndODAfterNextAnalysis];

  return v3;
}

- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setShouldHighlightTextAndODAfterNextAnalysis:v3];
}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 shouldEnterVisualSearchAfterNextAnalysis];

  return v3;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setShouldEnterVisualSearchAfterNextAnalysis:v3];
}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 shouldUpliftSubjectAfterNextAnalysis];

  return v3;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKMarkupViewController *)self markupContainerVC];
  [v4 setShouldUpliftSubjectAfterNextAnalysis:v3];
}

- (void)infoButtonTapped
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  [v2 infoButtonTapped];
}

- (void)setupAndStartImageAnalysisIfNeeded
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  [v2 setupAndStartImageAnalysisIfNeeded];
}

- (void)stopImageAnalysis
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  [v2 stopImageAnalysis];
}

- (void)flattenImageForAnalysis
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  [v2 flattenImageForAnalysis];
}

- (BOOL)isInteractionActive
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 isInteractionActive];

  return v3;
}

- (BOOL)hasResultsForVisualSearch
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 hasResultsForVisualSearch];

  return v3;
}

- (BOOL)isVisualSearchEnabled
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 isVisualSearchEnabled];

  return v3;
}

- (NSString)infoButtonGlyphName
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 infoButtonGlyphName];

  return (NSString *)v3;
}

- (NSString)filledInfoButtonGlyphName
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  char v3 = [v2 filledInfoButtonGlyphName];

  return (NSString *)v3;
}

- (void)markupContainerViewController:(id)a3 updateChromeWithAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PPKMarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 editor:self needsToUpdateChromeWithAnimation:v4];
  }
}

- (void)markupContainerViewController:(id)a3 willPresentViewControllerWithAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PPKMarkupViewController *)self delegate];
  if ([(PPKMarkupViewController *)self annotationEditingEnabled])
  {
    [(PPKQuickLookContentEditorViewController *)self setNeedsToRestoreAnnotationEditingMode:1];
    [(PPKMarkupViewController *)self setAnnotationEditingEnabled:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 editor:self willPresentViewControllerWithAnimation:v4];
  }
}

- (void)markupContainerViewController:(id)a3 didDismissViewControllerWithAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PPKMarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 editor:self didDismissViewControllerWithAnimation:v4];
  }
  if ([(PPKQuickLookContentEditorViewController *)self needsToRestoreAnnotationEditingMode])
  {
    [(PPKMarkupViewController *)self setAnnotationEditingEnabled:1];
    [(PPKQuickLookContentEditorViewController *)self setNeedsToRestoreAnnotationEditingMode:0];
  }
}

- (void)markupContainerViewControllerActiveAnalysisInteractionTypesDidChange:(id)a3
{
  id v4 = [(PPKMarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 editor:self needsToUpdateChromeWithAnimation:1];
  }
}

- (void)markupContainerViewControllerAvailableAnalysisResultTypesDidChange:(id)a3
{
  id v4 = [(PPKMarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 editor:self needsToUpdateChromeWithAnimation:1];
  }
}

- (void)markupContainerViewController:(id)a3 thumbnailViewDidCollapse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PPKMarkupViewController *)self delegate];
  v7 = (void *)v6;
  if (v6)
  {
    double v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if (v8)
    {
      [v9 editor:self needsScreenEdgePanGestureRecognition:!v4];
      v7 = v9;
    }
  }
}

+ (CGSize)_suggestedContentSizeForImageSource:(CGImageSource *)a3
{
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    CGImageRef v4 = ImageAtIndex;
    CGImageGetSizeAfterOrientation();
    double v6 = v5;
    double v8 = v7;
    CFRelease(v4);
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)_suggestedContentSizeForPDF:(id)a3
{
  id v3 = a3;
  CGImageRef v4 = v3;
  CGFloat width = *MEMORY[0x263F001B0];
  CGFloat height = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v3 && [v3 pageCount])
  {
    double v7 = [v4 pageAtIndex:0];
    CGRect BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)[v7 pageRef], kCGPDFMediaBox);
    CGFloat width = BoxRect.size.width;
    CGFloat height = BoxRect.size.height;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)markupContainerViewControllerDidChangeContent:(id)a3 enablingMarkup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PPKMarkupViewController *)self delegate];
  double v7 = (void *)v6;
  if (v6)
  {
    double v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    double v7 = v9;
    if (v8)
    {
      [v9 editorDidChangeContent:self enablingMarkup:v4];
      double v7 = v9;
    }
  }
}

- (void)markupContainerViewController:(id)a3 openFormFilling:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PPKMarkupViewController *)self delegate];
  double v7 = (void *)v6;
  if (v6)
  {
    double v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    double v7 = v9;
    if (v8)
    {
      [v9 editorDidChangeContent:self enablingFormFilling:v4];
      double v7 = v9;
    }
  }
}

- (void)markupContainerViewController:(id)a3 contentFrameDidChange:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = [(PPKMarkupViewController *)self delegate];
  double v10 = (void *)v9;
  if (v9)
  {
    CGImageSourceRef v12 = (void *)v9;
    char v11 = objc_opt_respondsToSelector();
    double v10 = v12;
    if (v11)
    {
      objc_msgSend(v12, "editor:contentFrameDidChange:", self, x, y, width, height);
      double v10 = v12;
    }
  }
}

- (void)markupContainerViewController:(id)a3 detectedFormInContent:(BOOL)a4 withAutofill:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = [(PPKMarkupViewController *)self delegate];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    char v11 = (void *)v8;
    if (objc_opt_respondsToSelector())
    {
      [v11 editor:self detectedFormInContent:v6 withAutofill:v5];
    }
    else
    {
      char v10 = objc_opt_respondsToSelector();
      uint64_t v9 = v11;
      if ((v10 & 1) == 0) {
        goto LABEL_7;
      }
      [v11 editor:self detectedFormInContent:v6];
    }
    uint64_t v9 = v11;
  }
LABEL_7:
}

- (BOOL)shouldAllowEditingContents:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PPKQuickLookContentEditorViewController;
  unsigned int v4 = [(PPKMarkupViewController *)&v9 shouldAllowEditingContents:a3];
  uint64_t v5 = [(PPKMarkupViewController *)self delegate];
  BOOL v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (objc_opt_respondsToSelector()) {
      LOBYTE(v4) = [v6 editorShouldAllowEditingContents:self];
    }
    else {
      LOBYTE(v4) = 1;
    }
  }

  return v4;
}

- (void)showBannerWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKMarkupViewController *)self markupContainerVC];
  [v5 showBannerViewWith:v4];
}

- (void)hideBanner
{
  id v3 = [(PPKMarkupViewController *)self markupContainerVC];
  id v2 = [v3 bannerView];
  [v2 removeFromSuperview];
}

- (BOOL)isBannerVisible
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  id v3 = [v2 bannerView];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (UIFindInteraction)findInteraction
{
  id v2 = [(PPKMarkupViewController *)self markupContainerVC];
  id v3 = [v2 findInteraction];

  return (UIFindInteraction *)v3;
}

- (void)find:(id)a3
{
  id v3 = [(PPKQuickLookContentEditorViewController *)self findInteraction];
  [v3 presentFindNavigatorShowingReplace:0];
}

- (void)findNext:(id)a3
{
  id v3 = [(PPKQuickLookContentEditorViewController *)self findInteraction];
  [v3 findNext];
}

- (void)findPrevious:(id)a3
{
  id v3 = [(PPKQuickLookContentEditorViewController *)self findInteraction];
  [v3 findPrevious];
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (PPKQuickLookBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (BOOL)needsToRestoreAnnotationEditingMode
{
  return self->_needsToRestoreAnnotationEditingMode;
}

- (void)setNeedsToRestoreAnnotationEditingMode:(BOOL)a3
{
  self->_needsToRestoreAnnotationEditingMode = a3;
}

- (void).cxx_destruct
{
}

@end
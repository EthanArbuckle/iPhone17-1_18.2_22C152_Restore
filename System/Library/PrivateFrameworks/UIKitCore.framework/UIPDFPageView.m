@interface UIPDFPageView
- (BOOL)allowHighlighting;
- (BOOL)allowMenu;
- (BOOL)allowSelection;
- (BOOL)allowTwoFingerSelection;
- (BOOL)animateSetFrame;
- (BOOL)hasSearchHighlights;
- (BOOL)showActivityIndicator;
- (BOOL)showAnnotations;
- (BOOL)showLinkAnnotationUnderline;
- (BOOL)showTextAnnotations;
- (BOOL)useBackingLayer;
- (BOOL)willDoSomethingWithTap:(CGPoint)a3;
- (CALayer)contentLayer;
- (CALayer)effectsLayer;
- (CGColor)highLightColor;
- (CGPDFDictionary)_annotForPoint:(CGPoint)a3 rect:(CGRect *)a4;
- (CGPoint)convertPointFromPDFPageSpace:(CGPoint)a3;
- (CGPoint)convertPointToPDFPageSpace:(CGPoint)a3;
- (CGRect)convertRectFromPDFPageSpace:(CGRect)a3;
- (CGRect)convertRectToPDFPageSpace:(CGRect)a3;
- (CGRect)fitRect:(CGRect)a3;
- (CGRect)fitWidth:(CGRect)a3 atVertical:(double)a4;
- (CGRect)rectangleOfInterestAt:(CGPoint)a3 kind:(int *)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSObject)delegate;
- (UIColor)backingLayerColor;
- (UIImage)backgroundImage;
- (UIPDFAnnotationController)annotationController;
- (UIPDFDocument)document;
- (UIPDFPage)page;
- (UIPDFPageView)init;
- (UIPDFPageView)initWithPage:(id)a3;
- (UIPDFPageView)initWithPage:(id)a3 tiledContent:(BOOL)a4;
- (UIPDFPageView)initWithPageLimitedMemory:(id)a3;
- (UIPDFSelectionController)selectionController;
- (double)margin;
- (id)createBackingLayer;
- (id)receiveBackgroundImage:(id)a3 info:(id)a4;
- (id)searchHighlightSelectionAt:(CGPoint)a3;
- (unint64_t)pageIndex;
- (void)addLayers:(BOOL)a3;
- (void)addPage:(id)a3;
- (void)addWidgetToSelection;
- (void)clearSearchHighlights;
- (void)clearSelection;
- (void)dealloc;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)didScroll:(id)a3;
- (void)displayContent;
- (void)doubleTapAt:(CGPoint)a3;
- (void)drawAnnotations:(CGContext *)a3;
- (void)enableLightMemoryFootprint;
- (void)hideSelection;
- (void)highlightSearchSelection:(id)a3 animated:(BOOL)a4;
- (void)ignoreTouches:(BOOL)a3;
- (void)layoutSubviews;
- (void)layoutTextEffects;
- (void)removeBackingLayer;
- (void)scheduleBackgroundImage;
- (void)setAllowHighlighting:(BOOL)a3;
- (void)setAllowMenu:(BOOL)a3;
- (void)setAllowSelection:(BOOL)a3;
- (void)setAllowTwoFingerSelection:(BOOL)a3;
- (void)setAnimateSetFrame:(BOOL)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackingLayerColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingSurfaceLayer:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMargin:(double)a3;
- (void)setNeedsDisplay;
- (void)setPage:(id)a3;
- (void)setSelectionController:(id)a3;
- (void)setSelectionNeedsDisplay;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setShowAnnotations:(BOOL)a3;
- (void)setShowLinkAnnotationUnderline:(BOOL)a3;
- (void)setShowTextAnnotations:(BOOL)a3;
- (void)setTransforms;
- (void)setUseBackingLayer:(BOOL)a3;
- (void)showContent;
- (void)showSelection;
- (void)singleTapAt:(CGPoint)a3;
- (void)stopActivityIndicator;
- (void)suspendInstantTouchHighlighting;
- (void)twoFingerDoubleTapAt:(CGPoint)a3;
- (void)viewDidZoom:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation UIPDFPageView

- (UIPDFPageView)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIPDFPageView;
  v2 = [(UIView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_scalePageOnDraw = 1;
    v2->_animateSetFrame = 1;
    v4 = [[UIPDFViewTouchHandler alloc] initWithView:v2];
    v3->_touchHandler = v4;
    [(UIPDFViewTouchHandler *)v4 enableRecognizers];
    v3->_searchHighlightController = [[UIPDFSearchHighlightsController alloc] initWithPageView:v3];
    [(UIPDFPageView *)v3 setAllowMenu:1];
    v3->_margin = 0.0;
    v3->_delegate = 0;
    v3->_allowSelection = 1;
    v3->_allowTwoFingerSelection = 0;
    v3->_useBackingLayer = 0;
    v3->_highLightColor = 0;
    v3->_useTiledContent = 0;
    v3->_enableLightMemoryFootprint = 0;
    v3->_showActivityIndicator = 1;
    v3->_annotationController = 0;
    [(UIPDFPageView *)v3 setShowAnnotations:0];
    [(UIPDFPageView *)v3 setAllowHighlighting:0];
    [(UIPDFPageView *)v3 setShowTextAnnotations:0];
    [(UIPDFPageView *)v3 setBackingLayerColor:+[UIColor lightGrayColor]];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_didReceiveMemoryWarning_, @"UIApplicationDidReceiveMemoryWarningNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_didScroll_, @"UITextSelectionDidScroll", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_viewDidZoom_, @"UITextSelectionDidZoom", 0);
  }
  return v3;
}

- (void)setBackingLayerColor:(id)a3
{
  id v5 = a3;

  self->_backingLayerColor = (UIColor *)a3;
  activityIndicator = self->_activityIndicator;
  uint64_t v7 = UIActivityIndicatorViewStyleForBackingColor(a3);
  [(UIActivityIndicatorView *)activityIndicator setActivityIndicatorViewStyle:v7];
}

- (void)addLayers:(BOOL)a3
{
  v4 = off_1E52D42D8;
  if (!a3) {
    v4 = off_1E52D42D0;
  }
  self->_contentLayer = (CALayer *)objc_alloc_init(*v4);
  id v5 = objc_alloc_init(UIPDFPageContentDelegate);
  self->_contentDelegate = v5;
  [(CALayer *)self->_contentLayer setDelegate:v5];
  [(UIPDFPageContentDelegate *)self->_contentDelegate setOwner:self->_contentLayer];
  [(UIPDFPageContentDelegate *)self->_contentDelegate setView:self];
  objc_super v6 = [(UIPDFPageView *)self highLightColor];
  contentDelegate = self->_contentDelegate;
  [(UIPDFPageContentDelegate *)contentDelegate setHighlightColor:v6];
}

- (UIPDFPageView)initWithPage:(id)a3
{
  if (a3)
  {
    v4 = [(UIPDFPageView *)self init];
    [(UIPDFPageView *)v4 addLayers:1];
    [(UIPDFPageView *)v4 addPage:a3];
  }
  else
  {

    return 0;
  }
  return v4;
}

- (UIPDFPageView)initWithPage:(id)a3 tiledContent:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    objc_super v6 = [(UIPDFPageView *)self init];
    [(UIPDFPageView *)v6 addLayers:v4];
    [(UIPDFPageView *)v6 addPage:a3];
  }
  else
  {

    return 0;
  }
  return v6;
}

- (UIPDFPageView)initWithPageLimitedMemory:(id)a3
{
  if (a3)
  {
    BOOL v4 = [(UIPDFPageView *)self init];
    [(UIPDFPageView *)v4 addLayers:1];
    [(UIPDFPageView *)v4 addPage:a3];
    [(UIPDFPageView *)v4 enableLightMemoryFootprint];
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_selectionController);
  CGColorRelease(self->_highLightColor);
  [[(UIPDFPageView *)self page] setPageImage:0];
  [(UIPDFPageView *)self setBackgroundImage:0];
  [(UIPDFPageView *)self setBackingLayerColor:0];
  [(UIPDFPage *)self->_page clearAnnotations];
  [(UIPDFViewTouchHandler *)self->_touchHandler disableRecognizers];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self->_activityIndicator];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self->_selectionController];

  [(CALayer *)self->_contentLayer setDelegate:0];
  [(CALayer *)self->_contentLayer setContents:0];
  [(CALayer *)self->_contentLayer removeFromSuperlayer];

  self->_contentLayer = 0;
  [(UIPDFPageContentDelegate *)self->_contentDelegate setOwner:0];
  [(UIPDFPageContentDelegate *)self->_contentDelegate setView:0];

  self->_contentDelegate = 0;
  [(UIPDFAnnotationController *)self->_annotationController setView:0];

  self->_annotationController = 0;
  self->_page = 0;

  self->_effectsLayer = 0;
  self->_document = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageView;
  [(UIView *)&v3 dealloc];
}

- (void)didReceiveMemoryWarning:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contentDelegate = self->_contentDelegate;
  if (contentDelegate && !self->_enableLightMemoryFootprint) {
    [(UIPDFPageContentDelegate *)contentDelegate setIsCancelled:1];
  }
  [(UIPDFPage *)self->_page refresh];
  os_unfair_lock_unlock(p_lock);
}

- (void)setDrawingSurfaceLayer:(id)a3
{
  BOOL v4 = [(UIPDFPageView *)self annotationController];
  [(UIPDFAnnotationController *)v4 setDrawingSurface:a3];
}

- (UIPDFPage)page
{
  return self->_page;
}

- (unint64_t)pageIndex
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t pageIndex = self->_pageIndex;
  os_unfair_lock_unlock(p_lock);
  return pageIndex;
}

- (UIPDFDocument)document
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_document;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSelectionNeedsDisplay
{
}

- (void)setNeedsDisplay
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(CALayer *)self->_contentLayer setNeedsDisplay];
  [(UIPDFSearchHighlightsController *)self->_searchHighlightController setNeedsDisplay];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  highlights = self->_highlights;
  uint64_t v4 = [(NSMutableArray *)highlights countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(highlights);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setNeedsDisplay];
      }
      uint64_t v5 = [(NSMutableArray *)highlights countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(UIPDFAnnotationController *)self->_annotationController setNeedsDisplay];
  v8.receiver = self;
  v8.super_class = (Class)UIPDFPageView;
  [(UIView *)&v8 setNeedsDisplay];
}

- (void)willMoveToSuperview:(id)a3
{
}

- (UIImage)backgroundImage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_backgroundImage;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBackgroundImage:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  backgroundImage = self->_backgroundImage;
  os_unfair_lock_unlock(p_lock);
  if (backgroundImage != a3)
  {
    [(UIPDFPageView *)self willChangeValueForKey:@"backgroundImage"];
    id v7 = a3;
    os_unfair_lock_lock(p_lock);

    self->_backgroundImage = (UIImage *)a3;
    os_unfair_lock_unlock(p_lock);
    [(UIPDFPageView *)self didChangeValueForKey:@"backgroundImage"];
  }
}

- (void)scheduleBackgroundImage
{
  [+[UIScreen mainScreen] scale];
  double v4 = v3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  os_unfair_lock_lock(&self->_lock);
  BOOL backgroundIsScheduled = self->_backgroundIsScheduled;
  self->_BOOL backgroundIsScheduled = 1;
  ++self->_backgroundScheduleCount;
  os_unfair_lock_unlock(&self->_lock);
  if (!backgroundIsScheduled && self->_showActivityIndicator)
  {
    if (!self->_activityIndicator)
    {
      long long v10 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleForBackingColor([(UIPDFPageView *)self backingLayerColor])];
      self->_activityIndicator = v10;
      [(UIView *)self addSubview:v10];
    }
    [(UIView *)self bounds];
    double MidX = CGRectGetMidX(v28);
    [(UIView *)self bounds];
    -[UIView setCenter:](self->_activityIndicator, "setCenter:", MidX, CGRectGetMidY(v29));
    [(UIView *)self bringSubviewToFront:self->_activityIndicator];
    [(UIActivityIndicatorView *)self->_activityIndicator performSelector:sel_startAnimating withObject:0 afterDelay:0.5];
  }
  os_unfair_lock_lock(&self->_lock);
  long long v12 = [(UIPDFDocument *)self->_document pageImageCache];
  unint64_t pageIndex = self->_pageIndex;
  BOOL backgroundIsFullResolution = self->_backgroundIsFullResolution;
  BOOL v27 = self->_backgroundIsFullResolution;
  os_unfair_lock_unlock(&self->_lock);
  [(UIView *)self frame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [[(UIView *)self superview] bounds];
  v31.origin.x = v23;
  v31.origin.y = v24;
  v31.size.width = v25;
  v31.size.height = v26;
  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  if (CGRectIntersectsRect(v30, v31))
  {
    -[UIPDFPageImageCache deliverImageOfPage:maxSize:quality:receiver:selector:info:](v12, "deliverImageOfPage:maxSize:quality:receiver:selector:info:", pageIndex + 1, &v27, self, sel_receiveBackgroundImage_info_, 0, v4 * v6, v4 * v8);
    BOOL backgroundIsFullResolution = v27;
  }
  if (backgroundIsFullResolution)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_BOOL backgroundIsFullResolution = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)didScroll:(id)a3
{
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(UIView *)self isDescendantOfView:v4]) {
    return;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_backgroundIsScheduled)
  {
    if (!self->_backgroundImage && !self->_backgroundIsFullResolution)
    {
      self->_BOOL backgroundIsFullResolution = 1;
      os_unfair_lock_unlock(&self->_lock);
      [(UIPDFPageView *)self scheduleBackgroundImage];
      return;
    }
  }
  else
  {
    self->_BOOL backgroundIsFullResolution = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)viewDidZoom:(id)a3
{
  uint64_t v4 = [(UIView *)self superview];
  if (v4)
  {
    double v5 = [(UIView *)v4 layer];
    if (v5)
    {
      [(CALayer *)v5 transform];
      self->_cachedScale = v6;
    }
  }
  [(UIPDFSearchHighlightsController *)self->_searchHighlightController setNeedsDisplay];
}

- (void)removeBackingLayer
{
}

- (id)createBackingLayer
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  objc_msgSend(v3, "setBackgroundColor:", -[UIColor CGColor](-[UIPDFPageView backingLayerColor](self, "backingLayerColor"), "CGColor"));
  [v3 setOpaque:1];
  [(UIView *)self bounds];
  objc_msgSend(v3, "setBounds:");
  [(CALayer *)self->_contentLayer position];
  objc_msgSend(v3, "setPosition:");
  return v3;
}

- (void)layoutSubviews
{
  if (![(UIPDFPageView *)self document]) {
    return;
  }
  if (self->_useBackingLayer)
  {
    if (!self->_backingLayer)
    {
      self->_backingLayer = (CALayer *)[(UIPDFPageView *)self createBackingLayer];
      [(CALayer *)[(UIView *)self layer] addSublayer:self->_backingLayer];
    }
    if ([(UIPDFPageView *)self backgroundImage] && !self->_boundsChanged) {
      goto LABEL_13;
    }
    if (!self->_backgroundIsScheduled) {
      [(UIPDFPageView *)self scheduleBackgroundImage];
    }
    [(CALayer *)self->_contentLayer position];
    double v4 = v3;
    double v6 = v5;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(UIView *)self bounds];
    -[CALayer setBounds:](self->_backingLayer, "setBounds:");
    -[CALayer setPosition:](self->_backingLayer, "setPosition:", v4, v6);
    [MEMORY[0x1E4F39CF8] commit];
    goto LABEL_12;
  }
  if (![(CALayer *)self->_contentLayer superlayer])
  {
    [(CALayer *)[(UIView *)self layer] addSublayer:self->_contentLayer];
    [(CALayer *)self->_contentLayer setNeedsDisplay];
LABEL_12:
    self->_boundsChanged = 0;
  }
LABEL_13:
  [(CALayer *)self->_contentLayer setNeedsLayout];
  v7.receiver = self;
  v7.super_class = (Class)UIPDFPageView;
  [(UIView *)&v7 layoutSubviews];
  +[UITextEffectsWindow sharedTextEffectsWindowAboveStatusBar];
  if ([(UIPDFPageView *)self showAnnotations]
    || [(UIPDFPageView *)self allowHighlighting])
  {
    [(UIPDFAnnotationController *)self->_annotationController layoutAnnotationViews:self];
  }
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
}

- (void)stopActivityIndicator
{
  if (self->_activityIndicator)
  {
    objc_msgSend(MEMORY[0x1E4FBA8A8], "cancelPreviousPerformRequestsWithTarget:");
    [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
    [(UIView *)self->_activityIndicator removeFromSuperview];

    self->_activityIndicator = 0;
  }
}

- (void)showContent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  highlights = self->_highlights;
  uint64_t v4 = [(NSMutableArray *)highlights countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(highlights);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) unhide];
      }
      uint64_t v5 = [(NSMutableArray *)highlights countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  if (![(CALayer *)self->_contentLayer superlayer])
  {
    [(CALayer *)[(UIView *)self layer] insertSublayer:self->_contentLayer above:self->_backingLayer];
    [(CALayer *)self->_contentLayer setNeedsDisplay];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"kUIPDFContentLayerAdded", self);
  }
  os_unfair_lock_lock(&self->_lock);
  double v8 = self->_backgroundImage;
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    [[(UIPDFPageView *)self page] setPageImage:v8];
  }
  if (self->_delegate)
  {
    if (objc_opt_respondsToSelector()) {
      [self->_delegate pageWasRendered:self];
    }
  }
}

- (void)enableLightMemoryFootprint
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    contentLayer = self->_contentLayer;
    self->_enableLightMemoryFootprint = 1;
    -[CALayer setTileSize:](contentLayer, "setTileSize:", 512.0, 512.0);
    [(CALayer *)contentLayer setLevelsOfDetail:1];
    [(CALayer *)contentLayer setLevelsOfDetailBias:2];
  }
}

- (id)receiveBackgroundImage:(id)a3 info:(id)a4
{
  if (self->_showActivityIndicator) {
    [(UIPDFPageView *)self performSelectorOnMainThread:sel_stopActivityIndicator withObject:0 waitUntilDone:0];
  }
  os_unfair_lock_lock(&self->_lock);
  if (!a3)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_8;
  }
  backgroundImage = self->_backgroundImage;
  if (backgroundImage)
  {
    [(UIImage *)backgroundImage size];
    double v8 = v7;
    double v10 = v9;
    [a3 size];
    double v13 = v11 * v12;
    os_unfair_lock_unlock(&self->_lock);
    if (v13 > v8 * v10) {
      goto LABEL_10;
    }
LABEL_8:
    os_unfair_lock_lock(&self->_lock);
    int v14 = 0;
    goto LABEL_11;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_10:
  [(UIPDFPageView *)self willChangeValueForKey:@"backgroundImage"];
  id v15 = a3;
  os_unfair_lock_lock(&self->_lock);

  self->_backgroundImage = (UIImage *)a3;
  [MEMORY[0x1E4F39CF8] begin];
  int v14 = 1;
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  -[CALayer setContents:](self->_backingLayer, "setContents:", [a3 CGImage]);
  [MEMORY[0x1E4F39CF8] commit];
LABEL_11:
  unint64_t v16 = self->_backgroundScheduleCount - 1;
  self->_backgroundScheduleCount = v16;
  os_unfair_lock_unlock(&self->_lock);
  if (v14) {
    [(UIPDFPageView *)self didChangeValueForKey:@"backgroundImage"];
  }
  if (!v16)
  {
    [(UIPDFPageView *)self performSelectorOnMainThread:sel_showContent withObject:0 waitUntilDone:0];
    self->_BOOL backgroundIsScheduled = 0;
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F39CF8] flush];
  }
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectIntegral(v26);
  CGFloat v16 = v27.origin.x;
  CGFloat v17 = v27.origin.y;
  CGFloat v18 = v27.size.width;
  CGFloat v19 = v27.size.height;
  v25.receiver = self;
  v25.super_class = (Class)UIPDFPageView;
  -[UIView setFrame:](&v25, sel_setFrame_);
  v28.origin.CGFloat x = v16;
  v28.origin.CGFloat y = v17;
  v28.size.CGFloat width = v18;
  v28.size.CGFloat height = v19;
  if (!CGRectIsEmpty(v28) && self->_document)
  {
    [(UIView *)self bounds];
    v32.origin.CGFloat x = v20;
    v32.origin.CGFloat y = v21;
    v32.size.CGFloat width = v22;
    v32.size.CGFloat height = v23;
    v29.origin.CGFloat x = v9;
    v29.origin.CGFloat y = v11;
    v29.size.CGFloat width = v13;
    v29.size.CGFloat height = v15;
    self->_boundsChanged = !CGRectEqualToRect(v29, v32);
    self->_scalePageOnDraw = 1;
    [(UIView *)self bounds];
    -[CALayer setBounds:](self->_contentLayer, "setBounds:");
    [(UIView *)self bounds];
    double MidX = CGRectGetMidX(v30);
    [(UIView *)self bounds];
    -[CALayer setPosition:](self->_contentLayer, "setPosition:", MidX, CGRectGetMidY(v31));
    if (self->_effectsLayer)
    {
      [(UIView *)self bounds];
      -[CALayer setBounds:](self->_effectsLayer, "setBounds:");
      [(CALayer *)self->_contentLayer position];
      -[CALayer setPosition:](self->_effectsLayer, "setPosition:");
    }
    if (self->_useBackingLayer && !self->_backingLayer)
    {
      self->_backingLayer = (CALayer *)[(UIPDFPageView *)self createBackingLayer];
      [(CALayer *)[(UIView *)self layer] addSublayer:self->_backingLayer];
    }
    [(UIPDFPageView *)self setTransforms];
    [(CALayer *)self->_contentLayer setNeedsLayout];
    [(CALayer *)self->_effectsLayer setNeedsLayout];
    [(UIPDFPageView *)self setNeedsDisplay];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = [(UIPDFPageView *)self page];
  if (v5)
  {
    [(UIPDFPage *)v5 cropBoxAccountForRotation];
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat v8 = v19.size.width;
    CGFloat v9 = v19.size.height;
    double v10 = CGRectGetWidth(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.double width = v8;
    v20.size.double height = v9;
    double v11 = CGRectGetHeight(v20);
    if (v10 >= 1.0 && v11 >= 1.0)
    {
      double v13 = fmin(width / v10, height / v11);
      float v14 = v11 * v13;
      double height = truncf(v14);
      float v15 = v10 * v13;
      double width = truncf(v15);
    }
  }
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutTextEffects
{
}

- (void)addPage:(id)a3
{
  [a3 cropBoxAccountForRotation];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double v9 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  -[UIPDFPageView setFrame:](self, "setFrame:", 0.0, 0.0, v9, CGRectGetHeight(v11));
  [(UIPDFPageView *)self setPage:a3];
  self->_scalePageOnDraw = 0;
}

- (void)setPage:(id)a3
{
  if (self->_page != a3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = (UIPDFDocument *)[a3 document];
    if (self->_document != v6) {
      self->_document = v6;
    }
    self->_unint64_t pageIndex = [a3 pageIndex];
    [(UIPDFPageContentDelegate *)self->_contentDelegate setDocument:self->_document];
    [(UIPDFPageContentDelegate *)self->_contentDelegate setPageIndex:self->_pageIndex];
    [a3 cropBox];
    self->_cropBox.origin.CGFloat x = v7;
    self->_cropBox.origin.CGFloat y = v8;
    self->_cropBox.size.CGFloat width = v9;
    self->_cropBox.size.CGFloat height = v10;
    -[UIPDFPageContentDelegate setPageRotation:](self->_contentDelegate, "setPageRotation:", [a3 rotation]);
    [a3 cropBoxAccountForRotation];
    -[UIPDFPageContentDelegate setBox:](self->_contentDelegate, "setBox:");
    [(CALayer *)self->_contentLayer setOpaque:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      contentLayer = self->_contentLayer;
      -[CALayer setTileSize:](contentLayer, "setTileSize:", 1024.0, 1024.0);
      [(CALayer *)contentLayer setLevelsOfDetail:6];
      [(CALayer *)contentLayer setMagnificationFilter:*MEMORY[0x1E4F3A2B0]];
      if (self->_scalePageOnDraw) {
        uint64_t v12 = 5;
      }
      else {
        uint64_t v12 = 3;
      }
      [(CALayer *)contentLayer setLevelsOfDetailBias:v12];
    }
    annotationController = self->_annotationController;
    if (annotationController) {

    }
    self->_annotationController = [[UIPDFAnnotationController alloc] initWithPageView:self];
    [(UIPDFViewTouchHandler *)self->_touchHandler setFirstTouch];

    self->_page = (UIPDFPage *)a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)drawAnnotations:(CGContext *)a3
{
  if ([(UIPDFPageView *)self showAnnotations]
    || [(UIPDFPageView *)self allowHighlighting])
  {
    annotationController = self->_annotationController;
    if (annotationController)
    {
      [(UIPDFAnnotationController *)annotationController drawAnnotations:a3];
    }
  }
}

- (void)ignoreTouches:(BOOL)a3
{
  touchHandler = self->_touchHandler;
  if (a3) {
    [(UIPDFViewTouchHandler *)touchHandler disableRecognizers];
  }
  else {
    [(UIPDFViewTouchHandler *)touchHandler enableRecognizers];
  }
}

- (void)doubleTapAt:(CGPoint)a3
{
  unsigned int v10 = 0;
  if (self->_delegate)
  {
    double y = a3.y;
    double x = a3.x;
    if (objc_opt_respondsToSelector())
    {
      -[UIPDFPageView rectangleOfInterestAt:kind:](self, "rectangleOfInterestAt:kind:", &v10, x, y);
      double v6 = v11.origin.x;
      double v7 = v11.origin.y;
      double width = v11.size.width;
      double height = v11.size.height;
      if (CGRectIsNull(v11))
      {
        if (objc_opt_respondsToSelector()) {
          [self->_delegate resetZoom:self];
        }
      }
      else
      {
        -[NSObject zoom:to:atPoint:kind:](self->_delegate, "zoom:to:atPoint:kind:", self, v10, v6, v7, width, height, x, y);
      }
    }
  }
}

- (void)twoFingerDoubleTapAt:(CGPoint)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->zoomRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->zoomRect.size = v4;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    [delegate resetZoom:self];
  }
}

- (void)singleTapAt:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIPDFSelectionController *)self->_selectionController clearSelection];
  [(UIPDFPageView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(UIPDFPageView *)self delegate];
    -[NSObject didTap:atPoint:](v6, "didTap:atPoint:", self, x, y);
  }
}

- (BOOL)willDoSomethingWithTap:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([[(UIPDFPageView *)self page] selection]
    || -[UIPDFAnnotationController willDoSomethingWithTap:]([(UIPDFPageView *)self annotationController], "willDoSomethingWithTap:", x, y))
  {
    return 1;
  }
  [(UIPDFPageView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v7 = [(UIPDFPageView *)self delegate];
  return -[NSObject shouldRecognizeTapIn:atPoint:](v7, "shouldRecognizeTapIn:atPoint:", self, x, y);
}

- (void)setTransforms
{
  [(UIView *)self bounds];
  CGRect v29 = CGRectInset(v28, self->_margin, self->_margin);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  [[(UIPDFPageView *)self page] cropBoxAccountForRotation];
  memset(&v27, 0, sizeof(v27));
  CGPDFComputeTransform((uint64_t)&v27, [[(UIPDFPageView *)self page] rotation], v7, v8, v9, v10, x, y, width, height);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, 1.0, -1.0);
  [(UIView *)self bounds];
  CGFloat v11 = CGRectGetHeight(v30);
  CGAffineTransform t1 = v26;
  CGAffineTransformTranslate(&v25, &t1, 0.0, -v11);
  CGAffineTransform v26 = v25;
  p_pageToViewTransform = &self->_pageToViewTransform;
  CGAffineTransform t1 = v27;
  CGAffineTransform v23 = v25;
  CGAffineTransformConcat(&v25, &t1, &v23);
  long long v13 = *(_OWORD *)&v25.c;
  *(_OWORD *)&self->_pageToViewTransform.a = *(_OWORD *)&v25.a;
  *(_OWORD *)&self->_pageToViewTransform.c = v13;
  *(_OWORD *)&self->_pageToViewTransform.tCGFloat x = *(_OWORD *)&v25.tx;
  p_viewToPageTransform = &self->_viewToPageTransform;
  uint64_t v15 = MEMORY[0x1E4F1DAB8];
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&self->_viewToPageTransform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->_viewToPageTransform.c = v16;
  *(_OWORD *)&self->_viewToPageTransform.tCGFloat x = *(_OWORD *)(v15 + 32);
  p_cropBoCGFloat x = &self->_cropBox;
  CGFloat v18 = p_cropBox->origin.x;
  *(CGFloat *)&long long v16 = p_cropBox->origin.y;
  CGFloat v19 = p_cropBox->size.width;
  CGFloat v20 = p_cropBox->size.height;
  if (CGRectGetWidth(*(CGRect *)((char *)&v16 - 8)) >= 1.0 && CGRectGetHeight(*p_cropBox) >= 1.0)
  {
    long long v21 = *(_OWORD *)&p_pageToViewTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_pageToViewTransform->a;
    *(_OWORD *)&t1.c = v21;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&p_pageToViewTransform->tx;
    CGAffineTransformInvert(&v25, &t1);
    long long v22 = *(_OWORD *)&v25.c;
    *(_OWORD *)&p_viewToPageTransform->a = *(_OWORD *)&v25.a;
    *(_OWORD *)&p_viewToPageTransform->c = v22;
    *(_OWORD *)&p_viewToPageTransform->tCGFloat x = *(_OWORD *)&v25.tx;
  }
}

- (CGPoint)convertPointToPDFPageSpace:(CGPoint)a3
{
  float64x2_t v3 = vaddq_f64(*(float64x2_t *)&self->_viewToPageTransform.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&self->_viewToPageTransform.a, a3.x), vmulq_n_f64(*(float64x2_t *)&self->_viewToPageTransform.c, a3.y)));
  double v4 = v3.f64[1];
  result.CGFloat x = v3.f64[0];
  result.CGFloat y = v4;
  return result;
}

- (CGPoint)convertPointFromPDFPageSpace:(CGPoint)a3
{
  float64x2_t v3 = vaddq_f64(*(float64x2_t *)&self->_pageToViewTransform.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&self->_pageToViewTransform.a, a3.x), vmulq_n_f64(*(float64x2_t *)&self->_pageToViewTransform.c, a3.y)));
  double v4 = v3.f64[1];
  result.CGFloat x = v3.f64[0];
  result.CGFloat y = v4;
  return result;
}

- (CGRect)convertRectToPDFPageSpace:(CGRect)a3
{
  long long v3 = *(_OWORD *)&self->_viewToPageTransform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_viewToPageTransform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tCGFloat x = *(_OWORD *)&self->_viewToPageTransform.tx;
  return CGRectApplyAffineTransform(a3, &v4);
}

- (CGRect)convertRectFromPDFPageSpace:(CGRect)a3
{
  long long v3 = *(_OWORD *)&self->_pageToViewTransform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_pageToViewTransform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tCGFloat x = *(_OWORD *)&self->_pageToViewTransform.tx;
  return CGRectApplyAffineTransform(a3, &v4);
}

- (CGRect)fitWidth:(CGRect)a3 atVertical:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self bounds];
  if (v9 <= 0.0)
  {
    double v12 = height;
    goto LABEL_10;
  }
  double v11 = width * v10;
  double v12 = width * v10 / v9;
  double v13 = a4 + v12 * -0.5;
  if (v11 <= height * v9)
  {
    if (v13 < y) {
      goto LABEL_10;
    }
    double v14 = y + height;
    if (v12 + v13 <= y + height) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
  if (v13 <= y)
  {
    double v14 = y + height;
    if (v12 + v13 >= y + height)
    {
LABEL_5:
      double y = a4 + v12 * -0.5;
      goto LABEL_10;
    }
LABEL_9:
    double y = v14 - v12;
  }
LABEL_10:
  double v15 = x;
  double v16 = y;
  double v17 = width;
  result.size.double height = v12;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)fitRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = height * v7;
  if (width * v8 <= height * v7)
  {
    if (v8 > 0.0)
    {
      double x = x + (v9 / v8 - width) * -0.5;
      double width = v9 / v8;
    }
  }
  else if (v7 > 0.0)
  {
    double y = y + (width * v8 / v7 - height) * -0.5;
    double height = width * v8 / v7;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)rectangleOfInterestAt:(CGPoint)a3 kind:(int *)a4
{
  double y = a3.y;
  [(UIPDFPageView *)self convertPointToPDFPageSpace:a3.x];
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self bounds];
  double v39 = v11;
  double v13 = v12;
  double x = *MEMORY[0x1E4F1DB20];
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  CGSize v40 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  CGPoint v41 = (CGPoint)*MEMORY[0x1E4F1DB20];
  v46.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v46.size = v40;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v45.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v45.c = v18;
  *(_OWORD *)&v45.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v44 = 0.0;
  [[(UIPDFPageView *)self page] CGPage];
  if (CGPDFSelectionCreateAtPointWithOptions())
  {
    int IsStandaloneGraphic = CGPDFSelectionIsStandaloneGraphic();
    if (a4)
    {
      if (IsStandaloneGraphic) {
        int v20 = 1;
      }
      else {
        int v20 = 2;
      }
      *a4 = v20;
    }
    int ContentRect = CGPDFSelectionGetContentRect();
    CGPDFSelectionRelease();
    if (ContentRect && !CGRectIsNull(v46))
    {
      if (v44 == 0.0 || ContentRect == 2)
      {
        CGAffineTransform v43 = v45;
        CGRect v46 = CGRectApplyAffineTransform(v46, &v43);
      }
      else
      {
        double height = v46.size.height;
        double width = v46.size.width;
        double v24 = v46.origin.y;
        if (v46.size.height > v46.size.width)
        {
          CGAffineTransform v42 = v45;
          memset(&v43, 0, sizeof(v43));
          CGAffineTransformInvert(&v43, &v42);
          double v25 = width * 0.5 + v43.ty + v8 * v43.b + v10 * v43.d;
          if (height + v24 <= v25) {
            double v25 = height + v24;
          }
          double v24 = v25 - width;
          v46.origin.double y = v25 - width;
          v46.size.double height = width;
          double height = width;
        }
        v47.origin.double x = v46.origin.x;
        CGAffineTransform v43 = v45;
        v47.origin.double y = v24;
        v47.size.double width = width;
        v47.size.double height = height;
        CGRect v48 = CGRectApplyAffineTransform(v47, &v43);
        CGRect v46 = v48;
        if (v13 > 0.0 && v13 * v48.size.width < v39 * v48.size.height)
        {
          v46.origin.double x = v48.origin.x + (v39 * v48.size.height / v13 - v48.size.width) * -0.5;
          v46.size.double width = v39 * v48.size.height / v13;
        }
      }
      -[UIPDFPageView convertRectFromPDFPageSpace:](self, "convertRectFromPDFPageSpace:");
      double x = v26;
      double v14 = v27;
      double v17 = v28;
      double v16 = v29;
    }
    v49.origin.double x = x;
    v49.origin.double y = v14;
    v49.size.double width = v17;
    v49.size.double height = v16;
    if (CGRectIsEmpty(v49)
      || (p_zoomRect = &self->zoomRect,
          v51.origin.double x = x,
          v51.origin.double y = v14,
          v51.size.double width = v17,
          v51.size.double height = v16,
          CGRectEqualToRect(self->zoomRect, v51)))
    {
      self->zoomRect.origin = v41;
      self->zoomRect.size = v40;
    }
    else
    {
      if (ContentRect == 1) {
        -[UIPDFPageView fitWidth:atVertical:](self, "fitWidth:atVertical:", x, v14, v17, v16, y);
      }
      else {
        -[UIPDFPageView fitRect:](self, "fitRect:", x, v14, v17, v16);
      }
      if (CGRectIsEmpty(*(CGRect *)&v35))
      {
        p_zoomRect->origin = v41;
        self->zoomRect.size = v40;
      }
      else
      {
        p_zoomRect->origin.double x = x;
        self->zoomRect.origin.double y = v14;
        self->zoomRect.size.double width = v17;
        self->zoomRect.size.double height = v16;
      }
    }
    double v17 = self->zoomRect.size.width;
    double v16 = self->zoomRect.size.height;
    double x = self->zoomRect.origin.x;
    double v14 = self->zoomRect.origin.y;
  }
  double v31 = x;
  double v32 = v14;
  double v33 = v17;
  double v34 = v16;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)displayContent
{
}

- (void)clearSelection
{
}

- (CGColor)highLightColor
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CGRect result = self->_highLightColor;
  if (!result)
  {
    v5[0] = xmmword_186B9C4D0;
    v5[1] = unk_186B9C4E0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    self->_highLightColor = CGColorCreate(DeviceRGB, (const CGFloat *)v5);
    CGColorSpaceRelease(DeviceRGB);
    return self->_highLightColor;
  }
  return result;
}

- (void)hideSelection
{
  [(UIPDFViewTouchHandler *)self->_touchHandler hideMenu];
  selectionController = self->_selectionController;
  [(UIPDFSelectionController *)selectionController hideWidget];
}

- (void)showSelection
{
  [(UIPDFSelectionController *)self->_selectionController layoutSelections];
  touchHandler = self->_touchHandler;
  [(UIPDFViewTouchHandler *)touchHandler showMenu];
}

- (CALayer)effectsLayer
{
  CGRect result = self->_effectsLayer;
  if (!result)
  {
    self->_effectsLayer = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [(UIView *)self bounds];
    -[CALayer setBounds:](self->_effectsLayer, "setBounds:");
    [(CALayer *)self->_contentLayer position];
    -[CALayer setPosition:](self->_effectsLayer, "setPosition:");
    [(CALayer *)[(UIView *)self layer] insertSublayer:self->_effectsLayer above:self->_contentLayer];
    return self->_effectsLayer;
  }
  return result;
}

- (void)highlightSearchSelection:(id)a3 animated:(BOOL)a4
{
}

- (void)clearSearchHighlights
{
}

- (BOOL)hasSearchHighlights
{
  searchHighlightController = self->_searchHighlightController;
  if (searchHighlightController) {
    LOBYTE(searchHighlightController) = [(UIPDFSearchHighlightsController *)searchHighlightController hasSearchHighlights];
  }
  return (char)searchHighlightController;
}

- (id)searchHighlightSelectionAt:(CGPoint)a3
{
  return -[UIPDFSearchHighlightsController hitTest:](self->_searchHighlightController, "hitTest:", a3.x, a3.y);
}

- (void)addWidgetToSelection
{
  selectionController = self->_selectionController;
  long long v3 = [[(UIPDFPageView *)self page] selection];
  [(UIPDFSelectionController *)selectionController addSelectionWidget:v3];
}

- (BOOL)allowHighlighting
{
  return self->_allowHighlighting;
}

- (void)setAllowHighlighting:(BOOL)a3
{
  self->_allowHighlighting = a3;
}

- (void)suspendInstantTouchHighlighting
{
  [[(UIPDFPageView *)self page] setSelection:[[(UIPDFAnnotationController *)self->_annotationController currentAnnotation] selection]];
  [(UIPDFSelectionController *)self->_selectionController suspendInstantHighlightMode];
  [(UIPDFViewTouchHandler *)self->_touchHandler showMenu];
  [(UIView *)self setNeedsLayout];
  [(UIPDFPageView *)self setNeedsDisplay];
}

- (void)setAllowMenu:(BOOL)a3
{
}

- (BOOL)allowMenu
{
  return [(UIPDFViewTouchHandler *)self->_touchHandler allowMenu];
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (NSObject)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (BOOL)allowSelection
{
  return self->_allowSelection;
}

- (void)setAllowSelection:(BOOL)a3
{
  self->_allowSelection = a3;
}

- (UIPDFSelectionController)selectionController
{
  return self->_selectionController;
}

- (void)setSelectionController:(id)a3
{
  self->_selectionController = (UIPDFSelectionController *)a3;
}

- (BOOL)animateSetFrame
{
  return self->_animateSetFrame;
}

- (void)setAnimateSetFrame:(BOOL)a3
{
  self->_animateSetFrame = a3;
}

- (UIColor)backingLayerColor
{
  return self->_backingLayerColor;
}

- (BOOL)showAnnotations
{
  return self->showAnnotations;
}

- (void)setShowAnnotations:(BOOL)a3
{
  self->showAnnotations = a3;
}

- (BOOL)useBackingLayer
{
  return self->_useBackingLayer;
}

- (void)setUseBackingLayer:(BOOL)a3
{
  self->_useBackingLayer = a3;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (UIPDFAnnotationController)annotationController
{
  return self->_annotationController;
}

- (BOOL)allowTwoFingerSelection
{
  return self->_allowTwoFingerSelection;
}

- (void)setAllowTwoFingerSelection:(BOOL)a3
{
  self->_allowTwoFingerSelection = a3;
}

- (BOOL)showTextAnnotations
{
  return self->_showTextAnnotations;
}

- (void)setShowTextAnnotations:(BOOL)a3
{
  self->_showTextAnnotations = a3;
}

- (BOOL)showLinkAnnotationUnderline
{
  return self->_showLinkAnnotationUnderline;
}

- (void)setShowLinkAnnotationUnderline:(BOOL)a3
{
  self->_showLinkAnnotationUnderline = a3;
}

- (CGPDFDictionary)_annotForPoint:(CGPoint)a3 rect:(CGRect *)a4
{
  if (a4)
  {
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    a4->size = v6;
  }
  -[UIPDFPageView convertPointToPDFPageSpace:](self, "convertPointToPDFPageSpace:", a3.x, a3.y);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGRect result = CGPDFPageGetDictionary([[(UIPDFPageView *)self page] CGPage]);
  if (result)
  {
    CGPDFArrayRef value = 0;
    BOOL v12 = CGPDFDictionaryGetArray(result, "Annots", &value);
    CGRect result = 0;
    if (v12)
    {
      CGRect result = (CGPDFDictionary *)CGPDFArrayGetCount(value);
      if (result)
      {
        double v13 = result;
        size_t v14 = 0;
        double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v24 = *MEMORY[0x1E4F1DB28];
        double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        while (1)
        {
          CGPDFDictionaryRef dict = 0;
          if (CGPDFArrayGetDictionary(value, v14, &dict))
          {
            __s1 = 0;
            if (CGPDFDictionaryGetName(dict, "Subtype", (const char **)&__s1))
            {
              double v17 = __s1;
              if (!strcmp(__s1, "Link") || !strcmp(v17, "lnk"))
              {
                arradouble y = 0;
                if (CGPDFDictionaryGetArray(dict, "Rect", &array))
                {
                  long long v18 = array;
                  double v19 = v16;
                  double v20 = v15;
                  CGFloat v21 = v23;
                  CGFloat v22 = v24;
                  if (CGPDFArrayGetCount(array) == 4)
                  {
                    CGPDFReal v31 = 0.0;
                    CGPDFReal v32 = 0.0;
                    CGPDFReal v29 = 0.0;
                    CGPDFReal v30 = 0.0;
                    CGPDFArrayGetNumber(v18, 0, &v32);
                    CGPDFArrayGetNumber(v18, 1uLL, &v31);
                    CGPDFArrayGetNumber(v18, 2uLL, &v30);
                    CGPDFArrayGetNumber(v18, 3uLL, &v29);
                    CGFloat v21 = v31;
                    CGFloat v22 = v32;
                    double v20 = v30 - v32;
                    double v19 = v29 - v31;
                  }
                  v34.origin.double x = v22;
                  v34.origin.double y = v21;
                  v34.size.double width = v20;
                  v34.size.double height = v19;
                  v33.double x = v8;
                  v33.double y = v10;
                  if (CGRectContainsPoint(v34, v33)) {
                    break;
                  }
                }
              }
            }
          }
          if (v13 == (CGPDFDictionary *)++v14) {
            return 0;
          }
        }
        if (a4)
        {
          a4->origin.double x = v22;
          a4->origin.double y = v21;
          a4->size.double width = v20;
          a4->size.double height = v19;
        }
        return dict;
      }
    }
  }
  return result;
}

@end
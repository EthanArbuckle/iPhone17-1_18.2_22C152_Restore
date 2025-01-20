@interface SXStripGalleryComponentView
- (BOOL)allowHierarchyRemoval;
- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5;
- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5;
- (BOOL)gestureShouldBegin:(id)a3;
- (BOOL)itemizedScrollView:(id)a3 isAllowedToAddViewInHierarchy:(unint64_t)a4;
- (BOOL)itemizedScrollViewWillReindex:(id)a3;
- (BOOL)loadedAtleastOneImage;
- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3;
- (BOOL)usesThumbnailWithImageIdentifier:(id)a3;
- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6;
- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6;
- (CGRect)itemizedScrollView:(id)a3 frameForViewAtIndex:(unint64_t)a4;
- (CGRect)snapRegion;
- (CGRect)transitionContentFrame;
- (CGRect)transitionVisibleFrame;
- (NSArray)accessibilityCaptions;
- (NSArray)imageResources;
- (NSMutableArray)imageViews;
- (NSMutableSet)exposedGalleryItems;
- (SXFullscreenCanvasController)fullScreenCanvasController;
- (SXFullscreenCanvasControllerFactory)canvasControllerFactory;
- (SXImageView)targetGalleryItem;
- (SXImageViewFactory)imageViewFactory;
- (SXItemizedScrollView)itemizedScrollView;
- (SXMediaViewEvent)mediaViewEvent;
- (SXStripGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11;
- (UIView)fullscreenGestureView;
- (double)contentOffset;
- (double)contentWidth;
- (double)gutterBetweenItemsInNotPagingItemizedScrollView:(id)a3;
- (double)rightContentInset;
- (double)xOffset;
- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4;
- (id)contentSizeCategoryForCaption:(id)a3;
- (id)createViewForViewIndex:(unint64_t)a3;
- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5;
- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (id)fullScreenCanvasController:(id)a3 copyViewForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (id)fullScreenCanvasController:(id)a3 originalViewForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (id)imageViewForLocation:(CGPoint)a3;
- (id)itemizedScrollView:(id)a3 viewAtIndex:(unint64_t)a4;
- (id)textResizerForCaption:(id)a3;
- (id)textRulesForCaption:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
- (id)visibleGalleryItemViewForImageIdentifier:(id)a3;
- (int64_t)visibleImageViewIndex;
- (unint64_t)analyticsGalleryType;
- (unint64_t)analyticsMediaType;
- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4;
- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5;
- (unint64_t)lastPreloadViewIndex;
- (unint64_t)numberOfViewsInItemizedScrollView:(id)a3;
- (void)createMediaViewEventForGalleryItem:(id)a3;
- (void)discardContents;
- (void)finishMediaViewEvent;
- (void)forceImageViewFullscreen:(id)a3;
- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 didShowShowable:(id)a4 viewIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5;
- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didHideViewWithIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didShowViewWithIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 willShowViewWithIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5;
- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4;
- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5;
- (void)itemizedScrollView:(id)a3 didChangeToActiveViewIndex:(unint64_t)a4;
- (void)itemizedScrollView:(id)a3 didShowViewWithIndex:(unint64_t)a4;
- (void)loadComponent:(id)a3;
- (void)preloadAdjacentViewsForIndex:(unint64_t)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAccessibilityCaptions:(id)a3;
- (void)setExposedGalleryItems:(id)a3;
- (void)setFullScreenCanvasController:(id)a3;
- (void)setFullscreenGestureView:(id)a3;
- (void)setImageResources:(id)a3;
- (void)setImageViews:(id)a3;
- (void)setItemizedScrollView:(id)a3;
- (void)setLastPreloadViewIndex:(unint64_t)a3;
- (void)setLoadedAtleastOneImage:(BOOL)a3;
- (void)setMediaViewEvent:(id)a3;
- (void)setTargetGalleryItem:(id)a3;
- (void)setVisibleImageViewIndex:(int64_t)a3;
- (void)submitEvents;
- (void)trackExposedGalleryItems;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
- (void)willSubmitMediaExposureEvent:(id)a3;
@end

@implementation SXStripGalleryComponentView

- (SXStripGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11
{
  id v27 = a10;
  id v26 = a11;
  v28.receiver = self;
  v28.super_class = (Class)SXStripGalleryComponentView;
  v18 = [(SXGalleryComponentView *)&v28 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:a8 mediaSharingPolicyProvider:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageViewFactory, a10);
    objc_storeStrong((id *)&v19->_canvasControllerFactory, a11);
    v19->_lastPreloadViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v19->_visibleImageViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v20 = objc_alloc_init(SXItemizedScrollView);
    itemizedScrollView = v19->_itemizedScrollView;
    v19->_itemizedScrollView = v20;

    [(SXItemizedScrollView *)v19->_itemizedScrollView setDataSource:v19];
    [(SXItemizedScrollView *)v19->_itemizedScrollView setDelegate:v19];
    [(SXItemizedScrollView *)v19->_itemizedScrollView setPagingEnabled:0];
    v22 = [(SXComponentView *)v19 contentView];
    [v22 addSubview:v19->_itemizedScrollView];

    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    exposedGalleryItems = v19->_exposedGalleryItems;
    v19->_exposedGalleryItems = (NSMutableSet *)v23;
  }
  return v19;
}

- (void)loadComponent:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)SXStripGalleryComponentView;
  [(SXComponentView *)&v33 loadComponent:a3];
  if (!self->_imageResources)
  {
    v4 = [(SXStripGalleryComponentView *)self canvasControllerFactory];
    v5 = [v4 fullscreenCanvasControllerForShowable:self];
    fullScreenCanvasController = self->_fullScreenCanvasController;
    self->_fullScreenCanvasController = v5;

    id v26 = [MEMORY[0x263EFF980] array];
    id v27 = [MEMORY[0x263EFF980] array];
    objc_super v28 = [MEMORY[0x263EFF980] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v7 = [(SXComponentView *)self component];
    v8 = [v7 items];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v14 = [(SXComponentView *)self DOMObjectProvider];
          v15 = [v13 imageIdentifier];
          v16 = [v14 imageResourceForIdentifier:v15];

          if (v16)
          {
            [v26 addObject:v16];
            v17 = [MEMORY[0x263EFF9D0] null];
            [(NSMutableArray *)v27 addObject:v17];

            v18 = [v13 accessibilityCaption];
            if (v18)
            {
              [v28 addObject:v18];
            }
            else
            {
              v19 = [MEMORY[0x263EFF9D0] null];
              [v28 addObject:v19];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }

    v20 = (NSArray *)[v26 copy];
    imageResources = self->_imageResources;
    self->_imageResources = v20;

    imageViews = self->_imageViews;
    self->_imageViews = v27;
    uint64_t v23 = v27;

    v24 = (NSArray *)[v28 copy];
    accessibilityCaptions = self->_accessibilityCaptions;
    self->_accessibilityCaptions = v24;
  }
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SXStripGalleryComponentView;
  [(SXComponentView *)&v10 receivedInfo:v6 fromLayoutingPhaseWithIdentifier:v7];
  if ([v7 isEqualToString:@"ContentWidth"])
  {
    v8 = &OBJC_IVAR___SXStripGalleryComponentView__contentWidth;
LABEL_7:
    [v6 floatValue];
    *(double *)((char *)&self->super.super.super.super.super.super.isa + *v8) = v9;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"leftOffset"])
  {
    v8 = &OBJC_IVAR___SXStripGalleryComponentView__xOffset;
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"rightOffset"])
  {
    v8 = &OBJC_IVAR___SXStripGalleryComponentView__rightContentInset;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)presentComponentWithChanges:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SXStripGalleryComponentView;
  [(SXComponentView *)&v29 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  [(SXStripGalleryComponentView *)self xOffset];
  double v5 = v4;
  id v6 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [(SXStripGalleryComponentView *)self rightContentInset];
  objc_msgSend(v6, "setContentInset:", 0.0, v5, 0.0, v7);

  [(SXComponentView *)self contentFrame];
  double v9 = v8;
  [(SXStripGalleryComponentView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  v14 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  objc_msgSend(v14, "setFrame:", 0.0, v9, v11, v13);

  if ([(SXStripGalleryComponentView *)self visibleImageViewIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    objc_msgSend(v15, "setActiveViewIndex:animated:", -[SXStripGalleryComponentView visibleImageViewIndex](self, "visibleImageViewIndex"), 0);
  }
  v16 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
  char v17 = [v16 isFullscreen];

  if ((v17 & 1) == 0)
  {
    v18 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    [v18 contentSize];
    double v20 = v19;
    v21 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    [v21 contentSize];
    double v23 = v22;
    v24 = [(SXStripGalleryComponentView *)self fullscreenGestureView];
    objc_msgSend(v24, "setFrame:", 0.0, 0.0, v20, v23);
  }
  v25 = [(SXComponentView *)self viewport];
  [v25 dynamicBounds];
  double Width = CGRectGetWidth(v30);
  [(SXStripGalleryComponentView *)self bounds];
  double v27 = CGRectGetWidth(v31);

  if (Width == v27)
  {
    objc_super v28 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    [v28 setClipsToBounds:0];
  }
}

- (void)discardContents
{
  v14.receiver = self;
  v14.super_class = (Class)SXStripGalleryComponentView;
  [(SXComponentView *)&v14 discardContents];
  v3 = [(SXStripGalleryComponentView *)self imageViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    for (unint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(SXStripGalleryComponentView *)self imageViews];
      double v7 = [v6 objectAtIndex:i];

      double v8 = [(SXStripGalleryComponentView *)self itemizedScrollView];
      unint64_t v9 = [v8 visibleRange];
      unint64_t v11 = v10;

      if (i < v9 || i - v9 >= v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v7 objectHasQualityInterest:self quality:0]) {
            [v7 giveUpInterestForObject:self];
          }
          [v7 setImage:0];
          double v12 = [(SXStripGalleryComponentView *)self imageViews];
          double v13 = [MEMORY[0x263EFF9D0] null];
          [v12 replaceObjectAtIndex:i withObject:v13];
        }
      }
    }
  }
  [(SXStripGalleryComponentView *)self setLastPreloadViewIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (id)createViewForViewIndex:(unint64_t)a3
{
  double v5 = [(SXStripGalleryComponentView *)self imageResources];
  id v6 = [v5 objectAtIndex:a3];

  double v7 = [(SXStripGalleryComponentView *)self imageViewFactory];
  double v8 = [v7 imageViewForResource:v6];

  [v8 setDelegate:self];
  unint64_t v9 = [(SXStripGalleryComponentView *)self accessibilityCaptions];
  unint64_t v10 = [v9 objectAtIndex:a3];

  unint64_t v11 = [MEMORY[0x263EFF9D0] null];

  if (v10 != v11) {
    [v8 setAccessibilityLabel:v10];
  }
  double v12 = [(SXStripGalleryComponentView *)self imageViews];
  [v12 replaceObjectAtIndex:a3 withObject:v8];

  double v13 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [(SXStripGalleryComponentView *)self itemizedScrollView:v13 frameForViewAtIndex:a3];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  objc_msgSend(v8, "setFrame:", v15, v17, v19, v21);
  objc_msgSend(v8, "setPreferredImageSize:", v19, v21);
  [v8 addInterestInImageQuality:0 forObject:self];
  double v22 = [(SXGalleryComponentView *)self dragManager];
  [v22 updateAccessibilityDragSourceDescriptorsForDraggableElement:v8];

  return v8;
}

- (unint64_t)numberOfViewsInItemizedScrollView:(id)a3
{
  v3 = [(SXStripGalleryComponentView *)self imageViews];
  unint64_t v4 = [v3 count];

  return v4;
}

- (CGRect)itemizedScrollView:(id)a3 frameForViewAtIndex:(unint64_t)a4
{
  id v6 = [(SXStripGalleryComponentView *)self imageResources];
  double v7 = [v6 objectAtIndex:a4];

  [(SXComponentView *)self contentFrame];
  CGFloat v9 = v8;
  [v7 widthForImageHeight:v8];
  v19.size.CGFloat width = v10;
  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat height = v9;
  CGRect v20 = CGRectIntegral(v19);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)itemizedScrollView:(id)a3 viewAtIndex:(unint64_t)a4
{
  id v6 = [(SXStripGalleryComponentView *)self imageViews];
  double v7 = [v6 objectAtIndex:a4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(SXStripGalleryComponentView *)self createViewForViewIndex:a4];

    double v7 = (void *)v8;
  }
  [(SXStripGalleryComponentView *)self preloadAdjacentViewsForIndex:a4];
  return v7;
}

- (double)gutterBetweenItemsInNotPagingItemizedScrollView:(id)a3
{
  return 5.0;
}

- (void)itemizedScrollView:(id)a3 didChangeToActiveViewIndex:(unint64_t)a4
{
  self->_visibleImageViewIndeCGFloat x = a4;
}

- (void)itemizedScrollView:(id)a3 didShowViewWithIndex:(unint64_t)a4
{
  double v5 = [(SXStripGalleryComponentView *)self fullscreenGestureView];
  id v6 = [v5 superview];
  double v7 = [(SXStripGalleryComponentView *)self fullscreenGestureView];
  [v6 bringSubviewToFront:v7];

  id v13 = [(SXStripGalleryComponentView *)self fullscreenGestureView];
  uint64_t v8 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v8 contentSize];
  double v10 = v9;
  unint64_t v11 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v11 contentSize];
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);
}

- (BOOL)itemizedScrollView:(id)a3 isAllowedToAddViewInHierarchy:(unint64_t)a4
{
  double v5 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
  LOBYTE(a4) = [v5 activeViewIndex] != a4;

  return a4;
}

- (BOOL)itemizedScrollViewWillReindex:(id)a3
{
  unint64_t v4 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
  if ([v4 isFullscreen])
  {
    double v5 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
    char v6 = [v5 isTransitioning];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(SXStripGalleryComponentView *)self preloadAdjacentViewsForIndex:[(SXStripGalleryComponentView *)self visibleImageViewIndex]];
  [(SXStripGalleryComponentView *)self trackExposedGalleryItems];
}

- (CGRect)transitionVisibleFrame
{
  [(SXStripGalleryComponentView *)self xOffset];
  double v4 = v3;
  double v5 = [(SXStripGalleryComponentView *)self targetGalleryItem];
  [v5 frame];
  double v7 = v6;
  uint64_t v8 = [(SXStripGalleryComponentView *)self targetGalleryItem];
  [v8 frame];
  double v10 = v9;

  double v11 = 0.0;
  double v12 = v4;
  double v13 = v7;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)transitionContentFrame
{
  [(SXStripGalleryComponentView *)self xOffset];
  double v4 = v3;
  [(SXComponentView *)self contentFrame];
  double v6 = v5;
  double v7 = [(SXStripGalleryComponentView *)self targetGalleryItem];
  [v7 frame];
  double v9 = v8;
  double v10 = [(SXStripGalleryComponentView *)self targetGalleryItem];
  [v10 frame];
  double v12 = v11;

  double v13 = v4;
  double v14 = v6;
  double v15 = v9;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SXStripGalleryComponentView *)self targetGalleryItem];
  double v6 = [v5 imageResource];
  double v7 = [v6 imageIdentifier];
  char v8 = [v4 isEqualToString:v7];

  return v8;
}

- (unint64_t)analyticsMediaType
{
  return 1;
}

- (unint64_t)analyticsGalleryType
{
  return 1;
}

- (id)visibleGalleryItemViewForImageIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CGRect v30 = self;
  double v5 = [(SXStripGalleryComponentView *)self imageViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          double v12 = [v11 imageResource];
          double v13 = [v12 imageIdentifier];
          int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            double v15 = [(SXStripGalleryComponentView *)v30 itemizedScrollView];
            [v15 bounds];
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            [v11 frame];
            v39.origin.CGFloat x = v24;
            v39.origin.CGFloat y = v25;
            v39.size.CGFloat width = v26;
            v39.size.CGFloat height = v27;
            v38.origin.CGFloat x = v17;
            v38.origin.CGFloat y = v19;
            v38.size.CGFloat width = v21;
            v38.size.CGFloat height = v23;
            BOOL v28 = CGRectContainsRect(v38, v39);

            if (v28)
            {
              [(SXStripGalleryComponentView *)v30 setTargetGalleryItem:v11];
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (void)willSubmitMediaExposureEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SXStripGalleryComponentView;
  id v4 = a3;
  [(SXMediaComponentView *)&v9 willSubmitMediaExposureEvent:v4];
  double v5 = [(SXComponentView *)self component];
  uint64_t v6 = [v5 items];
  objc_msgSend(v4, "setNumberOfImages:", objc_msgSend(v6, "count"));

  uint64_t v7 = [(SXStripGalleryComponentView *)self exposedGalleryItems];
  objc_msgSend(v4, "setNumberOfImagesExposed:", objc_msgSend(v7, "count"));

  uint64_t v8 = [(SXStripGalleryComponentView *)self exposedGalleryItems];
  [v8 removeAllObjects];
}

- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5
{
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
}

- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3
{
  double v3 = self;
  id v4 = [(SXComponentView *)self presentationDelegate];
  LOBYTE(v3) = [v4 allowInteractivityFocusForComponent:v3];

  return (char)v3;
}

- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  objc_super v9 = [(SXComponentView *)self presentationDelegate];
  double v10 = [v9 requestFullScreenCanvasViewControllerForComponent:self canvasController:v8 withCompletionBlock:v7];

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5
{
  id v12 = a4;
  uint64_t v6 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v6 contentSize];
  double v8 = v7;
  objc_super v9 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v9 contentSize];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v8, v10);

  id v11 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v11 addSubview:v12];

  [(SXStripGalleryComponentView *)self setFullscreenGestureView:v12];
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5
{
  double v7 = [(SXStripGalleryComponentView *)self imageViews];
  id v18 = [v7 objectAtIndex:a5];

  double v8 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v8 frameForViewAtIndex:a5];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);
  CGFloat v17 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v17 addSubview:v18];
}

- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4
{
  id v4 = [(SXStripGalleryComponentView *)self imageViews];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)fullScreenCanvasController:(id)a3 originalViewForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  double v7 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  double v8 = [(SXStripGalleryComponentView *)self itemizedScrollView:v7 viewAtIndex:a5];

  return v8;
}

- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6
{
  id v8 = a5;
  double v9 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v9 frameForViewAtIndex:a6];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  id v18 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  objc_msgSend(v18, "convertRect:toView:", v8, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat rect = a6.origin.x;
  id v12 = a3;
  double v13 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [(SXStripGalleryComponentView *)self itemizedScrollView:v13 frameForViewAtIndex:a5];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  objc_msgSend(v12, "fitSizeForRect:", v15, v17, v19, v21);
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  CGFloat v26 = y;
  v37.size.CGFloat width = width;
  CGFloat v27 = width;
  v37.size.CGFloat height = height;
  CGFloat v28 = height;
  double v29 = CGRectGetHeight(v37);
  v38.origin.CGFloat x = v15;
  v38.origin.CGFloat y = v17;
  v38.size.CGFloat width = v23;
  v38.size.CGFloat height = v25;
  CGFloat v30 = (v29 - CGRectGetHeight(v38)) * 0.5;
  v39.origin.CGFloat x = rect;
  v39.origin.CGFloat y = v26;
  v39.size.CGFloat width = v27;
  v39.size.CGFloat height = v28;
  double v31 = CGRectGetWidth(v39);
  v40.origin.CGFloat x = v15;
  v40.origin.CGFloat y = v30;
  v40.size.CGFloat width = v23;
  v40.size.CGFloat height = v25;
  double v32 = (v31 - CGRectGetWidth(v40)) * 0.5;
  double v33 = v30;
  double v34 = v23;
  double v35 = v25;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = [(SXStripGalleryComponentView *)self imageViews];
  uint64_t v9 = [v8 count];

  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v10 = 0;
  while (1)
  {
    double v11 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    [v11 frameForViewAtIndex:v10];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v15;
    v24.size.CGFloat width = v17;
    v24.size.CGFloat height = v19;
    v23.CGFloat x = x;
    v23.CGFloat y = y;
    if (CGRectContainsPoint(v24, v23)) {
      break;
    }
    ++v10;
    double v20 = [(SXStripGalleryComponentView *)self imageViews];
    unint64_t v21 = [v20 count];

    if (v10 >= v21) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v10;
}

- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  double v7 = [(SXComponentView *)self component];
  id v8 = [v7 items];
  uint64_t v9 = [v8 objectAtIndex:a5];

  unint64_t v10 = [v9 captionComponent];

  if (v10)
  {
    double v11 = [SXFullscreenCaption alloc];
    double v12 = [v9 captionComponent];
    CGFloat v13 = -[SXFullscreenCaption initWithCaption:dataSource:]((id *)&v11->super.isa, v12, self);
LABEL_5:
    double v16 = v13;

    goto LABEL_6;
  }
  double v14 = [v9 caption];

  if (v14)
  {
    CGFloat v15 = [SXFullscreenCaption alloc];
    double v12 = [v9 caption];
    CGFloat v13 = -[SXFullscreenCaption initWithText:dataSource:]((id *)&v15->super.isa, v12, self);
    goto LABEL_5;
  }
  double v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  double v7 = [(SXStripGalleryComponentView *)self imageViews];
  id v8 = [v7 objectAtIndex:a5];

  int v9 = [v8 hasLoadedImage];
  unint64_t v10 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  char v11 = [v10 isDecelerating];
  if (v11)
  {
LABEL_6:
    char v14 = v11 ^ 1;

    goto LABEL_7;
  }
  double v12 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  char v13 = [v12 isDragging];

  char v14 = 0;
  if ((v13 & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
    CGFloat v15 = [(SXComponentView *)self presentationDelegate];
    int v16 = [v15 addInteractivityFocusForComponent:self];

    if (!v16)
    {
      char v14 = 0;
      goto LABEL_7;
    }
    CGFloat v17 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    [v17 setScrollEnabled:0];

    unint64_t v10 = [(SXComponentView *)self presentationDelegate];
    double v18 = [v10 animationController];
    [v18 stopUpdatingAnimationForComponentView:self finishAnimation:1];

    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  double v7 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v7 reindexate];

  id v8 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v8 setActiveViewIndex:a5 animated:0];

  id v9 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v9 forceCorrectFrames];
}

- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  uint64_t v6 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v6 setScrollEnabled:1];

  double v7 = [(SXComponentView *)self presentationDelegate];
  [v7 removeInteractivityFocusForComponent:self];

  id v8 = [(SXComponentView *)self presentationDelegate];
  [v8 dismissFullscreenCanvasForComponent:self];

  [(SXStripGalleryComponentView *)self finishMediaViewEvent];
}

- (void)fullScreenCanvasController:(id)a3 didShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  double v7 = [(SXComponentView *)self component];
  id v8 = [v7 items];
  id v9 = [v8 objectAtIndex:a5];

  [(SXStripGalleryComponentView *)self createMediaViewEventForGalleryItem:v9];
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didShowViewWithIndex:(unint64_t)a5
{
  double v7 = [(SXComponentView *)self component];
  id v8 = [v7 items];
  id v11 = [v8 objectAtIndex:a5];

  [(SXStripGalleryComponentView *)self finishMediaViewEvent];
  [(SXStripGalleryComponentView *)self createMediaViewEventForGalleryItem:v11];
  id v9 = [(SXComponentView *)self presentationDelegate];
  unint64_t v10 = [v9 animationController];
  [v10 stopUpdatingAnimationForComponentView:self finishAnimation:1];
}

- (id)fullScreenCanvasController:(id)a3 copyViewForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  uint64_t v6 = [(SXStripGalleryComponentView *)self imageViews];
  double v7 = [v6 objectAtIndex:a5];

  id v8 = objc_alloc(MEMORY[0x263F1C6D0]);
  [v7 frame];
  id v9 = objc_msgSend(v8, "initWithFrame:");
  unint64_t v10 = [v7 image];
  [v9 setImage:v10];

  return v9;
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 willShowViewWithIndex:(unint64_t)a5
{
  double v7 = [(SXStripGalleryComponentView *)self imageViews];
  id v8 = [v7 objectAtIndex:a5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = 0;
    if ([v8 objectHasQualityInterest:self quality:&v9])
    {
      if (!v9) {
        [v8 addInterestInImageQuality:1 forObject:self];
      }
    }
  }
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didHideViewWithIndex:(unint64_t)a5
{
  double v7 = [(SXStripGalleryComponentView *)self imageViews];
  id v8 = [v7 objectAtIndex:a5];

  [v8 giveUpInterestForObject:self];
  [v8 addInterestInImageQuality:0 forObject:self];
}

- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5
{
  unint64_t v5 = [(SXComponentView *)self presentationDelegate];
  char v6 = [v5 isScrolling] ^ 1;

  return v6;
}

- (id)imageViewForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v6 forceCorrectFrames];

  double v7 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(SXStripGalleryComponentView *)self imageViews];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    CGFloat v15 = 0;
    do
    {
      int v16 = [(SXStripGalleryComponentView *)self imageViews];
      CGFloat v17 = [v16 objectAtIndex:v14];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v18 = [(SXStripGalleryComponentView *)self itemizedScrollView];
        [v18 frameForViewAtIndex:v14];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;

        id v27 = v17;
        v34.origin.double x = v20;
        v34.origin.double y = v22;
        v34.size.CGFloat width = v24;
        v34.size.CGFloat height = v26;
        v33.double x = v9;
        v33.double y = v11;
        if (CGRectContainsPoint(v34, v33))
        {
          id v28 = v27;

          CGFloat v15 = v28;
        }
      }
      ++v14;
      double v29 = [(SXStripGalleryComponentView *)self imageViews];
      unint64_t v30 = [v29 count];
    }
    while (v14 < v30);
  }
  else
  {
    CGFloat v15 = 0;
  }
  return v15;
}

- (void)forceImageViewFullscreen:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SXStripGalleryComponentView *)self imageViews];
  uint64_t v6 = [v5 indexOfObject:v4];

  id v7 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
  [v7 presentFullscreenWithIndex:v6];
}

- (CGRect)snapRegion
{
  [(SXStripGalleryComponentView *)self xOffset];
  double v4 = v3;
  [(SXStripGalleryComponentView *)self contentWidth];
  double v6 = v5;
  [(SXComponentView *)self contentFrame];
  double Height = CGRectGetHeight(v11);
  double v8 = 0.0;
  double v9 = v4;
  double v10 = v6;
  result.size.CGFloat height = Height;
  result.size.CGFloat width = v10;
  result.origin.double y = v8;
  result.origin.double x = v9;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  double v8 = a5->x;
  id v76 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v76 bounds];
  double v9 = v8 + CGRectGetWidth(v79);
  double v10 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v10 contentSize];
  if (v9 >= v11)
  {

    v45 = v76;
    goto LABEL_24;
  }
  double v12 = a5->x;

  if (x == 0.0 || v12 <= 0.0) {
    return;
  }
  [(SXStripGalleryComponentView *)self snapRegion];
  double v14 = v13;
  double v16 = v15;
  CGFloat v75 = v18;
  id v77 = v17;
  double v19 = a5->x;
  CGFloat v20 = [(SXStripGalleryComponentView *)self imageViews];
  uint64_t v21 = [v20 count];

  double v72 = x;
  CGFloat v73 = v16;
  CGFloat v74 = v14;
  BOOL v22 = 0;
  if (v21)
  {
    unint64_t v23 = 0;
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    double v25 = 1.79769313e308;
    while (1)
    {
      CGFloat v26 = [(SXStripGalleryComponentView *)self itemizedScrollView];
      [v26 frameForViewAtIndex:v23];
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;

      v80.origin.double x = v28;
      v80.origin.CGFloat y = v30;
      v80.size.CGFloat width = v32;
      v80.size.CGFloat height = v34;
      double v35 = v19 - CGRectGetMinX(v80);
      double v36 = v35 >= 0.0 ? v35 : -v35;
      CGRect v37 = [(SXStripGalleryComponentView *)self imageViews];
      uint64_t v38 = [v37 count] - 1;

      if (v23 == v38) {
        break;
      }
      v83.origin.double x = v28;
      v83.origin.CGFloat y = v30;
      v83.size.CGFloat width = v32;
      v83.size.CGFloat height = v34;
      double Width = CGRectGetWidth(v83);
      v84.origin.double x = v28;
      v84.origin.CGFloat y = v30;
      v84.size.CGFloat width = v32;
      v84.size.CGFloat height = v34;
      if (Width / CGRectGetHeight(v84) > 2.0)
      {
        v85.origin.double x = v28;
        v85.origin.CGFloat y = v30;
        v85.size.CGFloat width = v32;
        v85.size.CGFloat height = v34;
        double v40 = v19 - CGRectGetMaxX(v85);
        goto LABEL_13;
      }
      BOOL v42 = 0;
LABEL_19:
      if (v36 < v25)
      {
        uint64_t v24 = v23;
        double v25 = v36;
        BOOL v22 = v42;
      }
      ++v23;
      v43 = [(SXStripGalleryComponentView *)self imageViews];
      unint64_t v44 = [v43 count];

      if (v23 >= v44) {
        goto LABEL_28;
      }
    }
    v81.origin.CGFloat y = v73;
    v81.origin.double x = v74;
    v81.size.CGFloat height = v75;
    *(void *)&v81.size.CGFloat width = v77;
    double v39 = v19 + CGRectGetMaxX(v81);
    v82.origin.double x = v28;
    v82.origin.CGFloat y = v30;
    v82.size.CGFloat width = v32;
    v82.size.CGFloat height = v34;
    double v40 = v39 - CGRectGetMaxX(v82);
LABEL_13:
    if (v40 < 0.0) {
      double v40 = -v40;
    }
    BOOL v42 = v40 < v36;
    if (v40 < v36) {
      double v36 = v40;
    }
    goto LABEL_19;
  }
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_28:
  v46 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v46 frameForViewAtIndex:v24];
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;

  if (v72 < 0.0)
  {
    v86.origin.double x = v48;
    v86.origin.CGFloat y = v50;
    v86.size.CGFloat width = v52;
    v86.size.CGFloat height = v54;
    double MinX = CGRectGetMinX(v86);
    CGFloat v57 = v73;
    CGFloat v56 = v74;
    v87.origin.double x = v74;
    v87.origin.CGFloat y = v73;
    v87.size.CGFloat height = v75;
    *(void *)&v87.size.CGFloat width = v77;
    double v58 = MinX - CGRectGetMinX(v87);
    id v71 = [(SXStripGalleryComponentView *)self itemizedScrollView];
    [v71 contentOffset];
    if (v58 < v59)
    {

LABEL_37:
      v90.origin.double x = v48;
      v90.origin.CGFloat y = v50;
      v90.size.CGFloat width = v52;
      v90.size.CGFloat height = v54;
      double MaxX = CGRectGetMinX(v90);
      v91.origin.double x = v56;
      v91.origin.CGFloat y = v57;
      *(void *)&v91.size.CGFloat width = v77;
      v91.size.CGFloat height = v75;
      double v69 = CGRectGetMinX(v91);
      if (v22)
      {
        v92.origin.double x = v48;
        v92.origin.CGFloat y = v50;
        v92.size.CGFloat width = v52;
        v92.size.CGFloat height = v54;
        double MaxX = CGRectGetMaxX(v92);
        v93.origin.double x = v56;
        v93.origin.CGFloat y = v57;
        *(void *)&v93.size.CGFloat width = v77;
        v93.size.CGFloat height = v75;
        double v69 = CGRectGetMaxX(v93);
      }
      a5->double x = MaxX - v69;
      return;
    }
    if (v72 > 0.0) {
      goto LABEL_34;
    }
    v45 = v71;
LABEL_24:

    return;
  }
  CGFloat v57 = v73;
  CGFloat v56 = v74;
  if (v72 <= 0.0) {
    return;
  }
LABEL_34:
  v88.origin.CGFloat y = v50;
  double v60 = v48;
  v88.origin.double x = v48;
  v88.size.CGFloat width = v52;
  CGFloat y = v88.origin.y;
  double v61 = v54;
  v88.size.CGFloat height = v54;
  double v62 = CGRectGetMinX(v88);
  v89.origin.double x = v56;
  v89.origin.CGFloat y = v57;
  v89.size.CGFloat height = v75;
  *(void *)&v89.size.CGFloat width = v77;
  double v63 = v62 - CGRectGetMinX(v89);
  v64 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  [v64 contentOffset];
  double v66 = v65;

  if (v72 < 0.0) {
  BOOL v67 = v63 <= v66;
  }
  CGFloat v54 = v61;
  CGFloat v48 = v60;
  CGFloat v50 = y;
  if (!v67) {
    goto LABEL_37;
  }
}

- (BOOL)gestureShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
  char v6 = [v5 otherInteractivityGestureShouldBegin:v4];

  return v6;
}

- (id)textResizerForCaption:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SXComponentView *)self DOMObjectProvider];
  char v6 = SXDefaultTextStyleIdentifierForRole(@"body");
  v26[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  double v8 = [(SXComponentView *)self component];
  double v9 = [v5 componentTextStyleForIdentifiers:v7 component:v8];

  if (!v9)
  {
    double v10 = [(SXComponentView *)self DOMObjectProvider];
    double v25 = @"default";
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    double v12 = [(SXComponentView *)self component];
    double v9 = [v10 componentTextStyleForIdentifiers:v11 component:v12];
  }
  double v13 = [(SXComponentView *)self DOMObjectProvider];
  double v14 = -[SXFullscreenCaption caption]((uint64_t)v4);

  double v15 = [v14 textStyle];
  double v16 = [(SXComponentView *)self component];
  CGFloat v17 = [v16 classification];
  double v18 = [(SXComponentView *)self component];
  double v19 = [v13 componentTextStyleForIdentifier:v15 classification:v17 component:v18];

  if (v19) {
    char v20 = [v19 fontScaling];
  }
  else {
    char v20 = 1;
  }
  uint64_t v21 = [SXTextResizer alloc];
  BOOL v22 = [(SXComponentView *)self documentColumnLayout];
  unint64_t v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v21->super.isa, v22, v9, v20);

  return v23;
}

- (id)textRulesForCaption:(id)a3
{
  double v3 = [(SXComponentView *)self component];
  id v4 = [v3 classification];
  double v5 = [v4 textRules];

  return v5;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SXComponentView *)self DOMObjectProvider];
  char v6 = [(SXComponentView *)self component];
  id v7 = [v5 textStyleForIdentifier:v4 component:v6];

  return v7;
}

- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(SXComponentView *)self DOMObjectProvider];
  double v9 = [(SXComponentView *)self component];
  double v10 = [v8 componentTextStyleForIdentifier:v7 inheritingFromComponentTextStyle:v6 component:v9];

  return v10;
}

- (id)contentSizeCategoryForCaption:(id)a3
{
  double v3 = [(SXComponentView *)self presentationDelegate];
  id v4 = [v3 presentationAttributes];
  double v5 = [v4 contentSizeCategory];

  return v5;
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXStripGalleryComponentView;
  [(SXMediaComponentView *)&v4 visibilityStateDidChangeFromState:a3];
  if ([(SXComponentView *)self visibilityState] == 1) {
    [(SXStripGalleryComponentView *)self trackExposedGalleryItems];
  }
}

- (void)trackExposedGalleryItems
{
  double v3 = [(SXComponentView *)self component];
  objc_super v4 = [v3 items];
  double v5 = [v4 NSArray];
  id v6 = [(SXStripGalleryComponentView *)self itemizedScrollView];
  uint64_t v7 = [v6 visibleRange];
  objc_msgSend(v5, "subarrayWithRange:", v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  double v9 = [(SXStripGalleryComponentView *)self exposedGalleryItems];
  [v9 addObjectsFromArray:v10];
}

- (void)submitEvents
{
  v3.receiver = self;
  v3.super_class = (Class)SXStripGalleryComponentView;
  [(SXMediaComponentView *)&v3 submitEvents];
  [(SXStripGalleryComponentView *)self finishMediaViewEvent];
}

- (void)createMediaViewEventForGalleryItem:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SXStripGalleryComponentView *)self mediaViewEvent];

  if (v4 && !v5)
  {
    id v6 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
    uint64_t v7 = [(SXComponentView *)self component];
    uint64_t v8 = [v7 items];
    objc_msgSend(v6, "setGalleryImageCount:", objc_msgSend(v8, "count"));

    double v9 = [v4 imageIdentifier];
    v11[0] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v6 setGalleryImageIds:v10];

    [v6 setMediaType:4];
    [(SXStripGalleryComponentView *)self setMediaViewEvent:v6];
  }
}

- (void)finishMediaViewEvent
{
  objc_super v3 = [(SXStripGalleryComponentView *)self mediaViewEvent];
  id v4 = [v3 startDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 < 0.0) {
    double v6 = -v6;
  }
  uint64_t v7 = [(SXStripGalleryComponentView *)self mediaViewEvent];

  if (v7 && v6 >= 1.0)
  {
    uint64_t v8 = [(SXStripGalleryComponentView *)self mediaViewEvent];
    [v8 determineEndDate];

    double v9 = [(SXMediaComponentView *)self analyticsReporting];
    id v10 = [(SXStripGalleryComponentView *)self mediaViewEvent];
    [v9 reportEvent:v10];

    [(SXStripGalleryComponentView *)self setMediaViewEvent:0];
  }
}

- (void)preloadAdjacentViewsForIndex:(unint64_t)a3
{
  if ([(SXStripGalleryComponentView *)self lastPreloadViewIndex] != a3)
  {
    double v5 = [(SXStripGalleryComponentView *)self imageViews];
    unint64_t v6 = [v5 count] - 1;

    if (v6 >= a3) {
      unint64_t v7 = a3;
    }
    else {
      unint64_t v7 = v6;
    }
    if (a3 + 2 >= v6) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = a3 + 2;
    }
    for (; v7 <= v8; ++v7)
    {
      if (a3 != v7)
      {
        double v9 = [(SXStripGalleryComponentView *)self imageViews];
        id v10 = [v9 objectAtIndex:v7];

        double v11 = [MEMORY[0x263EFF9D0] null];

        if (v10 == v11)
        {
          uint64_t v12 = [(SXStripGalleryComponentView *)self createViewForViewIndex:v7];

          double v13 = [(SXStripGalleryComponentView *)self imageViews];
          [v13 replaceObjectAtIndex:v7 withObject:v12];

          id v10 = (void *)v12;
        }
      }
    }
    [(SXStripGalleryComponentView *)self setLastPreloadViewIndex:a3];
  }
}

- (BOOL)allowHierarchyRemoval
{
  v7.receiver = self;
  v7.super_class = (Class)SXStripGalleryComponentView;
  unsigned __int8 v3 = [(SXComponentView *)&v7 allowHierarchyRemoval];
  id v4 = [(SXStripGalleryComponentView *)self fullScreenCanvasController];
  char v5 = [v4 isFullscreen];

  return v3 & ~v5;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXFullscreenCanvasControllerFactory)canvasControllerFactory
{
  return self->_canvasControllerFactory;
}

- (double)xOffset
{
  return self->_xOffset;
}

- (double)rightContentInset
{
  return self->_rightContentInset;
}

- (NSArray)imageResources
{
  return self->_imageResources;
}

- (void)setImageResources:(id)a3
{
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (NSArray)accessibilityCaptions
{
  return self->_accessibilityCaptions;
}

- (void)setAccessibilityCaptions:(id)a3
{
}

- (SXItemizedScrollView)itemizedScrollView
{
  return self->_itemizedScrollView;
}

- (void)setItemizedScrollView:(id)a3
{
}

- (int64_t)visibleImageViewIndex
{
  return self->_visibleImageViewIndex;
}

- (void)setVisibleImageViewIndex:(int64_t)a3
{
  self->_visibleImageViewIndedouble x = a3;
}

- (UIView)fullscreenGestureView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fullscreenGestureView);
  return (UIView *)WeakRetained;
}

- (void)setFullscreenGestureView:(id)a3
{
}

- (SXFullscreenCanvasController)fullScreenCanvasController
{
  return self->_fullScreenCanvasController;
}

- (void)setFullScreenCanvasController:(id)a3
{
}

- (SXMediaViewEvent)mediaViewEvent
{
  return self->_mediaViewEvent;
}

- (void)setMediaViewEvent:(id)a3
{
}

- (BOOL)loadedAtleastOneImage
{
  return self->_loadedAtleastOneImage;
}

- (void)setLoadedAtleastOneImage:(BOOL)a3
{
  self->_loadedAtleastOneImage = a3;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (unint64_t)lastPreloadViewIndex
{
  return self->_lastPreloadViewIndex;
}

- (void)setLastPreloadViewIndex:(unint64_t)a3
{
  self->_lastPreloadViewIndedouble x = a3;
}

- (SXImageView)targetGalleryItem
{
  return self->_targetGalleryItem;
}

- (void)setTargetGalleryItem:(id)a3
{
}

- (NSMutableSet)exposedGalleryItems
{
  return self->_exposedGalleryItems;
}

- (void)setExposedGalleryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedGalleryItems, 0);
  objc_storeStrong((id *)&self->_targetGalleryItem, 0);
  objc_storeStrong((id *)&self->_mediaViewEvent, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasController, 0);
  objc_destroyWeak((id *)&self->_fullscreenGestureView);
  objc_storeStrong((id *)&self->_itemizedScrollView, 0);
  objc_storeStrong((id *)&self->_accessibilityCaptions, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_canvasControllerFactory, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
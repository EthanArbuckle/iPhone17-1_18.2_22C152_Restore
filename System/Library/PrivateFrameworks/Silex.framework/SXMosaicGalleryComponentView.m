@interface SXMosaicGalleryComponentView
- (BOOL)allowHierarchyRemoval;
- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5;
- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5;
- (BOOL)galleryLayouter:(id)a3 viewIsCurrentlyFullscreenForItemAtIndex:(unint64_t)a4;
- (BOOL)isLayoutRequired;
- (BOOL)loadedAtleastOneImage;
- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3;
- (BOOL)shouldSubmitMediaExposureEventForExposedBounds:(CGRect)a3;
- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6;
- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6;
- (CGSize)galleryLayouter:(id)a3 dimensionsForItemAtIndex:(unint64_t)a4;
- (NSMutableArray)imageViews;
- (NSMutableArray)visibleImageViews;
- (NSMutableSet)exposedGalleryItems;
- (SXFullscreenCanvasController)fullScreenCanvasController;
- (SXGalleryItemImageViewFactory)imageViewFactory;
- (SXMediaViewEvent)mediaViewEvent;
- (SXMosaicGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11;
- (SXMosaicGalleryLayouter)galleryLayouter;
- (UIView)galleryView;
- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4;
- (id)contentSizeCategoryForCaption:(id)a3;
- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5;
- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (id)fullScreenCanvasController:(id)a3 originalViewForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (id)galleryLayouter:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)imageViewForItemAtIndex:(unint64_t)a3;
- (id)imageViewForLocation:(CGPoint)a3;
- (id)textResizerForCaption:(id)a3;
- (id)textRulesForCaption:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
- (unint64_t)analyticsGalleryType;
- (unint64_t)analyticsMediaType;
- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4;
- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5;
- (unint64_t)numberOfItemsForGalleryLayouter:(id)a3;
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
- (void)presentComponentWithChanges:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)renderContents;
- (void)renderContentsInDrawableRect;
- (void)setExposedGalleryItems:(id)a3;
- (void)setGalleryLayouter:(id)a3;
- (void)setGalleryView:(id)a3;
- (void)setLayoutRequired:(BOOL)a3;
- (void)setLoadedAtleastOneImage:(BOOL)a3;
- (void)setMediaViewEvent:(id)a3;
- (void)submitEvents;
- (void)visibleBoundsChanged;
- (void)willSubmitMediaExposureEvent:(id)a3;
@end

@implementation SXMosaicGalleryComponentView

- (SXMosaicGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11
{
  id v33 = a10;
  id v18 = a11;
  v34.receiver = self;
  v34.super_class = (Class)SXMosaicGalleryComponentView;
  v19 = [(SXGalleryComponentView *)&v34 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:a8 mediaSharingPolicyProvider:a9];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageViewFactory, a10);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    galleryView = v20->_galleryView;
    v20->_galleryView = v21;

    v23 = [(SXComponentView *)v20 contentView];
    [v23 addSubview:v20->_galleryView];

    uint64_t v24 = [MEMORY[0x263EFF980] array];
    imageViews = v20->_imageViews;
    v20->_imageViews = (NSMutableArray *)v24;

    uint64_t v26 = [MEMORY[0x263EFF980] array];
    visibleImageViews = v20->_visibleImageViews;
    v20->_visibleImageViews = (NSMutableArray *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9C0] set];
    exposedGalleryItems = v20->_exposedGalleryItems;
    v20->_exposedGalleryItems = (NSMutableSet *)v28;

    v20->_layoutRequired = 1;
    uint64_t v30 = [v18 fullscreenCanvasControllerForShowable:v20];
    fullScreenCanvasController = v20->_fullScreenCanvasController;
    v20->_fullScreenCanvasController = (SXFullscreenCanvasController *)v30;
  }
  return v20;
}

- (void)presentComponentWithChanges:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXMosaicGalleryComponentView;
  [(SXComponentView *)&v10 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if ([(SXMosaicGalleryComponentView *)self isLayoutRequired])
  {
    v4 = [(SXMosaicGalleryComponentView *)self galleryView];
    [(SXComponentView *)self contentFrame];
    objc_msgSend(v4, "setFrame:");

    v5 = [(SXComponentView *)self component];
    v6 = [v5 items];

    if (v6)
    {
      v7 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
      [v7 setDataSource:self];

      v8 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
      v9 = [(SXMosaicGalleryComponentView *)self galleryView];
      [v8 layoutGalleryOnView:v9];

      [(SXMosaicGalleryComponentView *)self setLayoutRequired:0];
    }
  }
}

- (void)renderContents
{
  v3.receiver = self;
  v3.super_class = (Class)SXMosaicGalleryComponentView;
  [(SXComponentView *)&v3 renderContents];
  [(SXMosaicGalleryComponentView *)self renderContentsInDrawableRect];
}

- (void)discardContents
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SXMosaicGalleryComponentView;
  [(SXComponentView *)&v14 discardContents];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(SXMosaicGalleryComponentView *)self visibleImageViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 objectHasQualityInterest:self quality:0]) {
          [v8 giveUpInterestForObject:self];
        }
        [v8 setImage:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = [(SXMosaicGalleryComponentView *)self visibleImageViews];
  [v9 removeAllObjects];
}

- (void)visibleBoundsChanged
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)SXMosaicGalleryComponentView;
  [(SXMediaComponentView *)&v32 visibleBoundsChanged];
  [(SXMosaicGalleryComponentView *)self renderContentsInDrawableRect];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v3 = [(SXMosaicGalleryComponentView *)self visibleImageViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v8 frame];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [(SXMediaComponentView *)self visibleBounds];
        v39.origin.CGFloat x = v17;
        v39.origin.CGFloat y = v18;
        v39.size.CGFloat width = v19;
        v39.size.CGFloat height = v20;
        v35.origin.CGFloat x = v10;
        v35.origin.CGFloat y = v12;
        v35.size.CGFloat width = v14;
        v35.size.CGFloat height = v16;
        CGRect v36 = CGRectIntersection(v35, v39);
        CGFloat x = v36.origin.x;
        CGFloat y = v36.origin.y;
        CGFloat width = v36.size.width;
        CGFloat height = v36.size.height;
        if (!CGRectIsNull(v36))
        {
          v37.origin.CGFloat x = x;
          v37.origin.CGFloat y = y;
          v37.size.CGFloat width = width;
          v37.size.CGFloat height = height;
          double v25 = CGRectGetHeight(v37);
          [v8 frame];
          if (v25 >= CGRectGetHeight(v38) * 0.5)
          {
            uint64_t v26 = [(SXMosaicGalleryComponentView *)self exposedGalleryItems];
            v27 = [v8 galleryItem];
            [v26 addObject:v27];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v5);
  }
}

- (void)renderContentsInDrawableRect
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_super v3 = [(SXComponentView *)self viewport];
  [v3 bounds];
  double v5 = v4;

  [(SXMediaComponentView *)self visibleBounds];
  CGRect v28 = CGRectInset(v27, 0.0, v5 * -0.5);
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CGFloat v10 = [(SXMosaicGalleryComponentView *)self imageViews];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v15 frame];
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.CGFloat width = width;
        v30.size.CGFloat height = height;
        BOOL v16 = CGRectIntersectsRect(v29, v30);
        CGFloat v17 = [(SXMosaicGalleryComponentView *)self visibleImageViews];
        int v18 = [v17 containsObject:v15];

        if (v16)
        {
          if ((v18 & 1) == 0)
          {
            CGFloat v19 = [(SXMosaicGalleryComponentView *)self visibleImageViews];
            [v19 addObject:v15];

            [v15 addInterestInImageQuality:0 forObject:self];
          }
        }
        else if (v18)
        {
          CGFloat v20 = [(SXMosaicGalleryComponentView *)self visibleImageViews];
          [v20 removeObject:v15];

          if ([v15 objectHasQualityInterest:self quality:0]) {
            [v15 giveUpInterestForObject:self];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXMosaicGalleryComponentView;
  id v7 = a4;
  [(SXComponentView *)&v11 receivedInfo:v6 fromLayoutingPhaseWithIdentifier:v7];
  int v8 = objc_msgSend(v7, "isEqualToString:", @"Layouter", v11.receiver, v11.super_class);

  if (v8)
  {
    id v9 = [(SXMosaicGalleryComponentView *)self galleryLayouter];

    if (v9 != v6)
    {
      CGFloat v10 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
      [v10 reset];

      [(SXMosaicGalleryComponentView *)self setGalleryLayouter:v6];
      [(SXMosaicGalleryComponentView *)self setLayoutRequired:1];
    }
  }
}

- (id)imageViewForItemAtIndex:(unint64_t)a3
{
  double v5 = [(SXMosaicGalleryComponentView *)self imageViews];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    id v9 = [(SXComponentView *)self component];
    CGFloat v10 = [v9 items];
    id v7 = [v10 objectAtIndex:a3];

    objc_super v11 = [(SXComponentView *)self DOMObjectProvider];
    uint64_t v12 = [v7 imageIdentifier];
    uint64_t v13 = [v11 imageResourceForIdentifier:v12];

    CGFloat v14 = [(SXMosaicGalleryComponentView *)self imageViewFactory];
    int v8 = [v14 imageViewForGalleryItem:v7 imageResource:v13];

    [v8 setContentMode:2];
    [v8 setClipsToBounds:1];
    [v8 setDelegate:self];
    double v15 = [(SXGalleryComponentView *)self dragManager];
    [v15 updateAccessibilityDragSourceDescriptorsForDraggableElement:v8];

    BOOL v16 = [(SXMosaicGalleryComponentView *)self imageViews];
    [v16 addObject:v8];
  }
  else
  {
    id v7 = [(SXMosaicGalleryComponentView *)self imageViews];
    int v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5
{
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
}

- (unint64_t)numberOfItemsForGalleryLayouter:(id)a3
{
  objc_super v3 = [(SXComponentView *)self component];
  double v4 = [v3 items];
  unint64_t v5 = [v4 count];

  return v5;
}

- (CGSize)galleryLayouter:(id)a3 dimensionsForItemAtIndex:(unint64_t)a4
{
  unint64_t v6 = [(SXComponentView *)self component];
  id v7 = [v6 items];
  int v8 = [v7 objectAtIndex:a4];

  id v9 = [(SXComponentView *)self DOMObjectProvider];
  CGFloat v10 = [v8 imageIdentifier];
  objc_super v11 = [v9 imageResourceForIdentifier:v10];

  [v11 dimensions];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (id)galleryLayouter:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SXMosaicGalleryComponentView *)self imageViewForItemAtIndex:a4];
  [v6 frameForItemAtIndex:a4];
  double v9 = v8;
  double v11 = v10;

  double v12 = [v7 imageResource];
  [v12 dimensions];
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v7, "setPreferredImageSize:", CGSizeAspectFill(v14, v16, v9, v11));
  return v7;
}

- (BOOL)galleryLayouter:(id)a3 viewIsCurrentlyFullscreenForItemAtIndex:(unint64_t)a4
{
  id v6 = [(SXMosaicGalleryComponentView *)self fullScreenCanvasController];

  if (!v6) {
    return 0;
  }
  id v7 = [(SXMosaicGalleryComponentView *)self fullScreenCanvasController];
  BOOL v8 = [v7 activeViewIndex] == a4;

  return v8;
}

- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3
{
  objc_super v3 = self;
  double v4 = [(SXComponentView *)self presentationDelegate];
  LOBYTE(v3) = [v4 allowInteractivityFocusForComponent:v3];

  return (char)v3;
}

- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [(SXComponentView *)self presentationDelegate];
  double v10 = [v9 requestFullScreenCanvasViewControllerForComponent:self canvasController:v8 withCompletionBlock:v7];

  return v10;
}

- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v7 = [(SXComponentView *)self component];
  id v8 = [v7 items];
  double v9 = [v8 objectAtIndex:a5];

  double v10 = [v9 captionComponent];

  if (v10)
  {
    double v11 = [SXFullscreenCaption alloc];
    double v12 = [v9 captionComponent];
    double v13 = -[SXFullscreenCaption initWithCaption:dataSource:]((id *)&v11->super.isa, v12, self);
LABEL_5:
    double v16 = v13;

    goto LABEL_6;
  }
  double v14 = [v9 caption];

  if (v14)
  {
    double v15 = [SXFullscreenCaption alloc];
    double v12 = [v9 caption];
    double v13 = -[SXFullscreenCaption initWithText:dataSource:]((id *)&v15->super.isa, v12, self);
    goto LABEL_5;
  }
  double v16 = 0;
LABEL_6:

  return v16;
}

- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6 = [(SXComponentView *)self presentationDelegate];
  [v6 removeInteractivityFocusForComponent:self];

  id v7 = [(SXComponentView *)self presentationDelegate];
  [v7 dismissFullscreenCanvasForComponent:self];

  [(SXMosaicGalleryComponentView *)self finishMediaViewEvent];
}

- (void)fullScreenCanvasController:(id)a3 didShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v7 = [(SXComponentView *)self component];
  id v8 = [v7 items];
  id v9 = [v8 objectAtIndex:a5];

  [(SXMosaicGalleryComponentView *)self createMediaViewEventForGalleryItem:v9];
}

- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v12 = a3;
  double v13 = [(SXComponentView *)self component];
  double v14 = [v13 items];
  double v15 = [v14 objectAtIndex:a5];

  double v16 = [(SXComponentView *)self DOMObjectProvider];
  double v17 = [v15 imageIdentifier];
  int v18 = [v16 imageResourceForIdentifier:v17];

  [v18 dimensions];
  double v20 = v19;
  [v18 dimensions];
  objc_msgSend(v12, "fitSizeForRect:", 0.0, 0.0, v20, v21);
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v26 = CGRectGetHeight(v34);
  v35.origin.CGFloat x = 0.0;
  v35.origin.CGFloat y = 0.0;
  v35.size.CGFloat width = v23;
  v35.size.CGFloat height = v25;
  CGFloat v27 = (v26 - CGRectGetHeight(v35)) * 0.5;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double v28 = CGRectGetWidth(v36);
  v37.origin.CGFloat x = 0.0;
  v37.origin.CGFloat y = v27;
  v37.size.CGFloat width = v23;
  v37.size.CGFloat height = v25;
  double v29 = (v28 - CGRectGetWidth(v37)) * 0.5;

  double v30 = v29;
  double v31 = v27;
  double v32 = v23;
  double v33 = v25;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4
{
  unint64_t v5 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  unint64_t v6 = [(SXMosaicGalleryComponentView *)self numberOfItemsForGalleryLayouter:v5];

  return v6;
}

- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6
{
  id v8 = a5;
  id v9 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  [v9 frameForItemAtIndex:a6];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  int v18 = [(SXMosaicGalleryComponentView *)self galleryView];
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

- (id)fullScreenCanvasController:(id)a3 originalViewForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  unint64_t v6 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  id v7 = [v6 viewForItemAtIndex:a5];

  return v7;
}

- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5
{
  id v6 = a4;
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v6, "setFrame:");
  id v7 = [(SXComponentView *)self contentView];
  [v7 addSubview:v6];
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didShowViewWithIndex:(unint64_t)a5
{
  id v7 = [(SXComponentView *)self component];
  id v8 = [v7 items];
  id v36 = [v8 objectAtIndex:a5];

  [(SXMosaicGalleryComponentView *)self finishMediaViewEvent];
  [(SXMosaicGalleryComponentView *)self createMediaViewEventForGalleryItem:v36];
  id v9 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  [v9 frameForItemAtIndex:a5];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  [(SXComponentView *)self absoluteFrame];
  CGFloat v19 = v18;
  [(SXComponentView *)self absoluteFrame];
  CGFloat v21 = v20;
  v38.origin.double x = v11;
  v38.origin.double y = v13;
  v38.size.double width = v15;
  v38.size.double height = v17;
  CGRect v39 = CGRectOffset(v38, v19, v21);
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;
  double v26 = [(SXComponentView *)self viewport];
  [v26 dynamicBounds];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v40.origin.double x = v28;
  v40.origin.double y = v30;
  v40.size.double width = v32;
  v40.size.double height = v34;
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  if (!CGRectContainsRect(v40, v41))
  {
    CGRect v35 = [(SXComponentView *)self presentationDelegate];
    objc_msgSend(v35, "scrollToRect:animated:", 0, x, y, width, height);
  }
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5
{
  id v7 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  id v10 = [v7 viewForItemAtIndex:a5];

  id v8 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  [v8 frameForItemAtIndex:a5];
  objc_msgSend(v10, "setFrame:");

  id v9 = [(SXMosaicGalleryComponentView *)self galleryView];
  [v9 addSubview:v10];
}

- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  unint64_t v9 = [(SXMosaicGalleryComponentView *)self numberOfItemsForGalleryLayouter:v8];

  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v10 = 0;
  while (1)
  {
    CGFloat v11 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
    double v12 = [v11 viewForItemAtIndex:v10];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 frame];
      v16.CGFloat x = x;
      v16.CGFloat y = y;
      if (CGRectContainsPoint(v17, v16)) {
        break;
      }
    }

    ++v10;
    CGFloat v13 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
    unint64_t v14 = [(SXMosaicGalleryComponentView *)self numberOfItemsForGalleryLayouter:v13];

    if (v10 >= v14) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v7 = [(SXMosaicGalleryComponentView *)self galleryLayouter];
  [v7 frameForItemAtIndex:a5];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [(SXComponentView *)self absoluteFrame];
  CGFloat v17 = v16;
  [(SXComponentView *)self absoluteFrame];
  CGFloat v19 = v18;
  v35.origin.double x = v9;
  v35.origin.double y = v11;
  v35.size.double width = v13;
  v35.size.double height = v15;
  CGRect v36 = CGRectOffset(v35, v17, v19);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  double v24 = [(SXComponentView *)self viewport];
  [v24 dynamicBounds];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v37.origin.double x = v26;
  v37.origin.double y = v28;
  v37.size.double width = v30;
  v37.size.double height = v32;
  v38.origin.double x = x;
  v38.origin.double y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  if (!CGRectContainsRect(v37, v38))
  {
    id v33 = [(SXComponentView *)self presentationDelegate];
    objc_msgSend(v33, "scrollToRect:animated:", 0, x, y, width, height);
  }
}

- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v7 = [(SXMosaicGalleryComponentView *)self imageViews];
  double v8 = [v7 objectAtIndex:a5];

  if ([v8 hasLoadedImage])
  {
    CGFloat v9 = [(SXComponentView *)self presentationDelegate];
    int v10 = [v9 addInteractivityFocusForComponent:self];

    if (v10) {
      [v8 addInterestInImageQuality:1 forObject:self];
    }
    CGFloat v11 = [(SXComponentView *)self presentationDelegate];
    double v12 = [v11 animationController];
    [v12 stopUpdatingAnimationForComponentView:self finishAnimation:1];
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 willShowViewWithIndex:(unint64_t)a5
{
  id v7 = [(SXMosaicGalleryComponentView *)self imageViews];
  double v8 = [v7 objectAtIndex:a5];

  [v8 setShouldShowLoadingIndicator:1];
  double v12 = 0.0;
  CGFloat v9 = [(SXMosaicGalleryComponentView *)self backgroundColor];
  [v9 getHue:0 saturation:0 brightness:&v12 alpha:0];

  double v10 = v12;
  if (v12 < 0.5) {
    objc_msgSend(v8, "setLoadingIndicatorStyle:", 1, v12);
  }
  int v11 = 0;
  if (objc_msgSend(v8, "objectHasQualityInterest:quality:", self, &v11, v10) && !v11) {
    [v8 addInterestInImageQuality:1 forObject:self];
  }
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 didHideViewWithIndex:(unint64_t)a5
{
  id v7 = [(SXMosaicGalleryComponentView *)self imageViews];
  id v8 = [v7 objectAtIndex:a5];

  [v8 setShouldShowLoadingIndicator:0];
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
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = [(SXMosaicGalleryComponentView *)self imageViews];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        CGFloat v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 frame];
        v18.CGFloat x = x;
        v18.CGFloat y = y;
        if (CGRectContainsPoint(v19, v18))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)forceImageViewFullscreen:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SXMosaicGalleryComponentView *)self imageViews];
  uint64_t v6 = [v5 indexOfObject:v4];

  id v7 = [(SXMosaicGalleryComponentView *)self fullScreenCanvasController];
  [v7 presentFullscreenWithIndex:v6];
}

- (id)textResizerForCaption:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(SXComponentView *)self DOMObjectProvider];
  uint64_t v6 = SXDefaultTextStyleIdentifierForRole(@"body");
  v26[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v8 = [(SXComponentView *)self component];
  CGFloat v9 = [v5 componentTextStyleForIdentifiers:v7 component:v8];

  if (!v9)
  {
    double v10 = [(SXComponentView *)self DOMObjectProvider];
    double v25 = @"default";
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    long long v12 = [(SXComponentView *)self component];
    CGFloat v9 = [v10 componentTextStyleForIdentifiers:v11 component:v12];
  }
  long long v13 = [(SXComponentView *)self DOMObjectProvider];
  long long v14 = -[SXFullscreenCaption caption]((uint64_t)v4);

  CGFloat v15 = [v14 textStyle];
  uint64_t v16 = [(SXComponentView *)self component];
  CGFloat v17 = [v16 classification];
  CGPoint v18 = [(SXComponentView *)self component];
  CGRect v19 = [v13 componentTextStyleForIdentifier:v15 classification:v17 component:v18];

  if (v19) {
    char v20 = [v19 fontScaling];
  }
  else {
    char v20 = 1;
  }
  CGFloat v21 = [SXTextResizer alloc];
  double v22 = [(SXComponentView *)self documentColumnLayout];
  double v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v21->super.isa, v22, v9, v20);

  return v23;
}

- (id)textRulesForCaption:(id)a3
{
  objc_super v3 = [(SXComponentView *)self component];
  id v4 = [v3 classification];
  unint64_t v5 = [v4 textRules];

  return v5;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SXComponentView *)self DOMObjectProvider];
  uint64_t v6 = [(SXComponentView *)self component];
  id v7 = [v5 textStyleForIdentifier:v4 component:v6];

  return v7;
}

- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SXComponentView *)self DOMObjectProvider];
  CGFloat v9 = [(SXComponentView *)self component];
  double v10 = [v8 componentTextStyleForIdentifier:v7 inheritingFromComponentTextStyle:v6 component:v9];

  return v10;
}

- (id)contentSizeCategoryForCaption:(id)a3
{
  objc_super v3 = [(SXComponentView *)self presentationDelegate];
  id v4 = [v3 presentationAttributes];
  unint64_t v5 = [v4 contentSizeCategory];

  return v5;
}

- (void)submitEvents
{
  v3.receiver = self;
  v3.super_class = (Class)SXMosaicGalleryComponentView;
  [(SXMediaComponentView *)&v3 submitEvents];
  [(SXMosaicGalleryComponentView *)self finishMediaViewEvent];
}

- (unint64_t)analyticsMediaType
{
  return 1;
}

- (unint64_t)analyticsGalleryType
{
  return 2;
}

- (void)createMediaViewEventForGalleryItem:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(SXMosaicGalleryComponentView *)self mediaViewEvent];

  if (v4 && !v5)
  {
    id v6 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
    id v7 = [(SXComponentView *)self component];
    id v8 = [v7 items];
    objc_msgSend(v6, "setGalleryImageCount:", objc_msgSend(v8, "count"));

    CGFloat v9 = [v4 imageIdentifier];
    v11[0] = v9;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v6 setGalleryImageIds:v10];

    [v6 setMediaType:4];
    [(SXMosaicGalleryComponentView *)self setMediaViewEvent:v6];
  }
}

- (void)finishMediaViewEvent
{
  objc_super v3 = [(SXMosaicGalleryComponentView *)self mediaViewEvent];
  id v4 = [v3 startDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 < 0.0) {
    double v6 = -v6;
  }
  id v7 = [(SXMosaicGalleryComponentView *)self mediaViewEvent];

  if (v7 && v6 >= 1.0)
  {
    id v8 = [(SXMosaicGalleryComponentView *)self mediaViewEvent];
    [v8 determineEndDate];

    CGFloat v9 = [(SXMediaComponentView *)self analyticsReporting];
    double v10 = [(SXMosaicGalleryComponentView *)self mediaViewEvent];
    [v9 reportEvent:v10];
  }
  [(SXMosaicGalleryComponentView *)self setMediaViewEvent:0];
}

- (BOOL)shouldSubmitMediaExposureEventForExposedBounds:(CGRect)a3
{
  objc_super v3 = [(SXMosaicGalleryComponentView *)self exposedGalleryItems];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)willSubmitMediaExposureEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SXMosaicGalleryComponentView;
  id v4 = a3;
  [(SXMediaComponentView *)&v9 willSubmitMediaExposureEvent:v4];
  double v5 = [(SXComponentView *)self component];
  double v6 = [v5 items];
  objc_msgSend(v4, "setNumberOfImages:", objc_msgSend(v6, "count"));

  id v7 = [(SXMosaicGalleryComponentView *)self exposedGalleryItems];
  objc_msgSend(v4, "setNumberOfImagesExposed:", objc_msgSend(v7, "count"));

  id v8 = [(SXMosaicGalleryComponentView *)self exposedGalleryItems];
  [v8 removeAllObjects];
}

- (BOOL)allowHierarchyRemoval
{
  v7.receiver = self;
  v7.super_class = (Class)SXMosaicGalleryComponentView;
  unsigned __int8 v3 = [(SXComponentView *)&v7 allowHierarchyRemoval];
  id v4 = [(SXMosaicGalleryComponentView *)self fullScreenCanvasController];
  char v5 = [v4 isFullscreen];

  return v3 & ~v5;
}

- (SXGalleryItemImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXFullscreenCanvasController)fullScreenCanvasController
{
  return self->_fullScreenCanvasController;
}

- (UIView)galleryView
{
  return self->_galleryView;
}

- (void)setGalleryView:(id)a3
{
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (NSMutableArray)visibleImageViews
{
  return self->_visibleImageViews;
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

- (SXMosaicGalleryLayouter)galleryLayouter
{
  return self->_galleryLayouter;
}

- (void)setGalleryLayouter:(id)a3
{
}

- (NSMutableSet)exposedGalleryItems
{
  return self->_exposedGalleryItems;
}

- (void)setExposedGalleryItems:(id)a3
{
}

- (BOOL)isLayoutRequired
{
  return self->_layoutRequired;
}

- (void)setLayoutRequired:(BOOL)a3
{
  self->_layoutRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedGalleryItems, 0);
  objc_storeStrong((id *)&self->_galleryLayouter, 0);
  objc_storeStrong((id *)&self->_mediaViewEvent, 0);
  objc_storeStrong((id *)&self->_visibleImageViews, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_galleryView, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasController, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
@interface SXScalableImageComponentView
- (BOOL)allowHierarchyRemoval;
- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5;
- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5;
- (BOOL)gestureShouldBegin:(id)a3;
- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3;
- (BOOL)usesThumbnailWithImageIdentifier:(id)a3;
- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6;
- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6;
- (CGRect)previousContentFrame;
- (CGRect)transitionContentFrame;
- (NSString)description;
- (SXDragManager)dragManager;
- (SXFullscreenCanvasController)fullScreenCanvasController;
- (SXFullscreenCanvasControllerFactory)canvasControllerFactory;
- (SXImageResource)imageResource;
- (SXImageView)imageView;
- (SXImageViewFactory)imageViewFactory;
- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider;
- (SXMediaViewEvent)activeViewEvent;
- (SXScalableImageComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 canvasControllerFactory:(id)a10 mediaSharingPolicyProvider:(id)a11;
- (UIView)gestureView;
- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4;
- (id)contentSizeCategoryForCaption:(id)a3;
- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5;
- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (id)textResizerForCaption:(id)a3;
- (id)textRulesForCaption:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
- (unint64_t)analyticsMediaType;
- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4;
- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5;
- (void)createMediaViewEvent;
- (void)discardContents;
- (void)finishMediaViewEvent;
- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5;
- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5;
- (void)fullScreenCanvasController:(id)a3 willReturnToFullscreenForShowable:(id)a4 viewIndex:(unint64_t)a5;
- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4;
- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5;
- (void)layoutImageView;
- (void)loadComponent:(id)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)setActiveViewEvent:(id)a3;
- (void)setDragManager:(id)a3;
- (void)setFullScreenCanvasController:(id)a3;
- (void)setGestureView:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setPreviousContentFrame:(CGRect)a3;
- (void)submitEvents;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
@end

@implementation SXScalableImageComponentView

- (SXScalableImageComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 canvasControllerFactory:(id)a10 mediaSharingPolicyProvider:(id)a11
{
  id v23 = a9;
  id v22 = a10;
  id v21 = a11;
  v24.receiver = self;
  v24.super_class = (Class)SXScalableImageComponentView;
  v18 = [(SXMediaComponentView *)&v24 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageViewFactory, a9);
    objc_storeStrong((id *)&v19->_canvasControllerFactory, a10);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a11);
  }

  return v19;
}

- (void)loadComponent:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)SXScalableImageComponentView;
  [(SXComponentView *)&v25 loadComponent:a3];
  if (!self->_imageView)
  {
    v4 = [(SXComponentView *)self DOMObjectProvider];
    v5 = [(SXComponentView *)self component];
    v6 = [v5 imageIdentifier];
    v7 = [v4 imageResourceForIdentifier:v6];

    imageResource = self->_imageResource;
    self->_imageResource = v7;
    v9 = v7;

    v10 = [(SXScalableImageComponentView *)self imageViewFactory];
    v11 = [v10 imageViewForResource:v9];
    imageView = self->_imageView;
    self->_imageView = v11;

    v13 = self->_imageView;
    v14 = [MEMORY[0x263F1C550] clearColor];
    [(SXImageView *)v13 setBackgroundColor:v14];

    [(SXImageView *)self->_imageView setDelegate:self];
    v15 = [(SXComponentView *)self component];
    v16 = [v15 accessibilityCaption];
    [(SXImageView *)self->_imageView setAccessibilityLabel:v16];

    v17 = [(SXComponentView *)self contentView];
    [v17 addSubview:self->_imageView];

    v18 = [(SXScalableImageComponentView *)self canvasControllerFactory];
    v19 = [v18 fullscreenCanvasControllerForShowable:self];
    fullScreenCanvasController = self->_fullScreenCanvasController;
    self->_fullScreenCanvasController = v19;

    id v21 = [SXDragManager alloc];
    id v22 = [(SXScalableImageComponentView *)self mediaSharingPolicyProvider];
    id v23 = -[SXDragManager initWithSharingPolicy:dataSource:](v21, "initWithSharingPolicy:dataSource:", [v22 mediaSharingPolicy], self);
    dragManager = self->_dragManager;
    self->_dragManager = v23;

    [(SXDragManager *)self->_dragManager updateAccessibilityDragSourceDescriptorsForDraggableElement:self->_imageView];
  }
}

- (void)presentComponentWithChanges:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SXScalableImageComponentView;
  [(SXComponentView *)&v29 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  [(SXScalableImageComponentView *)self previousContentFrame];
  double v5 = v4;
  double v7 = v6;
  [(SXComponentView *)self contentFrame];
  if (v5 != v9 || v7 != v8)
  {
    v11 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
    if ([v11 isFullscreen])
    {
    }
    else
    {
      v12 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
      char v13 = [v12 isTransitioning];

      if ((v13 & 1) == 0) {
        [(SXScalableImageComponentView *)self layoutImageView];
      }
    }
    v14 = [(SXScalableImageComponentView *)self imageView];
    [(SXComponentView *)self contentFrame];
    objc_msgSend(v14, "setPreferredImageSize:", v15, v16);

    v17 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
    char v18 = [v17 isFullscreen];

    if ((v18 & 1) == 0)
    {
      v19 = [(SXScalableImageComponentView *)self imageView];
      [v19 bounds];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      v28 = [(SXScalableImageComponentView *)self gestureView];
      objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);
    }
  }
  [(SXComponentView *)self contentFrame];
  -[SXScalableImageComponentView setPreviousContentFrame:](self, "setPreviousContentFrame:");
}

- (void)renderContents
{
  v4.receiver = self;
  v4.super_class = (Class)SXScalableImageComponentView;
  [(SXComponentView *)&v4 renderContents];
  v3 = [(SXScalableImageComponentView *)self imageView];
  [v3 addInterestInImageQuality:0 forObject:self];
}

- (void)discardContents
{
  v7.receiver = self;
  v7.super_class = (Class)SXScalableImageComponentView;
  [(SXComponentView *)&v7 discardContents];
  v3 = [(SXScalableImageComponentView *)self imageView];
  int v4 = [v3 objectHasQualityInterest:self quality:0];

  if (v4)
  {
    double v5 = [(SXScalableImageComponentView *)self imageView];
    [v5 giveUpInterestForObject:self];
  }
  double v6 = [(SXScalableImageComponentView *)self imageView];
  [v6 setImage:0];
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXScalableImageComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v7, sel_visibilityStateDidChangeFromState_);
  if ([(SXComponentView *)self visibilityState] == 1)
  {
    double v5 = [(SXScalableImageComponentView *)self imageView];
    [v5 resume];
LABEL_6:

    return;
  }
  int64_t v6 = [(SXComponentView *)self visibilityState];
  if (a3 == 1 && v6 == 2)
  {
    double v5 = [(SXScalableImageComponentView *)self imageView];
    [v5 pause];
    goto LABEL_6;
  }
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4);
  if ([(SXComponentView *)self visibilityState] == 1)
  {
    double v5 = [(SXScalableImageComponentView *)self imageView];
    [v5 resume];
  }
  id v6 = [(SXScalableImageComponentView *)self imageView];
  [v6 setScrubbingEnabled:1];
}

- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5
{
}

- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3
{
  v3 = self;
  int v4 = [(SXComponentView *)self presentationDelegate];
  LOBYTE(v3) = [v4 allowInteractivityFocusForComponent:v3];

  return (char)v3;
}

- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [(SXComponentView *)self presentationDelegate];
  v10 = [v9 requestFullScreenCanvasViewControllerForComponent:self canvasController:v8 withCompletionBlock:v7];

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5
{
  id v6 = [(SXComponentView *)self contentView];
  id v7 = [(SXScalableImageComponentView *)self imageView];
  [v6 addSubview:v7];

  [(SXScalableImageComponentView *)self layoutImageView];
}

- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6 = [(SXComponentView *)self component];
  id v7 = [v6 captionComponent];

  if (v7)
  {
    id v8 = [SXFullscreenCaption alloc];
    double v9 = [(SXComponentView *)self component];
    v10 = [v9 captionComponent];
    v11 = -[SXFullscreenCaption initWithCaption:dataSource:]((id *)&v8->super.isa, v10, self);
LABEL_5:
    double v15 = v11;

    goto LABEL_6;
  }
  v12 = [(SXComponentView *)self component];
  char v13 = [v12 caption];

  if (v13)
  {
    v14 = [SXFullscreenCaption alloc];
    double v9 = [(SXComponentView *)self component];
    v10 = [v9 caption];
    v11 = -[SXFullscreenCaption initWithText:dataSource:]((id *)&v14->super.isa, v10, self);
    goto LABEL_5;
  }
  double v15 = 0;
LABEL_6:
  return v15;
}

- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6 = [(SXScalableImageComponentView *)self imageView];
  int v7 = [v6 hasLoadedImage];

  if (v7)
  {
    id v8 = [(SXComponentView *)self presentationDelegate];
    int v9 = [v8 addInteractivityFocusForComponent:self];

    if (v9)
    {
      v10 = [(SXScalableImageComponentView *)self imageView];
      [v10 addInterestInImageQuality:1 forObject:self];

      [(SXScalableImageComponentView *)self createMediaViewEvent];
    }
    v11 = [(SXComponentView *)self presentationDelegate];
    v12 = [v11 animationController];
    [v12 stopUpdatingAnimationForComponentView:self finishAnimation:1];
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)fullScreenCanvasController:(id)a3 willReturnToFullscreenForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6 = [(SXComponentView *)self presentationDelegate];
  [v6 willReturnToFullscreenForComponent:self];
}

- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6 = [(SXComponentView *)self presentationDelegate];
  [v6 removeInteractivityFocusForComponent:self];

  int v7 = [(SXComponentView *)self presentationDelegate];
  [v7 dismissFullscreenCanvasForComponent:self];

  [(SXComponentView *)self restoreBehavior];
  id v8 = [(SXScalableImageComponentView *)self imageView];
  [v8 giveUpInterestForObject:self];

  int v9 = [(SXScalableImageComponentView *)self imageView];
  [v9 addInterestInImageQuality:0 forObject:self];

  [(SXScalableImageComponentView *)self finishMediaViewEvent];
}

- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6 = [(SXComponentView *)self presentationDelegate];
  [v6 willDismissFullscreenCanvasForComponent:self];
}

- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v11 = a3;
  v12 = [(SXScalableImageComponentView *)self imageView];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat rect = v15;

  double v16 = [(SXScalableImageComponentView *)self imageView];
  [v16 bounds];
  objc_msgSend(v11, "fitSizeForRect:");
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v21 = CGRectGetHeight(v29);
  v30.origin.CGFloat x = v14;
  v30.origin.CGFloat y = rect;
  v30.size.CGFloat width = v18;
  v30.size.CGFloat height = v20;
  CGFloat v22 = (v21 - CGRectGetHeight(v30)) * 0.5;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v23 = CGRectGetWidth(v31);
  v32.origin.CGFloat x = v14;
  v32.origin.CGFloat y = v22;
  v32.size.CGFloat width = v18;
  v32.size.CGFloat height = v20;
  double v24 = (v23 - CGRectGetWidth(v32)) * 0.5;
  double v25 = v22;
  double v26 = v18;
  double v27 = v20;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5
{
  id v8 = a4;
  id v6 = [(SXScalableImageComponentView *)self imageView];
  [v6 bounds];
  objc_msgSend(v8, "setFrame:");

  int v7 = [(SXScalableImageComponentView *)self imageView];
  [v7 addSubview:v8];

  [(SXScalableImageComponentView *)self setGestureView:v8];
}

- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4
{
  return 1;
}

- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6
{
  id v7 = a5;
  [(SXComponentView *)self contentFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(SXComponentView *)self contentView];
  objc_msgSend(v7, "convertRect:fromView:", v16, v9, v11, v13, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5
{
  return 0;
}

- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5
{
  double v5 = [(SXComponentView *)self presentationDelegate];
  char v6 = [v5 isScrolling] ^ 1;

  return v6;
}

- (void)layoutImageView
{
  v3 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
  if ([v3 isFullscreen])
  {
    int v4 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
    int v5 = [v4 isTransitioning];

    if (!v5) {
      return;
    }
  }
  else
  {
  }
  id v6 = [(SXScalableImageComponentView *)self imageView];
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v6, "setFrame:");
}

- (BOOL)gestureShouldBegin:(id)a3
{
  id v4 = a3;
  int v5 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
  char v6 = [v5 otherInteractivityGestureShouldBegin:v4];

  return v6;
}

- (CGRect)transitionContentFrame
{
  v2 = [(SXScalableImageComponentView *)self imageView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SXComponentView *)self component];
  double v6 = [v5 imageIdentifier];
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (id)textResizerForCaption:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SXComponentView *)self DOMObjectProvider];
  double v6 = SXDefaultTextStyleIdentifierForRole(@"body");
  v26[0] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
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
  double v17 = [v16 classification];
  double v18 = [(SXComponentView *)self component];
  double v19 = [v13 componentTextStyleForIdentifier:v15 classification:v17 component:v18];

  if (v19) {
    char v20 = [v19 fontScaling];
  }
  else {
    char v20 = 1;
  }
  double v21 = [SXTextResizer alloc];
  double v22 = [(SXComponentView *)self documentColumnLayout];
  double v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v21->super.isa, v22, v9, v20);

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
  double v6 = [(SXComponentView *)self component];
  char v7 = [v5 textStyleForIdentifier:v4 component:v6];

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

- (void)submitEvents
{
  v3.receiver = self;
  v3.super_class = (Class)SXScalableImageComponentView;
  [(SXMediaComponentView *)&v3 submitEvents];
  [(SXScalableImageComponentView *)self finishMediaViewEvent];
}

- (unint64_t)analyticsMediaType
{
  return 4;
}

- (void)createMediaViewEvent
{
  objc_super v3 = [(SXScalableImageComponentView *)self activeViewEvent];
  if (!v3)
  {
    id v4 = [(SXScalableImageComponentView *)self imageView];
    double v5 = [v4 image];

    if (!v5) {
      return;
    }
    id v6 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
    [(SXScalableImageComponentView *)self setActiveViewEvent:v6];
    objc_super v3 = v6;
  }
}

- (void)finishMediaViewEvent
{
  objc_super v3 = [(SXScalableImageComponentView *)self activeViewEvent];

  if (v3)
  {
    id v4 = [(SXScalableImageComponentView *)self activeViewEvent];
    [v4 determineEndDate];

    double v5 = [(SXMediaComponentView *)self analyticsReporting];
    id v6 = [(SXScalableImageComponentView *)self activeViewEvent];
    [v5 reportEvent:v6];

    [(SXScalableImageComponentView *)self setActiveViewEvent:0];
  }
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SXScalableImageComponentView *)self imageResource];
  [v5 dimensions];
  id v6 = NSStringFromCGSize(v10);
  id v7 = [v3 stringWithFormat:@"<%@: %p>: %@", v4, self, v6];

  return (NSString *)v7;
}

- (BOOL)allowHierarchyRemoval
{
  v7.receiver = self;
  v7.super_class = (Class)SXScalableImageComponentView;
  unsigned __int8 v3 = [(SXComponentView *)&v7 allowHierarchyRemoval];
  uint64_t v4 = [(SXScalableImageComponentView *)self fullScreenCanvasController];
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

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (void)setImageResource:(id)a3
{
}

- (SXFullscreenCanvasController)fullScreenCanvasController
{
  return self->_fullScreenCanvasController;
}

- (void)setFullScreenCanvasController:(id)a3
{
}

- (SXMediaViewEvent)activeViewEvent
{
  return self->_activeViewEvent;
}

- (void)setActiveViewEvent:(id)a3
{
}

- (CGRect)previousContentFrame
{
  double x = self->_previousContentFrame.origin.x;
  double y = self->_previousContentFrame.origin.y;
  double width = self->_previousContentFrame.size.width;
  double height = self->_previousContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousContentFrame:(CGRect)a3
{
  self->_previousContentFrame = a3;
}

- (UIView)gestureView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureView);
  return (UIView *)WeakRetained;
}

- (void)setGestureView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gestureView);
  objc_storeStrong((id *)&self->_activeViewEvent, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasController, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_canvasControllerFactory, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
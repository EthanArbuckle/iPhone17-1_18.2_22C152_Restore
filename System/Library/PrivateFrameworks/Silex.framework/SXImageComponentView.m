@interface SXImageComponentView
- (BOOL)usesThumbnailWithImageIdentifier:(id)a3;
- (CGRect)imageFrame;
- (CGRect)transitionContentFrame;
- (NSString)description;
- (SXAnimatedImageController)animatedImageController;
- (SXDragManager)dragManager;
- (SXImageComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 mediaSharingPolicyProvider:(id)a10;
- (SXImageView)imageView;
- (SXImageViewFactory)imageViewFactory;
- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider;
- (id)contentViewForBehavior:(id)a3;
- (id)imageResource;
- (unint64_t)analyticsMediaType;
- (void)dealloc;
- (void)discardContents;
- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4;
- (void)imageView:(id)a3 didLoadImage:(id)a4;
- (void)layoutImageView;
- (void)loadComponent:(id)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)setAnimatedImageController:(id)a3;
- (void)setDragManager:(id)a3;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
@end

@implementation SXImageComponentView

- (SXImageComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 mediaSharingPolicyProvider:(id)a10
{
  id v21 = a9;
  id v17 = a10;
  v22.receiver = self;
  v22.super_class = (Class)SXImageComponentView;
  v18 = [(SXMediaComponentView *)&v22 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageViewFactory, a9);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a10);
  }

  return v19;
}

- (void)loadComponent:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SXImageComponentView;
  [(SXComponentView *)&v20 loadComponent:a3];
  if (!self->_imageView)
  {
    v4 = [(SXComponentView *)self DOMObjectProvider];
    v5 = [(SXComponentView *)self component];
    v6 = [v5 imageIdentifier];
    v7 = [v4 imageResourceForIdentifier:v6];

    v8 = [(SXImageComponentView *)self imageViewFactory];
    v9 = [v8 imageViewForResource:v7];
    imageView = self->_imageView;
    self->_imageView = v9;

    [(SXImageView *)self->_imageView setDelegate:self];
    v11 = [(SXComponentView *)self contentView];
    v12 = [(SXImageComponentView *)self imageView];
    [v11 addSubview:v12];

    v13 = [(SXComponentView *)self component];
    -[SXImageView setIsAccessibilityElement:](self->_imageView, "setIsAccessibilityElement:", [v13 shouldBeExposedToAssistiveTechnology]);

    v14 = [(SXComponentView *)self component];
    v15 = [v14 captionWithLocalizedRoleForSpeaking];
    [(SXImageView *)self->_imageView setAccessibilityLabel:v15];

    v16 = [SXDragManager alloc];
    id v17 = [(SXImageComponentView *)self mediaSharingPolicyProvider];
    v18 = -[SXDragManager initWithSharingPolicy:dataSource:](v16, "initWithSharingPolicy:dataSource:", [v17 mediaSharingPolicy], self);
    dragManager = self->_dragManager;
    self->_dragManager = v18;

    [(SXDragManager *)self->_dragManager updateAccessibilityDragSourceDescriptorsForDraggableElement:self->_imageView];
  }
}

- (void)layoutImageView
{
  id v3 = [(SXImageComponentView *)self imageView];
  [(SXImageComponentView *)self imageFrame];
  objc_msgSend(v3, "setFrame:");
}

- (CGRect)imageFrame
{
  [(SXComponentView *)self contentFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  double Width = v7;
  CGFloat height = v9;
  v11 = [(SXComponentView *)self componentLayout];
  [v11 maximumContentWidth];
  uint64_t v13 = v12;

  if (v13)
  {
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.width = Width;
    v37.size.CGFloat height = height;
    double Width = CGRectGetWidth(v37);
    v14 = [(SXComponentView *)self unitConverter];
    v15 = [(SXComponentView *)self componentLayout];
    uint64_t v16 = [v15 maximumContentWidth];
    objc_msgSend(v14, "convertValueToPoints:", v16, v17);
    double v19 = v18;

    if (Width >= v19) {
      double Width = v19;
    }
  }
  objc_super v20 = [(SXImageComponentView *)self imageResource];
  [v20 dimensions];
  if (v21 > 0.0)
  {
    objc_super v22 = [(SXImageComponentView *)self imageResource];
    [v22 dimensions];
    double v24 = v23;

    if (v24 <= 0.0) {
      goto LABEL_8;
    }
    objc_super v20 = [(SXImageComponentView *)self imageResource];
    [v20 dimensions];
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.width = Width;
    v45.size.CGFloat height = height;
    CGRect v38 = AVMakeRectWithAspectRatioInsideRect(v36, v45);
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    double Width = v38.size.width;
    CGFloat height = v38.size.height;
  }

LABEL_8:
  v25 = [(SXComponentView *)self componentLayout];
  if (![v25 horizontalContentAlignment])
  {

LABEL_13:
    [(SXComponentView *)self contentFrame];
    double MinX = CGRectGetMinX(v41);
    [(SXComponentView *)self contentFrame];
    double v31 = CGRectGetWidth(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.width = Width;
    v43.size.CGFloat height = height;
    double v29 = MinX + (v31 - CGRectGetWidth(v43)) * 0.5;
    goto LABEL_15;
  }
  v26 = [(SXComponentView *)self componentLayout];
  uint64_t v27 = [v26 horizontalContentAlignment];

  if (v27 != 1)
  {
    if (v27 == 3)
    {
      [(SXComponentView *)self contentFrame];
      double MaxX = CGRectGetMaxX(v39);
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.width = Width;
      v40.size.CGFloat height = height;
      double v29 = MaxX - CGRectGetWidth(v40);
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  double v29 = 0.0;
LABEL_15:
  CGFloat v32 = y;
  double v33 = Width;
  CGFloat v34 = height;
  return CGRectIntegral(*(CGRect *)&v29);
}

- (void)presentComponentWithChanges:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SXImageComponentView;
  [(SXComponentView *)&v8 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  [(SXImageComponentView *)self layoutImageView];
  v4 = [(SXImageComponentView *)self imageView];
  double v5 = [(SXImageComponentView *)self imageView];
  [v5 bounds];
  objc_msgSend(v4, "setPreferredImageSize:", v6, v7);
}

- (void)renderContents
{
  v4.receiver = self;
  v4.super_class = (Class)SXImageComponentView;
  [(SXComponentView *)&v4 renderContents];
  double v3 = [(SXImageComponentView *)self imageView];
  [v3 addInterestInImageQuality:0 forObject:self];
}

- (void)discardContents
{
  v7.receiver = self;
  v7.super_class = (Class)SXImageComponentView;
  [(SXComponentView *)&v7 discardContents];
  double v3 = [(SXImageComponentView *)self imageView];
  int v4 = [v3 objectHasQualityInterest:self quality:0];

  if (v4)
  {
    double v5 = [(SXImageComponentView *)self imageView];
    [v5 giveUpInterestForObject:self];
  }
  double v6 = [(SXImageComponentView *)self imageView];
  [v6 setImage:0];
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SXImageComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v15, sel_visibilityStateDidChangeFromState_);
  if ([(SXComponentView *)self visibilityState] == 1)
  {
    double v5 = [(SXImageComponentView *)self animatedImageController];

    if (v5)
    {
      double v6 = [(SXImageComponentView *)self animatedImageController];
      -[SXAnimatedImageController registerForViewportChanges]((uint64_t)v6);
    }
    objc_super v7 = [(SXComponentView *)self component];
    char v8 = [v7 userControllable];

    if ((v8 & 1) == 0)
    {
      double v9 = [(SXImageComponentView *)self imageView];
      [v9 resume];
LABEL_12:
    }
  }
  else
  {
    int64_t v10 = [(SXComponentView *)self visibilityState];
    if (a3 == 1 && v10 == 2)
    {
      v11 = [(SXImageComponentView *)self animatedImageController];

      if (v11)
      {
        uint64_t v12 = [(SXImageComponentView *)self animatedImageController];
        -[SXAnimatedImageController unregisterForViewportChanges]((uint64_t)v12);
      }
      uint64_t v13 = [(SXComponentView *)self component];
      char v14 = [v13 userControllable];

      if ((v14 & 1) == 0)
      {
        double v9 = [(SXImageComponentView *)self imageView];
        [v9 pause];
        goto LABEL_12;
      }
    }
  }
}

- (CGRect)transitionContentFrame
{
  v2 = [(SXImageComponentView *)self imageView];
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
  result.size.width = v13;
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

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
  id v14 = a3;
  double v5 = [(SXComponentView *)self component];
  int v6 = [v5 userControllable];

  if (v6)
  {
    char v7 = [(SXImageComponentView *)self animatedImageController];

    if (!v7)
    {
      double v8 = [SXAnimatedImageController alloc];
      double v9 = [(SXComponentView *)self viewport];
      double v10 = [(SXImageComponentView *)self imageView];
      double v11 = -[SXAnimatedImageController initWithImageComponentView:viewport:imageView:]((id *)&v8->super.isa, self, v9, v10);

      [(SXImageComponentView *)self setAnimatedImageController:v11];
      [v14 setAutoPlayEnabled:0];
      if ([(SXComponentView *)self visibilityState] == 1)
      {
        double v12 = [(SXImageComponentView *)self animatedImageController];
        -[SXAnimatedImageController registerForViewportChanges]((uint64_t)v12);
      }
    }
  }
  else if ([(SXComponentView *)self visibilityState] == 1)
  {
    [v14 setAutoPlayEnabled:1];
    [v14 resume];
  }
  [(SXMediaComponentView *)self setIsDisplayingMedia:1];
  double v13 = [(SXImageComponentView *)self imageView];
  [v13 setScrubbingEnabled:1];
}

- (void)imageView:(id)a3 didLoadImage:(id)a4
{
}

- (id)contentViewForBehavior:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXImageComponentView;
  double v5 = [(SXComponentView *)&v11 contentViewForBehavior:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  char v7 = [(SXComponentView *)self componentLayout];
  [v7 maximumContentWidth];
  uint64_t v9 = v8;

  if (!v9)
  {
LABEL_2:
    uint64_t v6 = [(SXImageComponentView *)self imageView];
  }
  else
  {
    uint64_t v6 = 0;
  }

  double v5 = (void *)v6;
LABEL_7:

  return v5;
}

- (id)imageResource
{
  v2 = [(SXImageComponentView *)self imageView];
  double v3 = [v2 imageResource];

  return v3;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SXComponentView *)self component];
  uint64_t v6 = [v5 identifier];
  char v7 = [(SXImageComponentView *)self imageResource];
  [v7 dimensions];
  uint64_t v8 = NSStringFromCGSize(v12);
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p; identifier: %@>: %@", v4, self, v6, v8];

  return (NSString *)v9;
}

- (unint64_t)analyticsMediaType
{
  return 4;
}

- (void)dealloc
{
  double v3 = [(SXImageComponentView *)self imageView];
  int v4 = [v3 objectHasQualityInterest:self quality:0];

  if (v4)
  {
    double v5 = [(SXImageComponentView *)self imageView];
    [v5 giveUpInterestForObject:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)SXImageComponentView;
  [(SXComponentView *)&v6 dealloc];
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (SXAnimatedImageController)animatedImageController
{
  return self->_animatedImageController;
}

- (void)setAnimatedImageController:(id)a3
{
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_animatedImageController, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
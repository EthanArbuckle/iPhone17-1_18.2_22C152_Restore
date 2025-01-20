@interface MTMPUMarqueeView
- (BOOL)fadeOnlyWhenAnimating;
- (BOOL)isMarqueeEnabled;
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (MTMPUMarqueeView)initWithFrame:(CGRect)a3;
- (MTMPUMarqueeViewDelegate)delegate;
- (NSArray)coordinatedMarqueeViews;
- (UIEdgeInsets)fadeEdgeInsets;
- (UIView)animationReferenceView;
- (UIView)contentView;
- (UIView)viewForContentSize;
- (double)_duration;
- (double)contentGap;
- (double)marqueeDelay;
- (double)marqueeScrollRate;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)animationDirection;
- (void)_applyMarqueeFade;
- (void)_applyMarqueeFadeIfNeeded;
- (void)_createMarqueeAnimationIfNeeded;
- (void)_createMarqueeAnimationIfNeededWithMaximumDuration:(double)a3 beginTime:(double)a4;
- (void)_removeMarqueeFade;
- (void)_tearDownMarqueeAnimation;
- (void)addCoordinatedMarqueeView:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToWindow;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)resetMarqueePosition;
- (void)setAnimationDirection:(int64_t)a3;
- (void)setAnimationReferenceView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentGap:(double)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setFadeEdgeInsets:(UIEdgeInsets)a3;
- (void)setFadeOnlyWhenAnimating:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMarqueeDelay:(double)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setMarqueeEnabled:(BOOL)a3 withOptions:(int64_t)a4;
- (void)setMarqueeScrollRate:(double)a3;
- (void)setViewForContentSize:(id)a3;
@end

@implementation MTMPUMarqueeView

- (MTMPUMarqueeView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTMPUMarqueeView;
  v3 = -[MTMPUMarqueeView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_marqueeDelay = 3.0;
    v3->_marqueeScrollRate = 30.0;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v3->_fadeEdgeInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v3->_fadeEdgeInsets.bottom = v5;
    uint64_t v6 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    coordinatedMarqueeViews = v4->_coordinatedMarqueeViews;
    v4->_coordinatedMarqueeViews = (NSPointerArray *)v6;

    [(MTMPUMarqueeView *)v4 setClipsToBounds:1];
    v8 = [_MPUMarqueeContentView alloc];
    [(MTMPUMarqueeView *)v4 bounds];
    uint64_t v9 = -[_MPUMarqueeContentView initWithFrame:](v8, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v9;

    [(MTMPUMarqueeView *)v4 addSubview:v4->_contentView];
  }
  return v4;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MTMPUMarqueeView;
  [(MTMPUMarqueeView *)&v4 didMoveToWindow];
  v3 = [(MTMPUMarqueeView *)self window];

  if (v3) {
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
  else {
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)MTMPUMarqueeView;
  [(MTMPUMarqueeView *)&v19 layoutSubviews];
  if ([(MTMPUMarqueeView *)self animationDirection]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  [(UIView *)self->_contentView setSemanticContentAttribute:v3];
  [(MTMPUMarqueeView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_super v12 = [(UIView *)self->_contentView layer];
  int64_t animationDirection = self->_animationDirection;
  double v14 = self->_contentSize.width + self->_contentGap;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double v15 = CGRectGetWidth(v20) - self->_fadeEdgeInsets.right;
  if (v14 >= v15) {
    double v15 = v14;
  }
  if (animationDirection == 1) {
    double v15 = -v15;
  }
  CATransform3DMakeTranslation(&v18, v15, 0.0, 0.0);
  [v12 setInstanceTransform:&v18];
  [v12 setInstanceCount:2];
  BOOL v16 = [(MTMPUMarqueeView *)self fadeOnlyWhenAnimating];
  contentView = self->_contentView;
  if (v16)
  {
    UIRectCenteredYInRectScale();
    [(UIView *)contentView setFrame:0];
  }
  else
  {
    UIRectCenteredYInRectScale();
    [(UIView *)contentView setFrame:0];
    [(MTMPUMarqueeView *)self _applyMarqueeFadeIfNeeded];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTMPUMarqueeView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MTMPUMarqueeView;
  -[MTMPUMarqueeView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (void)setFadeEdgeInsets:(UIEdgeInsets)a3
{
  self->_fadeEdgeInsets = a3;
  [(MTMPUMarqueeView *)self setNeedsLayout];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTMPUMarqueeView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MTMPUMarqueeView;
  -[MTMPUMarqueeView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)MTMPUMarqueeView;
  [(MTMPUMarqueeView *)&v4 invalidateIntrinsicContentSize];
  viewForContentSize = self->_viewForContentSize;
  if (viewForContentSize)
  {
    [(UIView *)viewForContentSize intrinsicContentSize];
    -[MTMPUMarqueeView setContentSize:](self, "setContentSize:");
  }
}

- (CGSize)intrinsicContentSize
{
  viewForContentSize = self->_viewForContentSize;
  if (viewForContentSize)
  {
    [(UIView *)viewForContentSize intrinsicContentSize];
  }
  else
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
  }
  double v6 = width + self->_fadeEdgeInsets.left + self->_fadeEdgeInsets.right;
  result.double height = height;
  result.double width = v6;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  v2 = [(UIView *)self->_contentView subviews];
  uint64_t v3 = [v2 firstObject];
  objc_super v4 = [v3 viewForFirstBaselineLayout];

  return v4;
}

- (id)viewForLastBaselineLayout
{
  v2 = [(UIView *)self->_contentView subviews];
  uint64_t v3 = [v2 lastObject];
  objc_super v4 = [v3 viewForLastBaselineLayout];

  return v4;
}

- (void)animationDidStart:(id)a3
{
  id v5 = [a3 valueForKey:@"_MPUMarqueeViewAnimationIdentifierKey"];
  if ([v5 isEqual:self->_currentAnimationID])
  {
    BOOL v4 = [(MTMPUMarqueeView *)self fadeOnlyWhenAnimating];

    if (v4)
    {
      [(MTMPUMarqueeView *)self _applyMarqueeFadeIfNeeded];
    }
  }
  else
  {
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(MTMPUMarqueeView *)self fadeOnlyWhenAnimating]) {
    [(MTMPUMarqueeView *)self _removeMarqueeFade];
  }
  double v6 = [v11 valueForKey:@"_MPUMarqueeViewAnimationIdentifierKey"];
  int v7 = [v6 isEqual:self->_currentAnimationID];

  if (v7)
  {
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 marqueeViewDidEndMarqueeIteration:self finished:v4];
    }
    if (v4) {
      [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    }
  }
}

- (void)setContentGap:(double)a3
{
  if (self->_contentGap != a3)
  {
    self->_contentGap = a3;
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    [(MTMPUMarqueeView *)self setNeedsLayout];
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    [(MTMPUMarqueeView *)self setNeedsLayout];
  }
}

- (void)setMarqueeDelay:(double)a3
{
  if (self->_marqueeDelay != a3)
  {
    self->_marqueeDeladouble y = a3;
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (void)setAnimationReferenceView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_animationReferenceView, obj);
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
    id v5 = obj;
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
}

- (void)setMarqueeEnabled:(BOOL)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  if (self->_options != a4)
  {
    self->_options = a4;
    p_marqueeEnabled = &self->_marqueeEnabled;
    if (self->_marqueeEnabled == a3)
    {
LABEL_13:
      [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
      return;
    }
LABEL_5:
    BOOL *p_marqueeEnabled = a3;
    int v7 = [(UIView *)self->_contentView layer];
    double v8 = v7;
    if ((v4 & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v9 = [v7 animationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [v8 presentationLayer];
      objc_super v12 = v11;
      if (v11)
      {
        [v11 affineTransform];
        double v13 = *(double *)&v17;
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v15 = 0u;
        double v13 = 0.0;
      }
      double v14 = fabs(v13);

      if (v14 < 2.22044605e-16) {
LABEL_11:
      }
        [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    }

    goto LABEL_13;
  }
  p_marqueeEnabled = &self->_marqueeEnabled;
  if (self->_marqueeEnabled != a3) {
    goto LABEL_5;
  }
}

- (void)setMarqueeScrollRate:(double)a3
{
  if (self->_marqueeScrollRate != a3)
  {
    self->_marqueeScrollRate = a3;
    [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];
    [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
  }
}

- (void)setViewForContentSize:(id)a3
{
  id v5 = (UIView *)a3;
  p_viewForContentSize = &self->_viewForContentSize;
  if (self->_viewForContentSize != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_viewForContentSize, a3);
    p_viewForContentSize = (UIView **)[(MTMPUMarqueeView *)self invalidateIntrinsicContentSize];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_viewForContentSize, v5);
}

- (void)setAnimationDirection:(int64_t)a3
{
  if (self->_animationDirection != a3)
  {
    self->_int64_t animationDirection = a3;
    [(MTMPUMarqueeView *)self setNeedsLayout];
  }
}

- (void)addCoordinatedMarqueeView:(id)a3
{
  p_primaryMarqueeView = &self->_primaryMarqueeView;
  double v8 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_primaryMarqueeView);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_primaryMarqueeView);
    [v6 addCoordinatedMarqueeView:v8];

    int v7 = (id *)v6;
  }
  else
  {
    objc_storeWeak(v8 + 54, self);
    [(NSPointerArray *)self->_coordinatedMarqueeViews addPointer:v8];
    int v7 = v8;
  }
}

- (NSArray)coordinatedMarqueeViews
{
  [(NSPointerArray *)self->_coordinatedMarqueeViews compact];
  coordinatedMarqueeViews = self->_coordinatedMarqueeViews;

  return [(NSPointerArray *)coordinatedMarqueeViews allObjects];
}

- (void)resetMarqueePosition
{
  [(MTMPUMarqueeView *)self _tearDownMarqueeAnimation];

  [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeeded];
}

- (void)_applyMarqueeFadeIfNeeded
{
  else {
    [(MTMPUMarqueeView *)self _applyMarqueeFade];
  }
}

- (void)_removeMarqueeFade
{
  id v2 = [(MTMPUMarqueeView *)self layer];
  [v2 setMask:0];
}

- (void)_applyMarqueeFade
{
  v22[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  char v4 = [(MTMPUMarqueeView *)self layer];
  id v5 = [v4 mask];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F39BD0] layer];
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v7 = [v6 CGColor];

    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v9 = [v8 CGColor];

    v22[0] = v9;
    v22[1] = v7;
    v22[2] = v7;
    v22[3] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    [v5 setColors:v10];

    [v4 setMask:v5];
  }
  [(MTMPUMarqueeView *)self bounds];
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  double v15 = CGRectGetWidth(v23);
  v21[0] = &unk_1F3F6F998;
  p_fadeEdgeInsets = &self->_fadeEdgeInsets;
  long long v17 = [NSNumber numberWithDouble:self->_fadeEdgeInsets.left / v15];
  v21[1] = v17;
  CATransform3D v18 = [NSNumber numberWithDouble:(v15 - p_fadeEdgeInsets->right) / v15];
  v21[2] = v18;
  v21[3] = &unk_1F3F6F9A8;
  objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v5 setLocations:v19];

  objc_msgSend(v5, "setBounds:", x, y, width, height);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  double MidX = CGRectGetMidX(v24);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v25));
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  objc_msgSend(v5, "setStartPoint:", 0.0, CGRectGetMidY(v26));
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  objc_msgSend(v5, "setEndPoint:", 1.0, CGRectGetMidY(v27));
  [MEMORY[0x1E4F39CF8] setDisableActions:v3];
}

- (void)_createMarqueeAnimationIfNeeded
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  p_primaryMarqueeView = &self->_primaryMarqueeView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryMarqueeView);

  if (WeakRetained)
  {
    id v24 = objc_loadWeakRetained((id *)p_primaryMarqueeView);
    [v24 _createMarqueeAnimationIfNeeded];
  }
  else
  {
    id v5 = [(MTMPUMarqueeView *)self superview];

    if (v5 && self->_marqueeEnabled)
    {
      [(MTMPUMarqueeView *)self _duration];
      double v7 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v8 = self->_coordinatedMarqueeViews;
      uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
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
            [*(id *)(*((void *)&v29 + 1) + 8 * i) _duration];
            if (v7 < v13) {
              double v7 = v13;
            }
          }
          uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v10);
      }

      double v14 = [(UIView *)self->_contentView layer];
      double v15 = [v14 animationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
      long long v16 = v15;
      if (v15)
      {
        [v15 beginTime];
        double v18 = v17;
      }
      else
      {
        double v18 = CACurrentMediaTime() + self->_marqueeDelay;
      }
      [(MTMPUMarqueeView *)self _createMarqueeAnimationIfNeededWithMaximumDuration:v7 beginTime:v18];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      objc_super v19 = self->_coordinatedMarqueeViews;
      uint64_t v20 = [(NSPointerArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * j) _createMarqueeAnimationIfNeededWithMaximumDuration:v7 beginTime:v18];
          }
          uint64_t v21 = [(NSPointerArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v21);
      }
    }
  }
}

- (void)_createMarqueeAnimationIfNeededWithMaximumDuration:(double)a3 beginTime:(double)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  double v7 = [(UIView *)self->_contentView layer];
  id v8 = [v7 animationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
  [(MTMPUMarqueeView *)self bounds];
  double Width = CGRectGetWidth(v27);
  if (!v8
    && self->_contentSize.width - (Width - self->_fadeEdgeInsets.left - self->_fadeEdgeInsets.right) > 0.00000011920929)
  {
    uint64_t v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    currentAnimationID = self->_currentAnimationID;
    self->_currentAnimationID = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);
    [WeakRetained bounds];
    double v13 = CGRectGetWidth(v28) - self->_fadeEdgeInsets.left - self->_fadeEdgeInsets.right - self->_contentSize.width;

    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    double v14 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.translation.x"];
    double v15 = -self->_contentSize.width - self->_contentGap - v13;
    int64_t v16 = [(MTMPUMarqueeView *)self animationDirection];
    double v17 = -v15;
    if (v16 != 1) {
      double v17 = v15;
    }
    double v18 = [NSNumber numberWithDouble:v17];
    [(MTMPUMarqueeView *)self _duration];
    double v20 = v19;
    v26[0] = &unk_1F3F6F998;
    v26[1] = v18;
    v26[2] = v18;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    [v14 setValues:v21];

    v25[0] = &unk_1F3F6F998;
    uint64_t v22 = [NSNumber numberWithDouble:v20 / a3];
    v25[1] = v22;
    v25[2] = &unk_1F3F6F9A8;
    CGRect v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
    [v14 setKeyTimes:v23];

    [v14 setDuration:a3];
    [v14 setBeginTime:a4];
    id v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v14 setTimingFunction:v24];

    [v14 setDelegate:self];
    [v14 setValue:self->_currentAnimationID forKey:@"_MPUMarqueeViewAnimationIdentifierKey"];
    [v14 setFrameInterval:0.016];
    [v7 addAnimation:v14 forKey:@"_MPUMarqueeViewLayerAnimationKey"];
  }
}

- (void)_tearDownMarqueeAnimation
{
  id v2 = [(UIView *)self->_contentView layer];
  [v2 removeAnimationForKey:@"_MPUMarqueeViewLayerAnimationKey"];
}

- (double)_duration
{
  return 1.0 / self->_marqueeScrollRate * (self->_contentSize.width + self->_contentGap);
}

- (double)contentGap
{
  return self->_contentGap;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)animationReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);

  return (UIView *)WeakRetained;
}

- (UIEdgeInsets)fadeEdgeInsets
{
  double top = self->_fadeEdgeInsets.top;
  double left = self->_fadeEdgeInsets.left;
  double bottom = self->_fadeEdgeInsets.bottom;
  double right = self->_fadeEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)fadeOnlyWhenAnimating
{
  return self->_fadeOnlyWhenAnimating;
}

- (void)setFadeOnlyWhenAnimating:(BOOL)a3
{
  self->_fadeOnlyWhenAnimating = a3;
}

- (MTMPUMarqueeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTMPUMarqueeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)marqueeDelay
{
  return self->_marqueeDelay;
}

- (double)marqueeScrollRate
{
  return self->_marqueeScrollRate;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (UIView)viewForContentSize
{
  return self->_viewForContentSize;
}

- (int64_t)animationDirection
{
  return self->_animationDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForContentSize, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_animationReferenceView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_primaryMarqueeView);
  objc_storeStrong((id *)&self->_coordinatedMarqueeViews, 0);

  objc_storeStrong((id *)&self->_currentAnimationID, 0);
}

@end
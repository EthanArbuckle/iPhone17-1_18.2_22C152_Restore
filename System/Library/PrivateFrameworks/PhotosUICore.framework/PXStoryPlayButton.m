@interface PXStoryPlayButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAShapeLayer)progressIndicator;
- (CGRect)clippingRect;
- (NSString)axPauseLabel;
- (NSString)axPlayLabel;
- (NSString)axReplayLabel;
- (PXStoryChromeButton)button;
- (PXStoryChromeButtonConfiguration)buttonConfiguration;
- (PXStoryPlayButton)initWithFrame:(CGRect)a3;
- (PXStoryPlayButtonConfiguration)configuration;
- (PXStoryPlayButtonConfiguration)userData;
- (PXStoryViewModel)viewModel;
- (PXUpdater)updater;
- (UIEdgeInsets)hitTestEdgeOutsets;
- (id)accessibilityLabel;
- (void)_invalidateButton;
- (void)_invalidateProgressIndicator;
- (void)_updateButton;
- (void)_updateProgressIndicator;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setConfiguration:(id)a3;
- (void)setUserData:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXStoryPlayButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axReplayLabel, 0);
  objc_storeStrong((id *)&self->_axPauseLabel, 0);
  objc_storeStrong((id *)&self->_axPlayLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (NSString)axReplayLabel
{
  return self->_axReplayLabel;
}

- (NSString)axPauseLabel
{
  return self->_axPauseLabel;
}

- (NSString)axPlayLabel
{
  return self->_axPlayLabel;
}

- (CAShapeLayer)progressIndicator
{
  return self->_progressIndicator;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setConfiguration:(id)a3
{
}

- (PXStoryPlayButtonConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryChromeButton)button
{
  return self->_button;
}

- (PXStoryChromeButtonConfiguration)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (UIEdgeInsets)hitTestEdgeOutsets
{
  double top = self->_hitTestEdgeOutsets.top;
  double left = self->_hitTestEdgeOutsets.left;
  double bottom = self->_hitTestEdgeOutsets.bottom;
  double right = self->_hitTestEdgeOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXStoryPlayButtonConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)accessibilityLabel
{
  v2 = [(PXStoryPlayButton *)self buttonConfiguration];
  v3 = [v2 axLabel];

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v10 = a3;
  if ((void *)ViewModelObservationContext_182554 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXStoryPlayButton.m" lineNumber:286 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((*(void *)&v6 & 0x200002) != 0) {
    [(PXStoryPlayButton *)self _invalidateButton];
  }
  if ((v6 & 4) != 0) {
    [(PXStoryPlayButton *)self _invalidateProgressIndicator];
  }
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v9 = (PXStoryPlayButtonConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v9)
  {
  }
  else
  {
    BOOL v5 = [(PXStoryPlayButtonConfiguration *)v9 isEqual:v4];

    if (!v5)
    {
      int v6 = (PXStoryPlayButtonConfiguration *)[(PXStoryPlayButtonConfiguration *)v9 copy];
      userData = self->_userData;
      self->_userData = v6;

      v8 = [(PXStoryPlayButtonConfiguration *)self->_userData viewModel];
      [(PXStoryPlayButton *)self setViewModel:v8];

      [(PXStoryPlayButton *)self _invalidateButton];
      [(PXStoryPlayButton *)self _invalidateProgressIndicator];
    }
  }
}

- (void)_updateProgressIndicator
{
  id v6 = [(PXStoryPlayButton *)self viewModel];
  [v6 playbackFractionCompleted];
  [v6 isAtPlaybackEnd];
  [(PXStoryPlayButton *)self userData];
  v3 = [(id)objc_claimAutoreleasedReturnValue() spec];
  [v3 playButtonProgressIndicatorLineWidth];
  double v5 = v4;

  [(PXStoryPlayButton *)self bounds];
  CGRectInset(v7, v5 * 0.5, v5 * 0.5);
  PXRectGetCenter();
}

- (void)_invalidateProgressIndicator
{
  id v2 = [(PXStoryPlayButton *)self updater];
  [v2 setNeedsUpdateOf:sel__updateProgressIndicator];
}

- (void)_updateButton
{
  id v12 = [(PXStoryPlayButton *)self viewModel];
  if ([v12 isAtPlaybackEnd])
  {
    axReplayLabel = self->_axReplayLabel;
    double v4 = [(PXStoryPlayButton *)self buttonConfiguration];
    [v4 setAxLabel:axReplayLabel];

    double v5 = +[PXStorySettings sharedInstance];
    [v5 playButtonRewindSymbolName];
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = [v12 desiredPlayState];
    if (v6 == 1)
    {
      axPauseLabel = self->_axPauseLabel;
      double v5 = [(PXStoryPlayButton *)self buttonConfiguration];
      [v5 setAxLabel:axPauseLabel];
    }
    else
    {
      if (v6)
      {
LABEL_8:
        v9 = [(PXStoryPlayButton *)self userData];
        [v9 spec];
        [(id)objc_claimAutoreleasedReturnValue() playButtonProgressIndicatorLineWidth];
        id v10 = [(PXStoryPlayButton *)self buttonConfiguration];
        v11 = [v9 target];
        [v10 setTarget:v11];

        objc_msgSend(v10, "setAction:", objc_msgSend(v9, "action"));
        PXEdgeInsetsMake();
      }
      axPlayLabel = self->_axPlayLabel;
      double v5 = [(PXStoryPlayButton *)self buttonConfiguration];
      [v5 setAxLabel:axPlayLabel];
    }
  }

  goto LABEL_8;
}

- (void)_invalidateButton
{
  id v2 = [(PXStoryPlayButton *)self updater];
  [v2 setNeedsUpdateOf:sel__updateButton];
}

- (void)layoutSubviews
{
  v3 = [(PXStoryPlayButton *)self updater];
  [v3 updateIfNeeded];

  v10.receiver = self;
  v10.super_class = (Class)PXStoryPlayButton;
  [(PXStoryPlayButton *)&v10 layoutSubviews];
  double v4 = [(PXStoryPlayButton *)self button];
  double v5 = [(PXStoryPlayButton *)self progressIndicator];
  [(PXStoryPlayButton *)self bounds];
  objc_msgSend(v5, "setFrame:");
  uint64_t v6 = [(PXStoryPlayButton *)self layer];
  [v6 zPosition];
  double v8 = v7;

  v9 = [v4 layer];
  [v9 setZPosition:v8];

  [v5 setZPosition:v8 + 0.1];
}

- (void)setViewModel:(id)a3
{
  double v5 = (PXStoryViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    double v7 = v5;
    [(PXStoryViewModel *)viewModel unregisterChangeObserver:self context:ViewModelObservationContext_182554];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXStoryViewModel *)self->_viewModel registerChangeObserver:self context:ViewModelObservationContext_182554];
    [(PXStoryPlayButton *)self _invalidateButton];
    [(PXStoryPlayButton *)self _invalidateProgressIndicator];
    double v5 = v7;
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PXStoryPlayButton;
  unsigned __int8 v5 = -[PXStoryPlayButton pointInside:withEvent:](&v11, sel_pointInside_withEvent_, a4);
  [(PXStoryPlayButton *)self bounds];
  if (v5) {
    return 1;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v6))
  {
    [(PXStoryPlayButton *)self hitTestEdgeOutsets];
    sub_1AB23B20C();
  }
  return 0;
}

- (PXStoryPlayButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryPlayButton;
  v3 = -[PXStoryPlayButton initWithFrame:](&v13, sel_initWithFrame_);
  if (v3)
  {
    uint64_t v4 = PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelPlay", @"PhotosUICore");
    axPlayLabel = v3->_axPlayLabel;
    v3->_axPlayLabel = (NSString *)v4;

    uint64_t v6 = PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelPause", @"PhotosUICore");
    axPauseLabel = v3->_axPauseLabel;
    v3->_axPauseLabel = (NSString *)v6;

    uint64_t v8 = PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelReplay", @"PhotosUICore");
    axReplayLabel = v3->_axReplayLabel;
    v3->_axReplayLabel = (NSString *)v8;

    uint64_t v10 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v10;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateButton];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateProgressIndicator];
    PXEdgeInsetsMake();
  }
  return 0;
}

@end
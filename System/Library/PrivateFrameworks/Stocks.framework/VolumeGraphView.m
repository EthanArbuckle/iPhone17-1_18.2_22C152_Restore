@interface VolumeGraphView
- (StockGraphImageSet)graphImageSet;
- (VolumeGraphView)initWithFrame:(CGRect)a3;
- (void)resizeSelectedVolumeClipViewWithLeftX:(double)a3 rightX:(double)a4;
- (void)setGraphImageSet:(id)a3;
- (void)setShowingSelectedRegion:(BOOL)a3;
@end

@implementation VolumeGraphView

- (VolumeGraphView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VolumeGraphView;
  v3 = -[VolumeGraphView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VolumeGraphView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setGraphImageSet:(id)a3
{
  id v10 = a3;
  v4 = [v10 volumeGraphImage];
  volumeImage = self->_volumeImage;

  if (v4 != volumeImage)
  {
    objc_super v6 = [v10 volumeGraphImage];
    v7 = self->_volumeImage;
    self->_volumeImage = v6;

    v8 = [(UIImage *)self->_volumeImage CGImage];
    v9 = [(VolumeGraphView *)self layer];
    [v9 setContents:v8];

    [(TintedView *)self->_tintedVolumeView setImage:self->_volumeImage];
  }
}

- (void)setShowingSelectedRegion:(BOOL)a3
{
  if (self->_showingTintedRegion != a3)
  {
    BOOL v3 = a3;
    self->_showingTintedRegion = a3;
    if (a3)
    {
      if (!self->_tintedVolumeView)
      {
        v5 = objc_alloc_init(TintedView);
        tintedVolumeView = self->_tintedVolumeView;
        self->_tintedVolumeView = v5;

        v7 = self->_tintedVolumeView;
        v8 = +[StocksStyle sharedStyle];
        v9 = [v8 chartHighlightColor];
        [(TintedView *)v7 setTintColor:v9];

        id v10 = objc_alloc(MEMORY[0x263F1CB60]);
        [(VolumeGraphView *)self bounds];
        v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
        tintedRegionClipView = self->_tintedRegionClipView;
        self->_tintedRegionClipView = v11;

        [(UIView *)self->_tintedRegionClipView setClipsToBounds:1];
        [(UIView *)self->_tintedRegionClipView addSubview:self->_tintedVolumeView];
        [(UIView *)self->_tintedRegionClipView setAlpha:0.0];
        [(VolumeGraphView *)self addSubview:self->_tintedRegionClipView];
      }
      if (self->_volumeImage) {
        -[TintedView setImage:](self->_tintedVolumeView, "setImage:");
      }
    }
    v13 = self->_tintedRegionClipView;
    [(UIView *)v13 setAlpha:(double)v3];
  }
}

- (void)resizeSelectedVolumeClipViewWithLeftX:(double)a3 rightX:(double)a4
{
  v7 = [(TintedView *)self->_tintedVolumeView layer];
  [v7 removeAllAnimations];

  v8 = [(UIView *)self->_tintedRegionClipView layer];
  [v8 removeAllAnimations];

  [(VolumeGraphView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[UIView setFrame:](self->_tintedRegionClipView, "setFrame:", a3, 0.0, a4 - a3);
  tintedVolumeView = self->_tintedVolumeView;
  -[VolumeGraphView convertRect:toView:](self, "convertRect:toView:", self->_tintedRegionClipView, v10, v12, v14, v16);

  -[TintedView setFrame:](tintedVolumeView, "setFrame:");
}

- (StockGraphImageSet)graphImageSet
{
  return self->_graphImageSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphImageSet, 0);
  objc_storeStrong((id *)&self->_volumeImage, 0);
  objc_storeStrong((id *)&self->_tintedRegionClipView, 0);

  objc_storeStrong((id *)&self->_tintedVolumeView, 0);
}

@end
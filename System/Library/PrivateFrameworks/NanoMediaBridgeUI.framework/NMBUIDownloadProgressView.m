@interface NMBUIDownloadProgressView
- (CGRect)_contentFrame;
- (CGSize)intrinsicContentSize;
- (NMBUIDownloadProgressView)initWithFrame:(CGRect)a3;
- (float)progress;
- (id)_ringPath;
- (unint64_t)state;
- (void)_updateDownloadingRingProgressLayerStrokeEnd;
- (void)layoutSubviews;
- (void)setProgress:(float)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation NMBUIDownloadProgressView

- (NMBUIDownloadProgressView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NMBUIDownloadProgressView;
  result = -[NMBUIDownloadProgressView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_state = 5;
    result->_progress = 1.0;
  }
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)NMBUIDownloadProgressView;
  [(NMBUIDownloadProgressView *)&v11 layoutSubviews];
  [(NMBUIDownloadProgressView *)self _contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_errorIconButton, "setFrame:");
  -[UIImageView setFrame:](self->_downloadableIconView, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_waitingRingLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_downloadingRingTrackLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_downloadingRingProgressLayer, "setFrame:", v4, v6, v8, v10);
  [(NMBUIDownloadProgressView *)self _updateDownloadingRingProgressLayerStrokeEnd];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(UIButton *)self->_errorIconButton removeFromSuperview];
    [(UIImageView *)self->_downloadableIconView removeFromSuperview];
    [(CAShapeLayer *)self->_waitingRingLayer removeFromSuperlayer];
    [(CAShapeLayer *)self->_downloadingRingTrackLayer removeFromSuperlayer];
    [(CAShapeLayer *)self->_downloadingRingProgressLayer removeFromSuperlayer];
    switch(self->_state)
    {
      case 1uLL:
      case 2uLL:
        downloadableIconView = self->_downloadableIconView;
        if (!downloadableIconView)
        {
          id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
          double v6 = (void *)MEMORY[0x263F1C6B0];
          double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          double v8 = [v6 imageNamed:@"downloadCloud" inBundle:v7];
          double v9 = (UIImageView *)[v5 initWithImage:v8];
          double v10 = self->_downloadableIconView;
          self->_downloadableIconView = v9;

          [(UIImageView *)self->_downloadableIconView setContentMode:4];
          objc_super v11 = BPSDetailTextColor();
          [(UIImageView *)self->_downloadableIconView setTintColor:v11];

          downloadableIconView = self->_downloadableIconView;
        }
        goto LABEL_15;
      case 3uLL:
        if (!self->_waitingRingLayer)
        {
          v12 = [(NMBUIDownloadProgressView *)self _ringPath];
          v13 = [MEMORY[0x263F15880] layer];
          waitingRingLayer = self->_waitingRingLayer;
          self->_waitingRingLayer = v13;

          id v15 = v12;
          -[CAShapeLayer setPath:](self->_waitingRingLayer, "setPath:", [v15 CGPath]);
          [(CAShapeLayer *)self->_waitingRingLayer setFillColor:0];
          BPSProgressBarTintColor();
          id v16 = objc_claimAutoreleasedReturnValue();
          -[CAShapeLayer setStrokeColor:](self->_waitingRingLayer, "setStrokeColor:", [v16 CGColor]);

          [(CAShapeLayer *)self->_waitingRingLayer setLineWidth:3.0];
          [(CAShapeLayer *)self->_waitingRingLayer setLineCap:*MEMORY[0x263F15E70]];
          CGAffineTransformMakeRotation(&v38, -1.57079633);
          v17 = self->_waitingRingLayer;
          CGAffineTransform v37 = v38;
          [(CAShapeLayer *)v17 setAffineTransform:&v37];
          [(CAShapeLayer *)self->_waitingRingLayer setStrokeEnd:0.8];
        }
        v18 = [(NMBUIDownloadProgressView *)self layer];
        [v18 addSublayer:self->_waitingRingLayer];

        v19 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
        [v19 setFromValue:&unk_26ECD8940];
        [v19 setToValue:&unk_26ECD8958];
        [v19 setBeginTime:(double)((unint64_t)CACurrentMediaTime() % 0x1E)];
        [v19 setRemovedOnCompletion:0];
        LODWORD(v20) = 2139095040;
        [v19 setRepeatCount:v20];
        [v19 setFrameInterval:0.0333333333];
        [v19 setDuration:1.0];
        [(CAShapeLayer *)self->_waitingRingLayer addAnimation:v19 forKey:@"waiting"];
        goto LABEL_12;
      case 4uLL:
        if (!self->_downloadingRingTrackLayer && !self->_downloadingRingProgressLayer)
        {
          v21 = [(NMBUIDownloadProgressView *)self _ringPath];
          v22 = [MEMORY[0x263F15880] layer];
          downloadingRingTrackLayer = self->_downloadingRingTrackLayer;
          self->_downloadingRingTrackLayer = v22;

          id v24 = v21;
          -[CAShapeLayer setPath:](self->_downloadingRingTrackLayer, "setPath:", [v24 CGPath]);
          [(CAShapeLayer *)self->_downloadingRingTrackLayer setFillColor:0];
          BPSProgressBarTrackTintColor();
          id v25 = objc_claimAutoreleasedReturnValue();
          -[CAShapeLayer setStrokeColor:](self->_downloadingRingTrackLayer, "setStrokeColor:", [v25 CGColor]);

          [(CAShapeLayer *)self->_downloadingRingTrackLayer setLineWidth:3.0];
          v26 = [MEMORY[0x263F15880] layer];
          downloadingRingProgressLayer = self->_downloadingRingProgressLayer;
          self->_downloadingRingProgressLayer = v26;

          id v28 = v24;
          -[CAShapeLayer setPath:](self->_downloadingRingProgressLayer, "setPath:", [v28 CGPath]);
          [(CAShapeLayer *)self->_downloadingRingProgressLayer setFillColor:0];
          BPSProgressBarTintColor();
          id v29 = objc_claimAutoreleasedReturnValue();
          -[CAShapeLayer setStrokeColor:](self->_downloadingRingProgressLayer, "setStrokeColor:", [v29 CGColor]);

          [(CAShapeLayer *)self->_downloadingRingProgressLayer setLineWidth:3.0];
          [(CAShapeLayer *)self->_downloadingRingProgressLayer setLineCap:*MEMORY[0x263F15E70]];
          CGAffineTransformMakeRotation(&v36, -1.57079633);
          v30 = self->_downloadingRingProgressLayer;
          CGAffineTransform v35 = v36;
          [(CAShapeLayer *)v30 setAffineTransform:&v35];
          [(NMBUIDownloadProgressView *)self _updateDownloadingRingProgressLayerStrokeEnd];
        }
        v31 = [(NMBUIDownloadProgressView *)self layer];
        [v31 addSublayer:self->_downloadingRingTrackLayer];

        v19 = [(NMBUIDownloadProgressView *)self layer];
        [v19 addSublayer:self->_downloadingRingProgressLayer];
LABEL_12:

        break;
      case 6uLL:
        downloadableIconView = self->_errorIconButton;
        if (!downloadableIconView)
        {
          v32 = [MEMORY[0x263F1C488] buttonWithType:118];
          errorIconButton = self->_errorIconButton;
          self->_errorIconButton = v32;

          v34 = [MEMORY[0x263F1C550] systemYellowColor];
          [(UIButton *)self->_errorIconButton setTintColor:v34];

          [(UIButton *)self->_errorIconButton setUserInteractionEnabled:0];
          downloadableIconView = self->_errorIconButton;
        }
LABEL_15:
        [(NMBUIDownloadProgressView *)self addSubview:downloadableIconView];
        break;
      default:
        break;
    }
    [(NMBUIDownloadProgressView *)self setNeedsLayout];
  }
}

- (void)setProgress:(float)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    [(NMBUIDownloadProgressView *)self _updateDownloadingRingProgressLayerStrokeEnd];
  }
}

- (CGSize)intrinsicContentSize
{
  [(NMBUIDownloadProgressView *)self _contentFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)_contentFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 28.0;
  double v5 = 28.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_ringPath
{
  return (id)objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 1.5, 1.5, 25.0, 25.0);
}

- (void)_updateDownloadingRingProgressLayerStrokeEnd
{
  float progress = self->_progress;
  if (progress == 1.0) {
    double v4 = progress;
  }
  else {
    double v4 = progress * 0.9;
  }
  [(CAShapeLayer *)self->_downloadingRingProgressLayer lineWidth];
  double v6 = v5;
  [(CAShapeLayer *)self->_downloadingRingProgressLayer bounds];
  double Width = CGRectGetWidth(v11);
  [(CAShapeLayer *)self->_downloadingRingProgressLayer bounds];
  double v8 = v6 / ((Width + CGRectGetHeight(v12)) * 3.14159265 * 0.5);
  if (v4 >= v8) {
    double v8 = v4;
  }
  downloadingRingProgressLayer = self->_downloadingRingProgressLayer;
  [(CAShapeLayer *)downloadingRingProgressLayer setStrokeEnd:v8];
}

- (unint64_t)state
{
  return self->_state;
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadingRingProgressLayer, 0);
  objc_storeStrong((id *)&self->_downloadingRingTrackLayer, 0);
  objc_storeStrong((id *)&self->_waitingRingLayer, 0);
  objc_storeStrong((id *)&self->_downloadableIconView, 0);
  objc_storeStrong((id *)&self->_errorIconButton, 0);
}

@end
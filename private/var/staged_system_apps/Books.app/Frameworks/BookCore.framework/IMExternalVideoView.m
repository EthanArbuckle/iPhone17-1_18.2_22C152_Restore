@interface IMExternalVideoView
- (AVPlayerLayer)videoLayer;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setVideoLayer:(id)a3;
@end

@implementation IMExternalVideoView

- (void)setVideoLayer:(id)a3
{
  v5 = (AVPlayerLayer *)a3;
  p_videoLayer = &self->_videoLayer;
  videoLayer = self->_videoLayer;
  if (videoLayer != v5)
  {
    [(AVPlayerLayer *)videoLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_videoLayer, a3);
    v8 = [(IMExternalVideoView *)self layer];
    [v8 addSublayer:*p_videoLayer];
  }

  _objc_release_x1();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)IMExternalVideoView;
  id v4 = a3;
  [(IMExternalVideoView *)&v17 layoutSublayersOfLayer:v4];
  id v5 = [(IMExternalVideoView *)self layer];

  if (v5 == v4)
  {
    v6 = [(IMExternalVideoView *)self videoLayer];
    [v6 bounds];
    BOOL IsEmpty = CGRectIsEmpty(v18);

    if (IsEmpty)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
    }
    [(IMExternalVideoView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(IMExternalVideoView *)self videoLayer];
    [v16 setFrame:v9, v11, v13, v15];

    if (IsEmpty) {
      +[CATransaction commit];
    }
  }
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (void).cxx_destruct
{
}

@end
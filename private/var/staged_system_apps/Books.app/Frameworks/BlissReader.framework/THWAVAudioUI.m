@interface THWAVAudioUI
- (BOOL)shouldPlayOnMainCanvasWithSize:(double)a3;
- (BOOL)shouldShowControlsOnCanvas;
- (BOOL)supportsCompactUI;
- (CGRect)frameForOnCanvasUI;
- (CGRect)p_frameForHUDUI;
- (CGRect)p_frameForOnCanvasUI;
- (UIButton)hiddenPlayButton;
- (UIButton)hiddenPlayButton_compactUI;
- (UIButton)playButton_compactUI;
- (double)hudInternalPadding;
- (double)minWidthToShowScrubberEndTime;
- (double)minWidthToShowScrubberStartTime;
- (double)widthForPlayButton;
- (id)imageNameForPauseButton;
- (id)imageNameForPauseButtonPressed;
- (id)imageNameForPlayButton;
- (id)imageNameForPlayButtonPressed;
- (int64_t)scrubberStyle;
- (void)compactnessChanged;
- (void)createMovieUIViewBackground;
- (void)createViewsForConfigurationChange;
- (void)dealloc;
- (void)initialConfiguration;
- (void)layout;
- (void)pConfigureHUDVisibility;
- (void)pConfigureScrubberVisibility;
- (void)pCreateHUDBackgroundForView:(id)a3;
- (void)p_handlePlayButtonPressed_compactUI:(id)a3;
- (void)rateChanged:(double)a3;
- (void)setHiddenPlayButton:(id)a3;
- (void)setHiddenPlayButton_compactUI:(id)a3;
- (void)setPlayButton_compactUI:(id)a3;
- (void)timeChanged:(double)a3;
@end

@implementation THWAVAudioUI

- (void)dealloc
{
  [(THWAVAudioUI *)self setHiddenPlayButton:0];
  [(THWAVAudioUI *)self setHiddenPlayButton_compactUI:0];
  [(THWAVAudioUI *)self setPlayButton_compactUI:0];
  v3.receiver = self;
  v3.super_class = (Class)THWAVAudioUI;
  [(THWAVTransportUI *)&v3 dealloc];
}

- (void)pCreateHUDBackgroundForView:(id)a3
{
  id v4 = +[TSUImage imageNamed:@"ib_media_audio_transport_bg" inBundle:THBundle()];
  [a3 setContentsFromImage:v4];
  [v4 size];

  [a3 setContentsCenter:0.5, 0.0, 1.0 / v5, 1.0];
}

- (void)createMovieUIViewBackground
{
  objc_super v3 = [(THWAVTransportUI *)self movieUIView];

  [(THWAVAudioUI *)self pCreateHUDBackgroundForView:v3];
}

- (void)initialConfiguration
{
  [(THWAVTransportUI *)self setWantsPlayButton:1];

  [(THWAVTransportUI *)self setWantsScrubber:0];
}

- (void)createViewsForConfigurationChange
{
  v7.receiver = self;
  v7.super_class = (Class)THWAVAudioUI;
  [(THWAVTransportUI *)&v7 createViewsForConfigurationChange];
  if ([(THWAVTransportUI *)self isCompact])
  {
    if (![(THWAVTransportUI *)self compactUIView])
    {
      -[THWAVTransportUI setCompactUIView:](self, "setCompactUIView:", -[THCustomLayerView initWithFrame:]([THCustomLayerView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0));
      [(THCustomLayerView *)[(THWAVTransportUI *)self compactUIView] setAutoresizesSubviews:1];
      [-[THWAVTransportUI compactUIView](self, "compactUIView") setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") platformColor]];
      [(THWAVAudioUI *)self pCreateHUDBackgroundForView:[(THWAVTransportUI *)self compactUIView]];
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      [(THWAVAudioUI *)self setHiddenPlayButton_compactUI:+[UIButton tsdPlatformButtonWithFrame:](UIButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, y, width, height)];
      [(UIButton *)[(THWAVAudioUI *)self hiddenPlayButton_compactUI] setTarget:self action:"p_handlePlayButtonPressed_compactUI:"];
      [(THCustomLayerView *)[(THWAVTransportUI *)self compactUIView] addSubview:[(THWAVAudioUI *)self hiddenPlayButton_compactUI]];
      id v6 = +[TSKBiggerButton tsdPlatformButtonWithFrame:](TSKBiggerButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, y, width, height);
      [v6 setTarget:self action:"p_handlePlayButtonPressed_compactUI:"];
      [v6 setHitBufferTop:10.0 left:10.0 bottom:10.0 right:10.0];
      [v6 setShowsTouchWhenHighlighted:1];
      objc_msgSend(objc_msgSend(v6, "imageView"), "setContentMode:", 4);
      [v6 setImageNamed:[self imageNameForPlayButton] inBundle:THBundle()];
      [v6 setAlternateImageNamed:[self imageNameForPlayButtonPressed] inBundle:THBundle()];
      [(THWAVAudioUI *)self setPlayButton_compactUI:v6];
      [(THCustomLayerView *)[(THWAVTransportUI *)self compactUIView] addSubview:[(THWAVAudioUI *)self playButton_compactUI]];
    }
    if ([(THWAVAudioUI *)self hiddenPlayButton])
    {
      [(UIButton *)[(THWAVAudioUI *)self hiddenPlayButton] removeFromSuperview];
      [(THWAVAudioUI *)self setHiddenPlayButton:0];
    }
  }
  else
  {
    if (![(THWAVTransportUI *)self wantsScrubber]
      && ![(THWAVAudioUI *)self hiddenPlayButton])
    {
      [(THWAVAudioUI *)self setHiddenPlayButton:+[UIButton tsdPlatformButtonWithFrame:](UIButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height)];
      [(UIButton *)[(THWAVAudioUI *)self hiddenPlayButton] setTarget:self action:"p_handlePlayButtonPressed:"];
      [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] addSubview:[(THWAVAudioUI *)self hiddenPlayButton]];
    }
    if ([(THWAVTransportUI *)self wantsScrubber]
      && [(THWAVAudioUI *)self hiddenPlayButton])
    {
      [(UIButton *)[(THWAVAudioUI *)self hiddenPlayButton] removeFromSuperview];
      [(THWAVAudioUI *)self setHiddenPlayButton:0];
    }
    if ([(THWAVTransportUI *)self compactUIView])
    {
      [(THCustomLayerView *)[(THWAVTransportUI *)self compactUIView] removeFromSuperview];
      [(THWAVTransportUI *)self setCompactUIView:0];
    }
  }
}

- (BOOL)supportsCompactUI
{
  return 1;
}

- (void)compactnessChanged
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVAudioUI;
  [(THWAVTransportUI *)&v3 compactnessChanged];
  [(THWAVAudioUI *)self pConfigureHUDVisibility];
}

- (CGRect)p_frameForHUDUI
{
  objc_super v3 = [(THWAVTransportUI *)self transportController];

  [(THWAVTransportController *)v3 frameOfHUDFor:self];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)p_frameForOnCanvasUI
{
  [(THWAVTransportUI *)self layoutRect];
  CGRect v19 = CGRectIntegral(v18);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  [(THWAVTransportController *)[(THWAVTransportUI *)self transportController] onCanvasScale];
  if (v7 != 1.0)
  {
    TSDCenterOfRect();
    TSDRectWithCenterAndSize();
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  if (!objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](-[THWAVTransportUI transportController](self, "transportController"), "movieLayout"), "movieInfo"), "posterImageData")&& -[THWAVTransportController controlStyle](-[THWAVTransportUI transportController](self, "transportController"), "controlStyle") == 1)
  {
    double height = (height + -30.0) * 0.5;
  }
  double v12 = 545.0;
  if (width <= 545.0)
  {
    double v12 = 180.0;
    if (width >= 180.0)
    {
      double v12 = width;
    }
    else
    {
      float v14 = (180.0 - width) * 0.5;
      double x = x - roundf(v14);
    }
  }
  else
  {
    float v13 = (width + -545.0) * 0.5;
    double x = x + roundf(v13);
  }
  double v15 = y + height;
  double v16 = 30.0;
  double v17 = x;
  result.size.double height = v16;
  result.size.double width = v12;
  result.origin.double y = v15;
  result.origin.double x = v17;
  return result;
}

- (CGRect)frameForOnCanvasUI
{
  if ([(THWAVTransportUI *)self isCompact]) {
    [(THWAVAudioUI *)self p_frameForHUDUI];
  }
  else {
    [(THWAVAudioUI *)self p_frameForOnCanvasUI];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)layout
{
  v32.receiver = self;
  v32.super_class = (Class)THWAVAudioUI;
  [(THWAVTransportUI *)&v32 layout];
  if ([(THWAVTransportUI *)self compactUIView])
  {
    [(THWAVAudioUI *)self p_frameForOnCanvasUI];
    -[THCustomLayerView setFrame:]([(THWAVTransportUI *)self compactUIView], "setFrame:", v3, v4, v5, v6);
    if ([(THWAVAudioUI *)self playButton_compactUI])
    {
      [(THCustomLayerView *)[(THWAVTransportUI *)self compactUIView] bounds];
      double v8 = v7;
      double v10 = v9;
      [(THWAVAudioUI *)self widthForPlayButton];
      double v12 = v11;
      [(THWAVAudioUI *)self hudInternalPadding];
      -[UIButton setFrame:]([(THWAVAudioUI *)self playButton_compactUI], "setFrame:", v13, v8, v12, v10);
      [(-[THWAVAudioUI playButton_compactUI](self, "playButton_compactUI")) layer setNeedsDisplay];
    }
    if ([(THWAVAudioUI *)self hiddenPlayButton_compactUI])
    {
      [(THCustomLayerView *)[(THWAVTransportUI *)self compactUIView] bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [(UIButton *)[(THWAVAudioUI *)self playButton_compactUI] bounds];
      CGFloat MaxX = CGRectGetMaxX(v33);
      -[UIButton setFrame:]([(THWAVAudioUI *)self hiddenPlayButton_compactUI], "setFrame:", v15 + MaxX, v17, v19 - MaxX, v21);
    }
  }
  if ([(THWAVAudioUI *)self hiddenPlayButton])
  {
    [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    [(UIButton *)[(THWAVTransportUI *)self playButton] bounds];
    CGFloat v31 = CGRectGetMaxX(v34);
    -[UIButton setFrame:]([(THWAVAudioUI *)self hiddenPlayButton], "setFrame:", v24 + v31, v26, v28 - v31, v30);
  }
}

- (int64_t)scrubberStyle
{
  return 3;
}

- (void)rateChanged:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THWAVAudioUI;
  [(THWAVTransportUI *)&v9 rateChanged:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  double v6 = sub_170948;
  double v7 = &unk_456DE0;
  double v8 = self;
  if (+[NSThread isMainThread])
  {
    v6((uint64_t)v5);
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_170984;
    v4[3] = &unk_457868;
    v4[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)timeChanged:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWAVAudioUI;
  [(THWAVTransportUI *)&v4 timeChanged:a3];
  [(THWAVAudioUI *)self pConfigureScrubberVisibility];
}

- (void)pConfigureHUDVisibility
{
  if ([(THWAVTransportUI *)self isCompact] && [(THWAVTransportUI *)self movieIsPlaying])
  {
    double v3 = [(THWAVTransportUI *)self transportController];
    [(THWAVTransportController *)v3 showTransportHUDFor:self];
  }
  else
  {
    objc_super v4 = [(THWAVTransportUI *)self transportController];
    [(THWAVTransportController *)v4 hideTransportHUDFor:self];
  }
}

- (void)pConfigureScrubberVisibility
{
  if ([(THWAVTransportUI *)self movieIsPlaying])
  {
    if ([(THWAVTransportUI *)self wantsScrubber]) {
      return;
    }
    BOOL v3 = 1;
  }
  else
  {
    [(THWAVTransportController *)[(THWAVTransportUI *)self transportController] currentTime];
    BOOL v3 = v4 > 0.1;
    if (v3 == [(THWAVTransportUI *)self wantsScrubber]) {
      return;
    }
  }
  [(THWAVTransportUI *)self setWantsScrubber:v3];
  [(THWAVAudioUI *)self createViewsForConfigurationChange];
  [(THWAVTransportUI *)self configureViewsForConfigurationChange];

  [(THWAVTransportUI *)self i_layout];
}

- (BOOL)shouldPlayOnMainCanvasWithSize:(double)a3
{
  return 1;
}

- (BOOL)shouldShowControlsOnCanvas
{
  return 1;
}

- (id)imageNameForPlayButton
{
  return @"ib_media_audio_transport_btn_play";
}

- (id)imageNameForPlayButtonPressed
{
  return @"ib_media_audio_transport_btn_play";
}

- (id)imageNameForPauseButton
{
  return @"ib_media_audio_transport_btn_pause";
}

- (id)imageNameForPauseButtonPressed
{
  return @"ib_media_audio_transport_btn_pause";
}

- (double)widthForPlayButton
{
  return 18.0;
}

- (double)hudInternalPadding
{
  return 12.0;
}

- (double)minWidthToShowScrubberStartTime
{
  return 275.0;
}

- (double)minWidthToShowScrubberEndTime
{
  return 0.0;
}

- (void)p_handlePlayButtonPressed_compactUI:(id)a3
{
  if (![(THWAVTransportUI *)self movieIsPlaying])
  {
    [(THWAVTransportUI *)self togglePlay];
  }
}

- (UIButton)hiddenPlayButton
{
  return self->_hiddenPlayButton;
}

- (void)setHiddenPlayButton:(id)a3
{
}

- (UIButton)hiddenPlayButton_compactUI
{
  return self->_hiddenPlayButton_compactUI;
}

- (void)setHiddenPlayButton_compactUI:(id)a3
{
}

- (UIButton)playButton_compactUI
{
  return self->_playButton_compactUI;
}

- (void)setPlayButton_compactUI:(id)a3
{
}

@end
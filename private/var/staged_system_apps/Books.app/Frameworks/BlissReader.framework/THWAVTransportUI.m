@interface THWAVTransportUI
- (BOOL)hidden;
- (BOOL)isCompact;
- (BOOL)movieIsPlaying;
- (BOOL)shouldPlayOnMainCanvasWithSize:(double)a3;
- (BOOL)shouldShowControlsOnCanvas;
- (BOOL)supportsCompactUI;
- (BOOL)wantsPlayButton;
- (BOOL)wantsScrubber;
- (CGRect)frameForOnCanvasUI;
- (CGRect)layoutRect;
- (NSString)imageNameForPauseButton;
- (NSString)imageNameForPauseButtonPressed;
- (NSString)imageNameForPlayButton;
- (NSString)imageNameForPlayButtonPressed;
- (THCustomLayerView)compactUIView;
- (THCustomLayerView)inHUDView;
- (THCustomLayerView)movieUIView;
- (THCustomLayerView)onCanvasView;
- (THWAVTransportController)transportController;
- (THWAVTransportUI)initWithTransportController:(id)a3;
- (THWDetailSlider)scrubber;
- (UIButton)playButton;
- (double)hudExternalPadding;
- (double)hudInternalPadding;
- (double)minWidthToShowScrubberEndTime;
- (double)minWidthToShowScrubberStartTime;
- (double)widthForPlayButton;
- (id)onCanvasViews;
- (int64_t)scrubberStyle;
- (void)changeCurrentTimeTo:(double)a3;
- (void)compactnessChanged;
- (void)configureButtonsForPaused;
- (void)configureButtonsForPlaying;
- (void)configureViewsForConfigurationChange;
- (void)createMovieUIView;
- (void)createMovieUIViewBackground;
- (void)createViewsForConfigurationChange;
- (void)dealloc;
- (void)detailSlider:(id)a3 didChangeValue:(float)a4;
- (void)didLayout;
- (void)durationChanged:(double)a3;
- (void)i_layout;
- (void)initialConfiguration;
- (void)layout;
- (void)mediaDidPlayToEnd;
- (void)p_handlePlayButtonPressed:(id)a3;
- (void)pause;
- (void)play;
- (void)rateChanged:(double)a3;
- (void)reconfigureViewsAndLayout;
- (void)setCompactUIView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLayoutRect:(CGRect)a3;
- (void)setMovieUIView:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setScrubber:(id)a3;
- (void)setTransportController:(id)a3;
- (void)setWantsPlayButton:(BOOL)a3;
- (void)setWantsScrubber:(BOOL)a3;
- (void)timeChanged:(double)a3;
- (void)toggleHidden;
- (void)togglePlay;
- (void)willLayout;
@end

@implementation THWAVTransportUI

- (THWAVTransportUI)initWithTransportController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWAVTransportUI;
  v4 = [(THWAVTransportUI *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(THWAVTransportUI *)v4 setTransportController:a3];
    [(THWAVTransportUI *)v5 createMovieUIView];
    [(THWAVTransportUI *)v5 initialConfiguration];
    [(THWAVTransportUI *)v5 createViewsForConfigurationChange];
    [(THWAVTransportUI *)v5 configureViewsForConfigurationChange];
  }
  return v5;
}

- (void)dealloc
{
  [(THWAVTransportUI *)self setPlayButton:0];
  [(THWAVTransportUI *)self setScrubber:0];
  [(THWAVTransportUI *)self setMovieUIView:0];
  [(THWAVTransportUI *)self setCompactUIView:0];
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUI;
  [(THWAVTransportUI *)&v3 dealloc];
}

- (void)initialConfiguration
{
  [(THWAVTransportUI *)self setWantsPlayButton:1];

  [(THWAVTransportUI *)self setWantsScrubber:1];
}

- (void)createMovieUIViewBackground
{
  id v3 = +[TSUImage imageNamed:@"ib_media_movie_transport_bg" inBundle:THBundle()];
  [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] setContentsFromImage:v3];
  [v3 size];
  double v5 = 1.0 / v4;
  double v7 = 1.0 / v6;
  v8 = [(THWAVTransportUI *)self movieUIView];

  -[THCustomLayerView setContentsCenter:](v8, "setContentsCenter:", 0.5, 0.5, v5, v7);
}

- (void)createMovieUIView
{
  -[THWAVTransportUI setMovieUIView:](self, "setMovieUIView:", -[THCustomLayerView initWithFrame:]([THCustomLayerView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0));
  [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] setAutoresizesSubviews:1];
  [-[THWAVTransportUI movieUIView](self, "movieUIView") setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") platformColor]];
  [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] setTsdAlpha:0.99];
  [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] setOpaque:0];

  [(THWAVTransportUI *)self createMovieUIViewBackground];
}

- (CGRect)frameForOnCanvasUI
{
  [(THWAVTransportUI *)self layoutRect];
  CGRect v16 = CGRectIntegral(v15);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  [(THWAVTransportUI *)self hudExternalPadding];
  if (v7 > 0.0)
  {
    [(THWAVTransportUI *)self hudExternalPadding];
    double x = x + v8;
    [(THWAVTransportUI *)self hudExternalPadding];
    double width = width + v9 * -2.0;
  }
  double v10 = 545.0;
  if (width <= 545.0)
  {
    double v10 = width;
  }
  else
  {
    float v11 = (width + -545.0) * 0.5;
    double x = x + roundf(v11);
  }
  double v12 = y + height + -49.0 + -10.0;
  double v13 = 49.0;
  double v14 = x;
  result.size.double height = v13;
  result.size.double width = v10;
  result.origin.double y = v12;
  result.origin.double x = v14;
  return result;
}

- (THCustomLayerView)onCanvasView
{
  if ([(THWAVTransportUI *)self compactUIView])
  {
    return [(THWAVTransportUI *)self compactUIView];
  }
  else
  {
    return [(THWAVTransportUI *)self movieUIView];
  }
}

- (THCustomLayerView)inHUDView
{
  return 0;
}

- (id)onCanvasViews
{
  v2 = [(THWAVTransportUI *)self onCanvasView];

  return +[NSArray arrayWithObject:v2];
}

- (void)reconfigureViewsAndLayout
{
  [(THWAVTransportUI *)self createViewsForConfigurationChange];
  [(THWAVTransportUI *)self configureViewsForConfigurationChange];

  [(THWAVTransportUI *)self i_layout];
}

- (BOOL)isCompact
{
  v2 = [(THWAVTransportUI *)self transportController];

  return [(THWAVTransportController *)v2 isCompact];
}

- (BOOL)supportsCompactUI
{
  return 0;
}

- (void)compactnessChanged
{
  if ([(THWAVTransportUI *)self supportsCompactUI])
  {
    [(THWAVTransportUI *)self reconfigureViewsAndLayout];
  }
}

- (int64_t)scrubberStyle
{
  return 2;
}

- (void)createViewsForConfigurationChange
{
  if ([(THWAVTransportUI *)self wantsPlayButton]
    && ![(THWAVTransportUI *)self playButton])
  {
    id v3 = +[TSKBiggerButton tsdPlatformButtonWithFrame:](TSKBiggerButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v3 setTarget:self action:"p_handlePlayButtonPressed:"];
    [v3 setHitBufferTop:10.0 left:10.0 bottom:10.0 right:10.0];
    [v3 setShowsTouchWhenHighlighted:1];
    objc_msgSend(objc_msgSend(v3, "imageView"), "setContentMode:", 4);
    [(THWAVTransportUI *)self setPlayButton:v3];
    [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] addSubview:[(THWAVTransportUI *)self playButton]];
  }
  if ([(THWAVTransportUI *)self wantsScrubber] && ![(THWAVTransportUI *)self scrubber])
  {
    double v4 = -[THWDetailSlider initWithFrame:style:]([THWDetailSlider alloc], "initWithFrame:style:", [(THWAVTransportUI *)self scrubberStyle], CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(THWDetailSlider *)v4 setDelegate:self];
    [(THWAVTransportUI *)self setScrubber:v4];
    [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] addSubview:[(THWAVTransportUI *)self scrubber]];
  }
  if (![(THWAVTransportUI *)self wantsPlayButton]
    && [(THWAVTransportUI *)self playButton])
  {
    [(UIButton *)[(THWAVTransportUI *)self playButton] removeFromSuperview];
    [(THWAVTransportUI *)self setPlayButton:0];
  }
  if (![(THWAVTransportUI *)self wantsScrubber] && [(THWAVTransportUI *)self scrubber])
  {
    [(THWDetailSlider *)[(THWAVTransportUI *)self scrubber] removeFromSuperview];
    [(THWAVTransportUI *)self setScrubber:0];
  }
}

- (void)configureViewsForConfigurationChange
{
  if ([(THWAVTransportUI *)self playButton])
  {
    id v3 = [(THWAVTransportUI *)self playButton];
    if ([(THWAVTransportController *)[(THWAVTransportUI *)self transportController] movieIsPlaying])
    {
      double v4 = [(THWAVTransportUI *)self imageNameForPauseButton];
    }
    else
    {
      double v4 = [(THWAVTransportUI *)self imageNameForPlayButton];
    }
    [(UIButton *)v3 setImageNamed:v4 inBundle:THBundle()];
    double v5 = [(THWAVTransportUI *)self playButton];
    if ([(THWAVTransportController *)[(THWAVTransportUI *)self transportController] movieIsPlaying])
    {
      double v6 = [(THWAVTransportUI *)self imageNameForPauseButtonPressed];
    }
    else
    {
      double v6 = [(THWAVTransportUI *)self imageNameForPlayButtonPressed];
    }
    [(UIButton *)v5 setAlternateImageNamed:v6 inBundle:THBundle()];
  }
  if ([(THWAVTransportUI *)self scrubber])
  {
    double v7 = [(THWAVTransportUI *)self scrubber];
    [(THWAVTransportController *)[(THWAVTransportUI *)self transportController] duration];
    *(float *)&double v8 = v8;
    [(THWDetailSlider *)v7 setDuration:roundf(*(float *)&v8)];
    double v9 = [(THWAVTransportUI *)self scrubber];
    [(THWAVTransportController *)[(THWAVTransportUI *)self transportController] currentTime];
    *(float *)&double v10 = v10;
    *(float *)&double v10 = roundf(*(float *)&v10);
    [(THWDetailSlider *)v9 setValue:v10];
  }
}

- (NSString)imageNameForPlayButton
{
  return (NSString *)@"ib_media_movie_transport_btn_play-N";
}

- (NSString)imageNameForPlayButtonPressed
{
  return (NSString *)@"ib_media_movie_transport_btn_play-P";
}

- (NSString)imageNameForPauseButton
{
  return (NSString *)@"ib_media_movie_transport_btn_pause-N";
}

- (NSString)imageNameForPauseButtonPressed
{
  return (NSString *)@"ib_media_movie_transport_btn_pause-P";
}

- (double)widthForPlayButton
{
  return 18.0;
}

- (double)hudInternalPadding
{
  return 15.0;
}

- (double)hudExternalPadding
{
  return 0.0;
}

- (double)minWidthToShowScrubberStartTime
{
  return 415.0;
}

- (double)minWidthToShowScrubberEndTime
{
  return 275.0;
}

- (void)i_layout
{
  [(THWAVTransportUI *)self willLayout];
  [(THWAVTransportUI *)self layout];

  [(THWAVTransportUI *)self didLayout];
}

- (void)willLayout
{
  id v3 = [(THWAVTransportUI *)self onCanvasView];
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v5 = v8[0];
  v8[1] = v6;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v4 = v9;
  [(THCustomLayerView *)v3 setTransform:v8];
  v7[0] = v5;
  v7[1] = v6;
  v7[2] = v4;
  [(THCustomLayerView *)[(THWAVTransportUI *)self inHUDView] setTransform:v7];
}

- (void)didLayout
{
  [(THWAVTransportController *)[(THWAVTransportUI *)self transportController] onCanvasScale];
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformScale(&v8, &v7, v4, v4);
  long long v5 = [(THWAVTransportUI *)self onCanvasView];
  CGAffineTransform v6 = v8;
  [(THCustomLayerView *)v5 setTransform:&v6];
}

- (void)layout
{
  [(THWAVTransportUI *)self frameForOnCanvasUI];
  -[THCustomLayerView setFrame:]([(THWAVTransportUI *)self movieUIView], "setFrame:", v3, v4, v5, v6);
  [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(THWAVTransportUI *)self hudInternalPadding];
  double v16 = v15 + v8;
  [(THWAVTransportUI *)self hudInternalPadding];
  double v18 = v17;
  if ([(THWAVTransportUI *)self playButton])
  {
    [(THWAVTransportUI *)self widthForPlayButton];
    double v20 = v19;
    -[UIButton setFrame:]([(THWAVTransportUI *)self playButton], "setFrame:", v16, v10, v19, v14);
    double v16 = v16 + v20 + 12.0;
    [(-[THWAVTransportUI playButton](self, "playButton")) layer setNeedsDisplay];
  }
  if ([(THWAVTransportUI *)self scrubber] && (double v21 = v8 + v12 - v18 - v16, v21 > 100.0))
  {
    -[THWDetailSlider sizeThatFits:]([(THWAVTransportUI *)self scrubber], "sizeThatFits:", v12, v14);
    float v23 = (v14 - v22) * 0.5;
    -[THWDetailSlider setFrame:]([(THWAVTransportUI *)self scrubber], "setFrame:", v16, v10 + floorf(v23) + 2.0, v21, v22);
    [(THWDetailSlider *)[(THWAVTransportUI *)self scrubber] setHidden:0];
    [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] frame];
    double Width = CGRectGetWidth(v30);
    [(THWAVTransportUI *)self minWidthToShowScrubberStartTime];
    [(THWDetailSlider *)[(THWAVTransportUI *)self scrubber] setHideLeftNumericDisplay:Width < v25];
    [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] frame];
    double v26 = CGRectGetWidth(v31);
    [(THWAVTransportUI *)self minWidthToShowScrubberEndTime];
    [(THWDetailSlider *)[(THWAVTransportUI *)self scrubber] setHideRightNumericDisplay:v26 < v27];
  }
  else
  {
    [(THWDetailSlider *)[(THWAVTransportUI *)self scrubber] setHidden:1];
  }
  if (![(THWAVTransportUI *)self shouldShowControlsOnCanvas])
  {
    v28 = [(THWAVTransportUI *)self movieUIView];
    [(THCustomLayerView *)v28 setHidden:1];
  }
}

- (void)durationChanged:(double)a3
{
  double v4 = [(THWAVTransportUI *)self scrubber];
  float v5 = a3;
  double v6 = roundf(v5);

  [(THWDetailSlider *)v4 setDuration:v6];
}

- (void)timeChanged:(double)a3
{
  double v4 = [(THWAVTransportUI *)self scrubber];
  *(float *)&double v5 = a3;
  *(float *)&double v5 = roundf(*(float *)&v5);

  [(THWDetailSlider *)v4 setValue:v5];
}

- (void)configureButtonsForPlaying
{
  [(UIButton *)[(THWAVTransportUI *)self playButton] setImageNamed:[(THWAVTransportUI *)self imageNameForPauseButton] inBundle:THBundle()];
  double v3 = [(THWAVTransportUI *)self playButton];
  double v4 = [(THWAVTransportUI *)self imageNameForPauseButtonPressed];
  uint64_t v5 = THBundle();

  [(UIButton *)v3 setAlternateImageNamed:v4 inBundle:v5];
}

- (void)configureButtonsForPaused
{
  [(UIButton *)[(THWAVTransportUI *)self playButton] setImageNamed:[(THWAVTransportUI *)self imageNameForPlayButton] inBundle:THBundle()];
  double v3 = [(THWAVTransportUI *)self playButton];
  double v4 = [(THWAVTransportUI *)self imageNameForPlayButtonPressed];
  uint64_t v5 = THBundle();

  [(UIButton *)v3 setAlternateImageNamed:v4 inBundle:v5];
}

- (void)rateChanged:(double)a3
{
  if ([(THWAVTransportUI *)self playButton])
  {
    if (+[NSThread isMainThread])
    {
      if (a3 == 0.0)
      {
        [(THWAVTransportUI *)self configureButtonsForPaused];
      }
      else
      {
        [(THWAVTransportUI *)self configureButtonsForPlaying];
      }
    }
    else
    {
      +[NSThread mainThread];
      -[THWAVTransportUI performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:");
    }
  }
}

- (void)mediaDidPlayToEnd
{
  if ([(THWAVTransportUI *)self scrubber])
  {
    double v3 = [(THWAVTransportUI *)self scrubber];
    [(THWDetailSlider *)v3 setValue:0.0];
  }
}

- (void)toggleHidden
{
  if ([(THWAVTransportUI *)self shouldShowControlsOnCanvas])
  {
    uint64_t v3 = [(THWAVTransportUI *)self hidden] ^ 1;
    [(THWAVTransportUI *)self setHidden:v3];
  }
}

- (BOOL)hidden
{
  v2 = [(THWAVTransportUI *)self movieUIView];

  return [(THCustomLayerView *)v2 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] isHidden] != a3)
  {
    uint64_t v5 = +[NSNotificationCenter defaultCenter];
    double v6 = &THWAVTransportUIWillHideNotification;
    if (!v3) {
      double v6 = &THWAVTransportUIWillShowNotification;
    }
    [(NSNotificationCenter *)v5 postNotificationName:*v6 object:self];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_16C86C;
    v9[3] = &unk_457278;
    v9[4] = self;
    BOOL v10 = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_16C8B8;
    _OWORD v7[3] = &unk_459E18;
    v7[4] = self;
    BOOL v8 = v3;
    +[UIView animateWithDuration:v9 animations:v7 completion:0.3];
  }
}

- (BOOL)shouldPlayOnMainCanvasWithSize:(double)a3
{
  int v4 = TSUPhoneUI() ^ 1;
  if (a3 >= 150.0) {
    return v4;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldShowControlsOnCanvas
{
  if (TSUPhoneUI()) {
    return 0;
  }
  [(THCustomLayerView *)[(THWAVTransportUI *)self movieUIView] frame];
  return v4 >= 150.0;
}

- (void)play
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_16C9F8;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)pause
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_16CAA4;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (BOOL)movieIsPlaying
{
  v2 = [(THWAVTransportUI *)self transportController];

  return [(THWAVTransportController *)v2 movieIsPlaying];
}

- (void)togglePlay
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_16CB78;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "AVTransport Toggle Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)changeCurrentTimeTo:(double)a3
{
  double v4 = [(THWAVTransportUI *)self transportController];

  [(THWAVTransportController *)v4 changeCurrentTimeTo:a3];
}

- (void)p_handlePlayButtonPressed:(id)a3
{
}

- (void)detailSlider:(id)a3 didChangeValue:(float)a4
{
  if ([(THWAVTransportUI *)self scrubber] == a3)
  {
    [(THWAVTransportUI *)self changeCurrentTimeTo:a4];
  }
}

- (THWAVTransportController)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
  self->_transportController = (THWAVTransportController *)a3;
}

- (CGRect)layoutRect
{
  double x = self->_layoutRect.origin.x;
  double y = self->_layoutRect.origin.y;
  double width = self->_layoutRect.size.width;
  double height = self->_layoutRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLayoutRect:(CGRect)a3
{
  self->_layoutRect = a3;
}

- (THCustomLayerView)movieUIView
{
  return self->_movieUIView;
}

- (void)setMovieUIView:(id)a3
{
}

- (THCustomLayerView)compactUIView
{
  return self->_compactUIView;
}

- (void)setCompactUIView:(id)a3
{
}

- (THWDetailSlider)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (BOOL)wantsPlayButton
{
  return self->_wantsPlayButton;
}

- (void)setWantsPlayButton:(BOOL)a3
{
  self->_wantsPlayButton = a3;
}

- (BOOL)wantsScrubber
{
  return self->_wantsScrubber;
}

- (void)setWantsScrubber:(BOOL)a3
{
  self->_wantsScrubber = a3;
}

@end
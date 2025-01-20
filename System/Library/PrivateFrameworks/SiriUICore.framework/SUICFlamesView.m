@interface SUICFlamesView
+ (BOOL)_isMetalAvailable;
- (BOOL)accelerateTransitions;
- (BOOL)freezesAura;
- (BOOL)isRenderingEnabled;
- (BOOL)paused;
- (BOOL)reduceFrameRate;
- (BOOL)reduceThinkingFramerate;
- (BOOL)renderInBackground;
- (BOOL)showAura;
- (CGRect)activeFrame;
- (SUICFlamesView)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5;
- (SUICFlamesViewDelegate)flamesDelegate;
- (UIColor)dictationColor;
- (UIImage)overlayImage;
- (double)horizontalScaleFactor;
- (float)audioLevelForFlamesView:(id)a3;
- (int64_t)mode;
- (int64_t)state;
- (void)didMoveToSuperview;
- (void)fadeOutCurrentAura;
- (void)flamesViewAuraDidDisplay:(id)a3;
- (void)layoutSubviews;
- (void)prewarmShadersForCurrentMode;
- (void)resetAndReinitialize:(BOOL)a3;
- (void)setAccelerateTransitions:(BOOL)a3;
- (void)setActiveFrame:(CGRect)a3;
- (void)setDictationColor:(id)a3;
- (void)setFlamesDelegate:(id)a3;
- (void)setFreezesAura:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHorizontalScaleFactor:(double)a3;
- (void)setMode:(int64_t)a3;
- (void)setOverlayImage:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setReduceFrameRate:(BOOL)a3;
- (void)setReduceThinkingFramerate:(BOOL)a3;
- (void)setRenderInBackground:(BOOL)a3;
- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4;
- (void)setShowAura:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SUICFlamesView

+ (BOOL)_isMetalAvailable
{
  return 1;
}

- (SUICFlamesView)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUICFlamesView;
  v12 = -[SUICFlamesView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    if (+[SUICFlamesView _isMetalAvailable]) {
      v13 = SUICFlamesViewMetal;
    }
    else {
      v13 = SUICFlamesViewLegacy;
    }
    uint64_t v14 = objc_msgSend([v13 alloc], "initWithFrame:screen:fidelity:", v11, a5, x, y, width, height);
    flamesView = v12->_flamesView;
    v12->_flamesView = (SUICFlamesViewProviding *)v14;
  }
  return v12;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SUICFlamesView;
  [(SUICFlamesView *)&v4 layoutSubviews];
  flamesView = self->_flamesView;
  [(SUICFlamesView *)self bounds];
  -[SUICFlamesViewProviding setFrame:](flamesView, "setFrame:");
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesView;
  -[SUICFlamesView setHidden:](&v5, sel_setHidden_);
  [(SUICFlamesViewProviding *)self->_flamesView setHidden:v3];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)SUICFlamesView;
  [(SUICFlamesView *)&v4 didMoveToSuperview];
  BOOL v3 = [(SUICFlamesView *)self superview];

  if (v3) {
    [(SUICFlamesView *)self addSubview:self->_flamesView];
  }
  else {
    [(SUICFlamesViewProviding *)self->_flamesView removeFromSuperview];
  }
}

- (void)prewarmShadersForCurrentMode
{
}

- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4
{
}

- (void)fadeOutCurrentAura
{
}

- (void)resetAndReinitialize:(BOOL)a3
{
}

- (void)setFlamesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flamesDelegate, a3);
  flamesView = self->_flamesView;
  if (a3) {
    v6 = self;
  }
  else {
    v6 = 0;
  }

  [(SUICFlamesViewProviding *)flamesView setFlamesDelegate:v6];
}

- (BOOL)isRenderingEnabled
{
  return [(SUICFlamesViewProviding *)self->_flamesView isRenderingEnabled];
}

- (int64_t)mode
{
  return [(SUICFlamesViewProviding *)self->_flamesView mode];
}

- (void)setMode:(int64_t)a3
{
}

- (int64_t)state
{
  return [(SUICFlamesViewProviding *)self->_flamesView state];
}

- (void)setState:(int64_t)a3
{
}

- (BOOL)showAura
{
  return [(SUICFlamesViewProviding *)self->_flamesView showAura];
}

- (void)setShowAura:(BOOL)a3
{
}

- (BOOL)freezesAura
{
  return [(SUICFlamesViewProviding *)self->_flamesView freezesAura];
}

- (void)setFreezesAura:(BOOL)a3
{
}

- (BOOL)reduceFrameRate
{
  return [(SUICFlamesViewProviding *)self->_flamesView reduceFrameRate];
}

- (void)setReduceFrameRate:(BOOL)a3
{
}

- (BOOL)reduceThinkingFramerate
{
  return [(SUICFlamesViewProviding *)self->_flamesView reduceThinkingFramerate];
}

- (void)setReduceThinkingFramerate:(BOOL)a3
{
}

- (CGRect)activeFrame
{
  [(SUICFlamesViewProviding *)self->_flamesView activeFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setActiveFrame:(CGRect)a3
{
}

- (UIImage)overlayImage
{
  return (UIImage *)[(SUICFlamesViewProviding *)self->_flamesView overlayImage];
}

- (void)setOverlayImage:(id)a3
{
}

- (UIColor)dictationColor
{
  return (UIColor *)[(SUICFlamesViewProviding *)self->_flamesView dictationColor];
}

- (void)setDictationColor:(id)a3
{
}

- (BOOL)renderInBackground
{
  return [(SUICFlamesViewProviding *)self->_flamesView renderInBackground];
}

- (void)setRenderInBackground:(BOOL)a3
{
}

- (BOOL)paused
{
  return [(SUICFlamesViewProviding *)self->_flamesView flamesPaused];
}

- (void)setPaused:(BOOL)a3
{
}

- (double)horizontalScaleFactor
{
  [(SUICFlamesViewProviding *)self->_flamesView horizontalScaleFactor];
  return result;
}

- (void)setHorizontalScaleFactor:(double)a3
{
}

- (BOOL)accelerateTransitions
{
  return [(SUICFlamesViewProviding *)self->_flamesView accelerateTransitions];
}

- (void)setAccelerateTransitions:(BOOL)a3
{
}

- (float)audioLevelForFlamesView:(id)a3
{
  double v4 = [(SUICFlamesView *)self flamesDelegate];
  [v4 audioLevelForFlamesView:self];
  float v6 = v5;

  return v6;
}

- (void)flamesViewAuraDidDisplay:(id)a3
{
  double v4 = [(SUICFlamesView *)self flamesDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SUICFlamesView *)self flamesDelegate];
    [v6 flamesViewAuraDidDisplay:self];
  }
}

- (SUICFlamesViewDelegate)flamesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);

  return (SUICFlamesViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flamesDelegate);

  objc_storeStrong((id *)&self->_flamesView, 0);
}

@end
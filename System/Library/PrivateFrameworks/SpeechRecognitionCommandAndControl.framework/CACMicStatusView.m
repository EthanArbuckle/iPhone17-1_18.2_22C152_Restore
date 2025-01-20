@interface CACMicStatusView
- (BOOL)swapPalette;
- (CACMicStatusView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (NSTimer)statusIndicatorAnimationTimer;
- (UIImageView)statusIndicatorImageView;
- (double)micPowerLevel;
- (id)imageBundle;
- (int64_t)micStatus;
- (void)drawBase;
- (void)setMicPowerLevel:(double)a3;
- (void)setMicStatus:(int64_t)a3;
- (void)setStatusIndicatorAnimationTimer:(id)a3;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setSwapPalette:(BOOL)a3;
- (void)stopRecordingAnimation;
- (void)transitionToIdle;
- (void)transitionToListening;
- (void)transitionToRecording;
@end

@implementation CACMicStatusView

- (CACMicStatusView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CACMicStatusView;
  v3 = -[CACMicStatusView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_swapPalette = 1;
    [(CACMicStatusView *)v3 drawBase];
    [(CACMicStatusView *)v4 setMicStatus:1];
  }
  return v4;
}

- (void)drawBase
{
  v3 = [(CACMicStatusView *)self layer];
  id v4 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  v5 = [(CACMicStatusView *)self layer];
  [(CACMicStatusView *)self frame];
  [v5 setCornerRadius:v6 * 0.5];

  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, 0.75, 0.75);
  id v7 = objc_alloc(MEMORY[0x263F82828]);
  [(CACMicStatusView *)self frame];
  v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
  statusIndicatorImageView = self->_statusIndicatorImageView;
  self->_statusIndicatorImageView = v8;

  v10 = [(UIImageView *)self->_statusIndicatorImageView layer];
  objc_msgSend(v10, "setAnchorPoint:", 0.5, 0.5);

  v11 = self->_statusIndicatorImageView;
  CGAffineTransform v12 = v13;
  [(UIImageView *)v11 setTransform:&v12];
  [(UIImageView *)self->_statusIndicatorImageView setAlpha:0.8];
  [(CACMicStatusView *)self addSubview:self->_statusIndicatorImageView];
}

- (void)setMicStatus:(int64_t)a3
{
  if (self->_micStatus != a3)
  {
    switch(a3)
    {
      case 3:
        [(CACMicStatusView *)self transitionToRecording];
        break;
      case 2:
        [(CACMicStatusView *)self transitionToListening];
        break;
      case 1:
        [(CACMicStatusView *)self transitionToIdle];
        break;
    }
    self->_micStatus = a3;
  }
}

- (void)setSwapPalette:(BOOL)a3
{
  if (self->_swapPalette != a3)
  {
    int64_t v5 = [(CACMicStatusView *)self micStatus];
    switch(v5)
    {
      case 3:
        [(CACMicStatusView *)self transitionToRecording];
        break;
      case 2:
        [(CACMicStatusView *)self transitionToListening];
        break;
      case 1:
        [(CACMicStatusView *)self transitionToIdle];
        break;
    }
    self->_swapPalette = a3;
  }
}

- (void)transitionToIdle
{
  [(CACMicStatusView *)self stopRecordingAnimation];
  v3 = (void *)MEMORY[0x263F82E00];
  id v4 = [(CACMicStatusView *)self statusIndicatorImageView];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__CACMicStatusView_transitionToIdle__block_invoke;
  v5[3] = &unk_264D115D0;
  v5[4] = self;
  [v3 transitionWithView:v4 duration:5242880 options:v5 animations:0 completion:0.3];
}

void __36__CACMicStatusView_transitionToIdle__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F827E8] _systemImageNamed:@"voice.control.slash"];
  v3 = [MEMORY[0x263F825C8] systemBlackColor];
  id v4 = [v2 _flatImageWithColor:v3];
  int64_t v5 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v5 setImage:v4];

  id v7 = [*(id *)(a1 + 32) layer];
  id v6 = [MEMORY[0x263F825C8] systemGray4Color];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
}

- (void)transitionToListening
{
  [(CACMicStatusView *)self stopRecordingAnimation];
  v3 = (void *)MEMORY[0x263F82E00];
  id v4 = [(CACMicStatusView *)self statusIndicatorImageView];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__CACMicStatusView_transitionToListening__block_invoke;
  v5[3] = &unk_264D115D0;
  v5[4] = self;
  [v3 transitionWithView:v4 duration:5242880 options:v5 animations:0 completion:0.3];
}

void __41__CACMicStatusView_transitionToListening__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F827E8] _systemImageNamed:@"voice.control"];
  v3 = [MEMORY[0x263F825C8] systemWhiteColor];
  id v4 = [v2 _flatImageWithColor:v3];
  int64_t v5 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v5 setImage:v4];

  id v7 = [*(id *)(a1 + 32) layer];
  id v6 = [MEMORY[0x263F825C8] systemBlueColor];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
}

- (void)transitionToRecording
{
  v3 = (void *)MEMORY[0x263F82E00];
  id v4 = [(CACMicStatusView *)self statusIndicatorImageView];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__CACMicStatusView_transitionToRecording__block_invoke;
  v6[3] = &unk_264D115D0;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__CACMicStatusView_transitionToRecording__block_invoke_2;
  v5[3] = &unk_264D11AD8;
  v5[4] = self;
  [v3 transitionWithView:v4 duration:5242880 options:v6 animations:v5 completion:0.3];
}

void __41__CACMicStatusView_transitionToRecording__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F827E8] _systemImageNamed:@"voice.control"];
  v3 = [MEMORY[0x263F825C8] systemRedColor];
  id v4 = [v2 _flatImageWithColor:v3];
  int64_t v5 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v5 setImage:v4];

  id v7 = [*(id *)(a1 + 32) layer];
  id v6 = [MEMORY[0x263F825C8] systemWhiteColor];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
}

void __41__CACMicStatusView_transitionToRecording__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) statusIndicatorAnimationTimer];

  if (!v2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __41__CACMicStatusView_transitionToRecording__block_invoke_3;
    v4[3] = &unk_264D12288;
    v4[4] = *(void *)(a1 + 32);
    v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v4 block:1.0];
    [*(id *)(a1 + 32) setStatusIndicatorAnimationTimer:v3];
  }
}

uint64_t __41__CACMicStatusView_transitionToRecording__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v2 alpha];
  BOOL v4 = v3 == 1.0;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__CACMicStatusView_transitionToRecording__block_invoke_4;
  v6[3] = &unk_264D120C0;
  v6[4] = *(void *)(a1 + 32);
  BOOL v7 = v4;
  return [MEMORY[0x263F82E00] animateWithDuration:0 delay:v6 options:0 animations:1.3 completion:0.0];
}

void __41__CACMicStatusView_transitionToRecording__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.2;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v2 setAlpha:v1];
}

- (void)stopRecordingAnimation
{
  double v3 = [(CACMicStatusView *)self statusIndicatorAnimationTimer];
  [v3 invalidate];

  [(CACMicStatusView *)self setStatusIndicatorAnimationTimer:0];
  id v4 = [(CACMicStatusView *)self statusIndicatorImageView];
  [v4 setAlpha:1.0];
}

- (CGSize)intrinsicContentSize
{
  [(CACMicStatusView *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)imageBundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__CACMicStatusView_imageBundle__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  if (imageBundle_onceToken != -1) {
    dispatch_once(&imageBundle_onceToken, block);
  }
  return (id)imageBundle_sImageBundle;
}

uint64_t __31__CACMicStatusView_imageBundle__block_invoke()
{
  imageBundle_sImageBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (int64_t)micStatus
{
  return self->_micStatus;
}

- (double)micPowerLevel
{
  return self->_micPowerLevel;
}

- (void)setMicPowerLevel:(double)a3
{
  self->_micPowerLevel = a3;
}

- (BOOL)swapPalette
{
  return self->_swapPalette;
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (NSTimer)statusIndicatorAnimationTimer
{
  return self->_statusIndicatorAnimationTimer;
}

- (void)setStatusIndicatorAnimationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorAnimationTimer, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
}

@end
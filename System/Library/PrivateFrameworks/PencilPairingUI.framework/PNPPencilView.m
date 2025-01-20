@interface PNPPencilView
+ (id)_hardwareImageForVariant:(unint64_t)a3;
- (BOOL)spinning;
- (CGAffineTransform)transformForDeviceState:(SEL)a3;
- (CGSize)_edgeAccurateSizeForLength:(double)a3 depth:(double)a4 deviceState:(id)a5;
- (CGSize)comfortableContainingSizeForDeviceState:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)intrinsicSizeForDeviceState:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PNPDeviceState)deviceState;
- (PNPPencilView)initWithCoder:(id)a3;
- (PNPPencilView)initWithVariant:(unint64_t)a3;
- (PNPPencilViewDelegate)delegate;
- (void)_animateIndicatorToShown:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_prepareMovieView;
- (void)_resetTouchIndicatorPosition;
- (void)cleanupSpinningResources;
- (void)completeRevolutionWithCompletionBlock:(id)a3;
- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4;
- (void)layoutSubviews;
- (void)prepareMovieForSpinningPencil:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setSpinning:(BOOL)a3;
@end

@implementation PNPPencilView

- (void)layoutSubviews
{
  pencilImageView = self->_pencilImageView;
  [(PNPPencilView *)self bounds];
  v4 = [(PNPPencilView *)self traitCollection];
  [v4 displayScale];
  UIRectIntegralWithScale();
  -[UIImageView setFrame:](pencilImageView, "setFrame:");

  pencilMovieView = self->_pencilMovieView;
  [(PNPPencilView *)self bounds];
  v6 = [(PNPPencilView *)self traitCollection];
  [v6 displayScale];
  UIRectIntegralWithScale();
  -[_PNPPencilMovieView setFrame:](pencilMovieView, "setFrame:");

  [(PNPPencilView *)self bounds];
  double v8 = v7;
  [(PNPPencilView *)self bounds];
  if (v8 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  double v11 = v10 * 0.5;
  v12 = [(PNPPencilView *)self layer];
  [v12 setCornerRadius:v11];

  [(UIView *)self->_touchIndicatorView _setCornerRadius:6.0];
  [(PNPPencilView *)self bounds];
  UIRectCenteredYInRect();
  [(PNPPencilView *)self bounds];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIView setFrame:](self->_touchIndicatorView, "setFrame:");
  touchIndicatorView = self->_touchIndicatorView;
  v14 = [MEMORY[0x263F1C550] systemBlueColor];
  [(UIView *)touchIndicatorView setBackgroundColor:v14];

  double v15 = 0.6;
  if (!self->_touchIndicatorShown) {
    double v15 = 0.0;
  }
  [(UIView *)self->_touchIndicatorView setAlpha:v15];
  v16 = self->_pencilMovieView;
  BOOL v17 = [(PNPPencilView *)self spinning];
  double v18 = 1.0;
  if (!v17) {
    double v18 = 0.0;
  }
  [(_PNPPencilMovieView *)v16 setAlpha:v18];
}

- (void)_animateIndicatorToShown:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  [(PNPPencilView *)self setNeedsLayout];
  [(PNPPencilView *)self layoutIfNeeded];
  double v7 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke;
  v11[3] = &unk_264DA5740;
  v11[4] = self;
  BOOL v12 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke_2;
  v9[3] = &unk_264DA5800;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithDuration:6 delay:v11 options:v9 animations:0.2 completion:0.0];
}

uint64_t __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 432) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_resetTouchIndicatorPosition
{
  self->_touchIndicatorPosition = 0.0;
  [(PNPPencilView *)self setNeedsLayout];
}

- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4
{
  id v5 = a4;
  [(PNPPencilView *)self _resetTouchIndicatorPosition];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke;
  v7[3] = &unk_264DA5B70;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PNPPencilView *)self _animateIndicatorToShown:1 withCompletionBlock:v7];
}

void __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_2;
  v2[3] = &unk_264DA5B70;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _animateIndicatorToShown:0 withCompletionBlock:v2];
}

void __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_3;
  v2[3] = &unk_264DA5B70;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _animateIndicatorToShown:1 withCompletionBlock:v2];
}

void __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_4;
  v2[3] = &unk_264DA5768;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _animateIndicatorToShown:0 withCompletionBlock:v2];
}

uint64_t __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDeviceState:(id)a3
{
  id v7 = a3;
  id v5 = [(PNPPencilView *)self deviceState];
  char v6 = [v7 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_deviceState, a3);
    [(PNPPencilView *)self setNeedsLayout];
  }
}

- (CGSize)_edgeAccurateSizeForLength:(double)a3 depth:(double)a4 deviceState:(id)a5
{
  id v7 = (void *)MEMORY[0x263F1C920];
  id v8 = a5;
  double v9 = [v7 mainScreen];
  [v9 scale];
  double v11 = v10;
  BOOL v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 nativeScale];
  double v14 = v13;

  int v15 = [v8 isOnLeftOrRightSide];
  if (v15) {
    double v19 = a4;
  }
  else {
    double v19 = a3;
  }
  if (v15) {
    double v20 = a3;
  }
  else {
    double v20 = a4;
  }
  v17.n128_f64[0] = v11 / v14 * v20;
  v16.n128_f64[0] = v11 / v14 * v19;
  v18.n128_u64[0] = 1.0;
  MEMORY[0x270F06280](v16, v17, v18);
  result.height = v22;
  result.width = v21;
  return result;
}

- (CGSize)intrinsicSizeForDeviceState:(id)a3
{
  [(PNPPencilView *)self _edgeAccurateSizeForLength:a3 depth:855.0 deviceState:51.2];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)comfortableContainingSizeForDeviceState:(id)a3
{
  [(PNPPencilView *)self _edgeAccurateSizeForLength:a3 depth:950.0 deviceState:128.0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(PNPPencilView *)self deviceState];
  [(PNPPencilView *)self intrinsicSizeForDeviceState:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(id)objc_opt_class() _hardwareImageForVariant:self->_variant];
  [v5 size];
  double v7 = v6;
  [v5 size];
  double v9 = v7 / v8;
  if (width == 0.0 || width == *MEMORY[0x263F1D7C8])
  {
    double width = height * v9;
  }
  else if (height == 0.0 || height == *MEMORY[0x263F1D7C8])
  {
    double height = width * (1.0 / v9);
  }
  else
  {
    objc_msgSend(v5, "size", v9);
    double width = v10;
    double height = v11;
  }

  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGAffineTransform)transformForDeviceState:(SEL)a3
{
  id v9 = a4;
  if ([v9 isOnLeftOrRightSide])
  {
    if ([v9 edge] == 8)
    {
      CGFloat v5 = 1.57079633;
LABEL_6:
      CGAffineTransformMakeRotation(retstr, v5);
      goto LABEL_8;
    }
    if ([v9 edge] == 2)
    {
      CGFloat v5 = -1.57079633;
      goto LABEL_6;
    }
  }
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
LABEL_8:

  return result;
}

+ (id)_hardwareImageForVariant:(unint64_t)a3
{
  if (_hardwareImageForVariant__onceToken != -1) {
    dispatch_once(&_hardwareImageForVariant__onceToken, &__block_literal_global_6);
  }
  double v4 = &_hardwareImageForVariant____hardwareImageForSettings;
  if (!a3) {
    double v4 = &_hardwareImageForVariant____hardwareImageForPencilPairingUI;
  }
  CGFloat v5 = (void *)*v4;
  return v5;
}

void __42__PNPPencilView__hardwareImageForVariant___block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = PencilPairingUIBundle();
  uint64_t v2 = [v0 imageNamed:@"hw_pencilpairingui" inBundle:v1 compatibleWithTraitCollection:0];
  double v3 = (void *)_hardwareImageForVariant____hardwareImageForPencilPairingUI;
  _hardwareImageForVariant____hardwareImageForPencilPairingUI = v2;

  double v4 = (void *)MEMORY[0x263F1C6B0];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 imageNamed:@"hw_settings" inBundle:v7 compatibleWithTraitCollection:0];
  uint64_t v6 = (void *)_hardwareImageForVariant____hardwareImageForSettings;
  _hardwareImageForVariant____hardwareImageForSettings = v5;
}

- (void)setSpinning:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PNPPencilView *)self spinning] != a3)
  {
    if (v3) {
      [(_PNPPencilMovieView *)self->_pencilMovieView prepare];
    }
    self->_spinning = v3;
    [(PNPPencilView *)self setNeedsLayout];
  }
}

- (void)_prepareMovieView
{
  [(_PNPPencilMovieView *)self->_pencilMovieView prepare];
  pencilMovieView = self->_pencilMovieView;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__PNPPencilView__prepareMovieView__block_invoke;
  v4[3] = &unk_264DA56A0;
  v4[4] = self;
  [(_PNPPencilMovieView *)pencilMovieView completeRevolutionWithCompletionBlock:v4];
}

void __34__PNPPencilView__prepareMovieView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 472));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 472));
    [v3 didCompleteOneRevolution];
  }
}

- (void)cleanupSpinningResources
{
}

- (void)completeRevolutionWithCompletionBlock:(id)a3
{
}

- (PNPPencilView)initWithVariant:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PNPPencilView;
  double v4 = -[PNPPencilView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4->_variant = a3;
  id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v6 = [(id)objc_opt_class() _hardwareImageForVariant:a3];
  uint64_t v7 = [v5 initWithImage:v6];
  pencilImageView = v4->_pencilImageView;
  v4->_pencilImageView = (UIImageView *)v7;

  [(UIImageView *)v4->_pencilImageView setContentMode:1];
  [(PNPPencilView *)v4 addSubview:v4->_pencilImageView];
  id v9 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  touchIndicatorView = v4->_touchIndicatorView;
  v4->_touchIndicatorView = v9;

  [(PNPPencilView *)v4 addSubview:v4->_touchIndicatorView];
  return v4;
}

- (PNPPencilView)initWithCoder:(id)a3
{
  return [(PNPPencilView *)self initWithVariant:0];
}

- (void)prepareMovieForSpinningPencil:(id)a3
{
  id v4 = a3;
  id v5 = [_PNPPencilMovieView alloc];
  uint64_t v6 = [v4 deviceType];

  uint64_t v7 = [(_PNPPencilMovieView *)v5 initWithDeviceType:v6];
  pencilMovieView = self->_pencilMovieView;
  self->_pencilMovieView = v7;

  [(PNPPencilView *)self addSubview:self->_pencilMovieView];
  if (self->_spinning)
  {
    [(PNPPencilView *)self _prepareMovieView];
  }
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPPencilViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPPencilViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)spinning
{
  return self->_spinning;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_touchIndicatorView, 0);
  objc_storeStrong((id *)&self->_pencilMovieView, 0);
  objc_storeStrong((id *)&self->_pencilImageView, 0);
}

@end
@interface PKAccessoryDeviceView
- (CGRect)_springBoardCutoutRect;
- (CGRect)cutoutFrame;
- (PKAccessoryDeviceView)initWithFrame:(CGRect)a3;
- (PKAccessoryDeviceView)initWithPass:(id)a3 accessory:(id)a4 cutoutFrame:(CGRect)a5 parentView:(id)a6;
- (PKAccessoryDeviceView)initWithState:(int64_t)a3 accessory:(id)a4 cutoutFrame:(CGRect)a5 parentView:(id)a6;
- (PKAccessoryDeviceViewDelegate)delegate;
- (void)_layoutFailureState;
- (void)_layoutProcessingState;
- (void)_layoutSuccessState;
- (void)_layoutSuccessWithUserInterventionState;
- (void)_layoutTryAgainState;
- (void)_setColors;
- (void)_showWalletWithMessage:(id)a3;
- (void)changeToState:(int64_t)a3;
- (void)dismissViewImmediatelyWithCompletion:(id)a3;
- (void)dismissViewWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)presentOnParentView;
- (void)setCutoutFrame:(CGRect)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKAccessoryDeviceView

- (PKAccessoryDeviceView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKAccessoryDeviceView)initWithPass:(id)a3 accessory:(id)a4 cutoutFrame:(CGRect)a5 parentView:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 bounds];
  v20.receiver = self;
  v20.super_class = (Class)PKAccessoryDeviceView;
  v18 = -[PKAccessoryDeviceView initWithFrame:](&v20, sel_initWithFrame_);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessory, a4);
    objc_storeStrong((id *)&v18->_pass, a3);
    v18->_cutoutFrame.origin.CGFloat x = x;
    v18->_cutoutFrame.origin.CGFloat y = y;
    v18->_cutoutFrame.size.CGFloat width = width;
    v18->_cutoutFrame.size.CGFloat height = height;
    objc_storeStrong((id *)&v18->_parentView, a6);
    v18->_state = 0;
    [(PKAccessoryDeviceView *)v18 changeToState:0];
    v18->_animationDelaCGFloat y = 4.0;
    [(PKAccessoryDeviceView *)v18 _setColors];
    [(PKAccessoryDeviceView *)v18 presentOnParentView];
  }

  return v18;
}

- (PKAccessoryDeviceView)initWithState:(int64_t)a3 accessory:(id)a4 cutoutFrame:(CGRect)a5 parentView:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a4;
  id v15 = a6;
  id v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 bounds];
  v19.receiver = self;
  v19.super_class = (Class)PKAccessoryDeviceView;
  v17 = -[PKAccessoryDeviceView initWithFrame:](&v19, sel_initWithFrame_);

  if (v17)
  {
    v17->_state = a3;
    objc_storeStrong((id *)&v17->_accessory, a4);
    v17->_cutoutFrame.origin.CGFloat x = x;
    v17->_cutoutFrame.origin.CGFloat y = y;
    v17->_cutoutFrame.size.CGFloat width = width;
    v17->_cutoutFrame.size.CGFloat height = height;
    objc_storeStrong((id *)&v17->_parentView, a6);
    [(PKAccessoryDeviceView *)v17 _setColors];
    [(PKAccessoryDeviceView *)v17 changeToState:v17->_state];
    [(PKAccessoryDeviceView *)v17 presentOnParentView];
  }

  return v17;
}

- (void)setCutoutFrame:(CGRect)a3
{
  self->_cutoutFrame = a3;
  [(PKAccessoryDeviceView *)self changeToState:self->_state];
}

- (void)_setColors
{
  v3 = [(PKAccessoryDevice *)self->_accessory primaryColorData];
  id v15 = v3;
  if (v3)
  {
    PKUIColorFromP3ColorData(v3);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    strokeColor = self->_strokeColor;
    self->_strokeColor = v4;
  }
  if (!self->_strokeColor)
  {
    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    v7 = self->_strokeColor;
    self->_strokeColor = v6;
  }
  v8 = [(PKAccessoryDevice *)self->_accessory secondaryColorData];
  v9 = v8;
  if (v8)
  {
    PKUIColorFromP3ColorData(v8);
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v10;
  }
  v12 = self->_backgroundColor;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4FB1618] blackColor];
    id v14 = self->_backgroundColor;
    self->_backgroundColor = v13;

    v12 = self->_backgroundColor;
  }
  [(PKAccessoryDeviceView *)self setBackgroundColor:v12];
}

- (void)presentOnParentView
{
  [(PKAccessoryDeviceView *)self removeFromSuperview];
  [(PKAccessoryDeviceView *)self setAlpha:1.0];
  [(UIView *)self->_parentView addSubview:self];
  [(UIView *)self->_parentView bringSubviewToFront:self];
  v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  dispatch_time_t v4 = dispatch_time(0, 12000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__PKAccessoryDeviceView_presentOnParentView__block_invoke;
  handler[3] = &unk_1E59CA7A8;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __44__PKAccessoryDeviceView_presentOnParentView__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_time_t v4 = WeakRetained + 62;
    id v8 = WeakRetained;
    id v5 = objc_loadWeakRetained(WeakRetained + 62);
    char v6 = objc_opt_respondsToSelector();

    WeakRetained = v8;
    if (v6)
    {
      id v7 = objc_loadWeakRetained(v4);
      [v7 accessoryDeviceDidReachHardTimeout];

      WeakRetained = v8;
    }
  }
}

- (void)changeToState:(int64_t)a3
{
  self->_state = a3;
  timeOutBlockTimer = self->_timeOutBlockTimer;
  if (timeOutBlockTimer) {
    dispatch_source_cancel(timeOutBlockTimer);
  }
  [(PKAccessoryDeviceView *)self setNeedsLayout];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 accessoryDeviceDidChangeStateTo:a3];
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKAccessoryDeviceView;
  [(PKAccessoryDeviceView *)&v9 layoutSubviews];
  switch(self->_state)
  {
    case 0:
      v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to processing state", v8, 2u);
      }

      self->_animationDelaCGFloat y = 4.0;
      [(PKAccessoryDeviceView *)self _layoutProcessingState];
      break;
    case 1:
      dispatch_time_t v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to success state", v8, 2u);
      }

      self->_animationDelaCGFloat y = 4.0;
      [(PKAccessoryDeviceView *)self _layoutSuccessState];
      break;
    case 2:
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to success with intervention state", v8, 2u);
      }

      self->_animationDelaCGFloat y = 10.0;
      [(PKAccessoryDeviceView *)self _layoutSuccessWithUserInterventionState];
      break;
    case 3:
      char v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to failure state", v8, 2u);
      }

      self->_animationDelaCGFloat y = 4.0;
      [(PKAccessoryDeviceView *)self _layoutFailureState];
      break;
    case 4:
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceView change to try again state", v8, 2u);
      }

      self->_animationDelaCGFloat y = 4.0;
      [(PKAccessoryDeviceView *)self _layoutTryAgainState];
      break;
    default:
      return;
  }
}

- (void)_layoutSuccessState
{
  [(UILabel *)self->_label setAlpha:0.0];
  [(PKGlyphView *)self->_glyph setAlpha:0.0];
  [(PKGlyphView *)self->_glyph setState:11];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PKAccessoryDeviceView__layoutSuccessState__block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.3];
}

uint64_t __44__PKAccessoryDeviceView__layoutSuccessState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

- (void)_layoutFailureState
{
  [(UILabel *)self->_label setAlpha:0.0];
  [(PKGlyphView *)self->_glyph setAlpha:0.0];
  v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:12.0];
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark" withConfiguration:v3];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(PKGlyphView *)self->_glyph primaryColor];
    id v7 = [v5 _flatImageWithColor:v6];
  }
  else
  {
    id v7 = 0;
  }
  [(PKGlyphView *)self->_glyph setState:10];
  glyph = self->_glyph;
  id v9 = v7;
  uint64_t v10 = [v9 CGImage];
  [v9 alignmentRectInsets];
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](glyph, "setCustomImage:withAlignmentEdgeInsets:", v10);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__PKAccessoryDeviceView__layoutFailureState__block_invoke;
  v11[3] = &unk_1E59CA7D0;
  v11[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.3];
}

uint64_t __44__PKAccessoryDeviceView__layoutFailureState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

- (void)_layoutTryAgainState
{
  PKLocalizedD5xString(&cfstr_PaymentRemoveS.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKAccessoryDeviceView *)self _showWalletWithMessage:v3];
}

- (void)_layoutSuccessWithUserInterventionState
{
  PKLocalizedD5xString(&cfstr_PaymentRemoveS_0.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKAccessoryDeviceView *)self _showWalletWithMessage:v3];
}

- (void)_layoutProcessingState
{
  [(UILabel *)self->_label setAlpha:0.0];
  [(PKGlyphView *)self->_glyph setAlpha:0.0];
  [(UIView *)self->_imageBackgroundView setAlpha:0.0];
  [(UILabel *)self->_label removeFromSuperview];
  [(PKGlyphView *)self->_glyph removeFromSuperview];
  [(UIView *)self->_imageBackgroundView removeFromSuperview];
  [(PKAccessoryDeviceView *)self setAlpha:1.0];
  [(PKAccessoryDeviceView *)self _setColors];
  [(PKAccessoryDeviceView *)self _springBoardCutoutRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PKPass *)self->_pass frontFaceImage];
  v12 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithAspectFillToSize:", 83.0, 52.0);
  v13 = [v11 resizedImageWithConstraints:v12];
  id v14 = [MEMORY[0x1E4FB1818] imageWithPKImage:v13];
  id v15 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
  imageBackgroundView = self->_imageBackgroundView;
  self->_imageBackgroundView = v15;

  v17 = [(UIView *)self->_imageBackgroundView layer];
  [(UIView *)self->_imageBackgroundView setContentMode:1];
  [(UIView *)self->_imageBackgroundView setClipsToBounds:1];
  [(UIView *)self->_imageBackgroundView _setContinuousCornerRadius:4.0];
  [(UIView *)self->_imageBackgroundView setBackgroundColor:self->_backgroundColor];
  [v17 setBorderWidth:PKUIPixelLength()];
  objc_msgSend(v17, "setBorderColor:", -[UIColor CGColor](self->_strokeColor, "CGColor"));
  v18 = self->_imageBackgroundView;
  double v19 = v4 + (v8 + -151.0) * 0.5;
  double v20 = v6 + (v10 + -52.0) * 0.5;
  v21.n128_f64[0] = v19;
  v22.n128_f64[0] = v20;
  v23.n128_u64[0] = 0x4054C00000000000;
  v24.n128_u64[0] = 0x404A000000000000;
  PKRectRoundToPixel(v21, v22, v23, v24, v25);
  -[UIView setFrame:](v18, "setFrame:");
  [(PKAccessoryDeviceView *)self addSubview:self->_imageBackgroundView];
  v26 = (PKGlyphView *)[objc_alloc(MEMORY[0x1E4F88120]) initWithStyle:5];
  glyph = self->_glyph;
  self->_glyph = v26;

  [(PKGlyphView *)self->_glyph setState:7];
  v28 = self->_glyph;
  v29.n128_f64[0] = v19 + 83.0 + 16.0;
  v30.n128_f64[0] = v20;
  v31.n128_u64[0] = 0x404A000000000000;
  v32.n128_u64[0] = 0x404A000000000000;
  PKRectRoundToPixel(v29, v30, v31, v32, v33);
  -[PKGlyphView setFrame:](v28, "setFrame:");
  [(PKAccessoryDeviceView *)self addSubview:self->_glyph];
  v34 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  timeOutBlockTimer = self->_timeOutBlockTimer;
  self->_timeOutBlockTimer = v34;

  v36 = self->_timeOutBlockTimer;
  dispatch_time_t v37 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer(v36, v37, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke;
  v40[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v41, &location);
  v38 = (void *)[v40 copy];
  dispatch_source_set_event_handler((dispatch_source_t)self->_timeOutBlockTimer, v38);
  dispatch_resume((dispatch_object_t)self->_timeOutBlockTimer);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke_2;
  v39[3] = &unk_1E59CA7D0;
  v39[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v39 animations:0.3];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

void __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = *((void *)WeakRetained + 61);
    double v4 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v2 = v4;
    }
    if (!v2[60])
    {
      [v2 changeToState:3];
      v2 = v4;
    }
  }
}

uint64_t __47__PKAccessoryDeviceView__layoutProcessingState__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 408);

  return [v2 setAlpha:1.0];
}

- (void)_showWalletWithMessage:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [(UILabel *)label setAlpha:0.0];
  [(PKGlyphView *)self->_glyph setAlpha:0.0];
  [(UIView *)self->_imageBackgroundView setAlpha:0.0];
  [(UILabel *)self->_label removeFromSuperview];
  [(PKGlyphView *)self->_glyph removeFromSuperview];
  [(UIView *)self->_imageBackgroundView removeFromSuperview];
  [(PKAccessoryDeviceView *)self _springBoardCutoutRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v59 = v12;
  id v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  id v15 = self->_label;
  self->_label = v14;

  id v16 = self->_label;
  v17 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v16 setTextColor:v17];

  [(UILabel *)self->_label setText:v5];
  [(UILabel *)self->_label setNumberOfLines:2];
  v18 = self->_label;
  double v19 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)v18 setFont:v19];

  [(UILabel *)self->_label setLineBreakMode:0];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v11 + -44.0 + -16.0 + -48.0, v13 + -44.0);
  double v21 = v20;
  double v58 = v22;
  __n128 v23 = (void *)MEMORY[0x1E4F84780];
  __n128 v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __n128 v25 = [v23 imageNamed:@"AddPass_Icon" inBundle:v24];

  v26.n128_u64[0] = 0x403DE66666666667;
  v27.n128_u64[0] = 0x403619999999999ALL;
  PKSizeRoundToPixel(v26, v27, v28);
  __n128 v29 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithAspectFillToSize:");
  __n128 v30 = [v25 resizedImageWithConstraints:v29];
  __n128 v31 = [MEMORY[0x1E4FB1818] imageWithPKImage:v30];
  __n128 v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v31];
  id v33 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v34 = (UIView *)objc_msgSend(v33, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 44.0, 44.0);
  imageBackgroundView = self->_imageBackgroundView;
  self->_imageBackgroundView = v34;

  v36 = self->_imageBackgroundView;
  dispatch_time_t v37 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)v36 setBackgroundColor:v37];

  [(UIView *)self->_imageBackgroundView _setContinuousCornerRadius:8.0];
  v38.n128_f64[0] = v7 + (v11 - (v21 + 60.0)) * 0.5;
  double v39 = v9;
  v40.n128_f64[0] = v9 + (v13 + -44.0) * 0.5;
  v41.n128_u64[0] = 0x4046000000000000;
  v42.n128_u64[0] = 0x4046000000000000;
  PKRectRoundToPixel(v38, v40, v41, v42, v43);
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  -[UIView setFrame:](self->_imageBackgroundView, "setFrame:");
  PKSizeAlignedInRect();
  objc_msgSend(v32, "setFrame:");
  v52 = self->_label;
  v61.origin.CGFloat x = v45;
  v61.origin.CGFloat y = v47;
  v61.size.CGFloat width = v49;
  v61.size.CGFloat height = v51;
  v53.n128_f64[0] = CGRectGetMaxX(v61) + 16.0;
  v54.n128_f64[0] = v58;
  v55.n128_f64[0] = v39 + (v59 - v58) * 0.5;
  v56.n128_f64[0] = v21;
  PKRectRoundToPixel(v53, v55, v56, v54, v57);
  -[UILabel setFrame:](v52, "setFrame:");
  [(PKAccessoryDeviceView *)self addSubview:v32];
  [(PKAccessoryDeviceView *)self addSubview:self->_imageBackgroundView];
  [(PKAccessoryDeviceView *)self addSubview:self->_label];
  [(PKAccessoryDeviceView *)self bringSubviewToFront:v32];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __48__PKAccessoryDeviceView__showWalletWithMessage___block_invoke;
  v60[3] = &unk_1E59CA7D0;
  v60[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v60 animations:0.3];
}

uint64_t __48__PKAccessoryDeviceView__showWalletWithMessage___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 424);

  return [v2 setAlpha:1.0];
}

- (void)dismissViewWithCompletion:(id)a3
{
  id v4 = a3;
  animationDelaCGFloat y = self->_animationDelay;
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke;
  v10[3] = &unk_1E59CA7D0;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke_2;
  v8[3] = &unk_1E59CA820;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 animateWithDuration:0 delay:v10 options:v8 animations:2.0 completion:animationDelay];
}

uint64_t __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

uint64_t __51__PKAccessoryDeviceView_dismissViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(void **)(a1 + 32);

  return [v3 removeFromSuperview];
}

- (void)dismissViewImmediatelyWithCompletion:(id)a3
{
  self->_animationDelaCGFloat y = 0.0;
  [(PKAccessoryDeviceView *)self dismissViewWithCompletion:a3];
}

- (CGRect)_springBoardCutoutRect
{
  double x = self->_cutoutFrame.origin.x;
  double y = self->_cutoutFrame.origin.y;
  double width = self->_cutoutFrame.size.width;
  double height = self->_cutoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)cutoutFrame
{
  double x = self->_cutoutFrame.origin.x;
  double y = self->_cutoutFrame.origin.y;
  double width = self->_cutoutFrame.size.width;
  double height = self->_cutoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PKAccessoryDeviceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAccessoryDeviceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeOutBlockTimer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);

  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
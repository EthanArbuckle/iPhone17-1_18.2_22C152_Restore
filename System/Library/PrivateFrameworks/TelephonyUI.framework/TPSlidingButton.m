@interface TPSlidingButton
- (CGSize)intrinsicContentSize;
- (TPSlidingButton)initWithSlidingButtonType:(int)a3;
- (TPSlidingButtonDelegateProtocol)delegate;
- (UIButton)sideButtonRight;
- (UIImageView)dialImageView;
- (_UIActionSlider)acceptButton;
- (int)type;
- (void)actionSlider:(id)a3 didUpdateSlideWithValue:(double)a4;
- (void)actionSliderDidCompleteSlide:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAcceptButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialImageView:(id)a3;
- (void)setSideButtonRight:(id)a3;
- (void)setType:(int)a3;
@end

@implementation TPSlidingButton

- (TPSlidingButton)initWithSlidingButtonType:(int)a3
{
  v46.receiver = self;
  v46.super_class = (Class)TPSlidingButton;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[TPSlidingButton initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v10 = (void *)MEMORY[0x1E4FB23D8];
    v11 = [MEMORY[0x1E4FB1618] blueColor];
    BOOL v12 = 1;
    v13 = [MEMORY[0x1E4FB21E0] sharedInstanceForStyle:1];
    v14 = [v10 vibrantSettingsWithReferenceColor:v11 referenceContrast:v13 legibilitySettings:0.3];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1FA8]), "initWithFrame:vibrantSettings:", v14, v4, v5, v6, v7);
    acceptButton = v9->_acceptButton;
    v9->_acceptButton = (_UIActionSlider *)v15;

    v17 = (void *)MEMORY[0x1E4FB1818];
    v18 = TelephonyUIBundle();
    v19 = [v17 imageNamed:@"phone_dial" inBundle:v18];
    v20 = [v19 imageWithRenderingMode:2];
    [(_UIActionSlider *)v9->_acceptButton setKnobImage:v20];

    v21 = [MEMORY[0x1E4FB1618] systemGreenColor];
    [(_UIActionSlider *)v9->_acceptButton setTintColor:v21];

    [(_UIActionSlider *)v9->_acceptButton setDelegate:v9];
    if (a3 > 6 || ((1 << a3) & 0x46) == 0) {
      BOOL v12 = a3 == 3;
    }
    [(_UIActionSlider *)v9->_acceptButton setStyle:v12];
    v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v23 = [v22 currentMode];
    [v23 size];
    double v25 = v24;

    if (v25 >= 2208.0)
    {
      [(_UIActionSlider *)v9->_acceptButton trackSize];
      [(_UIActionSlider *)v9->_acceptButton setTrackSize:300.0];
    }
    v26 = TelephonyUIBundle();
    v27 = v26;
    if ((a3 - 5) >= 2) {
      v28 = @"SLIDE_TO_ANSWER";
    }
    else {
      v28 = @"SLIDE_TO_UNLOCK";
    }
    v29 = [v26 localizedStringForKey:v28 value:&stru_1F1E807C8 table:@"General"];

    [(_UIActionSlider *)v9->_acceptButton setTrackText:v29];
    id v30 = objc_alloc(MEMORY[0x1E4FB1838]);
    v31 = (void *)MEMORY[0x1E4FB1818];
    v32 = TelephonyUIBundle();
    v33 = [v31 imageNamed:@"phone_dial" inBundle:v32];
    v34 = [MEMORY[0x1E4FB1618] systemGreenColor];
    v35 = [v33 _flatImageWithColor:v34];
    uint64_t v36 = [v30 initWithImage:v35];
    dialImageView = v9->_dialImageView;
    v9->_dialImageView = (UIImageView *)v36;

    uint64_t v38 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    sideButtonRight = v9->_sideButtonRight;
    v9->_sideButtonRight = (UIButton *)v38;

    v40 = v9->_sideButtonRight;
    v41 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)v40 setBackgroundColor:v41];

    +[TPButton defaultWidthForSideButton];
    double v43 = v42 * 0.5;
    v44 = [(UIButton *)v9->_sideButtonRight layer];
    [v44 setCornerRadius:v43];

    [(UIButton *)v9->_sideButtonRight setUserInteractionEnabled:0];
    [(UIImageView *)v9->_dialImageView setClipsToBounds:0];
    [(UIImageView *)v9->_dialImageView setContentMode:4];
    [(_UIActionSlider *)v9->_acceptButton setAlpha:1.0];
    [(TPSlidingButton *)v9 addSubview:v9->_acceptButton];
  }
  return v9;
}

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)TPSlidingButton;
  [(TPSlidingButton *)&v2 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TPSlidingButton;
  [(TPSlidingButton *)&v3 layoutSubviews];
  [(TPSlidingButton *)self bounds];
  -[_UIActionSlider setFrame:](self->_acceptButton, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  objc_super v2 = [(TPSlidingButton *)self acceptButton];
  [v2 trackSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)actionSlider:(id)a3 didUpdateSlideWithValue:(double)a4
{
  uint64_t v6 = [(TPSlidingButton *)self delegate];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [(TPSlidingButton *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(TPSlidingButton *)self delegate];
      [v10 slidingButton:self didSlideToProportion:a4];
    }
  }
}

- (void)actionSliderDidCompleteSlide:(id)a3
{
  uint64_t v4 = [(TPSlidingButton *)self delegate];
  if (v4)
  {
    double v5 = (void *)v4;
    uint64_t v6 = [(TPSlidingButton *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(TPSlidingButton *)self delegate];
      [v8 slidingButtonWillFinishSlide];
    }
  }
  if (self->_type == 4)
  {
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke;
    v85[3] = &unk_1E647C1D0;
    v85[4] = self;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_2;
    v84[3] = &unk_1E647C588;
    v84[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v85 animations:v84 completion:0.300000012];
  }
  else
  {
    acceptButton = self->_acceptButton;
    [(_UIActionSlider *)acceptButton knobRect];
    -[_UIActionSlider convertRect:toView:](acceptButton, "convertRect:toView:", self);
    -[UIButton setFrame:](self->_sideButtonRight, "setFrame:");
    [(UIButton *)self->_sideButtonRight center];
    -[UIImageView setCenter:](self->_dialImageView, "setCenter:");
    [(TPSlidingButton *)self insertSubview:self->_dialImageView above:self->_sideButtonRight];
    [(TPSlidingButton *)self insertSubview:self->_sideButtonRight above:self->_acceptButton];
    id v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v10 setFromValue:&unk_1F1E89998];
    [v10 setToValue:&unk_1F1E899A8];
    [v10 setDuration:0.115000002];
    uint64_t v11 = *MEMORY[0x1E4F39FA8];
    [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
    v82 = v10;
    [v10 setRemovedOnCompletion:0];
    BOOL v12 = NSNumber;
    v13 = [(TPSlidingButton *)self acceptButton];
    v14 = [v13 layer];
    [v14 position];
    uint64_t v15 = objc_msgSend(v12, "numberWithDouble:");

    v16 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
    v17 = self->_acceptButton;
    if (self->_type == 3)
    {
      v18 = [(_UIActionSlider *)v17 layer];
      [v18 position];
      double v20 = v19 + -3.0;
    }
    else
    {
      [(_UIActionSlider *)v17 knobRect];
      double v22 = v21;
      [(_UIActionSlider *)self->_acceptButton center];
      double v20 = v22 - v23;
    }
    if ([(TPSlidingButton *)self _shouldReverseLayoutDirection])
    {
      [v15 doubleValue];
      double v20 = v24 - v20;
    }
    [v16 setMass:2.0];
    [v16 setStiffness:300.0];
    [v16 setDamping:50.0];
    [v16 setFromValue:v15];
    double v25 = [NSNumber numberWithDouble:v20];
    [v16 setToValue:v25];

    [v16 setDuration:0.50999999];
    [v16 setFillMode:v11];
    v80 = v16;
    [v16 setRemovedOnCompletion:0];
    v26 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.rotation.z"];
    [v26 setMass:2.0];
    [v26 setStiffness:300.0];
    [v26 setDamping:50.0];
    [v26 setToValue:&unk_1F1E89988];
    [v26 setDuration:0.50999999];
    [v26 setFillMode:v11];
    v79 = v26;
    [v26 setRemovedOnCompletion:0];
    v81 = v15;
    if (self->_type == 3)
    {
      +[TPSuperBottomBar defaultSideMarginForDoubleButton];
      double v28 = v27;
      +[TPSuperBottomBarButton defaultWidth];
      double v30 = v28 + v29 * 0.5;
      [(TPSlidingButton *)self frame];
      double v32 = floor(v30 - v31);
    }
    else
    {
      [(TPSlidingButton *)self bounds];
      double v32 = v33 * 0.5;
    }
    int v34 = [(TPSlidingButton *)self _shouldReverseLayoutDirection];
    double v35 = -1.0;
    if (v34) {
      double v35 = 1.0;
    }
    double v36 = v32 + v35;
    v37 = NSNumber;
    uint64_t v38 = [(TPSlidingButton *)self sideButtonRight];
    v39 = [v38 layer];
    [v39 position];
    v78 = objc_msgSend(v37, "numberWithDouble:");

    v76 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
    [v76 setMass:2.0];
    [v76 setStiffness:300.0];
    [v76 setDamping:50.0];
    [v76 setFromValue:v78];
    v40 = [NSNumber numberWithDouble:v36];
    [v76 setToValue:v40];

    [v76 setDuration:0.50999999];
    [v76 setFillMode:v11];
    [v76 setRemovedOnCompletion:0];
    v41 = NSNumber;
    double v42 = [(TPSlidingButton *)self dialImageView];
    double v43 = [v42 layer];
    [v43 position];
    v77 = objc_msgSend(v41, "numberWithDouble:");

    v44 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
    [v44 setMass:2.0];
    [v44 setStiffness:300.0];
    [v44 setDamping:50.0];
    v73 = v44;
    [v44 setFromValue:v77];
    v45 = [NSNumber numberWithDouble:v36];
    [v44 setToValue:v45];

    [v44 setDuration:0.50999999];
    [v44 setFillMode:v11];
    [v44 setRemovedOnCompletion:0];
    v75 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
    objc_super v46 = (void *)MEMORY[0x1E4F29238];
    +[TPSuperBottomBarButton defaultHeight];
    double v48 = v47;
    +[TPSuperBottomBarButton defaultHeight];
    v50 = objc_msgSend(v46, "valueWithCGRect:", 0.0, 0.0, v48, v49);
    [v75 setToValue:v50];

    [v75 setDuration:0.150000006];
    [v75 setFillMode:v11];
    [v75 setRemovedOnCompletion:0];
    +[TPSuperBottomBarButton defaultHeight];
    double v52 = v51 * 0.5;
    v53 = [(UIButton *)self->_sideButtonRight layer];
    [v53 setCornerRadius:v52];

    v54 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"backgroundColor"];
    [v54 setDuration:0.144999996];
    id v55 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v54, "setFromValue:", objc_msgSend(v55, "CGColor"));

    id v56 = [MEMORY[0x1E4FB1618] systemRedColor];
    objc_msgSend(v54, "setToValue:", objc_msgSend(v56, "CGColor"));

    [v54 setFillMode:v11];
    [v54 setRemovedOnCompletion:0];
    v57 = [MEMORY[0x1E4F39D18] animation];
    [v57 setType:*MEMORY[0x1E4F3A5B8]];
    v74 = v57;
    [v57 setDuration:0.115000002];
    [MEMORY[0x1E4F39CF8] begin];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_101;
    v83[3] = &unk_1E647C1D0;
    v83[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v83];
    v58 = [(UIImageView *)self->_dialImageView layer];
    [v58 addAnimation:v57 forKey:*MEMORY[0x1E4F3A5B0]];

    v59 = (void *)MEMORY[0x1E4FB1818];
    v60 = TelephonyUIBundle();
    v61 = [v59 imageNamed:@"phone_dial" inBundle:v60];
    v62 = [MEMORY[0x1E4FB1618] whiteColor];
    id v63 = [v61 _flatImageWithColor:v62];
    uint64_t v64 = [v63 CGImage];
    v65 = [(UIImageView *)self->_dialImageView layer];
    [v65 setContents:v64];

    v66 = [(UIButton *)self->_sideButtonRight layer];
    [v66 addAnimation:v54 forKey:@"backgroundColor"];

    v67 = [(UIButton *)self->_sideButtonRight layer];
    [v67 addAnimation:v75 forKey:@"bounds"];

    v68 = [(UIButton *)self->_sideButtonRight layer];
    [v68 addAnimation:v76 forKey:@"position"];

    v69 = [(UIImageView *)self->_dialImageView layer];
    [v69 addAnimation:v79 forKey:@"transform"];

    v70 = [(_UIActionSlider *)self->_acceptButton layer];
    [v70 addAnimation:v82 forKey:@"opacity"];

    v71 = [(_UIActionSlider *)self->_acceptButton layer];
    [v71 addAnimation:v80 forKey:@"position"];

    v72 = [(UIImageView *)self->_dialImageView layer];
    [v72 addAnimation:v73 forKey:@"position"];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

uint64_t __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    double v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 slidingButtonDidFinishSlide];
    }
  }
}

void __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_101(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    double v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 slidingButtonDidFinishSlide];
    }
  }
}

- (UIButton)sideButtonRight
{
  return (UIButton *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSideButtonRight:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (TPSlidingButtonDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPSlidingButtonDelegateProtocol *)a3;
}

- (UIImageView)dialImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 432, 1);
}

- (void)setDialImageView:(id)a3
{
}

- (_UIActionSlider)acceptButton
{
  return (_UIActionSlider *)objc_getProperty(self, a2, 440, 1);
}

- (void)setAcceptButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_dialImageView, 0);
  objc_storeStrong((id *)&self->_sideButtonRight, 0);
}

@end
@interface TVRUIChannelButton
- (BOOL)isAnimating;
- (BOOL)isEnabled;
- (BOOL)isExpanded;
- (CATransform3D)_transformForLeftWingExpanded:(SEL)a3;
- (CATransform3D)_transformForRightWingExpanded:(SEL)a3;
- (TVRUIChannelButton)initWithTitle:(id)a3 styleProvider:(id)a4;
- (TVRUIPageButton)bottomButton;
- (TVRUIPageButton)topButton;
- (TVRUIStyleProvider)styleProvider;
- (UILabel)titleLabel;
- (UIView)contentView;
- (_TVRUIEventDelegate)buttonEventDelegate;
- (id)_newSpringAnimation;
- (id)chevronLeftWingAnimationExpand:(BOOL)a3;
- (id)chevronRightWingAnimationExpand:(BOOL)a3;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_darkenSystemColorsChanged:(id)a3;
- (void)collapse;
- (void)expand;
- (void)layoutSubviews;
- (void)setBottomButton:(id)a3;
- (void)setButtonEventDelegate:(id)a3;
- (void)setContentView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopButton:(id)a3;
@end

@implementation TVRUIChannelButton

- (TVRUIChannelButton)initWithTitle:(id)a3 styleProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)TVRUIChannelButton;
  v8 = -[TVRUIChannelButton initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    [(TVRUIChannelButton *)v8 setStyleProvider:v7];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    contentView = v9->_contentView;
    v9->_contentView = v10;

    [(UIView *)v9->_contentView setClipsToBounds:1];
    [v7 mediaControlsButtonSize];
    double v13 = v12 * 0.5;
    v14 = [(UIView *)v9->_contentView layer];
    [v14 setCornerRadius:v13];

    uint64_t v15 = *MEMORY[0x263F15A20];
    v16 = [(UIView *)v9->_contentView layer];
    [v16 setCornerCurve:v15];

    v17 = [(UIView *)v9->_contentView layer];
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 1.0);

    [(TVRUIChannelButton *)v9 addSubview:v9->_contentView];
    v18 = [[TVRUIPageButton alloc] initWithType:26 hasTapAction:0];
    topButton = v9->_topButton;
    v9->_topButton = v18;

    v20 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIPageButton *)v9->_topButton setBackgroundColor:v20];

    [(TVRUIButton *)v9->_topButton setDisableHighlightEffect:1];
    [(UIView *)v9->_contentView addSubview:v9->_topButton];
    v21 = [[TVRUIPageButton alloc] initWithType:27 hasTapAction:0];
    bottomButton = v9->_bottomButton;
    v9->_bottomButton = v21;

    CATransform3DMakeRotation(&v34, 3.14159265, 0.0, 0.0, 1.0);
    v23 = [(TVRUIPageButton *)v9->_bottomButton contentLayer];
    CATransform3D v33 = v34;
    [v23 setTransform:&v33];

    v24 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIPageButton *)v9->_bottomButton setBackgroundColor:v24];

    [(TVRUIButton *)v9->_bottomButton setDisableHighlightEffect:1];
    [(UIView *)v9->_contentView addSubview:v9->_bottomButton];
    v25 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v25;

    [(UILabel *)v9->_titleLabel setText:v6];
    v27 = [v7 buttonTextColor];
    [(UILabel *)v9->_titleLabel setTextColor:v27];

    v28 = [v7 pagingButtonFont];
    [(UILabel *)v9->_titleLabel setFont:v28];

    [(UILabel *)v9->_titleLabel setTextAlignment:1];
    [(UILabel *)v9->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UIView *)v9->_contentView addSubview:v9->_titleLabel];
    [(UILabel *)v9->_titleLabel sizeToFit];
    [(TVRUIPageButton *)v9->_topButton addTarget:v9 action:sel__buttonPressed_ forControlEvents:1];
    [(TVRUIPageButton *)v9->_topButton addTarget:v9 action:sel__buttonReleased_ forControlEvents:448];
    [(TVRUIPageButton *)v9->_bottomButton addTarget:v9 action:sel__buttonPressed_ forControlEvents:1];
    [(TVRUIPageButton *)v9->_bottomButton addTarget:v9 action:sel__buttonReleased_ forControlEvents:448];
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v9 selector:sel__darkenSystemColorsChanged_ name:*MEMORY[0x263F831A0] object:0];

    [(TVRUIChannelButton *)v9 setUserInteractionEnabled:1];
    v30 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v9 action:sel_expand];
    [(TVRUIChannelButton *)v9 addGestureRecognizer:v30];
    v31 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIChannelButton *)v9 setBackgroundColor:v31];

    [(TVRUIButton *)v9->_topButton setEnabled:0];
    [(TVRUIButton *)v9->_bottomButton setEnabled:0];
  }
  return v9;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (a3)
  {
    v4 = [(TVRUIChannelButton *)self topButton];
    [v4 setEnabled:1];

    v5 = [(TVRUIChannelButton *)self bottomButton];
    [v5 setEnabled:1];

    id v6 = [(TVRUIChannelButton *)self styleProvider];
    id v7 = [v6 buttonTextColor];
    double v8 = 1.0;
  }
  else
  {
    v9 = [(TVRUIChannelButton *)self styleProvider];
    [v9 disabledButtonAlpha];
    double v8 = v10;

    v11 = [(TVRUIChannelButton *)self topButton];
    [v11 setEnabled:0];

    double v12 = [(TVRUIChannelButton *)self bottomButton];
    [v12 setEnabled:0];

    id v6 = [(TVRUIChannelButton *)self styleProvider];
    id v7 = [v6 tintColorForButtonDisabled];
  }
  double v13 = [(TVRUIChannelButton *)self titleLabel];
  [v13 setTextColor:v7];

  [(TVRUIChannelButton *)self setAlpha:v8];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)TVRUIChannelButton;
  [(TVRUIChannelButton *)&v30 layoutSubviews];
  [(TVRUIChannelButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(TVRUIChannelButton *)self isExpanded];
  double v12 = [(TVRUIChannelButton *)self contentView];
  double v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setBounds:", 0.0, 0.0, v8, 144.0);

    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    double MidX = CGRectGetMidX(v31);
    uint64_t v15 = [(TVRUIChannelButton *)self contentView];
    [v15 bounds];
    double MidY = CGRectGetMidY(v32);
    v17 = [(TVRUIChannelButton *)self titleLabel];
    objc_msgSend(v17, "setCenter:", MidX, MidY);

    v18 = [(TVRUIChannelButton *)self topButton];
    double v19 = 72.0;
    objc_msgSend(v18, "setFrame:", 0.0, 0.0, v8, 72.0);

    v20 = [(TVRUIChannelButton *)self contentView];
    [v20 bounds];
    double MaxY = CGRectGetMidY(v33);
  }
  else
  {
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    double v22 = CGRectGetMidX(v34);
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    double v23 = CGRectGetMidY(v35);
    v24 = [(TVRUIChannelButton *)self titleLabel];
    objc_msgSend(v24, "setCenter:", v22, v23);

    v25 = [(TVRUIChannelButton *)self titleLabel];
    [v25 frame];
    CGFloat v26 = CGRectGetMinY(v36) + -10.0;
    v27 = [(TVRUIChannelButton *)self topButton];
    double v19 = 10.0;
    objc_msgSend(v27, "setFrame:", 0.0, v26, v8, 10.0);

    v20 = [(TVRUIChannelButton *)self titleLabel];
    [v20 frame];
    double MaxY = CGRectGetMaxY(v37);
  }
  double v28 = MaxY;
  v29 = [(TVRUIChannelButton *)self bottomButton];
  objc_msgSend(v29, "setFrame:", 0.0, v28, v8, v19);
}

- (void)expand
{
  if (![(TVRUIChannelButton *)self isExpanded] && ![(TVRUIChannelButton *)self isAnimating])
  {
    double v3 = [(TVRUIChannelButton *)self contentView];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v70 = v8;

    v88.origin.x = v5;
    v88.origin.y = v7;
    v88.size.width = v9;
    v88.size.height = 144.0;
    CGFloat Width = CGRectGetWidth(v88);
    v89.origin.x = v5;
    v89.origin.y = v7;
    v89.size.width = v9;
    v89.size.height = 144.0;
    double MidY = CGRectGetMidY(v89);
    double v11 = MidY + -36.0;
    double v12 = [(TVRUIChannelButton *)self titleLabel];
    [v12 frame];
    double v14 = 36.0 - v13 * 0.5;

    double v15 = MidY + 36.0;
    v16 = [(TVRUIChannelButton *)self titleLabel];
    [v16 frame];
    double v18 = v17 * 0.5 + 36.0;

    double v19 = [(TVRUIChannelButton *)self styleProvider];
    v20 = [v19 pagingButtonBackgroundColor];

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [MEMORY[0x263F158F8] setAnimationDuration:1.0];
    v21 = (void *)MEMORY[0x263F158F8];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __28__TVRUIChannelButton_expand__block_invoke;
    v76[3] = &unk_264800900;
    CGFloat v78 = v5;
    CGFloat v79 = v7;
    CGFloat v80 = v70;
    uint64_t v81 = 0x4062000000000000;
    CGFloat v82 = Width;
    uint64_t v83 = 0x4052000000000000;
    double v84 = v11;
    double v85 = v14;
    double v86 = v15;
    double v87 = v18;
    v76[4] = self;
    id v77 = v20;
    id v73 = v20;
    [v21 setCompletionBlock:v76];
    id v22 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v22 setKeyPath:@"position.y"];
    double v23 = [NSNumber numberWithDouble:v14];
    v75 = v22;
    [v22 setToValue:v23];

    v24 = [(TVRUIChannelButton *)self topButton];
    v25 = [v24 contentLayer];
    [v25 addAnimation:v22 forKey:@"topChevronContentLayerPositionAnim"];

    CGFloat v26 = [(TVRUIChannelButton *)self topButton];
    v27 = [v26 leftWing];
    double v28 = [(TVRUIChannelButton *)self chevronLeftWingAnimationExpand:1];
    [v27 addAnimation:v28 forKey:@"transform.rotate"];

    v29 = [(TVRUIChannelButton *)self topButton];
    objc_super v30 = [v29 rightWing];
    CGRect v31 = [(TVRUIChannelButton *)self chevronRightWingAnimationExpand:1];
    [v30 addAnimation:v31 forKey:@"transform.rotate"];

    id v32 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v32 setKeyPath:@"bounds.size.height"];
    CGRect v33 = [NSNumber numberWithDouble:72.0];
    v72 = v32;
    [v32 setToValue:v33];

    CGRect v34 = [(TVRUIChannelButton *)self topButton];
    CGRect v35 = [v34 layer];
    [v35 addAnimation:v32 forKey:@"topChevronBoundsAnim"];

    id v36 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v36 setKeyPath:@"position.y"];
    CGRect v37 = [NSNumber numberWithDouble:v11];
    v71 = v36;
    [v36 setToValue:v37];

    v38 = [(TVRUIChannelButton *)self topButton];
    v39 = [v38 layer];
    [v39 addAnimation:v36 forKey:@"topChevronPositionAnim"];

    id v40 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v40 setKeyPath:@"position.y"];
    v90.origin.x = v5;
    v90.origin.y = v7;
    v90.size.width = v70;
    v90.size.height = 144.0;
    v41 = [NSNumber numberWithDouble:CGRectGetMidY(v90)];
    [v40 setToValue:v41];

    v42 = [(TVRUIChannelButton *)self titleLabel];
    v43 = [v42 layer];
    [v43 addAnimation:v40 forKey:@"channelPosAnim"];

    id v44 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v44 setKeyPath:@"position.y"];
    v45 = [NSNumber numberWithDouble:v18];
    [v44 setToValue:v45];

    v46 = [(TVRUIChannelButton *)self bottomButton];
    v47 = [v46 contentLayer];
    [v47 addAnimation:v44 forKey:@"bottomChevronContentLayerPositionAnim"];

    v48 = [(TVRUIChannelButton *)self bottomButton];
    v49 = [v48 leftWing];
    v50 = [(TVRUIChannelButton *)self chevronLeftWingAnimationExpand:1];
    [v49 addAnimation:v50 forKey:@"transform.rotate"];

    v51 = [(TVRUIChannelButton *)self bottomButton];
    v52 = [v51 rightWing];
    v53 = [(TVRUIChannelButton *)self chevronRightWingAnimationExpand:1];
    [v52 addAnimation:v53 forKey:@"transform.rotate"];

    id v54 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v54 setKeyPath:@"bounds.size.height"];
    v55 = [NSNumber numberWithDouble:72.0];
    [v54 setToValue:v55];

    v56 = [(TVRUIChannelButton *)self bottomButton];
    v57 = [v56 layer];
    [v57 addAnimation:v54 forKey:@"bottomChevronBoundsAnim"];

    id v58 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v58 setKeyPath:@"position.y"];
    v59 = [NSNumber numberWithDouble:v15];
    [v58 setToValue:v59];

    v60 = [(TVRUIChannelButton *)self bottomButton];
    v61 = [v60 layer];
    [v61 addAnimation:v58 forKey:@"bottomChevronPositionAnim"];

    id v62 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v62 setKeyPath:@"backgroundColor"];
    id v63 = v73;
    objc_msgSend(v62, "setToValue:", objc_msgSend(v63, "CGColor"));
    v64 = [(TVRUIChannelButton *)self contentView];
    v65 = [v64 layer];
    [v65 addAnimation:v62 forKey:@"backgroundColorAnimation"];

    id v66 = [(TVRUIChannelButton *)self _newSpringAnimation];
    [v66 setKeyPath:@"bounds.size.height"];
    v67 = [NSNumber numberWithDouble:144.0];
    [v66 setToValue:v67];

    v68 = [(TVRUIChannelButton *)self contentView];
    v69 = [v68 layer];
    [v69 addAnimation:v66 forKey:@"contentLayerBoundsAnim"];

    [MEMORY[0x263F158F8] commit];
    [(TVRUIChannelButton *)self setIsAnimating:1];
  }
}

uint64_t __28__TVRUIChannelButton_expand__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsExpanded:1];
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  double MidY = CGRectGetMidY(*(CGRect *)(a1 + 48));
  double v4 = [*(id *)(a1 + 32) titleLabel];
  CGFloat v5 = [v4 layer];
  objc_msgSend(v5, "setPosition:", MidX, MidY);

  double v6 = [*(id *)(a1 + 32) titleLabel];
  CGFloat v7 = [v6 layer];
  [v7 removeAllAnimations];

  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = [*(id *)(a1 + 32) topButton];
  double v11 = [v10 layer];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v9);

  double v12 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  double v13 = *(double *)(a1 + 96);
  double v14 = [*(id *)(a1 + 32) topButton];
  double v15 = [v14 layer];
  objc_msgSend(v15, "setPosition:", v12, v13);

  v16 = [*(id *)(a1 + 32) topButton];
  double v17 = [v16 layer];
  [v17 removeAllAnimations];

  double v18 = [*(id *)(a1 + 32) topButton];
  double v19 = [v18 contentLayer];
  [v19 position];
  double v21 = v20;
  double v22 = *(double *)(a1 + 104);
  double v23 = [*(id *)(a1 + 32) topButton];
  v24 = [v23 contentLayer];
  objc_msgSend(v24, "setPosition:", v21, v22);

  v25 = [*(id *)(a1 + 32) topButton];
  CGFloat v26 = [v25 contentLayer];
  [v26 removeAllAnimations];

  v27 = *(void **)(a1 + 32);
  uint64_t v28 = [v27 isExpanded];
  if (v27)
  {
    [v27 _transformForLeftWingExpanded:v28];
  }
  else
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
  }
  v29 = [*(id *)(a1 + 32) topButton];
  objc_super v30 = [v29 leftWing];
  v118[4] = v123;
  v118[5] = v124;
  v118[6] = v125;
  v118[7] = v126;
  v118[0] = v119;
  v118[1] = v120;
  v118[2] = v121;
  v118[3] = v122;
  [v30 setTransform:v118];

  CGRect v31 = *(void **)(a1 + 32);
  uint64_t v32 = [v31 isExpanded];
  if (v31)
  {
    [v31 _transformForRightWingExpanded:v32];
  }
  else
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
  }
  CGRect v33 = [*(id *)(a1 + 32) topButton];
  CGRect v34 = [v33 rightWing];
  v109[4] = v114;
  v109[5] = v115;
  v109[6] = v116;
  v109[7] = v117;
  v109[0] = v110;
  v109[1] = v111;
  v109[2] = v112;
  v109[3] = v113;
  [v34 setTransform:v109];

  CGRect v35 = [*(id *)(a1 + 32) topButton];
  id v36 = [v35 leftWing];
  [v36 removeAllAnimations];

  CGRect v37 = [*(id *)(a1 + 32) topButton];
  v38 = [v37 rightWing];
  [v38 removeAllAnimations];

  double v39 = *(double *)(a1 + 80);
  double v40 = *(double *)(a1 + 88);
  v41 = [*(id *)(a1 + 32) bottomButton];
  v42 = [v41 layer];
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v39, v40);

  double v43 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  double v44 = *(double *)(a1 + 112);
  v45 = [*(id *)(a1 + 32) bottomButton];
  v46 = [v45 layer];
  objc_msgSend(v46, "setPosition:", v43, v44);

  v47 = [*(id *)(a1 + 32) bottomButton];
  v48 = [v47 layer];
  [v48 removeAllAnimations];

  v49 = *(void **)(a1 + 32);
  uint64_t v50 = [v49 isExpanded];
  if (v49)
  {
    [v49 _transformForLeftWingExpanded:v50];
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
  }
  v51 = [*(id *)(a1 + 32) bottomButton];
  v52 = [v51 leftWing];
  v100[4] = v105;
  v100[5] = v106;
  v100[6] = v107;
  v100[7] = v108;
  v100[0] = v101;
  v100[1] = v102;
  v100[2] = v103;
  v100[3] = v104;
  [v52 setTransform:v100];

  v53 = *(void **)(a1 + 32);
  uint64_t v54 = [v53 isExpanded];
  if (v53)
  {
    [v53 _transformForRightWingExpanded:v54];
  }
  else
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
  }
  v55 = [*(id *)(a1 + 32) bottomButton];
  v56 = [v55 rightWing];
  v91[4] = v96;
  v91[5] = v97;
  v91[6] = v98;
  v91[7] = v99;
  v91[0] = v92;
  v91[1] = v93;
  v91[2] = v94;
  v91[3] = v95;
  [v56 setTransform:v91];

  v57 = [*(id *)(a1 + 32) bottomButton];
  id v58 = [v57 leftWing];
  [v58 removeAllAnimations];

  v59 = [*(id *)(a1 + 32) bottomButton];
  v60 = [v59 rightWing];
  [v60 removeAllAnimations];

  v61 = [*(id *)(a1 + 32) topButton];
  id v62 = [v61 contentLayer];
  [v62 position];
  double v64 = v63;
  double v65 = *(double *)(a1 + 120);
  id v66 = [*(id *)(a1 + 32) bottomButton];
  v67 = [v66 contentLayer];
  objc_msgSend(v67, "setPosition:", v64, v65);

  v68 = [*(id *)(a1 + 32) bottomButton];
  v69 = [v68 contentLayer];
  [v69 removeAllAnimations];

  CGFloat v70 = [*(id *)(a1 + 32) contentView];
  v71 = [v70 layer];
  [v71 position];
  double v73 = v72;
  double v75 = v74;

  double v76 = *(double *)(a1 + 48);
  double v77 = *(double *)(a1 + 56);
  double v78 = *(double *)(a1 + 64);
  double v79 = *(double *)(a1 + 72);
  CGFloat v80 = [*(id *)(a1 + 32) contentView];
  uint64_t v81 = [v80 layer];
  objc_msgSend(v81, "setFrame:", v76, v77, v78, v79);

  CGFloat v82 = [*(id *)(a1 + 32) contentView];
  uint64_t v83 = [v82 layer];
  objc_msgSend(v83, "setPosition:", v73, v75);

  uint64_t v84 = *(void *)(a1 + 40);
  double v85 = [*(id *)(a1 + 32) contentView];
  [v85 setBackgroundColor:v84];

  double v86 = [*(id *)(a1 + 32) contentView];
  double v87 = [v86 layer];
  [v87 removeAllAnimations];

  CGRect v88 = [*(id *)(a1 + 32) topButton];
  [v88 setEnabled:1];

  CGRect v89 = [*(id *)(a1 + 32) bottomButton];
  [v89 setEnabled:1];

  return [*(id *)(a1 + 32) setIsAnimating:0];
}

- (id)_newSpringAnimation
{
  id v2 = objc_alloc_init(MEMORY[0x263F15890]);
  [v2 setMass:2.0];
  [v2 setStiffness:300.0];
  [v2 setDamping:50.0];
  [v2 settlingDuration];
  objc_msgSend(v2, "setDuration:");
  [v2 setFillMode:*MEMORY[0x263F15AB0]];
  [v2 setRemovedOnCompletion:0];
  return v2;
}

- (CATransform3D)_transformForLeftWingExpanded:(SEL)a3
{
  double v4 = -0.279253;
  if (a4) {
    double v4 = -0.785398;
  }
  return CATransform3DMakeRotation(retstr, v4, 0.0, 0.0, 1.0);
}

- (CATransform3D)_transformForRightWingExpanded:(SEL)a3
{
  double v4 = 0.279253;
  if (a4) {
    double v4 = 0.785398;
  }
  return CATransform3DMakeRotation(retstr, v4, 0.0, 0.0, 1.0);
}

- (id)chevronLeftWingAnimationExpand:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TVRUIChannelButton *)self _newSpringAnimation];
  [v4 setKeyPath:@"transform.rotation.z"];
  if (v3) {
    CGFloat v5 = &unk_26DB65D08;
  }
  else {
    CGFloat v5 = &unk_26DB65D18;
  }
  [v4 setToValue:v5];
  return v4;
}

- (id)chevronRightWingAnimationExpand:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TVRUIChannelButton *)self _newSpringAnimation];
  [v4 setKeyPath:@"transform.rotation.z"];
  if (v3) {
    CGFloat v5 = &unk_26DB65D28;
  }
  else {
    CGFloat v5 = &unk_26DB65D38;
  }
  [v4 setToValue:v5];
  return v4;
}

- (void)collapse
{
  if ([(TVRUIChannelButton *)self isExpanded])
  {
    if (![(TVRUIChannelButton *)self isAnimating])
    {
      BOOL v3 = [(TVRUIChannelButton *)self contentView];
      [v3 bounds];
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      CGFloat v9 = v8;

      v85.origin.x = v5;
      v85.origin.y = v7;
      v85.size.width = v9;
      v85.size.height = 64.0;
      CGFloat Width = CGRectGetWidth(v85);
      v86.origin.x = v5;
      v86.origin.y = v7;
      v86.size.width = v9;
      v86.size.height = 64.0;
      double MidY = CGRectGetMidY(v86);
      double v12 = [(TVRUIChannelButton *)self titleLabel];
      double v13 = [v12 layer];
      [v13 frame];
      double v15 = MidY - v14 * 0.5 + -5.0;

      v16 = [(TVRUIChannelButton *)self titleLabel];
      double v17 = [v16 layer];
      [v17 frame];
      double v19 = MidY + v18 * 0.5 + 5.0;

      double v20 = [MEMORY[0x263F825C8] clearColor];
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [MEMORY[0x263F158F8] setAnimationDuration:1.0];
      double v21 = (void *)MEMORY[0x263F158F8];
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __30__TVRUIChannelButton_collapse__block_invoke;
      v74[3] = &unk_264800928;
      CGFloat v76 = v5;
      CGFloat v77 = v7;
      CGFloat v78 = v9;
      uint64_t v79 = 0x4050000000000000;
      CGFloat v80 = Width;
      uint64_t v81 = 0x4024000000000000;
      double v82 = v15;
      uint64_t v83 = 0x4014000000000000;
      double v84 = v19;
      v74[4] = self;
      id v75 = v20;
      id v72 = v20;
      [v21 setCompletionBlock:v74];
      id v22 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v22 setKeyPath:@"position.y"];
      double v23 = [NSNumber numberWithDouble:5.0];
      double v73 = v22;
      [v22 setToValue:v23];

      v24 = [(TVRUIChannelButton *)self topButton];
      v25 = [v24 contentLayer];
      [v25 addAnimation:v22 forKey:@"topChevronContentLayerPositionAnim"];

      CGFloat v26 = [(TVRUIChannelButton *)self topButton];
      v27 = [v26 leftWing];
      uint64_t v28 = [(TVRUIChannelButton *)self chevronLeftWingAnimationExpand:0];
      [v27 addAnimation:v28 forKey:@"transform.rotate"];

      v29 = [(TVRUIChannelButton *)self topButton];
      objc_super v30 = [v29 rightWing];
      CGRect v31 = [(TVRUIChannelButton *)self chevronRightWingAnimationExpand:0];
      [v30 addAnimation:v31 forKey:@"transform.rotate"];

      id v32 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v32 setKeyPath:@"bounds.size.height"];
      CGRect v33 = [NSNumber numberWithDouble:10.0];
      v71 = v32;
      [v32 setToValue:v33];

      CGRect v34 = [(TVRUIChannelButton *)self topButton];
      CGRect v35 = [v34 layer];
      [v35 addAnimation:v32 forKey:@"topChevronBoundsAnim"];

      id v36 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v36 setKeyPath:@"position.y"];
      CGRect v37 = [NSNumber numberWithDouble:v15];
      CGFloat v70 = v36;
      [v36 setToValue:v37];

      v38 = [(TVRUIChannelButton *)self topButton];
      double v39 = [v38 layer];
      [v39 addAnimation:v36 forKey:@"topChevronPositionAnim"];

      id v40 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v40 setKeyPath:@"position.y"];
      v41 = [NSNumber numberWithDouble:MidY];
      [v40 setToValue:v41];

      v42 = [(TVRUIChannelButton *)self titleLabel];
      double v43 = [v42 layer];
      [v43 addAnimation:v40 forKey:@"channelPosAnim"];

      id v44 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v44 setKeyPath:@"position.y"];
      v45 = [NSNumber numberWithDouble:5.0];
      [v44 setToValue:v45];

      v46 = [(TVRUIChannelButton *)self bottomButton];
      v47 = [v46 contentLayer];
      [v47 addAnimation:v44 forKey:@"bottomChevronContentLayerPositionAnim"];

      v48 = [(TVRUIChannelButton *)self bottomButton];
      v49 = [v48 leftWing];
      uint64_t v50 = [(TVRUIChannelButton *)self chevronLeftWingAnimationExpand:0];
      [v49 addAnimation:v50 forKey:@"transform.rotate"];

      v51 = [(TVRUIChannelButton *)self bottomButton];
      v52 = [v51 rightWing];
      v53 = [(TVRUIChannelButton *)self chevronRightWingAnimationExpand:0];
      [v52 addAnimation:v53 forKey:@"transform.rotate"];

      id v54 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v54 setKeyPath:@"bounds.size.height"];
      v55 = [NSNumber numberWithDouble:10.0];
      [v54 setToValue:v55];

      v56 = [(TVRUIChannelButton *)self bottomButton];
      v57 = [v56 layer];
      [v57 addAnimation:v54 forKey:@"bottomChevronBoundsAnim"];

      id v58 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v58 setKeyPath:@"position.y"];
      v59 = [NSNumber numberWithDouble:v19];
      [v58 setToValue:v59];

      v60 = [(TVRUIChannelButton *)self bottomButton];
      v61 = [v60 layer];
      [v61 addAnimation:v58 forKey:@"bottomChevronPositionAnim"];

      id v62 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v62 setKeyPath:@"backgroundColor"];
      id v63 = v72;
      objc_msgSend(v62, "setToValue:", objc_msgSend(v63, "CGColor"));
      double v64 = [(TVRUIChannelButton *)self contentView];
      double v65 = [v64 layer];
      [v65 addAnimation:v62 forKey:@"backgroundColorAnimation"];

      id v66 = [(TVRUIChannelButton *)self _newSpringAnimation];
      [v66 setKeyPath:@"bounds.size.height"];
      v67 = [NSNumber numberWithDouble:64.0];
      [v66 setToValue:v67];

      v68 = [(TVRUIChannelButton *)self contentView];
      v69 = [v68 layer];
      [v69 addAnimation:v66 forKey:@"contentLayerBoundsAnim"];

      [MEMORY[0x263F158F8] commit];
      [(TVRUIChannelButton *)self setIsAnimating:1];
    }
  }
}

uint64_t __30__TVRUIChannelButton_collapse__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsExpanded:0];
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  double MidY = CGRectGetMidY(*(CGRect *)(a1 + 48));
  double v4 = [*(id *)(a1 + 32) titleLabel];
  CGFloat v5 = [v4 layer];
  objc_msgSend(v5, "setPosition:", MidX, MidY);

  double v6 = [*(id *)(a1 + 32) titleLabel];
  CGFloat v7 = [v6 layer];
  [v7 removeAllAnimations];

  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = [*(id *)(a1 + 32) topButton];
  double v11 = [v10 layer];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v9);

  double v12 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  double v13 = *(double *)(a1 + 96);
  double v14 = [*(id *)(a1 + 32) topButton];
  double v15 = [v14 layer];
  objc_msgSend(v15, "setPosition:", v12, v13);

  v16 = [*(id *)(a1 + 32) topButton];
  double v17 = [v16 layer];
  [v17 removeAllAnimations];

  double v18 = [*(id *)(a1 + 32) topButton];
  double v19 = [v18 contentLayer];
  [v19 position];
  double v21 = v20;
  double v22 = *(double *)(a1 + 104);
  double v23 = [*(id *)(a1 + 32) topButton];
  v24 = [v23 contentLayer];
  objc_msgSend(v24, "setPosition:", v21, v22);

  v25 = [*(id *)(a1 + 32) topButton];
  CGFloat v26 = [v25 contentLayer];
  [v26 removeAllAnimations];

  v27 = *(void **)(a1 + 32);
  uint64_t v28 = [v27 isExpanded];
  if (v27)
  {
    [v27 _transformForLeftWingExpanded:v28];
  }
  else
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
  }
  v29 = [*(id *)(a1 + 32) topButton];
  objc_super v30 = [v29 leftWing];
  v118[4] = v123;
  v118[5] = v124;
  v118[6] = v125;
  v118[7] = v126;
  v118[0] = v119;
  v118[1] = v120;
  v118[2] = v121;
  v118[3] = v122;
  [v30 setTransform:v118];

  CGRect v31 = *(void **)(a1 + 32);
  uint64_t v32 = [v31 isExpanded];
  if (v31)
  {
    [v31 _transformForRightWingExpanded:v32];
  }
  else
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
  }
  CGRect v33 = [*(id *)(a1 + 32) topButton];
  CGRect v34 = [v33 rightWing];
  v109[4] = v114;
  v109[5] = v115;
  v109[6] = v116;
  v109[7] = v117;
  v109[0] = v110;
  v109[1] = v111;
  v109[2] = v112;
  v109[3] = v113;
  [v34 setTransform:v109];

  CGRect v35 = [*(id *)(a1 + 32) topButton];
  id v36 = [v35 leftWing];
  [v36 removeAllAnimations];

  CGRect v37 = [*(id *)(a1 + 32) topButton];
  v38 = [v37 rightWing];
  [v38 removeAllAnimations];

  double v39 = *(double *)(a1 + 80);
  double v40 = *(double *)(a1 + 88);
  v41 = [*(id *)(a1 + 32) bottomButton];
  v42 = [v41 layer];
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v39, v40);

  double v43 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  double v44 = *(double *)(a1 + 112);
  v45 = [*(id *)(a1 + 32) bottomButton];
  v46 = [v45 layer];
  objc_msgSend(v46, "setPosition:", v43, v44);

  v47 = [*(id *)(a1 + 32) bottomButton];
  v48 = [v47 layer];
  [v48 removeAllAnimations];

  v49 = *(void **)(a1 + 32);
  uint64_t v50 = [v49 isExpanded];
  if (v49)
  {
    [v49 _transformForLeftWingExpanded:v50];
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
  }
  v51 = [*(id *)(a1 + 32) bottomButton];
  v52 = [v51 leftWing];
  v100[4] = v105;
  v100[5] = v106;
  v100[6] = v107;
  v100[7] = v108;
  v100[0] = v101;
  v100[1] = v102;
  v100[2] = v103;
  v100[3] = v104;
  [v52 setTransform:v100];

  v53 = *(void **)(a1 + 32);
  uint64_t v54 = [v53 isExpanded];
  if (v53)
  {
    [v53 _transformForRightWingExpanded:v54];
  }
  else
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
  }
  v55 = [*(id *)(a1 + 32) bottomButton];
  v56 = [v55 rightWing];
  v91[4] = v96;
  v91[5] = v97;
  v91[6] = v98;
  v91[7] = v99;
  v91[0] = v92;
  v91[1] = v93;
  v91[2] = v94;
  v91[3] = v95;
  [v56 setTransform:v91];

  v57 = [*(id *)(a1 + 32) bottomButton];
  id v58 = [v57 leftWing];
  [v58 removeAllAnimations];

  v59 = [*(id *)(a1 + 32) bottomButton];
  v60 = [v59 rightWing];
  [v60 removeAllAnimations];

  v61 = [*(id *)(a1 + 32) topButton];
  id v62 = [v61 contentLayer];
  [v62 position];
  double v64 = v63;
  double v65 = *(double *)(a1 + 104);
  id v66 = [*(id *)(a1 + 32) bottomButton];
  v67 = [v66 contentLayer];
  objc_msgSend(v67, "setPosition:", v64, v65);

  v68 = [*(id *)(a1 + 32) bottomButton];
  v69 = [v68 contentLayer];
  [v69 removeAllAnimations];

  CGFloat v70 = [*(id *)(a1 + 32) contentView];
  v71 = [v70 layer];
  [v71 position];
  double v73 = v72;
  double v75 = v74;

  double v76 = *(double *)(a1 + 48);
  double v77 = *(double *)(a1 + 56);
  double v78 = *(double *)(a1 + 64);
  double v79 = *(double *)(a1 + 72);
  CGFloat v80 = [*(id *)(a1 + 32) contentView];
  uint64_t v81 = [v80 layer];
  objc_msgSend(v81, "setFrame:", v76, v77, v78, v79);

  double v82 = [*(id *)(a1 + 32) contentView];
  uint64_t v83 = [v82 layer];
  objc_msgSend(v83, "setPosition:", v73, v75);

  uint64_t v84 = *(void *)(a1 + 40);
  CGRect v85 = [*(id *)(a1 + 32) contentView];
  [v85 setBackgroundColor:v84];

  CGRect v86 = [*(id *)(a1 + 32) contentView];
  double v87 = [v86 layer];
  [v87 removeAllAnimations];

  CGRect v88 = [*(id *)(a1 + 32) topButton];
  [v88 setEnabled:0];

  CGRect v89 = [*(id *)(a1 + 32) bottomButton];
  [v89 setEnabled:0];

  return [*(id *)(a1 + 32) setIsAnimating:0];
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    double v8 = "-[TVRUIChannelButton _darkenSystemColorsChanged:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  CGFloat v5 = [(TVRUIChannelButton *)self styleProvider];
  double v6 = [v5 buttonBackgroundColor];
  [(TVRUIChannelButton *)self setBackgroundColor:v6];
}

- (void)_buttonPressed:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIChannelButton *)self buttonEventDelegate];
  if (v4)
  {
    CGFloat v5 = (void *)v4;
    double v6 = [(TVRUIChannelButton *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(TVRUIChannelButton *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_buttonReleased:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIChannelButton *)self buttonEventDelegate];
  if (v4)
  {
    CGFloat v5 = (void *)v4;
    double v6 = [(TVRUIChannelButton *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(TVRUIChannelButton *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setButtonEventDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (TVRUIPageButton)topButton
{
  return self->_topButton;
}

- (void)setTopButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TVRUIPageButton)bottomButton
{
  return self->_bottomButton;
}

- (void)setBottomButton:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_bottomButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_topButton, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

@end
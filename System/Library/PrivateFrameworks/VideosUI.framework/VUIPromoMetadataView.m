@interface VUIPromoMetadataView
- (BOOL)onlySkipButtonAvailable;
- (CGSize)expectedImageSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSString)addToUpNextSymbolName;
- (NSString)addedToUpNextSymbolName;
- (TVPMediaItemSkipInfo)skipInfo;
- (VUIButton)computationOnlyButton;
- (VUIButton)skipButton;
- (VUIImageView)titleImageView;
- (VUIMediaTagsView)mediaTagsView;
- (VUIMediaTagsViewLayout)mediaTagsViewLayout;
- (VUIPromoMetadataView)init;
- (VUIPromoMetadataViewDelegate)delegate;
- (VUITextLayout)buttonTextLayout;
- (VUIUpNextButton)upNextButton;
- (double)defaultButtonHeight;
- (double)imageViewBottomMargin;
- (double)maxButtonWidth;
- (double)mediaTagsViewBottomMargin;
- (double)minButtonWidth;
- (double)upNextButtonRightMargin;
- (id)_createComputationOnlyButton;
- (id)_createSkipButtonWithTitle:(id)a3;
- (id)_createUpNextButtonWithPromoInfo:(id)a3;
- (void)_configureBasicLayoutForButton:(id)a3;
- (void)_configureLayout;
- (void)_skipButtonTapped:(id)a3;
- (void)_upNextButtonTapped:(id)a3;
- (void)setAddToUpNextSymbolName:(id)a3;
- (void)setAddedToUpNextSymbolName:(id)a3;
- (void)setButtonTextLayout:(id)a3;
- (void)setComputationOnlyButton:(id)a3;
- (void)setDefaultButtonHeight:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExpectedImageSize:(CGSize)a3;
- (void)setImageViewBottomMargin:(double)a3;
- (void)setMaxButtonWidth:(double)a3;
- (void)setMediaTagsView:(id)a3;
- (void)setMediaTagsViewBottomMargin:(double)a3;
- (void)setMediaTagsViewLayout:(id)a3;
- (void)setMinButtonWidth:(double)a3;
- (void)setOnlySkipButtonAvailable:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setSkipInfo:(id)a3;
- (void)setTitleImageView:(id)a3;
- (void)setUpNextButton:(id)a3;
- (void)setUpNextButtonRightMargin:(double)a3;
- (void)updateWithInfo:(id)a3;
@end

@implementation VUIPromoMetadataView

- (VUIPromoMetadataView)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIPromoMetadataView;
  v2 = [(VUIPromoMetadataView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(VUIPromoMetadataView *)v2 _configureLayout];
    [(VUIPromoMetadataView *)v3 setAddToUpNextSymbolName:@"plus"];
    [(VUIPromoMetadataView *)v3 setAddedToUpNextSymbolName:@"checkmark"];
    [(VUIPromoMetadataView *)v3 vui_setOverrideUserInterfaceStyle:2];
  }
  return v3;
}

- (void)updateWithInfo:(id)a3
{
  id v4 = a3;
  [(VUIPromoMetadataView *)self setSkipInfo:v4];
  v48 = v4;
  objc_super v5 = [v4 promoInfo];
  [(VUIPromoMetadataView *)self setOnlySkipButtonAvailable:1];
  v6 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v7 = [v6 isNetworkReachable];

  if (v7)
  {
    v47 = [v5 titleImageURLString];
    if (v47)
    {
      v8 = [(VUIPromoMetadataView *)self titleImageView];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v11 = objc_alloc(MEMORY[0x1E4FB3CE0]);
        id v10 = (id)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      }
      v12 = v10;

      v13 = [v5 title];
      [v12 setAccessibilityLabel:v13];

      [v12 setAccessibilityIdentifier:@"TitleImage"];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __39__VUIPromoMetadataView_updateWithInfo___block_invoke;
      v49[3] = &unk_1E6DF6038;
      id v50 = v12;
      id v14 = v12;
      [v5 getTitleImageUsingCompletionHandler:v49];
      [v5 expectedImageSize];
      -[VUIPromoMetadataView setExpectedImageSize:](self, "setExpectedImageSize:");
      v15 = [(VUIPromoMetadataView *)self titleImageView];
      [(VUIPromoMetadataView *)self vui_addSubview:v14 oldView:v15];

      [(VUIPromoMetadataView *)self setTitleImageView:v14];
      [(VUIPromoMetadataView *)self setOnlySkipButtonAvailable:0];
    }
    else
    {
      [(VUIPromoMetadataView *)self setTitleImageView:0];
    }
    v16 = objc_opt_new();
    v17 = [v5 genre];
    if (v17) {
      [v16 setObject:v17 forKey:@"genreName"];
    }
    v18 = [v5 movieRuntime];
    v19 = v18;
    if (v18)
    {
      [v18 doubleValue];
      if (v20 != 0.0)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
        [v16 setObject:v21 forKey:@"duration"];
      }
    }
    v22 = [v5 ratingDisplayName];
    uint64_t v23 = [v5 ratingSystem];
    v24 = (void *)v23;
    if (v22 && v23)
    {
      [v16 setObject:v22 forKey:@"ratingName"];
      [v16 setObject:v24 forKey:@"ratingSystem"];
    }
    if ([v16 count])
    {
      v25 = [[VUIContentMetadata alloc] initWithDictionary:v16];
      int v46 = v7;
      [(VUIPromoMetadataView *)self mediaTagsViewLayout];
      v45 = v16;
      v26 = v22;
      v27 = v19;
      v29 = v28 = v17;
      v30 = [(VUIPromoMetadataView *)self mediaTagsView];
      v31 = +[VUIMediaTagsView tagsViewWithMetadata:v25 layout:v29 existingView:v30];

      v17 = v28;
      v19 = v27;
      v22 = v26;
      v16 = v45;
      [v31 setAccessibilityIdentifier:@"MediaTags"];
      [(VUIPromoMetadataView *)self vui_addSubview:v31 oldView:0];
      [(VUIPromoMetadataView *)self setMediaTagsView:v31];
      [(VUIPromoMetadataView *)self setOnlySkipButtonAvailable:0];

      int v7 = v46;
    }
    else
    {
      v32 = [(VUIPromoMetadataView *)self mediaTagsView];
      [v32 removeFromSuperview];

      [(VUIPromoMetadataView *)self setMediaTagsView:0];
    }
  }
  uint64_t v33 = [v5 addToUpNextLabelString];
  if (v33
    && ((v34 = (void *)v33,
         [v5 addedToUpNextLabelString],
         (v35 = objc_claimAutoreleasedReturnValue()) != 0)
      ? (int v36 = v7)
      : (int v36 = 0),
        v35,
        v34,
        v36 == 1))
  {
    v37 = [(VUIPromoMetadataView *)self _createUpNextButtonWithPromoInfo:v5];
    [v37 setAccessibilityIdentifier:@"UpNextButton"];
    v38 = [(VUIPromoMetadataView *)self upNextButton];
    [(VUIPromoMetadataView *)self vui_addSubview:v37 oldView:v38];

    [(VUIPromoMetadataView *)self setUpNextButton:v37];
    v39 = [(VUIPromoMetadataView *)self _createComputationOnlyButton];
    [(VUIPromoMetadataView *)self setComputationOnlyButton:v39];

    [(VUIPromoMetadataView *)self setOnlySkipButtonAvailable:0];
  }
  else
  {
    [(VUIPromoMetadataView *)self setUpNextButton:0];
    [(VUIPromoMetadataView *)self setComputationOnlyButton:0];
  }
  v40 = [v48 localizedTitle];
  if (![v40 length])
  {
    v41 = +[VUILocalizationManager sharedInstance];
    uint64_t v42 = [v41 localizedStringForKey:@"SKIP_INTRO"];

    v40 = (void *)v42;
  }
  v43 = [(VUIPromoMetadataView *)self _createSkipButtonWithTitle:v40];
  [v43 setAccessibilityIdentifier:@"SkipButton"];
  v44 = [(VUIPromoMetadataView *)self skipButton];
  [(VUIPromoMetadataView *)self vui_addSubview:v43 oldView:v44];

  [(VUIPromoMetadataView *)self setSkipButton:v43];
}

uint64_t __39__VUIPromoMetadataView_updateWithInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(VUIPromoMetadataView *)self onlySkipButtonAvailable])
  {
    v8 = [(VUIPromoMetadataView *)self skipButton];
    objc_msgSend(v8, "vui_sizeThatFits:", width, height);
    double v10 = v9;
    double v12 = v11;

    if (!a4)
    {
      v13 = [(VUIPromoMetadataView *)self skipButton];
      id v14 = v13;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = v10;
      double v18 = v12;
LABEL_30:
      objc_msgSend(v13, "setFrame:", v15, v16, v17, v18);

      double v10 = *MEMORY[0x1E4F1DB30];
      double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  [(VUIPromoMetadataView *)self expectedImageSize];
  double v99 = v19;
  double v95 = v20;
  v21 = [(VUIPromoMetadataView *)self mediaTagsView];
  objc_msgSend(v21, "vui_sizeThatFits:", width, 0.0);
  double v101 = v22;
  double v97 = v23;

  v24 = [(VUIPromoMetadataView *)self skipButton];
  objc_msgSend(v24, "vui_sizeThatFits:", width, height);
  double v26 = v25;
  double v28 = v27;

  v29 = [(VUIPromoMetadataView *)self upNextButton];
  objc_msgSend(v29, "vui_sizeThatFits:", width, height);
  double v31 = v30;
  double v33 = v32;

  v34 = [(VUIPromoMetadataView *)self computationOnlyButton];
  objc_msgSend(v34, "vui_sizeThatFits:", width, height);
  double v36 = v35;

  if (v31 >= v26) {
    double v37 = v31;
  }
  else {
    double v37 = v26;
  }
  if (v37 >= v36) {
    double v36 = v37;
  }
  [(VUIPromoMetadataView *)self upNextButtonRightMargin];
  double v39 = v38 + v36 * 2.0;
  [(VUIPromoMetadataView *)self maxButtonWidth];
  double v41 = v40;
  [(VUIPromoMetadataView *)self upNextButtonRightMargin];
  double v43 = v42;
  [(VUIPromoMetadataView *)self minButtonWidth];
  double v45 = v44;
  [(VUIPromoMetadataView *)self upNextButtonRightMargin];
  double v47 = v46 + v45 * 2.0;
  if (v39 >= v47)
  {
    double v47 = v43 + v41 * 2.0;
    if (v39 <= v47)
    {
      double v54 = v101;
      goto LABEL_15;
    }
    [(VUIPromoMetadataView *)self maxButtonWidth];
  }
  else
  {
    [(VUIPromoMetadataView *)self minButtonWidth];
  }
  double v49 = v48;
  id v50 = [(VUIPromoMetadataView *)self skipButton];
  objc_msgSend(v50, "vui_sizeThatFits:", v49, 0.0);
  double v28 = v51;

  v52 = [(VUIPromoMetadataView *)self upNextButton];
  objc_msgSend(v52, "vui_sizeThatFits:", v49, 0.0);
  double v33 = v53;
  double v54 = v101;

  double v39 = v47;
LABEL_15:
  if (v28 >= v33) {
    double v55 = v28;
  }
  else {
    double v55 = v33;
  }
  [(VUIPromoMetadataView *)self defaultButtonHeight];
  if (v55 >= v56) {
    double v57 = v55;
  }
  else {
    double v57 = v56;
  }
  [(VUIPromoMetadataView *)self imageViewBottomMargin];
  double v59 = v58;
  [(VUIPromoMetadataView *)self mediaTagsViewBottomMargin];
  if (v39 >= v54) {
    double v61 = v39;
  }
  else {
    double v61 = v54;
  }
  if (v61 >= v99) {
    double v10 = v61;
  }
  else {
    double v10 = v99;
  }
  if (!a4)
  {
    [(VUIPromoMetadataView *)self vuiIsRTL];
    [(VUIPromoMetadataView *)self imageViewBottomMargin];
    [(VUIPromoMetadataView *)self mediaTagsViewBottomMargin];
    [(VUIPromoMetadataView *)self upNextButtonRightMargin];
    [(VUIPromoMetadataView *)self bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v100 = v62;
    double v94 = v64;
    double v96 = v63;
    double v93 = v65;
    [(VUIPromoMetadataView *)self bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v102 = v66;
    double v98 = v67;
    double v91 = v69;
    double v92 = v68;
    [(VUIPromoMetadataView *)self bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;
    [(VUIPromoMetadataView *)self bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    double v79 = v78;
    double v81 = v80;
    double v83 = v82;
    double v85 = v84;
    v86 = [(VUIPromoMetadataView *)self titleImageView];
    objc_msgSend(v86, "setFrame:", v100, v96, v94, v93);

    v87 = [(VUIPromoMetadataView *)self mediaTagsView];
    objc_msgSend(v87, "setFrame:", v102, v98, v92, v91);

    v88 = [(VUIPromoMetadataView *)self upNextButton];
    objc_msgSend(v88, "setFrame:", v71, v73, v75, v77);

    v13 = [(VUIPromoMetadataView *)self skipButton];
    id v14 = v13;
    double v15 = v79;
    double v16 = v81;
    double v17 = v83;
    double v18 = v85;
    goto LABEL_30;
  }
  double v12 = v60 + v97 + v95 + v59 + v57;
LABEL_31:
  double v89 = v10;
  double v90 = v12;
  result.double height = v90;
  result.double width = v89;
  return result;
}

- (id)_createSkipButtonWithTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(VUIPromoMetadataView *)self skipButton];
  v6 = v5;
  if (v5) {
    int v7 = v5;
  }
  else {
    int v7 = [[VUIButton alloc] initWithType:0 interfaceStyle:0];
  }
  v8 = v7;

  [(VUIPromoMetadataView *)self _configureBasicLayoutForButton:v8];
  double v9 = [(VUIPromoMetadataView *)self buttonTextLayout];
  double v10 = +[VUILabel labelWithString:v4 textLayout:v9 existingLabel:0];

  if ([(VUIPromoMetadataView *)self onlySkipButtonAvailable]) {
    objc_msgSend(v10, "setPadding:", 14.0, 50.0, 14.0, 50.0);
  }
  [(VUIButton *)v8 setTextContentView:v10];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__VUIPromoMetadataView__createSkipButtonWithTitle___block_invoke;
  v12[3] = &unk_1E6DF4400;
  objc_copyWeak(&v13, &location);
  [(VUIButton *)v8 setSelectActionHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __51__VUIPromoMetadataView__createSkipButtonWithTitle___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _skipButtonTapped:v3];
}

- (id)_createUpNextButtonWithPromoInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 addToUpNextLabelString];
  uint64_t v6 = [v4 addedToUpNextLabelString];
  double v35 = [(VUIPromoMetadataView *)self addToUpNextSymbolName];
  v34 = [(VUIPromoMetadataView *)self addedToUpNextSymbolName];
  double v33 = [v4 canonicalId];
  unsigned int v32 = [v4 isAddedToUpNext];
  int v7 = [(VUIPromoMetadataView *)self upNextButton];
  v8 = v7;
  if (v7) {
    double v9 = v7;
  }
  else {
    double v9 = [[VUIUpNextButton alloc] initWithType:0 interfaceStyle:0];
  }
  double v10 = v9;

  double v11 = [(VUIUpNextButton *)v10 properties];
  double v12 = [(VUIPromoMetadataView *)self buttonTextLayout];
  double v31 = (void *)v5;
  uint64_t v13 = +[VUILabel labelWithString:v5 textLayout:v12 existingLabel:0];

  id v14 = [(VUIPromoMetadataView *)self buttonTextLayout];
  double v30 = (void *)v6;
  double v15 = +[VUILabel labelWithString:v6 textLayout:v14 existingLabel:0];

  double v28 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  double v16 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:");
  double v17 = [v11 removedStateView];
  v29 = (void *)v13;
  [v17 setLabel:v13];
  double v18 = [MEMORY[0x1E4FB1818] systemImageNamed:v35 withConfiguration:v16];
  double v27 = v17;
  [v17 setImage:v18];

  double v19 = [v11 addedStateView];
  [v19 setLabel:v15];
  double v20 = [MEMORY[0x1E4FB1818] systemImageNamed:v34 withConfiguration:v16];
  [v19 setImage:v20];

  [v11 setCanonicalID:v33];
  [v11 setIsWatchListed:v32];
  [v11 setDismissOnSelect:0];
  id v21 = objc_alloc(MEMORY[0x1E4FB3D18]);
  if (v32) {
    double v22 = v34;
  }
  else {
    double v22 = v35;
  }
  double v23 = objc_msgSend(v21, "initWithSymbol:size:symbolConfiguration:", v22, v16, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  v24 = [MEMORY[0x1E4FB3CC0] makeImageViewWithResourceDescriptor:v23 existingView:0];
  [v11 setCurrentImageView:v24];
  [(VUIPromoMetadataView *)self _configureBasicLayoutForButton:v10];
  [v11 setDelegate:v10];
  [v11 updateButtonContentView];
  objc_initWeak(location, self);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke;
  v39[3] = &unk_1E6DF4400;
  objc_copyWeak(&v40, location);
  [(VUIButton *)v10 setSelectActionHandler:v39];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke_2;
  v36[3] = &unk_1E6DF9BB0;
  objc_copyWeak(&v38, location);
  id v25 = v4;
  id v37 = v25;
  [(VUIUpNextButton *)v10 setStateDidChangeHandler:v36];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

  return v10;
}

void __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _upNextButtonTapped:v3];
  [v3 selectButtonAction:@"select"];
}

void __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 properties];

  objc_msgSend(v5, "setIsAddedToUpNext:", objc_msgSend(v6, "isWatchListed"));
  [WeakRetained setNeedsLayout];
}

- (void)_configureLayout
{
  id v3 = [[VUIMediaTagsViewLayout alloc] initWithType:19];
  [(VUIPromoMetadataView *)self setMediaTagsViewLayout:v3];

  id v5 = (id)objc_opt_new();
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setColor:v4];

  [v5 setTextStyle:6];
  [v5 setFontWeight:10];
  [v5 setAlignment:1];
  [v5 setNumberOfLines:0];
  [v5 setLineBreakMode:1];
  [(VUIPromoMetadataView *)self setButtonTextLayout:v5];
  [(VUIPromoMetadataView *)self setMaxButtonWidth:140.0];
  [(VUIPromoMetadataView *)self setMinButtonWidth:110.0];
  [(VUIPromoMetadataView *)self setImageViewBottomMargin:14.0];
  [(VUIPromoMetadataView *)self setMediaTagsViewBottomMargin:14.0];
  [(VUIPromoMetadataView *)self setUpNextButtonRightMargin:12.0];
  [(VUIPromoMetadataView *)self setDefaultButtonHeight:40.0];
}

- (void)_configureBasicLayoutForButton:(id)a3
{
  id v6 = a3;
  [v6 setButtonShape:0];
  [v6 setCornerRadius:8.0];
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setButtonBackgroundColor:v3];

  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setHighlightColor:v4];

  id v5 = [MEMORY[0x1E4FB1618] blackColor];
  [v6 setTintColor:v5];

  objc_msgSend(v6, "setPadding:", 0.0, 16.0, 0.0, 16.0);
}

- (id)_createComputationOnlyButton
{
  id v3 = [(VUIPromoMetadataView *)self skipInfo];
  id v4 = [v3 promoInfo];

  id v5 = [(VUIPromoMetadataView *)self computationOnlyButton];
  id v6 = v5;
  if (v4)
  {
    if (v5) {
      int v7 = v5;
    }
    else {
      int v7 = [[VUIButton alloc] initWithType:0 interfaceStyle:0];
    }
    v8 = v7;

    [(VUIPromoMetadataView *)self _configureBasicLayoutForButton:v8];
    if ([v4 isAddedToUpNext]) {
      [v4 addToUpNextLabelString];
    }
    else {
    double v9 = [v4 addedToUpNextLabelString];
    }
    double v10 = [(VUIPromoMetadataView *)self buttonTextLayout];
    double v11 = +[VUILabel labelWithString:v9 textLayout:v10 existingLabel:0];

    [(VUIButton *)v8 setTextContentView:v11];
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_skipButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIPromoMetadataView *)self delegate];
  [v5 skipButtonTapped:v4];
}

- (void)_upNextButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIPromoMetadataView *)self delegate];
  [v5 upNextButtonTapped:v4];
}

- (VUIPromoMetadataViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIPromoMetadataViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVPMediaItemSkipInfo)skipInfo
{
  return self->_skipInfo;
}

- (void)setSkipInfo:(id)a3
{
}

- (VUIImageView)titleImageView
{
  return self->_titleImageView;
}

- (void)setTitleImageView:(id)a3
{
}

- (VUIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (VUIUpNextButton)upNextButton
{
  return self->_upNextButton;
}

- (void)setUpNextButton:(id)a3
{
}

- (VUIMediaTagsView)mediaTagsView
{
  return self->_mediaTagsView;
}

- (void)setMediaTagsView:(id)a3
{
}

- (BOOL)onlySkipButtonAvailable
{
  return self->_onlySkipButtonAvailable;
}

- (void)setOnlySkipButtonAvailable:(BOOL)a3
{
  self->_onlySkipButtonAvailable = a3;
}

- (NSString)addToUpNextSymbolName
{
  return self->_addToUpNextSymbolName;
}

- (void)setAddToUpNextSymbolName:(id)a3
{
}

- (NSString)addedToUpNextSymbolName
{
  return self->_addedToUpNextSymbolName;
}

- (void)setAddedToUpNextSymbolName:(id)a3
{
}

- (VUIMediaTagsViewLayout)mediaTagsViewLayout
{
  return self->_mediaTagsViewLayout;
}

- (void)setMediaTagsViewLayout:(id)a3
{
}

- (VUITextLayout)buttonTextLayout
{
  return self->_buttonTextLayout;
}

- (void)setButtonTextLayout:(id)a3
{
}

- (CGSize)expectedImageSize
{
  double width = self->_expectedImageSize.width;
  double height = self->_expectedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  self->_expectedImageSize = a3;
}

- (double)imageViewBottomMargin
{
  return self->_imageViewBottomMargin;
}

- (void)setImageViewBottomMargin:(double)a3
{
  self->_imageViewBottomMargin = a3;
}

- (double)mediaTagsViewBottomMargin
{
  return self->_mediaTagsViewBottomMargin;
}

- (void)setMediaTagsViewBottomMargin:(double)a3
{
  self->_mediaTagsViewBottomMargin = a3;
}

- (double)upNextButtonRightMargin
{
  return self->_upNextButtonRightMargin;
}

- (void)setUpNextButtonRightMargin:(double)a3
{
  self->_upNextButtonRightMargin = a3;
}

- (double)defaultButtonHeight
{
  return self->_defaultButtonHeight;
}

- (void)setDefaultButtonHeight:(double)a3
{
  self->_defaultButtonHeight = a3;
}

- (double)maxButtonWidth
{
  return self->_maxButtonWidth;
}

- (void)setMaxButtonWidth:(double)a3
{
  self->_maxButtonWidth = a3;
}

- (double)minButtonWidth
{
  return self->_minButtonWidth;
}

- (void)setMinButtonWidth:(double)a3
{
  self->_minButtonWidth = a3;
}

- (VUIButton)computationOnlyButton
{
  return self->_computationOnlyButton;
}

- (void)setComputationOnlyButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computationOnlyButton, 0);
  objc_storeStrong((id *)&self->_buttonTextLayout, 0);
  objc_storeStrong((id *)&self->_mediaTagsViewLayout, 0);
  objc_storeStrong((id *)&self->_addedToUpNextSymbolName, 0);
  objc_storeStrong((id *)&self->_addToUpNextSymbolName, 0);
  objc_storeStrong((id *)&self->_mediaTagsView, 0);
  objc_storeStrong((id *)&self->_upNextButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_skipInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
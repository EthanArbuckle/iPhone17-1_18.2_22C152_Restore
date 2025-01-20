@interface PXBannerView
- (PXBannerView)init;
- (PXBannerView)initWithFrame:(CGRect)a3;
- (PXBannerView)initWithFrame:(CGRect)a3 padding:(UIEdgeInsets)a4;
- (PXBannerViewConfiguration)configuration;
- (PXBannerViewDelegate)delegate;
- (UIEdgeInsets)padding;
- (id)_createActionButton;
- (id)_createCancelButton;
- (id)_labelWithSubtitle:(id)a3;
- (id)_labelWithTitle:(id)a3;
- (void)_handleCancelButton:(id)a3;
- (void)_handleContinueButton:(id)a3;
- (void)_reloadViews;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXBannerView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (UIEdgeInsets)padding
{
  objc_copyStruct(v6, &self->_padding, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (PXBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXBannerViewDelegate *)WeakRetained;
}

- (PXBannerViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)_handleCancelButton:(id)a3
{
  double v5 = [(PXBannerView *)self configuration];
  v6 = [v5 cancelButtonHandler];
  if (v6)
  {
    v7 = [(PXBannerView *)self delegate];
    if (!v7)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"PXBannerView.m", 335, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    v8 = [v5 cancelActionIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__PXBannerView__handleCancelButton___block_invoke;
    v10[3] = &unk_1E5DAF118;
    id v11 = v6;
    [v7 preparePresentationEnvironmentForBannerView:self actionIdentifier:v8 completionHandler:v10];
  }
}

void __36__PXBannerView__handleCancelButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "PXBannerView: Cancel: error preparing presentation environment: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleContinueButton:(id)a3
{
  id v5 = [(PXBannerView *)self configuration];
  id v6 = [v5 actionButtonHandler];
  if (v6)
  {
    v7 = [(PXBannerView *)self delegate];
    if (!v7)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"PXBannerView.m", 318, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    int v8 = [v5 primaryActionIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__PXBannerView__handleContinueButton___block_invoke;
    v10[3] = &unk_1E5DAF118;
    id v11 = v6;
    [v7 preparePresentationEnvironmentForBannerView:self actionIdentifier:v8 completionHandler:v10];
  }
}

void __38__PXBannerView__handleContinueButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "PXBannerView: Continue: error preparing presentation environment: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createCancelButton
{
  double v3 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
  [v3 setButtonSize:0];
  double v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v3 setBaseForegroundColor:v4];

  id v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:2 scale:20.0];
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"multiply"];
  v7 = [v6 imageWithSymbolConfiguration:v5];
  [v3 setImage:v7];

  objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  int v8 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v8 setConfiguration:v3];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addTarget:self action:sel__handleCancelButton_ forControlEvents:0x2000];

  return v8;
}

- (id)_createActionButton
{
  double v3 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  [v3 setButtonSize:0];
  [v3 setCornerStyle:4];
  double v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v3 setBaseBackgroundColor:v4];

  id v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v3 setBaseForegroundColor:v5];

  id v6 = [(PXBannerView *)self configuration];
  v7 = [v6 actionButtonTitle];
  [v3 setTitle:v7];

  [v3 setTitleTextAttributesTransformer:&__block_literal_global_4878];
  int v8 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v8 setConfiguration:v3];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1144766464;
  [v8 setContentCompressionResistancePriority:0 forAxis:v9];
  [v8 addTarget:self action:sel__handleContinueButton_ forControlEvents:0x2000];

  return v8;
}

id __35__PXBannerView__createActionButton__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)[a2 mutableCopy];
  double v3 = MEMORY[0x1AD10AAF0](10, 2, 6);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (id)_labelWithSubtitle:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4FB1930];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = MEMORY[0x1AD10AAF0](11, 0x8000, 5);
  [v5 setFont:v6];

  [v5 setText:v4];
  [v5 setNumberOfLines:2];
  [v5 sizeToFit];
  return v5;
}

- (id)_labelWithTitle:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4FB1930];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = MEMORY[0x1AD10AAF0](12, 32770, 5);
  [v5 setFont:v6];

  [v5 setText:v4];
  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v5 setTextColor:v7];

  [v5 setNumberOfLines:2];
  [v5 sizeToFit];
  return v5;
}

- (void)_reloadViews
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  double v3 = [(PXBannerView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v71 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v5);
  }

  int v8 = [(PXBannerView *)self configuration];
  int v9 = [v8 wantsCancelButton];
  [(PXBannerView *)self padding];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  int v40 = v9;
  if (v9) {
    double v17 = v10 + 4.0;
  }
  else {
    double v17 = v10;
  }
  [(PXBannerView *)self setAutoresizingMask:18];
  v18 = [v8 title];
  v19 = [(PXBannerView *)self _labelWithTitle:v18];

  v69 = v8;
  v20 = [v8 subtitle];
  v21 = [(PXBannerView *)self _labelWithSubtitle:v20];

  v22 = [(PXBannerView *)self _createActionButton];
  v23 = [(PXBannerView *)self _createCancelButton];
  id v24 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v24 setAxis:1];
  [v24 setAlignment:1];
  [v24 setSpacing:-1.0];
  [v24 addArrangedSubview:v19];
  [v24 addArrangedSubview:v21];
  [(PXBannerView *)self addSubview:v24];
  [(PXBannerView *)self addSubview:v22];
  [(PXBannerView *)self addSubview:v23];
  v54 = (void *)MEMORY[0x1E4F28DC8];
  v66 = [v24 topAnchor];
  v65 = [(PXBannerView *)self topAnchor];
  v64 = [v66 constraintGreaterThanOrEqualToAnchor:v65 constant:v12];
  v74[0] = v64;
  v63 = [v24 leadingAnchor];
  v62 = [(PXBannerView *)self leadingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:v14];
  v74[1] = v61;
  v60 = [v24 centerYAnchor];
  v59 = [(PXBannerView *)self centerYAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v74[2] = v58;
  v57 = [(PXBannerView *)self bottomAnchor];
  v56 = [v24 bottomAnchor];
  v55 = [v57 constraintGreaterThanOrEqualToAnchor:v56 constant:v16];
  v74[3] = v55;
  v53 = [v21 topAnchor];
  v68 = v19;
  v52 = [v19 bottomAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v74[4] = v51;
  v67 = v21;
  v50 = [v21 leadingAnchor];
  v49 = [(PXBannerView *)self leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:v14];
  v74[5] = v48;
  v42 = v23;
  v47 = [v23 trailingAnchor];
  v46 = [(PXBannerView *)self trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 constant:-v17];
  v74[6] = v45;
  v44 = [v23 centerYAnchor];
  v43 = [(PXBannerView *)self centerYAnchor];
  v25 = [v44 constraintEqualToAnchor:v43];
  v74[7] = v25;
  v26 = v22;
  v41 = v22;
  v27 = [v22 centerYAnchor];
  v28 = [(PXBannerView *)self centerYAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v74[8] = v29;
  v30 = [v26 leadingAnchor];
  v31 = [v24 trailingAnchor];
  v32 = [v30 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v31 multiplier:1.0];
  v74[9] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:10];
  [v54 activateConstraints:v33];

  if (v41)
  {
    if (v40)
    {
      v34 = [v41 trailingAnchor];
      v35 = [v42 leadingAnchor];
      double v36 = -10.0;
      v37 = v34;
      v38 = v35;
    }
    else
    {
      [v42 setHidden:1];
      v34 = [v41 trailingAnchor];
      v35 = [(PXBannerView *)self trailingAnchor];
      v37 = v34;
      v38 = v35;
      double v36 = -v17;
    }
    v39 = [v37 constraintEqualToAnchor:v38 constant:v36];
    [v39 setActive:1];
  }
}

- (void)setConfiguration:(id)a3
{
  int v8 = (PXBannerViewConfiguration *)a3;
  uint64_t v4 = self->_configuration;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(PXBannerViewConfiguration *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (PXBannerViewConfiguration *)[(PXBannerViewConfiguration *)v8 copy];
      configuration = self->_configuration;
      self->_configuration = v6;

      [(PXBannerView *)self _reloadViews];
    }
  }
}

- (PXBannerView)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXBannerView.m", 97, @"%s is not available as initializer", "-[PXBannerView init]");

  abort();
}

- (PXBannerView)initWithFrame:(CGRect)a3
{
  char v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXBannerView.m", 93, @"%s is not available as initializer", "-[PXBannerView initWithFrame:]");

  abort();
}

- (PXBannerView)initWithFrame:(CGRect)a3 padding:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v11.receiver = self;
  v11.super_class = (Class)PXBannerView;
  int v8 = -[PXBannerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v9 = v8;
  if (v8)
  {
    v8->_padding.CGFloat top = top;
    v8->_padding.CGFloat left = left;
    v8->_padding.CGFloat bottom = bottom;
    v8->_padding.CGFloat right = right;
    [(PXBannerView *)v8 _reloadViews];
  }
  return v9;
}

@end
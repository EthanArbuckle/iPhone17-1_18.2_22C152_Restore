@interface VUIProductPlacementView
- (BOOL)_isPortrait;
- (CGSize)_descriptionSize;
- (CGSize)_dividerSize;
- (CGSize)_logoSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)_descriptionMargin;
- (UIEdgeInsets)_dividerMargin;
- (UIEdgeInsets)_logoMargin;
- (UIEdgeInsets)_margin;
- (UIView)dividerView;
- (VUILabel)blockDescriptionLabel;
- (VUIProductPlacementView)initWithAdvisoryInfoDictionary:(id)a3;
- (VUIVideoAdvisoryViewLayout)layout;
- (_TVImageView)logoImageView;
- (void)_configureSubviewsWithDictionary:(id)a3;
- (void)_hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)_hideWithAnimationWithCompletion:(id)a3;
- (void)_showAnimated:(BOOL)a3 completion:(id)a4;
- (void)_showWithAnimationWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setBlockDescriptionLabel:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLogoImageView:(id)a3;
- (void)show:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation VUIProductPlacementView

- (VUIProductPlacementView)initWithAdvisoryInfoDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIProductPlacementView;
  v5 = -[VUIProductPlacementView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    layout = v5->_layout;
    v5->_layout = (VUIVideoAdvisoryViewLayout *)v6;

    [(VUIProductPlacementView *)v5 _configureSubviewsWithDictionary:v4];
  }

  return v5;
}

- (void)show:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a3) {
    [(VUIProductPlacementView *)self _showAnimated:a4 completion:a5];
  }
  else {
    [(VUIProductPlacementView *)self _hideAnimated:a4 completion:a5];
  }
}

- (BOOL)_isPortrait
{
  v2 = [(VUIProductPlacementView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (!v3 || (BOOL v4 = +[VUIUtilities isIpadPortrait])) {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (UIEdgeInsets)_margin
{
  BOOL v3 = [(VUIProductPlacementView *)self _isPortrait];
  BOOL v4 = [(VUIProductPlacementView *)self layout];
  v5 = v4;
  if (v3) {
    [v4 portraitMargin];
  }
  else {
    [v4 margin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_logoSize
{
  BOOL v3 = [(VUIProductPlacementView *)self _isPortrait];
  BOOL v4 = [(VUIProductPlacementView *)self layout];
  v5 = v4;
  if (v3) {
    [v4 portraitLogoSize];
  }
  else {
    [v4 logoSize];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_dividerSize
{
  [(VUIProductPlacementView *)self bounds];
  double v4 = v3;
  BOOL v5 = [(VUIProductPlacementView *)self _isPortrait];
  double v6 = [(VUIProductPlacementView *)self layout];
  double v7 = v6;
  if (v5) {
    [v6 portraitDividerSize];
  }
  else {
    [v6 dividerSize];
  }
  double v9 = v8;

  double v10 = v9;
  double v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)_logoMargin
{
  BOOL v3 = [(VUIProductPlacementView *)self _isPortrait];
  double v4 = [(VUIProductPlacementView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitLogoMargin];
  }
  else {
    [v4 logoMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_dividerMargin
{
  BOOL v3 = [(VUIProductPlacementView *)self _isPortrait];
  double v4 = [(VUIProductPlacementView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitDividerMargin];
  }
  else {
    [v4 dividerMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_descriptionMargin
{
  BOOL v3 = [(VUIProductPlacementView *)self _isPortrait];
  double v4 = [(VUIProductPlacementView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitDescriptionMargin];
  }
  else {
    [v4 descriptionMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_descriptionSize
{
  BOOL v3 = [(VUIProductPlacementView *)self layout];
  [v3 descriptionMaxWidth];
  double v5 = v4;

  double v6 = [(VUIProductPlacementView *)self blockDescriptionLabel];
  [(VUIProductPlacementView *)self bounds];
  objc_msgSend(v6, "sizeThatFits:", v5, CGRectGetHeight(v14));
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_configureSubviewsWithDictionary:(id)a3
{
  id v15 = a3;
  double v4 = objc_opt_new();
  double v5 = [v15 objectForKeyedSubscript:@"VUIAdvisoryViewLogoImageKey"];
  if (v5) {
    [v4 setImage:v5];
  }
  [v4 setAlpha:0.0];
  [(VUIProductPlacementView *)self addSubview:v4];
  [(VUIProductPlacementView *)self setLogoImageView:v4];
  double v6 = [v15 objectForKeyedSubscript:@"VUIAdvisoryViewBlockDescriptionKey"];
  if ([v6 length])
  {
    if (v5)
    {
      [(VUIProductPlacementView *)self _dividerSize];
      double v8 = v7;
      double v9 = objc_opt_new();
      double v10 = [(VUIProductPlacementView *)self layout];
      double v11 = [v10 dividerColor];
      [v9 setBackgroundColor:v11];

      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, 0.0);
      [(VUIProductPlacementView *)self addSubview:v9];
      [(VUIProductPlacementView *)self setDividerView:v9];
    }
    double v12 = [(VUIProductPlacementView *)self layout];
    double v13 = [v12 descriptionLayout];
    CGRect v14 = +[VUILabel labelWithString:v6 textLayout:v13 existingLabel:0];

    [v14 setAlpha:0.0];
    [(VUIProductPlacementView *)self addSubview:v14];
    [(VUIProductPlacementView *)self setBlockDescriptionLabel:v14];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(VUIProductPlacementView *)self _logoSize];
  double v7 = v6;
  [(VUIProductPlacementView *)self _margin];
  double v9 = v8;
  [(VUIProductPlacementView *)self _logoMargin];
  double v11 = v10;
  double v13 = v12;
  double v14 = width + v9 * -2.0;
  id v15 = [(VUIProductPlacementView *)self blockDescriptionLabel];
  objc_msgSend(v15, "sizeThatFits:", width, height);
  double v17 = v16 + 0.0;

  if (v17 >= v7 + v11 + v13) {
    double v18 = v17;
  }
  else {
    double v18 = v7 + v11 + v13;
  }
  double v19 = v14;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)VUIProductPlacementView;
  [(VUIProductPlacementView *)&v52 layoutSubviews];
  uint64_t v3 = [(VUIProductPlacementView *)self effectiveUserInterfaceLayoutDirection];
  [(VUIProductPlacementView *)self bounds];
  double v5 = v4;
  double v45 = v6;
  double v8 = v7;
  [(VUIProductPlacementView *)self _logoSize];
  double v10 = v9;
  double v12 = v11;
  [(VUIProductPlacementView *)self _logoMargin];
  double v14 = v13;
  double v48 = v15;
  [(VUIProductPlacementView *)self _dividerSize];
  double v49 = v16;
  double v44 = v17;
  [(VUIProductPlacementView *)self _dividerMargin];
  double v43 = v18;
  double v20 = v19;
  double v47 = v21;
  [(VUIProductPlacementView *)self _descriptionMargin];
  double v46 = v22;
  [(VUIProductPlacementView *)self _descriptionSize];
  double v51 = v24;
  double v25 = v8 - v14 - v10;
  double v26 = v5 + v14;
  if (v3 == 1) {
    double v27 = v25;
  }
  else {
    double v27 = v26;
  }
  double v28 = v23;
  VUIRoundValue();
  double v30 = v29;
  v31 = [(VUIProductPlacementView *)self logoImageView];
  double v50 = v30;
  objc_msgSend(v31, "setFrame:", v27, v30, v10, v12);

  v32 = [(VUIProductPlacementView *)self dividerView];

  if (v32)
  {
    double v33 = v49;
    if (v3 == 1) {
      double v34 = v25 - (v48 + v20 - v49);
    }
    else {
      double v34 = v26 + v20 + v48 + v10 + v26;
    }
    v35 = [(VUIProductPlacementView *)self dividerView];

    if (v35)
    {
      v36 = [(VUIProductPlacementView *)self dividerView];
      [v36 frame];
      double v37 = v28;
      double v39 = v38;

      if (v39 > 0.0) {
        double v39 = v44;
      }
      v40 = [(VUIProductPlacementView *)self dividerView];
      double v41 = v39;
      double v28 = v37;
      objc_msgSend(v40, "setFrame:", v34, v45 + v43, v49, v41);
    }
    else
    {
      double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    }
    if (v3 == 1) {
      double v27 = v34 - (v46 + v47 + v28);
    }
    else {
      double v27 = v34 + v46 + v47 + v33;
    }
  }
  v42 = [(VUIProductPlacementView *)self blockDescriptionLabel];
  objc_msgSend(v42, "setFrame:", v27, v50, v28, v51);
}

- (void)_showAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    [(VUIProductPlacementView *)self _showWithAnimationWithCompletion:a4];
  }
  else
  {
    double v5 = [(VUIProductPlacementView *)self dividerView];

    if (v5)
    {
      double v6 = [(VUIProductPlacementView *)self dividerView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      [(VUIProductPlacementView *)self _dividerSize];
      double v14 = v13;
      double v15 = [(VUIProductPlacementView *)self dividerView];
      objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
    }
    double v16 = [(VUIProductPlacementView *)self logoImageView];
    [v16 setAlpha:1.0];

    id v17 = [(VUIProductPlacementView *)self blockDescriptionLabel];
    [v17 setAlpha:1.0];
  }
}

- (void)_showWithAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(VUIProductPlacementView *)self dividerView];

  if (v5)
  {
    double v6 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke;
    v23[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v24, &location);
    [v6 animateWithDuration:0 delay:v23 options:0 animations:0.5 completion:0.0];
    objc_destroyWeak(&v24);
  }
  double v7 = (void *)MEMORY[0x1E4FB1EB0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_2;
  v21[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v22, &location);
  [v7 animateWithDuration:0 delay:v21 options:0 animations:0.5 completion:0.3];
  uint64_t v8 = [(VUIProductPlacementView *)self effectiveUserInterfaceLayoutDirection];
  double v9 = [(VUIProductPlacementView *)self blockDescriptionLabel];
  double v10 = [(VUIProductPlacementView *)self dividerView];

  if (v10)
  {
    double v11 = -20.0;
    if (v8 == 1) {
      double v11 = 20.0;
    }
    CGAffineTransformMakeTranslation(&v20, v11, 0.0);
    [v9 setTransform:&v20];
  }
  double v12 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_3;
  v17[3] = &unk_1E6DF6510;
  id v13 = v9;
  id v18 = v13;
  objc_copyWeak(&v19, &location);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_4;
  v15[3] = &unk_1E6DF3D80;
  id v14 = v4;
  id v16 = v14;
  [v12 animateWithDuration:0 delay:v17 options:v15 animations:0.5 completion:0.0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained dividerView];
  [v1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;

  [WeakRetained bounds];
  double v9 = v8;
  double v10 = [WeakRetained dividerView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

void __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained logoImageView];
  [v1 setAlpha:1.0];
}

void __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = [WeakRetained dividerView];

  if (v3)
  {
    double v4 = *(void **)(a1 + 32);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v6[0] = *MEMORY[0x1E4F1DAB8];
    v6[1] = v5;
    v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v6];
  }
}

uint64_t __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_hideAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    [(VUIProductPlacementView *)self _hideWithAnimationWithCompletion:a4];
  }
  else
  {
    long long v5 = [(VUIProductPlacementView *)self dividerView];

    if (v5)
    {
      double v6 = [(VUIProductPlacementView *)self dividerView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      id v13 = [(VUIProductPlacementView *)self dividerView];
      objc_msgSend(v13, "setFrame:", v8, v10, v12, 0.0);
    }
    id v14 = [(VUIProductPlacementView *)self logoImageView];
    [v14 setAlpha:0.0];

    id v15 = [(VUIProductPlacementView *)self blockDescriptionLabel];
    [v15 setAlpha:0.0];
  }
}

- (void)_hideWithAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  long long v5 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke;
  v15[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v16, &location);
  [v5 animateWithDuration:0 delay:v15 options:0 animations:2.0 completion:0.0];
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_2;
  v13[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v14, &location);
  [v6 animateWithDuration:0 delay:v13 options:0 animations:2.0 completion:0.0];
  double v7 = [(VUIProductPlacementView *)self dividerView];

  if (v7)
  {
    double v8 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_3;
    v11[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v12, &location);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_4;
    v9[3] = &unk_1E6DF3D80;
    id v10 = v4;
    [v8 animateWithDuration:0 delay:v11 options:v9 animations:2.0 completion:0.4];

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained logoImageView];
  [v1 setAlpha:0.0];
}

void __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained blockDescriptionLabel];
  [v2 setAlpha:0.0];

  double v3 = [WeakRetained blockDescriptionLabel];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v5];
}

void __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained dividerView];
  [v1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;

  double v8 = [WeakRetained dividerView];
  objc_msgSend(v8, "setFrame:", v3, v5, v7, 0.0);
}

uint64_t __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (VUIVideoAdvisoryViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (_TVImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (VUILabel)blockDescriptionLabel
{
  return self->_blockDescriptionLabel;
}

- (void)setBlockDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
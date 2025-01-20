@interface SiriUIReusableConfirmationFooterView
+ (double)defaultHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SAUIConfirmationOptions)confirmationOptions;
- (SiriUIReusableConfirmationFooterView)initWithFrame:(CGRect)a3;
- (UIButton)cancelButton;
- (UIButton)confirmButton;
- (UIEdgeInsets)edgeInsets;
- (double)defaultAmbientHeight;
- (id)snippetViewController;
- (void)beginProgressAnimation;
- (void)layoutSubviews;
- (void)setConfirmationOptions:(id)a3;
- (void)setSnippetViewController:(id)a3;
@end

@implementation SiriUIReusableConfirmationFooterView

- (SiriUIReusableConfirmationFooterView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SiriUIReusableConfirmationFooterView;
  v3 = -[SiriUIReusableConfirmationFooterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriUIContentButton buttonWithRole:0];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (SiriUIContentButton *)v4;

    [(SiriUIContentButton *)v3->_cancelButton _setContinuousCornerRadius:9.0];
    [(SiriUIReusableConfirmationFooterView *)v3 addSubview:v3->_cancelButton];
    uint64_t v6 = +[SiriUIContentButton buttonWithRole:0];
    confirmButton = v3->_confirmButton;
    v3->_confirmButton = (SiriUIContentButton *)v6;

    [(SiriUIContentButton *)v3->_confirmButton _setContinuousCornerRadius:9.0];
    [(SiriUIReusableConfirmationFooterView *)v3 addSubview:v3->_confirmButton];
    v8 = [SiriUIProgressBarView alloc];
    uint64_t v9 = -[SiriUIProgressBarView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (SiriUIProgressBarView *)v9;

    [(SiriUIProgressBarView *)v3->_progressBarView setUserInteractionEnabled:0];
    [(SiriUIReusableConfirmationFooterView *)v3 addSubview:v3->_progressBarView];
    v3->_automaticConfirmationThreshold = 0.0;
    [(SiriUIReusableConfirmationFooterView *)v3 setClipsToBounds:1];
  }
  return v3;
}

+ (double)defaultHeight
{
  objc_msgSend(MEMORY[0x263F1C658], "siriui_preferredDynamicBodySize");
  float v3 = v2 + -18.0;
  uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v5 = ceil(v3 + 76.0);
  if (v6 >= 2.0) {
    double v7 = v3 + 76.0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (double)defaultAmbientHeight
{
  objc_msgSend(MEMORY[0x263F1C658], "siriui_preferredDynamicBodySize");
  float v3 = v2 + -18.0;
  uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v5 = ceil(v3 + 66.0);
  if (v6 >= 2.0) {
    double v7 = v3 + 66.0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (void)setSnippetViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_snippetViewController, obj);
    cancelButton = self->_cancelButton;
    double v7 = [(SiriUIReusableConfirmationFooterView *)self snippetViewController];
    -[SiriUIContentButton setUsePlatterStyle:](cancelButton, "setUsePlatterStyle:", [v7 usePlatterStyle]);

    confirmButton = self->_confirmButton;
    uint64_t v9 = [(SiriUIReusableConfirmationFooterView *)self snippetViewController];
    -[SiriUIContentButton setUsePlatterStyle:](confirmButton, "setUsePlatterStyle:", [v9 usePlatterStyle]);

    verticalKeyline = self->_verticalKeyline;
    v11 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterKeylineColor");
    [(SiriUIKeyline *)verticalKeyline setCustomBackgroundColor:v11];

    double v5 = obj;
  }
}

- (void)setConfirmationOptions:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_confirmationOptions, a3);
  confirmButton = self->_confirmButton;
  double v7 = [v5 confirmText];
  [(SiriUIContentButton *)confirmButton setTitle:v7 forState:0];

  cancelButton = self->_cancelButton;
  uint64_t v9 = [v5 denyText];
  [(SiriUIContentButton *)cancelButton setTitle:v9 forState:0];

  v33 = self;
  [(SiriUIContentButton *)self->_cancelButton setRole:2];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v31 = v5;
  v10 = [v5 allConfirmationOptions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v11)
  {
    v13 = 0;
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  v13 = 0;
  uint64_t v14 = *(void *)v35;
  uint64_t v15 = *MEMORY[0x263F65D90];
  uint64_t v16 = *MEMORY[0x263F65D88];
  uint64_t v32 = *MEMORY[0x263F65D80];
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v10);
      }
      v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      v19 = [v18 type];
      int v20 = [v19 isEqualToString:v15];

      if (v20)
      {
        if (v13)
        {
          v21 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[SiriUIReusableConfirmationFooterView setConfirmationOptions:]";
            __int16 v40 = 2112;
            v41 = v18;
            _os_log_error_impl(&dword_2231EF000, v21, OS_LOG_TYPE_ERROR, "%s Warning: Duplicated confirm confirmationOption included in SAUIConfirmationOptions : %@", buf, 0x16u);
          }
        }
        id v22 = v18;

        v23 = [v22 buttonRole];
        char v24 = [v23 isEqualToString:v16];

        if (v24)
        {
          uint64_t v25 = 1;
          goto LABEL_14;
        }
        v26 = [v22 buttonRole];
        int v27 = [v26 isEqualToString:v32];

        if (v27)
        {
          uint64_t v25 = 3;
LABEL_14:
          [(SiriUIContentButton *)v33->_confirmButton setRole:v25];
        }
        v13 = v22;
        continue;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
  }
  while (v12);
LABEL_20:

  v28 = [v13 automaticConfirmationThreshold];

  if (v28)
  {
    v29 = [v13 automaticConfirmationThreshold];
    [v29 doubleValue];
    v33->_automaticConfirmationThreshold = v30;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v5 = [(SiriUIReusableConfirmationFooterView *)self traitCollection];
  if ([v5 isAmbientPresented]) {
    [(SiriUIReusableConfirmationFooterView *)self defaultAmbientHeight];
  }
  else {
    [(id)objc_opt_class() defaultHeight];
  }
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SiriUIReusableConfirmationFooterView;
  [(SiriUIReusableConfirmationFooterView *)&v28 layoutSubviews];
  uint64_t v3 = [(SiriUIReusableConfirmationFooterView *)self semanticContentAttribute];
  uint64_t v4 = [(SiriUIReusableConfirmationFooterView *)self traitCollection];
  if ([v4 isAmbientPresented]) {
    [(SiriUIReusableConfirmationFooterView *)self defaultAmbientHeight];
  }
  else {
    [(id)objc_opt_class() defaultHeight];
  }
  double v6 = v5;

  [(SiriUIReusableConfirmationFooterView *)self bounds];
  double v8 = v7;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v10 = v6 - v9;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v12 = v10 - v11;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v14 = v8 - v13;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v16 = v14 - v15;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v18 = (v16 - v17) * 0.5;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v20 = v19;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v22 = v21 + v18;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v24 = v22 + v23;
  [(SiriUIReusableConfirmationFooterView *)self edgeInsets];
  double v26 = v25;
  if (v3 == 4) {
    double v27 = v24;
  }
  else {
    double v27 = v20;
  }
  if (v3 != 4) {
    double v20 = v24;
  }
  -[SiriUIContentButton setFrame:](self->_cancelButton, "setFrame:", v27, v26, v18, v12);
  -[SiriUIContentButton setFrame:](self->_confirmButton, "setFrame:", v20, v26, v18, v12);
  -[SiriUIProgressBarView setFrame:](self->_progressBarView, "setFrame:", v20, v26, v18, v12);
}

- (void)beginProgressAnimation
{
  if (self->_automaticConfirmationThreshold > 0.0) {
    -[SiriUIProgressBarView beginProgressAnimationWithDuration:](self->_progressBarView, "beginProgressAnimationWithDuration:");
  }
}

- (UIEdgeInsets)edgeInsets
{
  double v2 = 16.0;
  double v3 = 16.0;
  double v4 = 16.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIButton)cancelButton
{
  return &self->_cancelButton->super;
}

- (UIButton)confirmButton
{
  return &self->_confirmButton->super;
}

- (id)snippetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  return WeakRetained;
}

- (SAUIConfirmationOptions)confirmationOptions
{
  return self->_confirmationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationOptions, 0);
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_progressBarView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_verticalKeyline, 0);
}

@end
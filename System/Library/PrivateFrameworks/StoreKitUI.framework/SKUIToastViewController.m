@interface SKUIToastViewController
+ (id)_fontWithSize:(double)a3 textStyleAttribute:(__CFString *)a4;
+ (id)_primaryLabelFont;
+ (id)_secondaryLabelFont;
- (NSString)descriptionText;
- (NSString)titleText;
- (SKUIToastPresentationWindow)presentationWindow;
- (SKUIToastViewController)initWithDialogTemplate:(id)a3;
- (SKUIToastViewController)initWithTitle:(id)a3 description:(id)a4 image:(id)a5;
- (UIImageView)imageView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIVisualEffectView)toastView;
- (id)completion;
- (void)_dismissWithDelay:(double)a3;
- (void)present;
- (void)presentFromViewController:(id)a3 completion:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setToastView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIToastViewController

- (SKUIToastViewController)initWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToastViewController initWithTitle:description:image:]();
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUIToastViewController;
  v12 = [(SKUIToastViewController *)&v29 initWithNibName:0 bundle:0];
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
    primaryLabel = v12->_primaryLabel;
    v12->_primaryLabel = (UILabel *)v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v14, v15, v16, v17);
    secondaryLabel = v12->_secondaryLabel;
    v12->_secondaryLabel = (UILabel *)v20;

    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v14, v15, v16, v17);
    imageView = v12->_imageView;
    v12->_imageView = (UIImageView *)v22;

    [(UIImageView *)v12->_imageView setImage:v11];
    v24 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    v25 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v24];
    [(UIVisualEffectView *)v25 setClipsToBounds:1];
    [(UIVisualEffectView *)v25 _setContinuousCornerRadius:9.0];
    toastView = v12->_toastView;
    v12->_toastView = v25;
    v27 = v25;

    objc_storeStrong((id *)&v12->_titleText, a3);
    objc_storeStrong((id *)&v12->_descriptionText, a4);

    [(SKUIToastViewController *)v12 setModalPresentationStyle:6];
  }

  return v12;
}

- (SKUIToastViewController)initWithDialogTemplate:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v5 text];
  v7 = [v6 attributedStringWithDefaultFont:0 foregroundColor:0];
  v8 = [v7 string];

  id v9 = [v4 message];
  id v10 = [v9 text];
  id v11 = [v10 attributedStringWithDefaultFont:0 foregroundColor:0];
  v12 = [v11 string];

  id v13 = [v4 image];

  double v14 = [v13 resourceName];

  if (v14)
  {
    double v15 = SKUIImageWithResourceName(v14);
  }
  else
  {
    double v15 = 0;
  }
  double v16 = [(SKUIToastViewController *)self initWithTitle:v8 description:v12 image:v15];

  return v16;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)SKUIToastViewController;
  [(SKUIToastViewController *)&v41 viewDidLoad];
  v3 = [(SKUIToastViewController *)self presentationController];
  [v3 _setContainerIgnoresDirectTouchEvents:1];

  id v4 = [(SKUIToastViewController *)self view];
  [v4 setUserInteractionEnabled:1];

  v5 = [(SKUIToastViewController *)self imageView];
  [v5 setAlpha:0.64];

  v6 = [MEMORY[0x1E4FB1618] blackColor];
  v7 = [(SKUIToastViewController *)self imageView];
  [v7 setTintColor:v6];

  v8 = [(SKUIToastViewController *)self titleText];
  id v9 = [(SKUIToastViewController *)self primaryLabel];
  [v9 setText:v8];

  id v10 = [(SKUIToastViewController *)self primaryLabel];
  [v10 setTextAlignment:1];

  id v11 = [(SKUIToastViewController *)self primaryLabel];
  [v11 setNumberOfLines:2];

  v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.64];
  id v13 = [(SKUIToastViewController *)self primaryLabel];
  [v13 setTextColor:v12];

  double v14 = [(SKUIToastViewController *)self primaryLabel];
  [v14 setLineBreakMode:4];

  double v15 = [(SKUIToastViewController *)self descriptionText];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v17 = [(SKUIToastViewController *)self descriptionText];
    uint64_t v18 = (void *)[v16 initWithString:v17];

    id v19 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v19 setLineSpacing:2.0];
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v19, 0, objc_msgSend(v18, "length"));
    uint64_t v20 = [(SKUIToastViewController *)self secondaryLabel];
    [v20 setAttributedText:v18];
  }
  v21 = [(SKUIToastViewController *)self secondaryLabel];
  [v21 setTextAlignment:1];

  uint64_t v22 = [(SKUIToastViewController *)self secondaryLabel];
  [v22 setNumberOfLines:4];

  v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.64];
  v24 = [(SKUIToastViewController *)self secondaryLabel];
  [v24 setTextColor:v23];

  v25 = [(SKUIToastViewController *)self secondaryLabel];
  [v25 setLineBreakMode:4];

  v26 = [(SKUIToastViewController *)self toastView];
  v27 = [v26 contentView];
  v28 = [(SKUIToastViewController *)self imageView];
  [v27 addSubview:v28];

  objc_super v29 = [(SKUIToastViewController *)self toastView];
  v30 = [v29 contentView];
  v31 = [(SKUIToastViewController *)self primaryLabel];
  [v30 addSubview:v31];

  v32 = [(SKUIToastViewController *)self toastView];
  v33 = [v32 contentView];
  v34 = [(SKUIToastViewController *)self secondaryLabel];
  [v33 addSubview:v34];

  CGAffineTransformMakeScale(&v40, 0.88, 0.88);
  v35 = [(SKUIToastViewController *)self toastView];
  CGAffineTransform v39 = v40;
  [v35 setTransform:&v39];

  v36 = [(SKUIToastViewController *)self toastView];
  [v36 setAlpha:0.0];

  v37 = [(SKUIToastViewController *)self view];
  v38 = [(SKUIToastViewController *)self toastView];
  [v37 addSubview:v38];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIToastViewController;
  [(SKUIToastViewController *)&v6 viewWillAppear:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SKUIToastViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_1E6422020;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SKUIToastViewController_viewWillAppear___block_invoke_2;
  v4[3] = &unk_1E64223D0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v5 options:v4 animations:0.2 completion:0.0];
}

void __42__SKUIToastViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  v2 = [*(id *)(a1 + 32) toastView];
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];

  v3 = [*(id *)(a1 + 32) toastView];
  [v3 setAlpha:1.0];
}

uint64_t __42__SKUIToastViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissWithDelay:1.5];
}

- (void)viewDidLayoutSubviews
{
  v75.receiver = self;
  v75.super_class = (Class)SKUIToastViewController;
  [(SKUIToastViewController *)&v75 viewDidLayoutSubviews];
  v3 = [(SKUIToastViewController *)self view];
  [v3 bounds];

  CGAffineTransform v4 = [(SKUIToastViewController *)self traitCollection];
  [v4 displayScale];
  uint64_t v6 = v5;

  v7 = [(SKUIToastViewController *)self toastView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, 250.0, 450.0);

  uint64_t v69 = 0;
  v70 = (double *)&v69;
  uint64_t v71 = 0x4010000000;
  v72 = &unk_1C1D0F257;
  long long v73 = 0u;
  long long v74 = 0u;
  v8 = [(SKUIToastViewController *)self toastView];
  [v8 bounds];
  *(double *)&long long v73 = v9 + 25.0;
  *((double *)&v73 + 1) = v10 + 32.0;
  *(double *)&long long v74 = v11 + -50.0;
  *((double *)&v74 + 1) = v12 + -57.0;

  id v13 = [(SKUIToastViewController *)self toastView];
  [v13 bounds];
  UIRectCenteredXInRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = [(SKUIToastViewController *)self imageView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = v70;
  v70[5] = v21 + v70[5];
  v23[7] = v23[7] - v21;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__SKUIToastViewController_viewDidLayoutSubviews__block_invoke;
  aBlock[3] = &unk_1E6426BA0;
  aBlock[4] = &v69;
  aBlock[5] = v64;
  aBlock[6] = &v65;
  v24 = (void (**)(void *, void *, void, double))_Block_copy(aBlock);
  v25 = [(id)objc_opt_class() _primaryLabelFont];
  v26 = [(SKUIToastViewController *)self primaryLabel];
  [v26 setFont:v25];

  v27 = [(SKUIToastViewController *)self primaryLabel];
  v24[2](v24, v27, 0, 18.0);

  v28 = [(id)objc_opt_class() _secondaryLabelFont];
  objc_super v29 = [(SKUIToastViewController *)self secondaryLabel];
  [v29 setFont:v28];

  v30 = [(SKUIToastViewController *)self secondaryLabel];
  v24[2](v24, v30, 0, 25.0);

  v31 = [(SKUIToastViewController *)self toastView];
  [v31 bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = v66[3];
  CGAffineTransform v39 = [(SKUIToastViewController *)self toastView];
  CGAffineTransform v40 = v39;
  double v41 = fmin(v38 + 25.0, 450.0);
  if (v41 < 250.0) {
    double v41 = 250.0;
  }
  float v42 = v41;
  objc_msgSend(v39, "setBounds:", v33, v35, v37, ceilf(v42));

  v43 = [(SKUIToastViewController *)self toastView];
  [v43 frame];
  UIRectCenteredXInRectScale();
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v52 = [(SKUIToastViewController *)self toastView];
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

  v53 = [(SKUIToastViewController *)self toastView];
  [v53 frame];
  UIRectCenteredYInRectScale();
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  v62 = [(SKUIToastViewController *)self toastView];
  objc_msgSend(v62, "setFrame:", v55, v57, v59, v61);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
}

void __48__SKUIToastViewController_viewDidLayoutSubviews__block_invoke(void *a1, void *a2, double a3)
{
  id v21 = a2;
  [v21 frame];
  uint64_t v5 = *(void *)(a1[4] + 8);
  double v6 = *(double *)(v5 + 48);
  double v7 = *(double *)(v5 + 56);
  objc_msgSend(v21, "sizeThatFits:", v6, v7);
  double v9 = v8;
  double MinX = CGRectGetMinX(*(CGRect *)(*(void *)(a1[4] + 8) + 32));
  double v11 = *(double *)(*(void *)(a1[5] + 8) + 24);
  if (v11 <= 0.0)
  {
    double v14 = CGRectGetMinY(*(CGRect *)(*(void *)(a1[4] + 8) + 32)) + a3;
  }
  else
  {
    double v12 = v11 + a3;
    [v21 _firstBaselineOffsetFromTop];
    *(float *)&double v13 = v12 - v13;
    double v14 = ceilf(*(float *)&v13);
  }
  if (v9 >= v7) {
    double v15 = v7;
  }
  else {
    double v15 = v9;
  }
  float v16 = v15;
  double v17 = ceilf(v16);
  objc_msgSend(v21, "setFrame:", MinX, v14, v6, v17);
  v23.origin.x = MinX;
  v23.origin.y = v14;
  v23.size.width = v6;
  v23.size.height = v17;
  *(double *)(*(void *)(a1[4] + 8) + 56) = *(double *)(*(void *)(a1[4] + 8) + 56) - CGRectGetHeight(v23);
  double Height = CGRectGetHeight(*(CGRect *)(*(void *)(a1[4] + 8) + 32));
  if (Height < 0.0) {
    double Height = 0.0;
  }
  *(double *)(*(void *)(a1[4] + 8) + 56) = Height;
  v24.origin.x = MinX;
  v24.origin.y = v14;
  v24.size.width = v6;
  v24.size.height = v17;
  double MaxY = CGRectGetMaxY(v24);
  [v21 _baselineOffsetFromBottom];
  *(double *)(*(void *)(a1[5] + 8) + 24) = MaxY - v20;
  v25.origin.x = MinX;
  v25.origin.y = v14;
  v25.size.width = v6;
  v25.size.height = v17;
  *(CGFloat *)(*(void *)(a1[6] + 8) + 24) = CGRectGetMaxY(v25);
}

- (void)present
{
  v3 = objc_alloc_init(SKUIToastPresentationWindow);
  [(SKUIToastViewController *)self setPresentationWindow:v3];
  [(SKUIToastPresentationWindow *)v3 setHidden:0];
  [(SKUIToastPresentationWindow *)v3 setUserInteractionEnabled:0];
  [(SKUIToastPresentationWindow *)v3 presentViewController:self animated:1 completion:0];
}

- (void)presentFromViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(SKUIToastViewController *)self setCompletion:a4];
  [v6 presentViewController:self animated:1 completion:0];
}

+ (id)_primaryLabelFont
{
  v2 = (void *)_primaryLabelFont__primaryLabelFont;
  if (!_primaryLabelFont__primaryLabelFont)
  {
    uint64_t v3 = [a1 _fontWithSize:*MEMORY[0x1E4F244E0] textStyleAttribute:22.0];
    CGAffineTransform v4 = (void *)_primaryLabelFont__primaryLabelFont;
    _primaryLabelFont__primaryLabelFont = v3;

    v2 = (void *)_primaryLabelFont__primaryLabelFont;
  }

  return v2;
}

+ (id)_secondaryLabelFont
{
  v2 = (void *)_secondaryLabelFont__secondaryLabelFont;
  if (!_secondaryLabelFont__secondaryLabelFont)
  {
    uint64_t v3 = [a1 _fontWithSize:*MEMORY[0x1E4F244D8] textStyleAttribute:16.0];
    CGAffineTransform v4 = (void *)_secondaryLabelFont__secondaryLabelFont;
    _secondaryLabelFont__secondaryLabelFont = v3;

    v2 = (void *)_secondaryLabelFont__secondaryLabelFont;
  }

  return v2;
}

+ (id)_fontWithSize:(double)a3 textStyleAttribute:(__CFString *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a3];
  id v6 = [v5 fontDescriptor];
  uint64_t v11 = *MEMORY[0x1E4FB0948];
  v12[0] = a4;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  double v8 = [v6 fontDescriptorByAddingAttributes:v7];
  double v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (void)_dismissWithDelay:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SKUIToastViewController__dismissWithDelay___block_invoke;
  v4[3] = &unk_1E6422020;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SKUIToastViewController__dismissWithDelay___block_invoke_2;
  v3[3] = &unk_1E64223D0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v4 options:v3 animations:0.2 completion:a3];
}

void __45__SKUIToastViewController__dismissWithDelay___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) toastView];
  uint64_t v3 = [v2 contentView];
  CGAffineTransform v4 = [v3 superview];
  [v4 setAlpha:0.0];

  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  id v6 = [*(id *)(a1 + 32) toastView];
  [v6 setBackgroundColor:v5];

  CGAffineTransformMakeScale(&v9, 0.88, 0.88);
  double v7 = [*(id *)(a1 + 32) view];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

uint64_t __45__SKUIToastViewController__dismissWithDelay___block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v7, 1.0, 1.0);
  v2 = [*(id *)(a1 + 32) view];
  CGAffineTransform v6 = v7;
  [v2 setTransform:&v6];

  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SKUIToastViewController__dismissWithDelay___block_invoke_3;
  v5[3] = &unk_1E6422020;
  v5[4] = v3;
  return [v3 dismissViewControllerAnimated:0 completion:v5];
}

void __45__SKUIToastViewController__dismissWithDelay___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) completion];
    v3[2]();
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (SKUIToastPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIVisualEffectView)toastView
{
  return self->_toastView;
}

- (void)setToastView:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

- (void)initWithTitle:description:image:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIToastViewController initWithTitle:description:image:]";
}

@end
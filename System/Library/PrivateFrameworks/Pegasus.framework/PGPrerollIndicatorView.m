@interface PGPrerollIndicatorView
+ (double)preferredHeight;
- (CGAffineTransform)_subviewTransform;
- (CGRect)buttonView:(id)a3 imageRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5;
- (CGRect)buttonView:(id)a3 titleRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5;
- (CGSize)labelSize;
- (NSString)labelText;
- (NSString)timeRemainingText;
- (PGButtonView)skipPrerollButtonView;
- (PGControlsViewModel)viewModel;
- (PGDisplayLink)displayLink;
- (PGPrerollIndicatorView)initWithFrame:(CGRect)a3 viewModel:(id)a4;
- (UIEdgeInsets)buttonView:(id)a3 contentEdgeInsetsForProposedInsets:(UIEdgeInsets)a4;
- (UILabel)contentTypeLabel;
- (double)labelWidth;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_layoutContentTypeLabel;
- (void)_layoutSkipPrerollButton;
- (void)buttonViewDidReceiveTouchUpInside:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setLabelSize:(CGSize)a3;
- (void)setLabelText:(id)a3;
- (void)setTimeRemainingText:(id)a3;
- (void)updateValues;
@end

@implementation PGPrerollIndicatorView

+ (double)preferredHeight
{
  return 21.0;
}

- (PGPrerollIndicatorView)initWithFrame:(CGRect)a3 viewModel:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGPrerollIndicatorView;
  v11 = -[PGPrerollIndicatorView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a4);
    v13 = [[PGDisplayLink alloc] initWithOwner:v12 linkFired:&__block_literal_global_4];
    displayLink = v12->_displayLink;
    v12->_displayLink = v13;

    [(PGPrerollIndicatorView *)v12 updateValues];
    [(PGButtonView *)v12->_skipPrerollButtonView sizeToFit];
  }

  return v12;
}

uint64_t __50__PGPrerollIndicatorView_initWithFrame_viewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateValues];
}

- (void)dealloc
{
  [(PGDisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PGPrerollIndicatorView;
  [(PGPrerollIndicatorView *)&v3 dealloc];
}

- (void)updateValues
{
  id v18 = [(PGPrerollIndicatorView *)self viewModel];
  objc_super v3 = [v18 values];
  if (![v3 isPrerollActive])
  {
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  v4 = [v3 prerollAttributes];
  uint64_t v5 = [v4 contentType];
  if (v5 == 2)
  {
    v6 = @"SPONSORED_PREROLL_LABEL";
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    v6 = @"AD_PREROLL_LABEL";
LABEL_7:
    v8 = PGLocalizedString(v6);
    [(PGPrerollIndicatorView *)self setLabelText:v8];
  }
  if ([v18 secondsUntilPrerollSkippable] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PGButtonView *)self->_skipPrerollButtonView setHidden:1];
  }
  else
  {
    uint64_t v9 = [v18 secondsUntilPrerollSkippable];
    if (v9 < 1)
    {
      PGLocalizedString(@"SKIP_PREROLL");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = &stru_1F0E4F210;
      v14 = self;
    }
    else
    {
      uint64_t v10 = v9;
      v11 = NSString;
      v12 = PGLocalizedString(@"SKIP_PREROLL_IN_N_SECONDS");
      objc_msgSend(v11, "stringWithFormat:", v12, v10);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v14 = self;
      v15 = v13;
    }
    [(PGPrerollIndicatorView *)v14 setTimeRemainingText:v15];
    [(PGButtonView *)self->_skipPrerollButtonView setAccessibilityIdentifier:v13];
    [(PGButtonView *)self->_skipPrerollButtonView setHidden:0];
  }
  objc_super v16 = [(PGPrerollIndicatorView *)self contentTypeLabel];
  v17 = [v3 prerollTintColor];
  [v16 setBackgroundColor:v17];

  uint64_t v7 = 10;
LABEL_15:
  [(PGDisplayLink *)self->_displayLink setPreferredFramesPerSecond:v7];
}

- (NSString)labelText
{
  v2 = [(PGPrerollIndicatorView *)self contentTypeLabel];
  objc_super v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLabelText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGPrerollIndicatorView *)self labelText];
  if ((id)v5 == v4)
  {
  }
  else
  {
    v6 = (void *)v5;
    uint64_t v7 = [(PGPrerollIndicatorView *)self labelText];
    char v8 = [v7 isEqualToString:v4];

    if ((v8 & 1) == 0)
    {
      if (!self->_contentTypeLabel)
      {
        uint64_t v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
        contentTypeLabel = self->_contentTypeLabel;
        self->_contentTypeLabel = v9;

        v11 = self->_contentTypeLabel;
        v12 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UILabel *)v11 setTextColor:v12];

        v13 = self->_contentTypeLabel;
        v14 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0 weight:*MEMORY[0x1E4F43930]];
        [(UILabel *)v13 setFont:v14];

        v15 = [(UILabel *)self->_contentTypeLabel layer];
        [v15 setCornerCurve:*MEMORY[0x1E4F39EA8]];

        objc_super v16 = [(UILabel *)self->_contentTypeLabel layer];
        [v16 setCornerRadius:6.0];

        [(UILabel *)self->_contentTypeLabel setTextAlignment:1];
        [(UILabel *)self->_contentTypeLabel setClipsToBounds:1];
        [(PGPrerollIndicatorView *)self addSubview:self->_contentTypeLabel];
        [(UILabel *)self->_contentTypeLabel setUserInteractionEnabled:0];
        [(UIView *)self PG_recursivelyDisallowGroupBlending];
      }
      v17 = [(PGPrerollIndicatorView *)self contentTypeLabel];
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v24[0] = *MEMORY[0x1E4F1DAB8];
      v24[1] = v18;
      v24[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v17 setTransform:v24];

      v19 = [(PGPrerollIndicatorView *)self contentTypeLabel];
      [v19 setText:v4];

      v20 = [(PGPrerollIndicatorView *)self contentTypeLabel];
      [v20 sizeToFit];

      v21 = [(PGPrerollIndicatorView *)self contentTypeLabel];
      [v21 frame];
      -[PGPrerollIndicatorView setLabelSize:](self, "setLabelSize:", v22, v23);

      [(PGPrerollIndicatorView *)self _layoutContentTypeLabel];
    }
  }
}

- (NSString)timeRemainingText
{
  return [(PGButtonView *)self->_skipPrerollButtonView text];
}

- (void)setTimeRemainingText:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGPrerollIndicatorView *)self timeRemainingText];
  if ([v4 isEqualToString:v5])
  {
  }
  else
  {
    id v6 = [(PGPrerollIndicatorView *)self timeRemainingText];

    if (v6 != v4)
    {
      skipPrerollButtonView = self->_skipPrerollButtonView;
      if (!skipPrerollButtonView)
      {
        char v8 = +[PGButtonView buttonWithDelegate:self];
        uint64_t v9 = self->_skipPrerollButtonView;
        self->_skipPrerollButtonView = v8;

        uint64_t v10 = self->_skipPrerollButtonView;
        v11 = +[PGButtonView disabledTintColor];
        [(PGButtonView *)v10 setTintColor:v11];

        [(PGButtonView *)self->_skipPrerollButtonView setEnabled:0];
        [(PGButtonView *)self->_skipPrerollButtonView setGlyphSize:10.5];
        [(PGMaterialView *)self->_skipPrerollButtonView _setContinuousCornerRadius:6.0];
        [(PGButtonView *)self->_skipPrerollButtonView setSystemImageName:@"forward.end.fill"];
        [(PGMaterialView *)self->_skipPrerollButtonView setBackgroundColor:0];
        v12 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0 weight:*MEMORY[0x1E4F43920]];
        uint64_t v13 = *MEMORY[0x1E4F43850];
        v26[0] = *MEMORY[0x1E4F43858];
        v26[1] = v13;
        v27[0] = &unk_1F0E5D540;
        v27[1] = &unk_1F0E5D558;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        v28[0] = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

        objc_super v16 = [v12 fontDescriptor];
        uint64_t v17 = *MEMORY[0x1E4F43818];
        v24[0] = *MEMORY[0x1E4F43808];
        v24[1] = v17;
        v25[0] = v15;
        v25[1] = &unk_1F0E5D7B0;
        long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
        v19 = [v16 fontDescriptorByAddingAttributes:v18];

        v20 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v19 size:13.0];

        [(PGButtonView *)self->_skipPrerollButtonView setFont:v20];
        [(PGPrerollIndicatorView *)self addSubview:self->_skipPrerollButtonView];
        [(UIView *)self PG_recursivelyDisallowGroupBlending];

        skipPrerollButtonView = self->_skipPrerollButtonView;
      }
      [(PGButtonView *)skipPrerollButtonView setText:v4];
      [(PGButtonView *)self->_skipPrerollButtonView sizeToFit];
      BOOL v21 = [(PGControlsViewModel *)self->_viewModel isPrerollSkippable];
      [(PGButtonView *)self->_skipPrerollButtonView setEnabled:v21];
      double v22 = self->_skipPrerollButtonView;
      if (v21) {
        [(PGButtonView *)self->_skipPrerollButtonView enabledTintColor];
      }
      else {
      double v23 = +[PGButtonView disabledTintColor];
      }
      [(PGButtonView *)v22 setTintColor:v23];

      [(PGPrerollIndicatorView *)self _layoutSkipPrerollButton];
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PGPrerollIndicatorView;
  -[PGPrerollIndicatorView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (PGPrerollIndicatorView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    uint64_t v5 = 0;
  }
  uint64_t v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PGPrerollIndicatorView;
  [(PGPrerollIndicatorView *)&v3 layoutSubviews];
  [(PGPrerollIndicatorView *)self _layoutContentTypeLabel];
  [(PGPrerollIndicatorView *)self _layoutSkipPrerollButton];
}

- (double)labelWidth
{
  [(UILabel *)self->_contentTypeLabel frame];

  return CGRectGetWidth(*(CGRect *)&v2);
}

- (void)buttonViewDidReceiveTouchUpInside:(id)a3
{
  id v3 = [(PGPrerollIndicatorView *)self viewModel];
  [v3 handleSkipPrerollButtonTapped];
}

- (CGRect)buttonView:(id)a3 imageRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double MaxX = CGRectGetMaxX(a4);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v10 = MaxX - CGRectGetWidth(v14);
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)buttonView:(id)a3 titleRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double v8 = 6.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.CGFloat x = v8;
  return result;
}

- (UIEdgeInsets)buttonView:(id)a3 contentEdgeInsetsForProposedInsets:(UIEdgeInsets)a4
{
  id v4 = objc_msgSend(a3, "text", a4.top, a4.left, a4.bottom, a4.right);
  if ([v4 length]) {
    double v5 = 9.0;
  }
  else {
    double v5 = 6.0;
  }

  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 6.0;
  double v9 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v9;
  result.top = v6;
  return result;
}

- (CGAffineTransform)_subviewTransform
{
  [(PGPrerollIndicatorView *)self bounds];
  double Height = CGRectGetHeight(v11);
  UIEdgeInsets result = (CGAffineTransform *)[(id)objc_opt_class() preferredHeight];
  double v7 = Height / v6;
  if (v7 > 1.0) {
    double v7 = 1.0;
  }
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v8 + 32);
  if (v7 != 1.0)
  {
    return CGAffineTransformMakeScale(retstr, v7, v7);
  }
  return result;
}

- (void)_layoutContentTypeLabel
{
  contentTypeLabel = self->_contentTypeLabel;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  v13[1] = v4;
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UILabel *)contentTypeLabel setTransform:v13];
  double v5 = [(PGPrerollIndicatorView *)self contentTypeLabel];
  [v5 frame];

  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(id)objc_opt_class() preferredHeight];
  double v9 = v8;
  [(PGPrerollIndicatorView *)self labelSize];
  -[UILabel setFrame:](self->_contentTypeLabel, "setFrame:", v6, v7, v10 + 12.0, v9);
  CGRect v11 = self->_contentTypeLabel;
  [(PGPrerollIndicatorView *)self _subviewTransform];
  [(UILabel *)v11 setTransform:&v12];
  -[UILabel setFrameOrigin:](self->_contentTypeLabel, "setFrameOrigin:", v6, v7);
}

- (void)_layoutSkipPrerollButton
{
  skipPrerollButtonView = self->_skipPrerollButtonView;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v20[0] = *MEMORY[0x1E4F1DAB8];
  v20[1] = v4;
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PGButtonView *)skipPrerollButtonView setTransform:v20];
  [(PGButtonView *)self->_skipPrerollButtonView sizeToFit];
  [(PGButtonView *)self->_skipPrerollButtonView frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  [(PGPrerollIndicatorView *)self bounds];
  double MaxX = CGRectGetMaxX(v21);
  v22.origin.CGFloat x = v6;
  v22.origin.double y = v8;
  v22.size.double width = v10;
  v22.size.double height = v12;
  double v14 = MaxX - CGRectGetWidth(v22);
  [(id)objc_opt_class() preferredHeight];
  -[PGButtonView setFrame:](self->_skipPrerollButtonView, "setFrame:", v14, 0.0, v10, v15);
  objc_super v16 = self->_skipPrerollButtonView;
  [(PGPrerollIndicatorView *)self _subviewTransform];
  [(PGButtonView *)v16 setTransform:&v19];
  uint64_t v17 = self->_skipPrerollButtonView;
  [(PGPrerollIndicatorView *)self bounds];
  double v18 = CGRectGetMaxX(v23);
  [(PGButtonView *)self->_skipPrerollButtonView frame];
  -[PGButtonView setFrameOrigin:](v17, "setFrameOrigin:", v18 - CGRectGetWidth(v24), 0.0);
}

- (PGControlsViewModel)viewModel
{
  return self->_viewModel;
}

- (UILabel)contentTypeLabel
{
  return self->_contentTypeLabel;
}

- (PGButtonView)skipPrerollButtonView
{
  return self->_skipPrerollButtonView;
}

- (CGSize)labelSize
{
  double width = self->_labelSize.width;
  double height = self->_labelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLabelSize:(CGSize)a3
{
  self->_labelSize = a3;
}

- (PGDisplayLink)displayLink
{
  return self->_displayLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_skipPrerollButtonView, 0);
  objc_storeStrong((id *)&self->_contentTypeLabel, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
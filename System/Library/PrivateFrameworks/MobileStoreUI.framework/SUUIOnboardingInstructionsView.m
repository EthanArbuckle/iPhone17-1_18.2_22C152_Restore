@interface SUUIOnboardingInstructionsView
+ (id)explanationAttributedStringWithString:(id)a3;
+ (id)titleAttributedStringWithString:(id)a3;
- (SUUIOnboardingInstructionsView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (UILabel)explanationLabel;
- (UILabel)titleLabel;
- (id)_newExplanationLabel;
- (id)_newTitleLabel;
- (int64_t)contentPosition;
- (void)layoutSubviews;
- (void)popLabelState;
- (void)pushLabelState;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentPosition:(int64_t)a3;
- (void)setContentPosition:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation SUUIOnboardingInstructionsView

- (SUUIOnboardingInstructionsView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIOnboardingInstructionsView;
  v3 = -[SUUIOnboardingInstructionsView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(SUUIOnboardingInstructionsView *)v3 _newExplanationLabel];
    explanationLabel = v4->_explanationLabel;
    v4->_explanationLabel = (UILabel *)v5;

    [(SUUIOnboardingInstructionsView *)v4 addSubview:v4->_explanationLabel];
    uint64_t v7 = [(SUUIOnboardingInstructionsView *)v4 _newTitleLabel];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v7;

    [(SUUIOnboardingInstructionsView *)v4 addSubview:v4->_titleLabel];
  }
  return v4;
}

+ (id)explanationAttributedStringWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
  [v5 setObject:v6 forKey:*MEMORY[0x263F814F0]];

  uint64_t v7 = [MEMORY[0x263F825C8] grayColor];
  [v5 setObject:v7 forKey:*MEMORY[0x263F81500]];

  v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v4 attributes:v5];
  return v8;
}

+ (id)titleAttributedStringWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x263F81708] _ultraLightSystemFontOfSize:28.0];
  [v5 setObject:v6 forKey:*MEMORY[0x263F814F0]];

  uint64_t v7 = [MEMORY[0x263F825C8] blackColor];
  [v5 setObject:v7 forKey:*MEMORY[0x263F81500]];

  v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v4 attributes:v5];
  return v8;
}

- (void)popLabelState
{
  if ((unint64_t)[(NSMutableArray *)self->_labelsStack count] >= 2)
  {
    [(UILabel *)self->_explanationLabel removeFromSuperview];
    [(UILabel *)self->_titleLabel removeFromSuperview];
    v3 = [(NSMutableArray *)self->_labelsStack lastObject];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    id v5 = self->_titleLabel;
    v6 = [(SUUIOnboardingInstructionsView *)self backgroundColor];
    [(UILabel *)v5 setBackgroundColor:v6];

    [(NSMutableArray *)self->_labelsStack removeLastObject];
    [(SUUIOnboardingInstructionsView *)self addSubview:self->_titleLabel];
    uint64_t v7 = [(NSMutableArray *)self->_labelsStack lastObject];
    explanationLabel = self->_explanationLabel;
    self->_explanationLabel = v7;

    v9 = self->_explanationLabel;
    objc_super v10 = [(SUUIOnboardingInstructionsView *)self backgroundColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    [(NSMutableArray *)self->_labelsStack removeLastObject];
    [(SUUIOnboardingInstructionsView *)self addSubview:self->_explanationLabel];
    [(SUUIOnboardingInstructionsView *)self setNeedsLayout];
  }
}

- (void)pushLabelState
{
  labelsStack = self->_labelsStack;
  if (!labelsStack)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = self->_labelsStack;
    self->_labelsStack = v4;

    labelsStack = self->_labelsStack;
  }
  [(NSMutableArray *)labelsStack addObject:self->_explanationLabel];
  [(NSMutableArray *)self->_labelsStack addObject:self->_titleLabel];
  [(UILabel *)self->_explanationLabel removeFromSuperview];
  [(UILabel *)self->_titleLabel removeFromSuperview];
  v6 = [(SUUIOnboardingInstructionsView *)self _newExplanationLabel];
  explanationLabel = self->_explanationLabel;
  self->_explanationLabel = v6;

  v8 = self->_explanationLabel;
  v9 = [(SUUIOnboardingInstructionsView *)self backgroundColor];
  [(UILabel *)v8 setBackgroundColor:v9];

  [(SUUIOnboardingInstructionsView *)self addSubview:self->_explanationLabel];
  objc_super v10 = [(SUUIOnboardingInstructionsView *)self _newTitleLabel];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  v12 = self->_titleLabel;
  v13 = [(SUUIOnboardingInstructionsView *)self backgroundColor];
  [(UILabel *)v12 setBackgroundColor:v13];

  [(SUUIOnboardingInstructionsView *)self addSubview:self->_titleLabel];
  [(SUUIOnboardingInstructionsView *)self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(SUUIOnboardingInstructionsView *)self setNeedsLayout];
  }
}

- (void)setContentPosition:(int64_t)a3
{
}

- (void)setContentPosition:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (self->_contentPosition == a3)
  {
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
  else
  {
    self->_contentPosition = a3;
    if (a4)
    {
      [(UILabel *)self->_explanationLabel frame];
      double v37 = v11;
      double v38 = v10;
      double v35 = v13;
      double v36 = v12;
      [(UILabel *)self->_titleLabel frame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [(SUUIOnboardingInstructionsView *)self layoutSubviews];
      [(UILabel *)self->_explanationLabel frame];
      uint64_t v41 = v23;
      uint64_t v42 = v22;
      uint64_t v39 = v25;
      uint64_t v40 = v24;
      [(UILabel *)self->_titleLabel frame];
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      uint64_t v33 = v32;
      -[UILabel setFrame:](self->_explanationLabel, "setFrame:", v38, v37, v36, v35);
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v15, v17, v19, v21);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke;
      v46[3] = &unk_265400B40;
      v46[4] = self;
      v46[5] = v27;
      v46[6] = v29;
      v46[7] = v31;
      v46[8] = v33;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v46 options:0 animations:1.0 completion:0.0];
      v34 = (void *)MEMORY[0x263F82E00];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_2;
      v45[3] = &unk_265400B40;
      v45[4] = self;
      v45[5] = v42;
      v45[6] = v41;
      v45[7] = v40;
      v45[8] = v39;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_3;
      v43[3] = &unk_265400B68;
      id v44 = v9;
      [v34 animateWithDuration:0 delay:v45 options:v43 animations:1.05 completion:0.05];
    }
    else
    {
      if (v8) {
        (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
      }
      [(SUUIOnboardingInstructionsView *)self setNeedsLayout];
    }
  }
}

uint64_t __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)layoutSubviews
{
  [(SUUIOnboardingInstructionsView *)self bounds];
  double v4 = v3;
  double v6 = v5 - self->_contentInset.left - self->_contentInset.right;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v8 = v7;
  double v10 = v9;
  -[UILabel sizeThatFits:](self->_explanationLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v13 = v12;
  double top = self->_contentInset.top;
  if (!self->_contentPosition)
  {
    float v15 = top + (v4 - top - self->_contentInset.bottom - v10 - v12 + -10.0) * 0.5;
    double top = floorf(v15);
  }
  if (v11 >= v6) {
    double v16 = v6;
  }
  else {
    double v16 = v11;
  }
  if (v8 >= v6) {
    double v8 = v6;
  }
  CGFloat left = self->_contentInset.left;
  float v18 = (v6 - v8) * 0.5;
  float v19 = left + floorf(v18);
  CGFloat v20 = floorf(v19);
  float v21 = (v6 - v16) * 0.5;
  *(float *)&CGFloat left = left + floorf(v21);
  double v22 = floorf(*(float *)&left);
  v26.origin.x = v20;
  v26.origin.y = top;
  v26.size.width = v8;
  v26.size.height = v10;
  double v23 = CGRectGetMaxY(v26) + 10.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v20, top, v8, v10);
  explanationLabel = self->_explanationLabel;
  -[UILabel setFrame:](explanationLabel, "setFrame:", v22, v23, v16, v13);
}

- (void)setBackgroundColor:(id)a3
{
  explanationLabel = self->_explanationLabel;
  id v5 = a3;
  [(UILabel *)explanationLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIOnboardingInstructionsView;
  [(SUUIOnboardingInstructionsView *)&v6 setBackgroundColor:v5];
}

- (id)_newExplanationLabel
{
  id v2 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  [v2 setNumberOfLines:0];
  [v2 setTextAlignment:1];
  return v2;
}

- (id)_newTitleLabel
{
  id v2 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  [v2 setNumberOfLines:0];
  [v2 setTextAlignment:1];
  return v2;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)contentPosition
{
  return self->_contentPosition;
}

- (UILabel)explanationLabel
{
  return self->_explanationLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelsStack, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
}

@end
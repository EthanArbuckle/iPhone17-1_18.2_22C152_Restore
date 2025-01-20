@interface SKUIOnboardingInstructionsView
+ (id)explanationAttributedStringWithString:(id)a3;
+ (id)titleAttributedStringWithString:(id)a3;
- (SKUIOnboardingInstructionsView)initWithFrame:(CGRect)a3;
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

@implementation SKUIOnboardingInstructionsView

- (SKUIOnboardingInstructionsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOnboardingInstructionsView initWithFrame:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIOnboardingInstructionsView;
  v8 = -[SKUIOnboardingInstructionsView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(SKUIOnboardingInstructionsView *)v8 _newExplanationLabel];
    explanationLabel = v9->_explanationLabel;
    v9->_explanationLabel = (UILabel *)v10;

    [(SKUIOnboardingInstructionsView *)v9 addSubview:v9->_explanationLabel];
    uint64_t v12 = [(SKUIOnboardingInstructionsView *)v9 _newTitleLabel];
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v12;

    [(SKUIOnboardingInstructionsView *)v9 addSubview:v9->_titleLabel];
  }
  return v9;
}

+ (id)explanationAttributedStringWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4FB06F8]];

  v7 = [MEMORY[0x1E4FB1618] grayColor];
  [v5 setObject:v7 forKey:*MEMORY[0x1E4FB0700]];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4 attributes:v5];

  return v8;
}

+ (id)titleAttributedStringWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x1E4FB08E0] _ultraLightSystemFontOfSize:28.0];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4FB06F8]];

  v7 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setObject:v7 forKey:*MEMORY[0x1E4FB0700]];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4 attributes:v5];

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
    v6 = [(SKUIOnboardingInstructionsView *)self backgroundColor];
    [(UILabel *)v5 setBackgroundColor:v6];

    [(NSMutableArray *)self->_labelsStack removeLastObject];
    [(SKUIOnboardingInstructionsView *)self addSubview:self->_titleLabel];
    v7 = [(NSMutableArray *)self->_labelsStack lastObject];
    explanationLabel = self->_explanationLabel;
    self->_explanationLabel = v7;

    v9 = self->_explanationLabel;
    uint64_t v10 = [(SKUIOnboardingInstructionsView *)self backgroundColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    [(NSMutableArray *)self->_labelsStack removeLastObject];
    [(SKUIOnboardingInstructionsView *)self addSubview:self->_explanationLabel];
    [(SKUIOnboardingInstructionsView *)self setNeedsLayout];
  }
}

- (void)pushLabelState
{
  labelsStack = self->_labelsStack;
  if (!labelsStack)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_labelsStack;
    self->_labelsStack = v4;

    labelsStack = self->_labelsStack;
  }
  [(NSMutableArray *)labelsStack addObject:self->_explanationLabel];
  [(NSMutableArray *)self->_labelsStack addObject:self->_titleLabel];
  [(UILabel *)self->_explanationLabel removeFromSuperview];
  [(UILabel *)self->_titleLabel removeFromSuperview];
  v6 = [(SKUIOnboardingInstructionsView *)self _newExplanationLabel];
  explanationLabel = self->_explanationLabel;
  self->_explanationLabel = v6;

  v8 = self->_explanationLabel;
  v9 = [(SKUIOnboardingInstructionsView *)self backgroundColor];
  [(UILabel *)v8 setBackgroundColor:v9];

  [(SKUIOnboardingInstructionsView *)self addSubview:self->_explanationLabel];
  uint64_t v10 = [(SKUIOnboardingInstructionsView *)self _newTitleLabel];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  uint64_t v12 = self->_titleLabel;
  v13 = [(SKUIOnboardingInstructionsView *)self backgroundColor];
  [(UILabel *)v12 setBackgroundColor:v13];

  [(SKUIOnboardingInstructionsView *)self addSubview:self->_titleLabel];

  [(SKUIOnboardingInstructionsView *)self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(SKUIOnboardingInstructionsView *)self setNeedsLayout];
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
      [(SKUIOnboardingInstructionsView *)self layoutSubviews];
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
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __78__SKUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke;
      v46[3] = &unk_1E6425038;
      v46[4] = self;
      v46[5] = v27;
      v46[6] = v29;
      v46[7] = v31;
      v46[8] = v33;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v46 options:0 animations:1.0 completion:0.0];
      v34 = (void *)MEMORY[0x1E4FB1EB0];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __78__SKUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_2;
      v45[3] = &unk_1E6425038;
      v45[4] = self;
      v45[5] = v42;
      v45[6] = v41;
      v45[7] = v40;
      v45[8] = v39;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __78__SKUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_3;
      v43[3] = &unk_1E64224E8;
      id v44 = v9;
      [v34 animateWithDuration:0 delay:v45 options:v43 animations:1.05 completion:0.05];
    }
    else
    {
      if (v8) {
        (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
      }
      [(SKUIOnboardingInstructionsView *)self setNeedsLayout];
    }
  }
}

uint64_t __78__SKUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SKUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SKUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)layoutSubviews
{
  [(SKUIOnboardingInstructionsView *)self bounds];
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
  v26.origin.double x = v20;
  v26.origin.double y = top;
  v26.size.double width = v8;
  v26.size.double height = v10;
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
  v6.super_class = (Class)SKUIOnboardingInstructionsView;
  [(SKUIOnboardingInstructionsView *)&v6 setBackgroundColor:v5];
}

- (id)_newExplanationLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  [v2 setNumberOfLines:0];
  [v2 setTextAlignment:1];
  return v2;
}

- (id)_newTitleLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v3 = [MEMORY[0x1E4FB1618] clearColor];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIOnboardingInstructionsView initWithFrame:]";
}

@end
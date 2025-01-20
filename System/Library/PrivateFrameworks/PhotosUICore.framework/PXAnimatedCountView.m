@interface PXAnimatedCountView
- (BOOL)_requiresDigitAnimationForNewText:(id)a3;
- (BOOL)_requiresLabelSwitchForNewText:(id)a3;
- (CAGradientLayer)gradientLayer;
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (PXAnimatedCountView)initWithCoder:(id)a3;
- (PXAnimatedCountView)initWithFrame:(CGRect)a3;
- (PXAnimatedLabel)currentLabel;
- (PXAnimatedLabel)sizingLabel;
- (UIFont)font;
- (id)_labelWithText:(id)a3;
- (void)_animateLabelSwitchFromLabel:(id)a3 toLabel:(id)a4 andAnimationStyle:(int64_t)a5 completionBlock:(id)a6;
- (void)_updateSizingWithText:(id)a3;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setCurrentLabel:(id)a3;
- (void)setFont:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setSizingLabel:(id)a3;
- (void)setText:(id)a3;
- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4;
- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4 spinDigits:(BOOL)a5;
@end

@implementation PXAnimatedCountView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
  objc_storeStrong((id *)&self->_currentLabel, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (void)setGradientLayer:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return (CAGradientLayer *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSizingLabel:(id)a3
{
}

- (PXAnimatedLabel)sizingLabel
{
  return (PXAnimatedLabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCurrentLabel:(id)a3
{
}

- (PXAnimatedLabel)currentLabel
{
  return (PXAnimatedLabel *)objc_getProperty(self, a2, 424, 1);
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (void)_animateLabelSwitchFromLabel:(id)a3 toLabel:(id)a4 andAnimationStyle:(int64_t)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v10;
  id v14 = v11;
  [(PXAnimatedCountView *)self bounds];
  objc_msgSend(v14, "setFrame:");
  [(PXAnimatedCountView *)self addSubview:v14];
  [(PXAnimatedCountView *)self setCurrentLabel:v14];
  v15 = [(PXAnimatedCountView *)self currentLabel];
  [v15 bounds];
  CGFloat v16 = CGRectGetHeight(v35) + 1.0;

  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, 0.0, 0.0 - v16);
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeTranslation(&v33, 0.0, v16);
  if (a5 == 2)
  {
    CGAffineTransform v32 = v34;
    long long v29 = *(_OWORD *)&v33.a;
    long long v30 = *(_OWORD *)&v33.c;
    long long v17 = *(_OWORD *)&v33.tx;
  }
  else
  {
    CGAffineTransform v32 = v33;
    long long v29 = *(_OWORD *)&v34.a;
    long long v30 = *(_OWORD *)&v34.c;
    long long v17 = *(_OWORD *)&v34.tx;
  }
  long long v31 = v17;
  [v14 setTransform:&v29];
  v18 = (void *)MEMORY[0x1E4FB1EB0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke;
  v25[3] = &unk_1E5DCA648;
  id v26 = v14;
  id v19 = v13;
  id v27 = v19;
  CGAffineTransform v28 = v32;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke_2;
  v22[3] = &unk_1E5DCD158;
  id v23 = v19;
  id v24 = v12;
  id v20 = v12;
  id v21 = v14;
  [v18 animateWithDuration:0x10000 delay:v25 options:v22 animations:0.400000006 completion:0.0];
}

uint64_t __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v7 = *MEMORY[0x1E4F1DAB8];
  long long v8 = v3;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:&v7];
  v4 = *(void **)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 80);
  [v4 setTransform:&v7];
  [*(id *)(a1 + 32) setAlpha:1.0];
  return [*(id *)(a1 + 40) setAlpha:0.0];
}

uint64_t __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateSizingWithText:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXAnimatedCountView *)self sizingLabel];
  [v5 setText:v4];

  [(PXAnimatedCountView *)self invalidateIntrinsicContentSize];
  v6 = (void *)MEMORY[0x1E4F39CF8];
  [v6 flush];
}

- (id)_labelWithText:(id)a3
{
  id v4 = (__CFString *)a3;
  long long v5 = objc_alloc_init(PXAnimatedLabel);
  v6 = v5;
  if (v4) {
    long long v7 = v4;
  }
  else {
    long long v7 = &stru_1F00B0030;
  }
  [(PXAnimatedLabel *)v5 setText:v7];

  [(PXAnimatedLabel *)v6 setAlpha:0.0];
  long long v8 = [(PXAnimatedCountView *)self font];
  if (v8) {
    [(PXAnimatedLabel *)v6 setFont:v8];
  }

  return v6;
}

- (BOOL)_requiresDigitAnimationForNewText:(id)a3
{
  id v3 = a3;
  if ([v3 rangeOfDigits]) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 containsDigits];
  }

  return v4;
}

- (BOOL)_requiresLabelSwitchForNewText:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXAnimatedCountView *)self text];
  v6 = [v5 stringByRemovingDigits];
  long long v7 = [v4 stringByRemovingDigits];
  uint64_t v8 = [v4 rangeOfDigits];
  uint64_t v10 = v9;
  [v5 rangeOfDigits];
  uint64_t v12 = v11;
  if (v8) {
    LOBYTE(v13) = 1;
  }
  else {
    int v13 = [v4 containsDigits] ^ 1;
  }
  int v14 = [v6 isEqualToString:v7];
  if (v12 == v10) {
    char v15 = v13;
  }
  else {
    char v15 = 1;
  }
  if (v14) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  id v5 = a3;
  v6 = [(PXAnimatedCountView *)self currentLabel];
  [v6 setFont:v5];

  id v7 = [(PXAnimatedCountView *)self sizingLabel];
  [v7 setFont:v5];
}

- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4 spinDigits:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = 1;
    if (a4 != 1) {
      uint64_t v10 = 2;
    }
    uint64_t v41 = v10;
    uint64_t v11 = [(PXAnimatedCountView *)self currentLabel];
    uint64_t v12 = self->_text;
    BOOL v13 = [(PXAnimatedCountView *)self _requiresLabelSwitchForNewText:v9];
    int v14 = [(PXAnimatedCountView *)self _requiresDigitAnimationForNewText:v9]
       && v5;
    objc_storeStrong((id *)&self->_text, a3);
    if (v13 && v14)
    {
      v37 = v11;
      id v15 = v9;
      uint64_t v16 = [v15 rangeOfDigits];
      unint64_t v18 = v17;
      v40 = v12;
      uint64_t v19 = [(NSString *)v12 digits];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v19;
      }
      id v21 = (void *)MEMORY[0x1E4F28EE0];
      v22 = objc_msgSend(NSNumber, "numberWithInteger:", v20, v37);
      id v23 = [v21 localizedStringFromNumber:v22 numberStyle:0];

      uint64_t v39 = v16;
      if ([v23 length] >= v18)
      {
        v25 = v23;
      }
      else
      {
        do
        {
          id v24 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1F02D8E00 numberStyle:0];
          v25 = [v24 stringByAppendingString:v23];

          id v23 = v25;
        }
        while ([v25 length] < v18);
      }
      CGAffineTransform v28 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v39, v18, v25);

      [(NSString *)v40 rangeOfDigits];
      unint64_t v30 = v29;
      [v15 rangeOfDigits];
      if (v31 >= v30)
      {
        CGAffineTransform v34 = [(PXAnimatedCountView *)self _labelWithText:v28];
        [(PXAnimatedCountView *)self _updateSizingWithText:v15];
        uint64_t v11 = v38;
        [(PXAnimatedCountView *)self _animateLabelSwitchFromLabel:v38 toLabel:v34 andAnimationStyle:a4 completionBlock:0];
        dispatch_time_t v35 = dispatch_time(0, 240000003);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke;
        v46[3] = &unk_1E5DD0D90;
        id v47 = v34;
        id v48 = v15;
        uint64_t v49 = v41;
        id v36 = v34;
        dispatch_after(v35, MEMORY[0x1E4F14428], v46);
      }
      else
      {
        CGAffineTransform v32 = [(PXAnimatedCountView *)self currentLabel];
        [v32 setText:v15 withAnimationStyle:v41 completionBlock:&__block_literal_global_167636];

        dispatch_time_t v33 = dispatch_time(0, 330000013);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_3;
        block[3] = &unk_1E5DD1508;
        block[4] = self;
        id v43 = v15;
        uint64_t v11 = v38;
        id v44 = v38;
        int64_t v45 = a4;
        dispatch_after(v33, MEMORY[0x1E4F14428], block);
      }
      uint64_t v12 = v40;
    }
    else if (v13)
    {
      id v27 = [(PXAnimatedCountView *)self _labelWithText:v9];
      [(PXAnimatedCountView *)self _updateSizingWithText:v9];
      [(PXAnimatedCountView *)self _animateLabelSwitchFromLabel:v11 toLabel:v27 andAnimationStyle:a4 completionBlock:0];
    }
    else if (v14)
    {
      [v11 setText:v9 withAnimationStyle:v41 completionBlock:0];
      [(PXAnimatedCountView *)self _updateSizingWithText:v9];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_text, a3);
    id v26 = [(PXAnimatedCountView *)self currentLabel];
    [v26 setText:v9];

    [(PXAnimatedCountView *)self _updateSizingWithText:v9];
  }
}

uint64_t __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setText:*(void *)(a1 + 40) withAnimationStyle:*(void *)(a1 + 48) completionBlock:0];
}

void __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _labelWithText:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_4;
  v6[3] = &unk_1E5DD0058;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  [v3 _animateLabelSwitchFromLabel:v4 toLabel:v2 andAnimationStyle:v5 completionBlock:v6];
}

uint64_t __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSizingWithText:*(void *)(a1 + 40)];
}

- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4
{
}

- (void)setText:(id)a3
{
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXAnimatedCountView;
  [(PXAnimatedCountView *)&v13 layoutSubviews];
  [(PXAnimatedCountView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(PXAnimatedCountView *)self gradientLayer];
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGRect v15 = CGRectInset(v14, 0.0, 4.0);
  objc_msgSend(v11, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

  uint64_t v12 = [(PXAnimatedCountView *)self currentLabel];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(PXAnimatedCountView *)self sizingLabel];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v6 + 8.0;
  double v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (PXAnimatedCountView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCountView;
  double v3 = [(PXAnimatedCountView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PXAnimatedCountView *)v3 commonInit];
  }
  return v4;
}

- (PXAnimatedCountView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCountView;
  double v3 = -[PXAnimatedCountView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PXAnimatedCountView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v20[4] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F39BD0] layer];
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  double v5 = [v4 CGColor];

  id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  double v7 = [v6 CGColor];

  v20[0] = v5;
  v20[1] = v7;
  v20[2] = v7;
  v20[3] = v5;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [(CAGradientLayer *)v3 setColors:v8];
  [(CAGradientLayer *)v3 setLocations:&unk_1F02D4AB0];
  double v9 = [(PXAnimatedCountView *)self layer];
  [v9 bounds];
  -[CAGradientLayer setFrame:](v3, "setFrame:");

  double v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  font = self->_font;
  self->_font = v10;

  gradientLayer = self->_gradientLayer;
  self->_gradientLayer = v3;
  objc_super v13 = v3;

  CGRect v14 = [(PXAnimatedCountView *)self layer];
  [v14 setMask:v13];

  CGRect v15 = objc_alloc_init(PXAnimatedLabel);
  [(PXAnimatedLabel *)v15 setText:&stru_1F00B0030];
  [(PXAnimatedLabel *)v15 setFont:self->_font];
  [(PXAnimatedLabel *)v15 sizeToFit];
  currentLabel = self->_currentLabel;
  self->_currentLabel = v15;
  unint64_t v17 = v15;

  [(PXAnimatedCountView *)self addSubview:v17];
  unint64_t v18 = objc_alloc_init(PXAnimatedLabel);
  [(PXAnimatedLabel *)v18 setText:&stru_1F00B0030];
  [(PXAnimatedLabel *)v18 setFont:self->_font];
  [(PXAnimatedLabel *)v18 sizeToFit];
  sizingLabel = self->_sizingLabel;
  self->_sizingLabel = v18;
}

@end
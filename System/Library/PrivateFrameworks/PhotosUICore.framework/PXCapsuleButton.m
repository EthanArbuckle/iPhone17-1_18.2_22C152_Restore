@interface PXCapsuleButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)maxContentSizeCategory;
- (PXCapsuleButton)init;
- (PXCapsuleButton)initWithCoder:(id)a3;
- (PXCapsuleButton)initWithColor:(id)a3;
- (PXCapsuleButton)initWithFrame:(CGRect)a3;
- (id)_titleFont;
- (id)colorForState:(unint64_t)a3;
- (void)_updateBackgroundColor;
- (void)_updateCornerRadius;
- (void)setColor:(id)a3 forState:(unint64_t)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaxContentSizeCategory:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)startLoadingAnimation;
- (void)stopLoadingAnimation;
@end

@implementation PXCapsuleButton

- (PXCapsuleButton)initWithColor:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCapsuleButton.m", 45, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXCapsuleButton;
  v6 = -[PXCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stateColorMap = v6->_stateColorMap;
    v6->_stateColorMap = v7;

    v6->_maxContentSizeCategory = (NSString *)*MEMORY[0x1E4FB27B0];
    v9 = [(PXCapsuleButton *)v6 titleLabel];
    v10 = [(PXCapsuleButton *)v6 _titleFont];
    [v9 setFont:v10];

    [(PXCapsuleButton *)v6 setColor:v5 forState:0];
  }

  return v6;
}

- (void)setColor:(id)a3 forState:(unint64_t)a4
{
  id v11 = a3;
  stateColorMap = self->_stateColorMap;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  if (!v11)
  {
    [(NSMutableDictionary *)stateColorMap setObject:0 forKeyedSubscript:v7];
    goto LABEL_5;
  }
  uint64_t v8 = [(NSMutableDictionary *)stateColorMap objectForKeyedSubscript:v7];

  if ((id)v8 != v11)
  {
    v9 = self->_stateColorMap;
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];

    v7 = (void *)v8;
LABEL_5:

    [(PXCapsuleButton *)self _invalidateBackgroundColor];
    goto LABEL_7;
  }

LABEL_7:
}

- (void)_updateBackgroundColor
{
  id v3 = [(PXCapsuleButton *)self colorForState:[(PXCapsuleButton *)self state]];
  [(PXCapsuleButton *)self setBackgroundColor:v3];
}

- (id)colorForState:(unint64_t)a3
{
  stateColorMap = self->_stateColorMap;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)stateColorMap objectForKeyedSubscript:v4];

  return v5;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCapsuleButton;
  -[PXCapsuleButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXCapsuleButton *)self _invalidateCornerRadius];
}

- (void)_updateCornerRadius
{
  [(PXCapsuleButton *)self bounds];
  CGFloat v3 = CGRectGetHeight(v6) * 0.5;
  id v4 = [(PXCapsuleButton *)self layer];
  [v4 setCornerRadius:v3];
}

- (void)setMaxContentSizeCategory:(id)a3
{
  if (self->_maxContentSizeCategory != a3)
  {
    self->_maxContentSizeCategory = (NSString *)a3;
    id v5 = [(PXCapsuleButton *)self _titleFont];
    id v4 = [(PXCapsuleButton *)self titleLabel];
    [v4 setFont:v5];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGRect v6 = [(PXCapsuleButton *)self titleLabel];
  v7 = [(PXCapsuleButton *)self _titleFont];
  [v6 setFont:v7];

  uint64_t v8 = [(PXCapsuleButton *)self titleLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;

  objc_super v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  v14 = [v13 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

  double v16 = fmax(v10, 36.0) + 32.0;
  double v17 = 34.0;
  if (!IsAccessibilityCategory) {
    double v17 = 28.0;
  }
  double v18 = fmax(v12 + 10.0, v17);

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (id)_titleFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v3 = *MEMORY[0x1E4FB2948];
  id v4 = [(PXCapsuleButton *)self maxContentSizeCategory];
  id v5 = objc_msgSend(v2, "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v3, v4, 2);

  return v5;
}

- (NSString)maxContentSizeCategory
{
  return self->_maxContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_stateColorMap, 0);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXCapsuleButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXCapsuleButton;
    [(PXCapsuleButton *)&v5 setEnabled:v3];
    [(PXCapsuleButton *)self _stateDidChange];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXCapsuleButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXCapsuleButton;
    [(PXCapsuleButton *)&v5 setSelected:v3];
    [(PXCapsuleButton *)self _stateDidChange];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXCapsuleButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXCapsuleButton;
    [(PXCapsuleButton *)&v5 setHighlighted:v3];
    [(PXCapsuleButton *)self _stateDidChange];
  }
}

- (void)stopLoadingAnimation
{
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  id v5 = [(PXCapsuleButton *)self titleLabel];
  BOOL v3 = [v5 layer];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];
}

- (void)startLoadingAnimation
{
  BOOL v3 = [(PXCapsuleButton *)self titleLabel];
  double v4 = [v3 layer];
  [v4 setOpacity:0.0];

  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    CGRect v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    v7 = self->_activityIndicatorView;
    self->_activityIndicatorView = v6;

    uint64_t v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIActivityIndicatorView *)self->_activityIndicatorView setColor:v8];

    [(PXCapsuleButton *)self bounds];
    double MidX = CGRectGetMidX(v11);
    [(PXCapsuleButton *)self bounds];
    -[UIActivityIndicatorView setCenter:](self->_activityIndicatorView, "setCenter:", MidX, CGRectGetMidY(v12));
    [(PXCapsuleButton *)self addSubview:self->_activityIndicatorView];
    activityIndicatorView = self->_activityIndicatorView;
  }
  [(UIActivityIndicatorView *)activityIndicatorView startAnimating];
}

- (PXCapsuleButton)initWithCoder:(id)a3
{
  id v5 = a3;
  CGRect v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCapsuleButton.m", 41, @"%s is not available as initializer", "-[PXCapsuleButton initWithCoder:]");

  abort();
}

- (PXCapsuleButton)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCapsuleButton.m", 37, @"%s is not available as initializer", "-[PXCapsuleButton initWithFrame:]");

  abort();
}

- (PXCapsuleButton)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCapsuleButton.m", 33, @"%s is not available as initializer", "-[PXCapsuleButton init]");

  abort();
}

@end
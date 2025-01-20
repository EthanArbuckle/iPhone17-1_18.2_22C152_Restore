@interface PUImportCustomViewBarButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)customAccessibilityLabel;
- (PUImportCustomViewBarButton)initWithCustomView:(id)a3;
- (UIView)customView;
- (id)accessibilityLabel;
- (void)invalidateIntrinsicContentSize;
- (void)setCustomAccessibilityLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)sizeToFit;
- (void)updateConstraints;
@end

@implementation PUImportCustomViewBarButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

- (void)setCustomAccessibilityLabel:(id)a3
{
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (UIView)customView
{
  return self->_customView;
}

- (id)accessibilityLabel
{
  v3 = [(PUImportCustomViewBarButton *)self customAccessibilityLabel];

  if (v3)
  {
    v4 = [(PUImportCustomViewBarButton *)self customAccessibilityLabel];
  }
  else
  {
    v5 = [(PUImportCustomViewBarButton *)self customView];
    v4 = [v5 accessibilityLabel];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportCustomViewBarButton;
  -[PUImportCustomViewBarButton setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PUImportCustomViewBarButton_setHighlighted___block_invoke;
  v5[3] = &unk_1E5F2E120;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.2];
}

void __46__PUImportCustomViewBarButton_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.4;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) customView];
  [v2 setAlpha:v1];
}

- (void)invalidateIntrinsicContentSize
{
  id v2 = [(PUImportCustomViewBarButton *)self customView];
  [v2 invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  id v2 = [(PUImportCustomViewBarButton *)self customView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  id v2 = [(PUImportCustomViewBarButton *)self customView];
  [v2 sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(PUImportCustomViewBarButton *)self customView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)updateConstraints
{
  v16.receiver = self;
  v16.super_class = (Class)PUImportCustomViewBarButton;
  [(PUImportCustomViewBarButton *)&v16 updateConstraints];
  double v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  double v4 = [(UIView *)self->_customView topAnchor];
  double v5 = [(PUImportCustomViewBarButton *)self topAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];
  [v3 addObject:v6];

  double v7 = [(UIView *)self->_customView leftAnchor];
  double v8 = [(PUImportCustomViewBarButton *)self leftAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  double v10 = [(UIView *)self->_customView bottomAnchor];
  double v11 = [(PUImportCustomViewBarButton *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  v13 = [(UIView *)self->_customView rightAnchor];
  v14 = [(PUImportCustomViewBarButton *)self rightAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (PUImportCustomViewBarButton)initWithCustomView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUImportCustomViewBarButton;
  double v6 = -[PUImportCustomViewBarButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    p_customView = (id *)&v6->_customView;
    objc_storeStrong((id *)&v6->_customView, a3);
    [*p_customView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUImportCustomViewBarButton *)v7 addSubview:*p_customView];
  }

  return v7;
}

@end
@interface PUImportAddToAlbumsToolbarView
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (CGSize)intrinsicContentSize;
- (NSString)destinationDescriptionTitle;
- (PHPhotoLibrary)photoLibrary;
- (PUImportAddToAlbumsToolbarView)initWithFrame:(CGRect)a3;
- (PUImportAddToAlbumsToolbarView)initWithFrame:(CGRect)a3 photoLibrary:(id)a4;
- (PUImportAddToAlbumsToolbarViewDelegate)delegate;
- (UIButton)destinationButton;
- (UILabel)destinationLabel;
- (UILabel)titleLabel;
- (id)_destinationDescription;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_animateButtonAlpha:(double)a3;
- (void)_setupButton;
- (void)_setupSubviews;
- (void)_updateButtonText;
- (void)buttonPressed:(id)a3;
- (void)buttonTouchDown:(id)a3;
- (void)buttonTouchDragInside:(id)a3;
- (void)buttonTouchDragOutside:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationDescriptionTitle:(id)a3;
- (void)setDestinationLabel:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation PUImportAddToAlbumsToolbarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destinationButton, 0);
  objc_storeStrong((id *)&self->_destinationDescriptionTitle, 0);
}

- (void)setDestinationLabel:(id)a3
{
}

- (UILabel)destinationLabel
{
  return self->_destinationLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (PUImportAddToAlbumsToolbarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUImportAddToAlbumsToolbarViewDelegate *)WeakRetained;
}

- (UIButton)destinationButton
{
  return self->_destinationButton;
}

- (NSString)destinationDescriptionTitle
{
  return self->_destinationDescriptionTitle;
}

- (CGRect)accessibilityFrame
{
  v3 = [(PUImportAddToAlbumsToolbarView *)self destinationButton];
  [v3 frame];
  -[PUImportAddToAlbumsToolbarView convertRect:toView:](self, "convertRect:toView:", 0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2540];
}

- (id)accessibilityLabel
{
  v3 = NSString;
  double v4 = [(PUImportAddToAlbumsToolbarView *)self titleLabel];
  double v5 = [v4 text];
  double v6 = [(PUImportAddToAlbumsToolbarView *)self destinationDescriptionTitle];
  double v7 = [v3 stringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)buttonPressed:(id)a3
{
  [a3 setAlpha:1.0];
  double v4 = [(PUImportAddToAlbumsToolbarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PUImportAddToAlbumsToolbarView *)self delegate];
    [v6 didTapAddToAlbumsView:self];
  }
}

- (void)buttonTouchDragOutside:(id)a3
{
}

- (void)buttonTouchDragInside:(id)a3
{
}

- (void)_animateButtonAlpha:(double)a3
{
  char v5 = [(PUImportAddToAlbumsToolbarView *)self destinationButton];
  [v5 alpha];
  double v7 = v6;

  if (vabdd_f64(v7, a3) > 0.000001)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PUImportAddToAlbumsToolbarView__animateButtonAlpha___block_invoke;
    v8[3] = &unk_1E5F2E0A8;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v8 options:0 animations:0.25 completion:0.0];
  }
}

void __54__PUImportAddToAlbumsToolbarView__animateButtonAlpha___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) destinationButton];
  [v2 setAlpha:v1];
}

- (void)buttonTouchDown:(id)a3
{
}

- (void)setDestinationDescriptionTitle:(id)a3
{
  double v4 = (NSString *)a3;
  if (self->_destinationDescriptionTitle != v4)
  {
    double v7 = v4;
    if (v4)
    {
      char v5 = v4;
    }
    else
    {
      char v5 = [(PUImportAddToAlbumsToolbarView *)self _destinationDescription];
    }
    destinationDescriptionTitle = self->_destinationDescriptionTitle;
    self->_destinationDescriptionTitle = v5;

    [(PUImportAddToAlbumsToolbarView *)self _updateButtonText];
    double v4 = v7;
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(PUImportAddToAlbumsToolbarView *)self titleLabel];
  [v3 sizeToFit];

  double v4 = [(PUImportAddToAlbumsToolbarView *)self destinationButton];
  [v4 sizeToFit];

  char v5 = [(PUImportAddToAlbumsToolbarView *)self destinationButton];
  [v5 frame];
  double v7 = v6;
  double v8 = [(PUImportAddToAlbumsToolbarView *)self titleLabel];
  [v8 frame];
  double v10 = v7 + v9;
  double v11 = [(PUImportAddToAlbumsToolbarView *)self destinationButton];
  [v11 frame];
  double v13 = v12;
  double v14 = [(PUImportAddToAlbumsToolbarView *)self titleLabel];
  [v14 frame];
  double v16 = v13 + v15;

  double v17 = v10;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_updateButtonText
{
  id v4 = [(PUImportAddToAlbumsToolbarView *)self destinationDescriptionTitle];
  v3 = [(PUImportAddToAlbumsToolbarView *)self destinationLabel];
  [v3 setText:v4];
}

- (void)_setupButton
{
  v34[5] = *MEMORY[0x1E4F143B8];
  if (self->_destinationButton)
  {
    v3 = [(PUImportAddToAlbumsToolbarView *)self _destinationDescription];
    [(PUImportAddToAlbumsToolbarView *)self setDestinationDescriptionTitle:v3];

    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    destinationLabel = self->_destinationLabel;
    self->_destinationLabel = v9;

    double v11 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)self->_destinationLabel setFont:v11];

    [(UILabel *)self->_destinationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v12 = self->_destinationLabel;
    double v13 = [(PUImportAddToAlbumsToolbarView *)self tintColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)self->_destinationLabel setNumberOfLines:1];
    [(UILabel *)self->_destinationLabel setTextAlignment:4];
    [(UIButton *)self->_destinationButton addSubview:self->_destinationLabel];
    [(PUImportAddToAlbumsToolbarView *)self _updateButtonText];
    double v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    double v15 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2998]];
    [v14 setFont:v15];

    [v14 setText:@"⌄"];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v16 = [(PUImportAddToAlbumsToolbarView *)self tintColor];
    [v14 setTextColor:v16];

    [v14 setNumberOfLines:0];
    [v14 setTextAlignment:4];
    [(UIButton *)self->_destinationButton addSubview:v14];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(UILabel *)self->_destinationLabel leadingAnchor];
    v32 = [(UIButton *)self->_destinationButton leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v34[0] = v31;
    v30 = [(UILabel *)self->_destinationLabel centerYAnchor];
    v29 = [(UIButton *)self->_destinationButton centerYAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v34[1] = v28;
    v26 = [(UILabel *)self->_destinationLabel trailingAnchor];
    double v17 = [v14 leadingAnchor];
    double v18 = [v26 constraintEqualToAnchor:v17];
    v34[2] = v18;
    v19 = [v14 trailingAnchor];
    v20 = [(UIButton *)self->_destinationButton trailingAnchor];
    v21 = [v19 constraintLessThanOrEqualToAnchor:v20];
    v34[3] = v21;
    v22 = [v14 bottomAnchor];
    v23 = [(UILabel *)self->_destinationLabel bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-1.0];
    v34[4] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
    [v27 activateConstraints:v25];
  }
}

- (id)_destinationDescription
{
  id v2 = [(PUImportAddToAlbumsToolbarView *)self photoLibrary];
  v3 = PXTargetLibraryTitleForDefaultType();

  return v3;
}

- (void)_setupSubviews
{
  v28[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB2950];
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  double v7 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:v3];
  [(UILabel *)self->_titleLabel setFont:v7];

  double v8 = PLLocalizedFrameworkString();
  [(UILabel *)self->_titleLabel setText:v8];

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:0];
  [(PUImportAddToAlbumsToolbarView *)self addSubview:self->_titleLabel];
  double v9 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  destinationButton = self->_destinationButton;
  self->_destinationButton = v9;

  [(UIButton *)self->_destinationButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PUImportAddToAlbumsToolbarView *)self _setupButton];
  [(UIButton *)self->_destinationButton addTarget:self action:sel_buttonPressed_ forControlEvents:64];
  [(UIButton *)self->_destinationButton addTarget:self action:sel_buttonTouchDown_ forControlEvents:1];
  [(UIButton *)self->_destinationButton addTarget:self action:sel_buttonTouchDragInside_ forControlEvents:4];
  [(UIButton *)self->_destinationButton addTarget:self action:sel_buttonTouchDragOutside_ forControlEvents:8];
  [(PUImportAddToAlbumsToolbarView *)self addSubview:self->_destinationButton];
  v21 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(UILabel *)self->_titleLabel leadingAnchor];
  v26 = [(PUImportAddToAlbumsToolbarView *)self leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v28[0] = v25;
  v24 = [(UILabel *)self->_titleLabel centerYAnchor];
  v23 = [(PUImportAddToAlbumsToolbarView *)self centerYAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v28[1] = v22;
  double v11 = [(UIButton *)self->_destinationButton leadingAnchor];
  double v12 = [(UILabel *)self->_titleLabel trailingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12 constant:2.0];
  v28[2] = v13;
  double v14 = [(UIButton *)self->_destinationButton trailingAnchor];
  double v15 = [(PUImportAddToAlbumsToolbarView *)self trailingAnchor];
  double v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
  v28[3] = v16;
  double v17 = [(UIButton *)self->_destinationButton centerYAnchor];
  double v18 = [(PUImportAddToAlbumsToolbarView *)self centerYAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v28[4] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
  [v21 activateConstraints:v20];
}

- (PUImportAddToAlbumsToolbarView)initWithFrame:(CGRect)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUImportAddToAlbumsToolbarView.m", 34, @"%s is not available as initializer", "-[PUImportAddToAlbumsToolbarView initWithFrame:]");

  abort();
}

- (PUImportAddToAlbumsToolbarView)initWithFrame:(CGRect)a3 photoLibrary:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUImportAddToAlbumsToolbarView;
  double v11 = -[PUImportAddToAlbumsToolbarView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    [(PUImportAddToAlbumsToolbarView *)v12 _setupSubviews];
  }

  return v12;
}

@end
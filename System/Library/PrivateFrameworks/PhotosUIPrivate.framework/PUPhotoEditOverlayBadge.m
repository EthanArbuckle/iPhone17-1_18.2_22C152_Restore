@interface PUPhotoEditOverlayBadge
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (PUPhotoEditOverlayBadge)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)insets;
- (UILabel)label;
- (void)_updateLabel;
- (void)setText:(id)a3;
@end

@implementation PUPhotoEditOverlayBadge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UILabel)label
{
  return self->_label;
}

- (NSString)text
{
  return self->_text;
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_label intrinsicContentSize];
  double v4 = v3 + self->_insets.top + self->_insets.bottom;
  double v6 = v5 + self->_insets.left + self->_insets.right;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)_updateLabel
{
  label = self->_label;
  id v3 = [(PUPhotoEditOverlayBadge *)self text];
  [(UILabel *)label setText:v3];
}

- (void)setText:(id)a3
{
  double v4 = (NSString *)a3;
  double v5 = v4;
  if (self->_text != v4)
  {
    v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    double v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v9 copy];
      text = self->_text;
      self->_text = v7;

      [(PUPhotoEditOverlayBadge *)self _updateLabel];
      double v5 = v9;
    }
  }
}

- (PUPhotoEditOverlayBadge)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)PUPhotoEditOverlayBadge;
  v7 = -[PUPhotoEditOverlayBadge initWithFrame:](&v25, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(PUPhotoEditOverlayBadge *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(PUPhotoEditOverlayBadge *)v8 layer];
    [v9 setCornerRadius:3.0];

    v10 = +[PUInterfaceManager currentTheme];
    v11 = [v10 photoEditingOverlayBadgeBackgroundColor];
    [(PUPhotoEditOverlayBadge *)v8 setBackgroundColor:v11];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    label = v8->_label;
    v8->_label = (UILabel *)v12;

    v14 = v8->_label;
    v15 = [v10 photoEditingOverlayBadgeColor];
    [(UILabel *)v14 setTextColor:v15];

    v16 = v8->_label;
    v17 = [v10 photoEditingOverlayBadgeFont];
    [(UILabel *)v16 setFont:v17];

    [(UILabel *)v8->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_label setText:v8->_text];
    [(PUPhotoEditOverlayBadge *)v8 addSubview:v8->_label];
    v18 = [MEMORY[0x1E4F1CA48] array];
    *(_OWORD *)&v8->_insets.double top = xmmword_1AEFF7C20;
    *(_OWORD *)&v8->_insets.double bottom = xmmword_1AEFF7C20;
    v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8->_label attribute:1 relatedBy:0 toItem:v8 attribute:1 multiplier:1.0 constant:8.0];
    [v18 addObject:v19];

    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8->_label attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:v8->_insets.top];
    [v18 addObject:v20];

    v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:2 relatedBy:0 toItem:v8->_label attribute:2 multiplier:1.0 constant:v8->_insets.right];
    [v18 addObject:v21];

    v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v8->_label attribute:4 multiplier:1.0 constant:v8->_insets.bottom];
    [v18 addObject:v22];

    LODWORD(v23) = 1148846080;
    [(UILabel *)v8->_label setContentCompressionResistancePriority:1 forAxis:v23];
    [MEMORY[0x1E4F28DC8] activateConstraints:v18];
  }
  return v8;
}

@end
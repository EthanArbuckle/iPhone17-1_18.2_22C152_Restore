@interface PXUILabel
- (NSString)text;
- (PXLabelSpec)spec;
- (PXUILabel)initWithCoder:(id)a3;
- (PXUILabel)initWithFrame:(CGRect)a3;
- (id)_configuredText;
- (void)_commonPXMemoriesLabelInitialization;
- (void)_configureLabel;
- (void)setSpec:(id)a3;
- (void)setText:(id)a3;
- (void)updateConstraints;
@end

@implementation PXUILabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_labelLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (PXLabelSpec)spec
{
  return self->_spec;
}

- (NSString)text
{
  return self->_text;
}

- (id)_configuredText
{
  v3 = [(PXUILabel *)self text];
  v4 = [(PXUILabel *)self spec];
  v5 = objc_msgSend(v3, "px_stringByApplyingCapitalization:", objc_msgSend(v4, "capitalization"));

  return v5;
}

- (void)updateConstraints
{
  v35[5] = *MEMORY[0x1E4F143B8];
  int64_t verticalAlignment = self->_verticalAlignment;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = self->_label;
  LODWORD(v6) = 1132068864;
  [(UILabel *)v5 setContentCompressionResistancePriority:1 forAxis:v6];
  LODWORD(v7) = 1132068864;
  [(UILabel *)v5 setContentCompressionResistancePriority:0 forAxis:v7];
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  visualEffectView = self->_visualEffectView;
  if (!visualEffectView) {
    visualEffectView = self;
  }
  id v32 = visualEffectView;
  v34[0] = @"leftInset";
  v13 = [NSNumber numberWithDouble:left];
  v35[0] = v13;
  v34[1] = @"topInset";
  v14 = [NSNumber numberWithDouble:top];
  v35[1] = v14;
  v34[2] = @"rightInset";
  v15 = [NSNumber numberWithDouble:right];
  v35[2] = v15;
  v34[3] = @"bottomInset";
  v16 = [NSNumber numberWithDouble:bottom];
  v34[4] = @"marginPriority";
  v35[3] = v16;
  v35[4] = &unk_1F02DBB68;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:5];

  if (verticalAlignment)
  {
    if (verticalAlignment == 1)
    {
      v18 = v32;
      v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:11 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:-self->_contentInsets.bottom];
      [v4 addObject:v26];
    }
    else
    {
      v18 = v32;
      if (verticalAlignment != 2) {
        goto LABEL_10;
      }
      v19 = (void *)MEMORY[0x1E4F28DC8];
      v20 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v5, 0);
      v21 = [v19 constraintsWithVisualFormat:@"V:|-(topInset@marginPriority)-[label(label@marginPriority)]-(>=bottomInset@marginPriority)-|" options:2048 metrics:v17 views:v20];
      [v4 addObjectsFromArray:v21];
    }
    LODWORD(v22) = 1148846080;
    [(UILabel *)v5 setContentHuggingPriority:1 forAxis:v22];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F28DC8];
    v24 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v5, 0);
    v25 = [v23 constraintsWithVisualFormat:@"V:|-(topInset@marginPriority)-[label(label@marginPriority)]-(bottomInset@marginPriority)-|" options:2048 metrics:v17 views:v24];
    [v4 addObjectsFromArray:v25];

    v18 = v32;
  }
LABEL_10:
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v28 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v5, 0);
  v29 = [v27 constraintsWithVisualFormat:@"H:|-(leftInset@marginPriority)-[label(label@marginPriority)]-(rightInset@marginPriority)-|" options:0 metrics:v17 views:v28];
  [v4 addObjectsFromArray:v29];

  if (self->_labelLayoutConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  v30 = (NSArray *)[v4 copy];
  labelLayoutConstraints = self->_labelLayoutConstraints;
  self->_labelLayoutConstraints = v30;

  v33.receiver = self;
  v33.super_class = (Class)PXUILabel;
  [(PXUILabel *)&v33 updateConstraints];
}

- (void)_configureLabel
{
  id v11 = [(PXUILabel *)self spec];
  v3 = [(PXUILabel *)self _configuredText];
  id v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [(UILabel *)self->_label text];
    char v6 = [v4 isEqualToString:v5];

    if ((v6 & 1) == 0) {
      [(UILabel *)self->_label setText:v4];
    }
    double v7 = [v11 font];
    v8 = [(UILabel *)self->_label font];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0) {
      [(UILabel *)self->_label setFont:v7];
    }
    int64_t v10 = [v11 verticalAlignment];
    if (v10 != self->_verticalAlignment)
    {
      self->_int64_t verticalAlignment = v10;
      [(PXUILabel *)self setNeedsUpdateConstraints];
    }
    [v11 contentInsets];
    PXEdgeInsetsEqualToEdgeInsets();
  }
  [(UILabel *)self->_label setText:0];
}

- (void)_commonPXMemoriesLabelInitialization
{
  [(PXUILabel *)self setUserInteractionEnabled:0];
  id obj = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [obj setAdjustsFontSizeToFitWidth:1];
  [obj setMinimumScaleFactor:0.5];
  [obj setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&self->_label, obj);
  visualEffectView = self->_visualEffectView;
  if (visualEffectView)
  {
    id v4 = [(UIVisualEffectView *)visualEffectView contentView];
  }
  else
  {
    id v4 = self;
  }
  v5 = v4;
  [(PXUILabel *)v4 addSubview:obj];
  [(PXUILabel *)self setNeedsUpdateConstraints];
}

- (void)setSpec:(id)a3
{
  v5 = (PXLabelSpec *)a3;
  if (self->_spec != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXUILabel *)self _configureLabel];
    v5 = v6;
  }
}

- (void)setText:(id)a3
{
  if (self->_text != a3)
  {
    id v4 = (NSString *)[a3 copy];
    text = self->_text;
    self->_text = v4;

    [(PXUILabel *)self _configureLabel];
  }
}

- (PXUILabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXUILabel;
  v3 = -[PXUILabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PXUILabel *)v3 _commonPXMemoriesLabelInitialization];
  }
  return v4;
}

- (PXUILabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXUILabel;
  v3 = [(PXUILabel *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PXUILabel *)v3 _commonPXMemoriesLabelInitialization];
  }
  return v4;
}

@end
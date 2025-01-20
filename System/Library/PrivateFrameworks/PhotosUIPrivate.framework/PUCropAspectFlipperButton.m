@interface PUCropAspectFlipperButton
- (PUCropAspectFlipperButton)init;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PUCropAspectFlipperButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionCheckboxLayer, 0);
  objc_storeStrong((id *)&self->_pageLayer, 0);
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCropAspectFlipperButton;
  [(PUCropAspectFlipperButton *)&v4 setEnabled:a3];
  [(PUCropAspectFlipperButton *)self setNeedsLayout];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCropAspectFlipperButton;
  [(PUCropAspectFlipperButton *)&v4 setSelected:a3];
  [(PUCropAspectFlipperButton *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  if (!self->_pageLayer)
  {
    [(PUCropAspectFlipperButton *)self orientation];
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    pageLayer = self->_pageLayer;
    self->_pageLayer = v3;

    [(CALayer *)self->_pageLayer setCornerRadius:4.0];
    PXRectWithCenterAndSize();
    -[CALayer setBounds:](self->_pageLayer, "setBounds:");
    [(PUCropAspectFlipperButton *)self bounds];
    double v6 = v5 * 0.5;
    [(PUCropAspectFlipperButton *)self bounds];
    -[CALayer setPosition:](self->_pageLayer, "setPosition:", v6, v7 * 0.5);
    [(CALayer *)self->_pageLayer setBorderWidth:2.0];
    v8 = [(PUCropAspectFlipperButton *)self layer];
    [v8 addSublayer:self->_pageLayer];
  }
  if (!self->_selectionCheckboxLayer)
  {
    v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
    v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    selectionCheckboxLayer = self->_selectionCheckboxLayer;
    self->_selectionCheckboxLayer = v10;

    id v12 = v9;
    -[CALayer setContents:](self->_selectionCheckboxLayer, "setContents:", [v12 CGImage]);
    PXRectWithCenterAndSize();
    -[CALayer setBounds:](self->_selectionCheckboxLayer, "setBounds:");
  }
  if ([(PUCropAspectFlipperButton *)self isEnabled])
  {
    id v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
    -[CALayer setBackgroundColor:](self->_pageLayer, "setBackgroundColor:", [v13 CGColor]);

    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else
  {
    id v14 = [MEMORY[0x1E4FB1618] systemGray5Color];
    -[CALayer setBackgroundColor:](self->_pageLayer, "setBackgroundColor:", [v14 CGColor]);

    [MEMORY[0x1E4FB1618] systemGray3Color];
  }
  id v15 = objc_claimAutoreleasedReturnValue();
  -[CALayer setBorderColor:](self->_pageLayer, "setBorderColor:", [v15 CGColor]);

  if ([(PUCropAspectFlipperButton *)self isSelected]
    && [(PUCropAspectFlipperButton *)self isEnabled])
  {
    v16 = [(CALayer *)self->_selectionCheckboxLayer superlayer];

    if (!v16)
    {
      v17 = self->_pageLayer;
      v18 = self->_selectionCheckboxLayer;
      [(CALayer *)v17 addSublayer:v18];
    }
  }
  else
  {
    v19 = [(CALayer *)self->_selectionCheckboxLayer superlayer];

    if (v19)
    {
      v20 = self->_selectionCheckboxLayer;
      [(CALayer *)v20 removeFromSuperlayer];
    }
  }
}

- (PUCropAspectFlipperButton)init
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PUCropAspectFlipperButton;
  v2 = [(PUCropAspectFlipperButton *)&v6 init];
  if (v2)
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
    id v4 = (id)[(PUCropAspectFlipperButton *)v2 registerForTraitChanges:v3 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v2;
}

@end
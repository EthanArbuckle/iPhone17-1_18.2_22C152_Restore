@interface _NTKCGalleryCollectionFooter
+ (id)reuseIdentifier;
- (NSString)text;
- (_NTKCGalleryCollectionFooter)initWithFrame:(CGRect)a3;
- (void)_fontSizeDidChange;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation _NTKCGalleryCollectionFooter

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKCGalleryCollectionFooter)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_NTKCGalleryCollectionFooter;
  v3 = -[_NTKCGalleryCollectionFooter initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    v6 = BPSTextColor();
    [(UILabel *)v3->_label setTextColor:v6];

    [(UILabel *)v3->_label setNumberOfLines:0];
    [(_NTKCGalleryCollectionFooter *)v3 addSubview:v3->_label];
    [(_NTKCGalleryCollectionFooter *)v3 _fontSizeDidChange];
  }
  return v3;
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UILabel *)self->_label text];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    if (v4)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v12 = *MEMORY[0x1E4FB0738];
      LODWORD(v8) = 0.5;
      v9 = [MEMORY[0x1E4FB0848] NTKHyphenationParagraphStyleWithFactor:v8];
      [v9 setLineBreakMode:4];
      v13[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v11 = (void *)[v7 initWithString:v4 attributes:v10];

      [(UILabel *)self->_label setAttributedText:v11];
    }
    else
    {
      [(UILabel *)self->_label setText:0];
    }
    [(_NTKCGalleryCollectionFooter *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_NTKCGalleryCollectionFooter;
  [(_NTKCGalleryCollectionFooter *)&v10 layoutSubviews];
  [(_NTKCGalleryCollectionFooter *)self bounds];
  double Width = CGRectGetWidth(v11);
  uint64_t v4 = NTKCScreenStyle();
  char IsRTL = CLKLayoutIsRTL();
  [(UILabel *)self->_label frame];
  double v6 = 0.0;
  if ((IsRTL & 1) == 0)
  {
    if (NTKCScreenStyle() == -1) {
      double v6 = 11.0;
    }
    else {
      double v6 = 15.0;
    }
  }
  double v7 = 15.0;
  if (v4 == -1) {
    double v7 = 11.0;
  }
  double v8 = Width - v7;
  +[NTKCFaceContainerView sizeForFaceSize:1 style:FaceSize()];
  -[UILabel setFrame:](self->_label, "setFrame:", v6, 0.0, v8, v9);
}

- (void)_fontSizeDidChange
{
  uint64_t v3 = NTKCScreenStyle();
  uint64_t v4 = (void *)MEMORY[0x1E4FB28F0];
  if (v3 != -1) {
    uint64_t v4 = (void *)MEMORY[0x1E4FB2948];
  }
  v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*v4];
  double v6 = [v5 fontDescriptorWithSymbolicTraits:0x8000];

  double v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];

  [(UILabel *)self->_label setFont:v7];
  [(_NTKCGalleryCollectionFooter *)self setNeedsLayout];
}

- (void).cxx_destruct
{
}

@end
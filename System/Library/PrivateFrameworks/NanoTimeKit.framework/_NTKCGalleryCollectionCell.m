@interface _NTKCGalleryCollectionCell
+ (id)agaveReuseIdentifier;
+ (id)aloeReuseIdentifier;
+ (id)avoniaReuseIdentifier;
+ (id)classicReuseIdentifier;
+ (id)luxoReuseIdentifier;
+ (id)reuseIdentifier;
- (BOOL)active;
- (NSString)calloutName;
- (NTKCFaceContainerView)faceContainerView;
- (UIFontMetrics)fontMetrics;
- (UIImage)calloutImage;
- (UIView)faceView;
- (_NTKCGalleryCollectionCell)initWithFrame:(CGRect)a3;
- (void)_highlight;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setActive:(BOOL)a3;
- (void)setCalloutImage:(id)a3;
- (void)setCalloutName:(id)a3;
- (void)setFaceContainerView:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setFontMetrics:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation _NTKCGalleryCollectionCell

+ (id)reuseIdentifier
{
  v3 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v4 = [v3 deviceCategory];

  switch(v4)
  {
    case 2:
      v5 = [a1 luxoReuseIdentifier];
      break;
    case 3:
      v5 = [a1 aloeReuseIdentifier];
      break;
    case 4:
      v5 = [a1 agaveReuseIdentifier];
      break;
    case 5:
      v5 = [a1 avoniaReuseIdentifier];
      break;
    default:
      v5 = [a1 classicReuseIdentifier];
      break;
  }
  return v5;
}

+ (id)classicReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)luxoReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-luxo"];

  return v3;
}

+ (id)aloeReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-aloe"];

  return v3;
}

+ (id)agaveReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-agave"];

  return v3;
}

+ (id)avoniaReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-avonia"];

  return v3;
}

- (_NTKCGalleryCollectionCell)initWithFrame:(CGRect)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)_NTKCGalleryCollectionCell;
  v3 = -[_NTKCGalleryCollectionCell initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = FaceSize();
    v6 = -[NTKCFaceContainerView initWithFaceSize:style:]([NTKCFaceContainerView alloc], "initWithFaceSize:style:", 1, v4, v5);
    faceContainerView = v3->_faceContainerView;
    v3->_faceContainerView = v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v30[0] = v3->_faceContainerView;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v10 = [v8 initWithArrangedSubviews:v9];
    contentStack = v3->_contentStack;
    v3->_contentStack = (UIStackView *)v10;

    [(UIStackView *)v3->_contentStack setAlignment:3];
    [(UIStackView *)v3->_contentStack setAxis:1];
    [(UIStackView *)v3->_contentStack setSpacing:10.0];
    [(UIStackView *)v3->_contentStack setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(_NTKCGalleryCollectionCell *)v3 contentView];
    [v12 addSubview:v3->_contentStack];

    v23 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(_NTKCGalleryCollectionCell *)v3 contentView];
    v26 = [v27 leadingAnchor];
    v25 = [(UIStackView *)v3->_contentStack leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v29[0] = v24;
    v13 = [(_NTKCGalleryCollectionCell *)v3 contentView];
    v14 = [v13 trailingAnchor];
    v15 = [(UIStackView *)v3->_contentStack trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v29[1] = v16;
    v17 = [(_NTKCGalleryCollectionCell *)v3 contentView];
    v18 = [v17 topAnchor];
    v19 = [(UIStackView *)v3->_contentStack topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v29[2] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    [v23 activateConstraints:v21];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_NTKCGalleryCollectionCell;
  [(_NTKCGalleryCollectionCell *)&v4 dealloc];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_NTKCGalleryCollectionCell;
  [(_NTKCGalleryCollectionCell *)&v3 prepareForReuse];
  [(_NTKCGalleryCollectionCell *)self setCalloutName:0];
  [(NTKCFaceContainerView *)self->_faceContainerView setFaceView:0];
}

- (UIView)faceView
{
  return [(NTKCFaceContainerView *)self->_faceContainerView faceView];
}

- (void)setFaceView:(id)a3
{
}

- (void)setCalloutName:(id)a3
{
  id v15 = a3;
  char v4 = [v15 isEqualToString:self->_calloutName];
  double v5 = v15;
  if ((v4 & 1) == 0)
  {
    v6 = (NSString *)[v15 copy];
    calloutName = self->_calloutName;
    self->_calloutName = v6;

    NSUInteger v8 = [(NSString *)self->_calloutName length];
    nameLabel = self->_nameLabel;
    if (v8)
    {
      if (nameLabel)
      {
        [(UILabel *)nameLabel setHidden:0];
      }
      else
      {
        uint64_t v10 = (UILabel *)objc_opt_new();
        v11 = self->_nameLabel;
        self->_nameLabel = v10;

        v12 = BPSTextColor();
        [(UILabel *)self->_nameLabel setTextColor:v12];

        v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
        [(UILabel *)self->_nameLabel setFont:v13];

        [(UILabel *)self->_nameLabel setAdjustsFontForContentSizeCategory:1];
        [(UILabel *)self->_nameLabel setAllowsDefaultTighteningForTruncation:1];
        [(UILabel *)self->_nameLabel setMinimumScaleFactor:0.8];
        LODWORD(v14) = 0.5;
        [(UILabel *)self->_nameLabel _setHyphenationFactor:v14];
        [(UILabel *)self->_nameLabel setTextAlignment:1];
        [(UILabel *)self->_nameLabel setNumberOfLines:0];
        [(UIStackView *)self->_contentStack addArrangedSubview:self->_nameLabel];
      }
      [(UILabel *)self->_nameLabel setText:self->_calloutName];
    }
    else
    {
      [(UILabel *)nameLabel setHidden:1];
    }
    double v5 = v15;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKCGalleryCollectionCell;
  [(_NTKCGalleryCollectionCell *)&v4 setHighlighted:a3];
  [(_NTKCGalleryCollectionCell *)self _highlight];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKCGalleryCollectionCell;
  [(_NTKCGalleryCollectionCell *)&v4 setSelected:a3];
  [(_NTKCGalleryCollectionCell *)self _highlight];
}

- (void)_highlight
{
  if ([(_NTKCGalleryCollectionCell *)self isSelected]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [(_NTKCGalleryCollectionCell *)self isHighlighted];
  }
  faceContainerView = self->_faceContainerView;
  [(NTKCFaceContainerView *)faceContainerView setHighlighted:v3];
}

- (void)setActive:(BOOL)a3
{
}

- (BOOL)active
{
  return [(NTKCFaceContainerView *)self->_faceContainerView active];
}

- (NTKCFaceContainerView)faceContainerView
{
  return self->_faceContainerView;
}

- (void)setFaceContainerView:(id)a3
{
}

- (NSString)calloutName
{
  return self->_calloutName;
}

- (UIImage)calloutImage
{
  return self->_calloutImage;
}

- (void)setCalloutImage:(id)a3
{
}

- (UIFontMetrics)fontMetrics
{
  return self->_fontMetrics;
}

- (void)setFontMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontMetrics, 0);
  objc_storeStrong((id *)&self->_calloutImage, 0);
  objc_storeStrong((id *)&self->_calloutName, 0);
  objc_storeStrong((id *)&self->_faceContainerView, 0);
  objc_storeStrong((id *)&self->_contentStack, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
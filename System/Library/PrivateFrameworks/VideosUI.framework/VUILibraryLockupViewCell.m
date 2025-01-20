@interface VUILibraryLockupViewCell
+ (void)configureImageViewArtworkForLockupCell:(id)a3 withMedia:(id)a4 width:(double)a5;
+ (void)configureLockupCell:(id)a3 withMedia:(id)a4 width:(double)a5 forMetrics:(BOOL)a6;
- (BOOL)hideTitleLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIImageView)imageView;
- (VUILabel)titleLabel;
- (VUILibraryLockupViewCell)initWithFrame:(CGRect)a3;
- (VUIRentalExpirationLabel)expirationLabel;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)imageAspectRatio;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setExpirationLabel:(id)a3;
- (void)setHideTitleLabel:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageAspectRatio:(double)a3;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUILibraryLockupViewCell

+ (void)configureLockupCell:(id)a3 withMedia:(id)a4 width:(double)a5 forMetrics:(BOOL)a6
{
  id v20 = a3;
  id v9 = a4;
  [v20 setImageAspectRatio:0.5625];
  if (!a6) {
    +[VUILibraryLockupViewCell configureImageViewArtworkForLockupCell:v20 withMedia:v9 width:a5];
  }
  v10 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v10 setTextStyle:21];
  [(VUITextLayout *)v10 setFontWeight:0];
  v11 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v10 setColor:v11];

  [(VUITextLayout *)v10 setNumberOfLines:1];
  uint64_t v12 = [v9 title];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_1F3E921E0;
  }
  v15 = [v20 titleLabel];
  v16 = +[VUILabel labelWithString:v14 textLayout:v10 existingLabel:v15];
  [v20 setTitleLabel:v16];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v9 rentalExpirationDate];

    if (v17)
    {
      v18 = [v9 rentalExpirationDate];
      v19 = +[VUIRentalExpirationLabel labelWithExpirationDate:v18 textLayout:0 existingLabel:0 locStringPrefix:@"EXPIRATION_LEFT"];
      [v20 setExpirationLabel:v19];
    }
  }
  [v20 setExclusiveTouch:1];
  [v20 setHideTitleLabel:0];
}

+ (void)configureImageViewArtworkForLockupCell:(id)a3 withMedia:(id)a4 width:(double)a5
{
  id v31 = a3;
  id v7 = a4;
  v8 = [v31 imageView];
  if (v8)
  {
    id v9 = [v31 imageView];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
  }
  v10 = v9;

  +[VUIUtilities imageCornerRadiusWithStyle:1];
  double v12 = v11;
  v13 = [v31 contentView];
  v14 = [v13 traitCollection];
  v15 = +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", [v14 userInterfaceStyle]);
  v16 = +[VUIImageResourceMap imageForResourceName:v15];

  v17 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v7 imageType:0];
  [v31 imageAspectRatio];
  double v19 = ceil(v18 * a5);
  [v10 setUserInteractionEnabled:0];
  id v20 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageHighlightColor");
  [v10 _setFocusedColor:v20];

  [v10 setPlaceholderImage:v16];
  SEL v21 = NSSelectorFromString(&cfstr_Artworkurl.isa);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!v17) {
      goto LABEL_11;
    }
    v27 = (void *)MEMORY[0x1E4FB3CC8];
    v28 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
    v22 = objc_msgSend(v27, "decoratorWithOutlineColor:outlineWidths:", v28, 1.0, 1.0, 1.0, 1.0);

    id v29 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    v30 = [v7 mediaLibrary];
    v23 = (void *)[v29 initWithObject:v17 imageLoader:v30 groupType:0];

    objc_msgSend(v22, "setScaleToSize:", a5, v19);
    [MEMORY[0x1E4FB3C70] radiiFromRadius:v12];
    objc_msgSend(v22, "setCornerRadii:");
    [v23 setDecorator:v22];
    [v10 setImageProxy:v23];
    [v10 setCornerRadius:v12];
    goto LABEL_9;
  }
  v22 = ((void (*)(id, SEL))[v7 methodForSelector:v21])(v7, v21);
  if ([v22 length])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3D10]), "initWithSrc:size:", v22, a5, v19);
    v24 = +[VUIUtilities placeholderImageResourceName:0];
    [v23 setPlaceholderSrc:v24];

    [MEMORY[0x1E4FB3C70] radiiFromRadius:v12];
    objc_msgSend(v23, "setBorderRadii:");
    [v23 setExtension:@"jpeg"];
    v25 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
    [v23 setBackgroundColor:v25];

    uint64_t v26 = [MEMORY[0x1E4FB3CC0] makeImageViewWithDescriptor:v23 existingView:v10];

    v10 = (void *)v26;
LABEL_9:
  }
LABEL_11:
  [v31 setImageView:v10];
}

- (VUILibraryLockupViewCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryLockupViewCell;
  return -[VUILibraryLockupViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImageView:(id)a3
{
  v5 = (VUIImageView *)a3;
  p_imageView = &self->_imageView;
  if (self->_imageView != v5)
  {
    v8 = v5;
    [(VUIImageView *)v5 removeFromSuperview];
    objc_storeStrong((id *)&self->_imageView, a3);
    if (*p_imageView)
    {
      id v7 = [(VUILibraryLockupViewCell *)self contentView];
      [v7 addSubview:*p_imageView];
    }
    [(VUILibraryLockupViewCell *)self setNeedsLayout];
    v5 = v8;
  }
}

- (void)setTitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    id v9 = v5;
    [(VUILabel *)titleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (*p_titleLabel)
    {
      v8 = [(VUILibraryLockupViewCell *)self contentView];
      [v8 addSubview:*p_titleLabel];
    }
    [(VUILibraryLockupViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)setExpirationLabel:(id)a3
{
  v5 = (VUIRentalExpirationLabel *)a3;
  p_expirationLabel = &self->_expirationLabel;
  expirationLabel = self->_expirationLabel;
  if (expirationLabel != v5)
  {
    id v9 = v5;
    [(VUIRentalExpirationLabel *)expirationLabel removeFromSuperview];
    [(VUIRentalExpirationLabel *)*p_expirationLabel setDelegate:0];
    objc_storeStrong((id *)&self->_expirationLabel, a3);
    if (*p_expirationLabel)
    {
      [(VUIRentalExpirationLabel *)*p_expirationLabel setDelegate:self];
      v8 = [(VUILibraryLockupViewCell *)self contentView];
      [v8 addSubview:*p_expirationLabel];
    }
    [(VUILibraryLockupViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryLockupViewCell;
  [(VUILibraryLockupViewCell *)&v3 prepareForReuse];
  [(VUIRentalExpirationLabel *)self->_expirationLabel invalidateTimer];
  [(VUIImageView *)self->_imageView setImage:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = ceil(a3.width * self->_imageAspectRatio);
  if (![(VUILibraryLockupViewCell *)self hideTitleLabel])
  {
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
    double v7 = v6;
    [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:20.0];
    double v5 = v5 + v7 + v8;
  }
  expirationLabel = self->_expirationLabel;
  if (expirationLabel)
  {
    -[VUILabel sizeThatFits:](expirationLabel, "sizeThatFits:", width, 1.79769313e308);
    double v11 = v10;
    [(VUILabel *)self->_expirationLabel topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
    double v13 = v12;
    if ([(VUILibraryLockupViewCell *)self hideTitleLabel])
    {
      [(VUILabel *)self->_expirationLabel topMarginWithBaselineMargin:20.0];
      double v13 = v14;
    }
    double v5 = v5 + v11 + v13;
  }
  double v15 = width;
  double v16 = v5;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)VUILibraryLockupViewCell;
  [(VUILibraryLockupViewCell *)&v16 layoutSubviews];
  [(VUILibraryLockupViewCell *)self bounds];
  double Width = CGRectGetWidth(v17);
  double v4 = ceil(Width * self->_imageAspectRatio);
  -[VUIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, Width, v4);
  [(VUILabel *)self->_expirationLabel topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
  double v6 = v5;
  [(VUILabel *)self->_expirationLabel topMarginWithBaselineMargin:20.0];
  double v8 = v7;
  if ([(VUILibraryLockupViewCell *)self hideTitleLabel])
  {
    double v9 = v4 + v8;
  }
  else
  {
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width, 1.79769313e308);
    double v11 = v10;
    [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:20.0];
    double v13 = v4 + v12;
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v13, Width, v11);
    double v9 = v6 + v11 + v13;
  }
  expirationLabel = self->_expirationLabel;
  if (expirationLabel)
  {
    -[VUILabel sizeThatFits:](expirationLabel, "sizeThatFits:", Width, 1.79769313e308);
    -[VUIRentalExpirationLabel setFrame:](self->_expirationLabel, "setFrame:", 0.0, v9, Width, v15);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VUILibraryLockupViewCell;
  -[VUILibraryLockupViewCell setHighlighted:](&v16, sel_setHighlighted_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(VUILibraryLockupViewCell *)self contentView];
  double v6 = [v5 subviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 setHighlighted:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  expirationLabel = self->_expirationLabel;
  if (expirationLabel)
  {
    double v5 = expirationLabel;
  }
  else
  {
    double v5 = self->_titleLabel;
    if (!v5)
    {
      double v5 = [(VUILibraryLockupViewCell *)self traitCollection];
      +[VUIUtilities scaleContentSizeValue:v5 forTraitCollection:a3];
      goto LABEL_5;
    }
  }
  [(VUILabel *)v5 bottomMarginWithBaselineMargin:a3];
LABEL_5:
  double v8 = v7;

  return v8;
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (double)imageAspectRatio
{
  return self->_imageAspectRatio;
}

- (void)setImageAspectRatio:(double)a3
{
  self->_imageAspectRatio = a3;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUIRentalExpirationLabel)expirationLabel
{
  return self->_expirationLabel;
}

- (BOOL)hideTitleLabel
{
  return self->_hideTitleLabel;
}

- (void)setHideTitleLabel:(BOOL)a3
{
  self->_hideTitleLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
@interface SUUIProfileSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
- (BOOL)hasDisclosureChevron;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIProfileSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  uint64_t v6 = *MEMORY[0x263F83570];
  v7 = objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:", *MEMORY[0x263F83570], a5);
  v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
  v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:v6];
  [v7 _scaledValueForValue:36.0];
  double v11 = v10 + 0.0;
  [v8 _scaledValueForValue:16.0];
  double v13 = v11 + v12;
  [v9 _scaledValueForValue:20.0];
  double v15 = v13 + v14;

  double v16 = a3;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v27 = a3;
  uint64_t v6 = [v27 viewElement];
  v7 = [v6 firstChildForElementType:29];
  self->_hasDisclosureChevron = v7 != 0;

  if (!self->_handleLabel)
  {
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    handleLabel = self->_handleLabel;
    self->_handleLabel = v8;

    double v10 = self->_handleLabel;
    double v11 = [MEMORY[0x263F825C8] grayColor];
    [(UILabel *)v10 setColor:v11];

    [(SUUIProfileSettingDescriptionView *)self addSubview:self->_handleLabel];
  }
  double v12 = [v27 handle];
  double v13 = v12;
  if (v12 && [v12 length])
  {
    [(UILabel *)self->_handleLabel setHidden:0];
    double v14 = self->_handleLabel;
    double v15 = [NSString stringWithFormat:@"@%@", v13];
    [(UILabel *)v14 setText:v15];
  }
  else
  {
    [(UILabel *)self->_handleLabel setHidden:1];
  }
  nameLabel = self->_nameLabel;
  double v17 = v27;
  if (!nameLabel)
  {
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v19 = self->_nameLabel;
    self->_nameLabel = v18;

    v20 = self->_nameLabel;
    v21 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)v20 setColor:v21];

    [(SUUIProfileSettingDescriptionView *)self addSubview:self->_nameLabel];
    double v17 = v27;
    nameLabel = self->_nameLabel;
  }
  v22 = [v17 name];
  [(UILabel *)nameLabel setText:v22];

  imageView = self->_imageView;
  if (!imageView)
  {
    v24 = objc_alloc_init(SUUIImageView);
    v25 = self->_imageView;
    self->_imageView = v24;

    [(SUUIProfileSettingDescriptionView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  v26 = [v27 photo];
  [(SUUIImageView *)imageView setImage:v26];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SUUIProfileSettingDescriptionView;
  [(SUUIProfileSettingDescriptionView *)&v29 layoutSubviews];
  [(SUUISettingDescriptionView *)self layoutMargins];
  CGFloat v4 = v3;
  double v6 = v5;
  [(SUUIProfileSettingDescriptionView *)self bounds];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  CGFloat v11 = floor((CGRectGetHeight(v30) + -56.0) * 0.5);
  [(SUUIImageView *)self->_imageView setFrame:SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v4, v11, 56.0, 56.0, x, y, width, height)];
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v11;
  v31.size.CGFloat width = 56.0;
  v31.size.CGFloat height = 56.0;
  double v12 = CGRectGetMaxX(v31) + 8.0;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v13 = CGRectGetWidth(v32) - v12 - v6;
  double v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_nameLabel setFont:v14];
  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", v13, 1.0);
  double v16 = v15;
  if ([(UILabel *)self->_handleLabel isHidden])
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGFloat v17 = CGRectGetHeight(v33);
    [(UILabel *)self->_nameLabel setFrame:SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v12, floor((v17 - v16) * 0.5), v13, v16, x, y, width, height)];
  }
  else
  {
    [v14 _scaledValueForValue:36.0];
    double v19 = v18;
    [(UILabel *)self->_nameLabel _firstBaselineOffsetFromTop];
    [(UILabel *)self->_nameLabel setFrame:SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v12, v19 - v20, v13, v16, x, y, width, height)];
    v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
    [(UILabel *)self->_handleLabel setFont:v21];
    -[UILabel sizeThatFits:](self->_handleLabel, "sizeThatFits:", v13, 1.0);
    CGFloat v23 = v22;
    [v21 _scaledValueForValue:16.0];
    double v25 = v24;
    [(UILabel *)self->_nameLabel _lastLineBaselineFrameOriginY];
    double v27 = v25 + v26;
    [(UILabel *)self->_handleLabel _firstBaselineOffsetFromTop];
    [(UILabel *)self->_handleLabel setFrame:SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v12, v27 - v28, v13, v23, x, y, width, height)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
}

@end
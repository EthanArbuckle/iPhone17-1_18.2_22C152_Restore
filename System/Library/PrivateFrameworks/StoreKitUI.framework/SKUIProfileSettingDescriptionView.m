@interface SKUIProfileSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)hasDisclosureChevron;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)hasDisclosureChevron;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUIProfileSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIProfileSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIProfileSettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUIProfileSettingDescriptionView requestLayoutForSettingDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUIProfileSettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  uint64_t v14 = *MEMORY[0x1E4FB28C8];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v14];
  [v15 _scaledValueForValue:36.0];
  double v19 = v18 + 0.0;
  [v16 _scaledValueForValue:16.0];
  double v21 = v19 + v20;
  [v17 _scaledValueForValue:20.0];
  double v23 = v21 + v22;

  double v24 = a3;
  double v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProfileSettingDescriptionView *)v3 hasDisclosureChevron];
      }
    }
  }
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIProfileSettingDescriptionView reloadWithSettingDescription:width:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = v6;
  v16 = [v15 viewElement];
  v17 = [v16 firstChildForElementType:29];
  self->_hasDisclosureChevron = v17 != 0;

  if (!self->_handleLabel)
  {
    double v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    handleLabel = self->_handleLabel;
    self->_handleLabel = v18;

    double v20 = self->_handleLabel;
    double v21 = [MEMORY[0x1E4FB1618] grayColor];
    [(UILabel *)v20 setColor:v21];

    [(SKUIProfileSettingDescriptionView *)self addSubview:self->_handleLabel];
  }
  double v22 = [v15 handle];
  double v23 = v22;
  if (v22 && [v22 length])
  {
    [(UILabel *)self->_handleLabel setHidden:0];
    double v24 = self->_handleLabel;
    double v25 = [NSString stringWithFormat:@"@%@", v23];
    [(UILabel *)v24 setText:v25];
  }
  else
  {
    [(UILabel *)self->_handleLabel setHidden:1];
  }
  nameLabel = self->_nameLabel;
  if (!nameLabel)
  {
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v28 = self->_nameLabel;
    self->_nameLabel = v27;

    v29 = self->_nameLabel;
    v30 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v29 setColor:v30];

    [(SKUIProfileSettingDescriptionView *)self addSubview:self->_nameLabel];
    nameLabel = self->_nameLabel;
  }
  v31 = [v15 name];
  [(UILabel *)nameLabel setText:v31];

  imageView = self->_imageView;
  if (!imageView)
  {
    v33 = objc_alloc_init(SKUIImageView);
    v34 = self->_imageView;
    self->_imageView = v33;

    [(SKUIProfileSettingDescriptionView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  v35 = [v15 photo];
  [(SKUIImageView *)imageView setImage:v35];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIProfileSettingDescriptionView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_handleLabel, 0);
}

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hasDisclosureChevron
{
}

- (void)reloadWithSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
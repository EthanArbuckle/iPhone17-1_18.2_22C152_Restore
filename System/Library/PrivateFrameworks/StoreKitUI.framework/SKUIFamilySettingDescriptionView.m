@interface SKUIFamilySettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (id)_attributedStringForKey:(id)a3;
- (id)_attributedStringForViewState;
- (void)_layoutWithActivityIndicator;
- (void)_layoutWithLockup;
- (void)_setViewState:(int64_t)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUIFamilySettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIFamilySettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIFamilySettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
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
      +[SKUIFamilySettingDescriptionView requestLayoutForSettingDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIFamilySettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v14 _scaledValueForValue:48.0];
  double v16 = v15;

  double v17 = a3;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_storeStrong((id *)&self->_layoutContext, a5);
  id v7 = a3;
  uint64_t v8 = [v7 viewState];

  [(SKUIFamilySettingDescriptionView *)self _setViewState:v8];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIFamilySettingDescriptionView;
  [(SKUIFamilySettingDescriptionView *)&v4 layoutSubviews];
  int64_t viewState = self->_viewState;
  if ((unint64_t)(viewState - 1) >= 3)
  {
    if (viewState == -1) {
      [(SKUIFamilySettingDescriptionView *)self _layoutWithActivityIndicator];
    }
  }
  else
  {
    [(SKUIFamilySettingDescriptionView *)self _layoutWithLockup];
  }
}

- (id)_attributedStringForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKUISettingsFamilyViewElement *)self->_viewElement style];
  BOOL v6 = [(SKUIViewElementLayoutContext *)self->_layoutContext clientContext];
  id v7 = v6;
  if (v6) {
    [v6 localizedStringForKey:v4 inTable:@"Settings"];
  }
  else {
  uint64_t v8 = +[SKUIClientContext localizedStringForKey:v4 inBundles:0 inTable:@"Settings"];
  }

  uint64_t v9 = [v5 textShadow];
  uint64_t v10 = [(SKUIFamilySettingDescriptionView *)self tintColor];
  uint64_t v11 = SKUIViewElementPlainColorWithStyle(v5, v10);

  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4FB1618] blackColor];
  }
  uint64_t v12 = SKUIViewElementFontWithStyle(v5);
  id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v14 = objc_msgSend(v13, "initWithObjectsAndKeys:", v11, *MEMORY[0x1E4FB0700], v12, *MEMORY[0x1E4FB06F8], v9, *MEMORY[0x1E4FB0758], 0);
  double v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v14];

  return v15;
}

- (id)_attributedStringForViewState
{
  int64_t viewState = self->_viewState;
  v3 = @"SETTINGS_FAMILY_SETUP";
  if (viewState == 2) {
    v3 = @"SETTINGS_FAMILY_ADD";
  }
  if (viewState == 3) {
    id v4 = @"SETTINGS_FAMILY_MANAGE";
  }
  else {
    id v4 = v3;
  }
  BOOL v5 = [(SKUIFamilySettingDescriptionView *)self _attributedStringForKey:v4];

  return v5;
}

- (void)_layoutWithActivityIndicator
{
  [(UIImageView *)self->_iconImageView setHidden:1];
  [(UILabel *)self->_labelView setHidden:1];
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  if (!self->_activityIndicator)
  {
    v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    [(SKUIFamilySettingDescriptionView *)self addSubview:self->_activityIndicator];
  }
  [(SKUIFamilySettingDescriptionView *)self bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  uint64_t v9 = self->_activityIndicator;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v14);

  -[UIActivityIndicatorView setCenter:](v9, "setCenter:", MidX, MidY);
}

- (void)_layoutWithLockup
{
  [(UIImageView *)self->_iconImageView setHidden:0];
  [(UILabel *)self->_labelView setHidden:0];
  [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  [(SKUISettingDescriptionView *)self layoutMargins];
  double v4 = v3;
  double v36 = v5;
  [(SKUIFamilySettingDescriptionView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v16 = SKUIImageWithResourceName(@"familySharing");
    double v17 = (UIImageView *)[v15 initWithImage:v16];
    double v18 = self->_iconImageView;
    self->_iconImageView = v17;

    [(SKUIFamilySettingDescriptionView *)self addSubview:self->_iconImageView];
    iconImageView = self->_iconImageView;
  }
  v19 = [(UIImageView *)iconImageView image];
  [v19 size];
  double v21 = v20;
  double v23 = v22;

  v39.origin.CGFloat x = v7;
  v39.origin.CGFloat y = v9;
  v39.size.CGFloat width = v11;
  v39.size.CGFloat height = v13;
  double v24 = floor((CGRectGetHeight(v39) - v23) * 0.5);
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v4, v24, v21, v23);
  labelView = self->_labelView;
  if (!labelView)
  {
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v27 = self->_labelView;
    self->_labelView = v26;

    [(UILabel *)self->_labelView _setTextColorFollowsTintColor:1];
    [(SKUIFamilySettingDescriptionView *)self addSubview:self->_labelView];
    labelView = self->_labelView;
  }
  v28 = [(SKUIFamilySettingDescriptionView *)self _attributedStringForViewState];
  [(UILabel *)labelView setAttributedText:v28];

  id v37 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v40.origin.CGFloat x = v4;
  v40.origin.CGFloat y = v24;
  v40.size.CGFloat width = v21;
  v40.size.CGFloat height = v23;
  CGFloat v29 = CGRectGetMaxX(v40) + 8.0;
  v41.origin.CGFloat x = v7;
  v41.origin.CGFloat y = v9;
  v41.size.CGFloat width = v11;
  v41.size.CGFloat height = v13;
  CGFloat v30 = CGRectGetWidth(v41) - v29 - v36;
  -[UILabel sizeThatFits:](self->_labelView, "sizeThatFits:", v30, 1.79769313e308);
  double v32 = v31;
  [v37 _scaledValueForValue:30.0];
  double v34 = v33;
  [(UILabel *)self->_labelView _firstBaselineOffsetFromTop];
  -[UILabel setFrame:](self->_labelView, "setFrame:", v29, v34 - v35, v30, v32);
}

- (void)_setViewState:(int64_t)a3
{
  self->_int64_t viewState = a3;
  [(SKUIFamilySettingDescriptionView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
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

@end
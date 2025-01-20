@interface SUUIFamilySettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (id)_attributedStringForKey:(id)a3;
- (id)_attributedStringForViewState;
- (void)_layoutWithActivityIndicator;
- (void)_layoutWithLockup;
- (void)_setViewState:(int64_t)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIFamilySettingDescriptionView

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
  v6 = objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:", *MEMORY[0x263F83570], a5);
  [v6 _scaledValueForValue:48.0];
  double v8 = v7;

  double v9 = a3;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_storeStrong((id *)&self->_layoutContext, a5);
  id v7 = a3;
  uint64_t v8 = [v7 viewState];

  [(SUUIFamilySettingDescriptionView *)self _setViewState:v8];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIFamilySettingDescriptionView;
  [(SUUIFamilySettingDescriptionView *)&v4 layoutSubviews];
  int64_t viewState = self->_viewState;
  if ((unint64_t)(viewState - 1) >= 3)
  {
    if (viewState == -1) {
      [(SUUIFamilySettingDescriptionView *)self _layoutWithActivityIndicator];
    }
  }
  else
  {
    [(SUUIFamilySettingDescriptionView *)self _layoutWithLockup];
  }
}

- (id)_attributedStringForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUISettingsFamilyViewElement *)self->_viewElement style];
  v6 = [(SUUIViewElementLayoutContext *)self->_layoutContext clientContext];
  id v7 = v6;
  if (v6) {
    [v6 localizedStringForKey:v4 inTable:@"Settings"];
  }
  else {
  uint64_t v8 = +[SUUIClientContext localizedStringForKey:v4 inBundles:0 inTable:@"Settings"];
  }

  double v9 = [v5 textShadow];
  double v10 = [(SUUIFamilySettingDescriptionView *)self tintColor];
  v11 = SUUIViewElementPlainColorWithStyle(v5, v10);

  if (!v11)
  {
    v11 = [MEMORY[0x263F825C8] blackColor];
  }
  v12 = SUUIViewElementFontWithStyle(v5);
  id v13 = objc_alloc(NSDictionary);
  v14 = objc_msgSend(v13, "initWithObjectsAndKeys:", v11, *MEMORY[0x263F81500], v12, *MEMORY[0x263F814F0], v9, *MEMORY[0x263F81560], 0);
  v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8 attributes:v14];

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
  double v5 = [(SUUIFamilySettingDescriptionView *)self _attributedStringForKey:v4];
  return v5;
}

- (void)_layoutWithActivityIndicator
{
  [(UIImageView *)self->_iconImageView setHidden:1];
  [(UILabel *)self->_labelView setHidden:1];
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  if (!self->_activityIndicator)
  {
    v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    [(SUUIFamilySettingDescriptionView *)self addSubview:self->_activityIndicator];
  }
  [(SUUIFamilySettingDescriptionView *)self bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double v9 = self->_activityIndicator;
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
  [(SUUISettingDescriptionView *)self layoutMargins];
  double v4 = v3;
  double v36 = v5;
  [(SUUIFamilySettingDescriptionView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    id v15 = objc_alloc(MEMORY[0x263F82828]);
    v16 = SUUIImageWithResourceName(@"familySharing");
    v17 = (UIImageView *)[v15 initWithImage:v16];
    v18 = self->_iconImageView;
    self->_iconImageView = v17;

    [(SUUIFamilySettingDescriptionView *)self addSubview:self->_iconImageView];
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
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v27 = self->_labelView;
    self->_labelView = v26;

    [(UILabel *)self->_labelView _setTextColorFollowsTintColor:1];
    [(SUUIFamilySettingDescriptionView *)self addSubview:self->_labelView];
    labelView = self->_labelView;
  }
  v28 = [(SUUIFamilySettingDescriptionView *)self _attributedStringForViewState];
  [(UILabel *)labelView setAttributedText:v28];

  id v37 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
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
  [(SUUIFamilySettingDescriptionView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
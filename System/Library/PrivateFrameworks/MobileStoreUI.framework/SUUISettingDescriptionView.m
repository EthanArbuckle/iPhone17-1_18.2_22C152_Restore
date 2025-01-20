@interface SUUISettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
- (BOOL)hasDisclosureChevron;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)layoutMargins;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUISettingDescriptionView

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
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  return 0;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (UIEdgeInsets)layoutMargins
{
  v17.receiver = self;
  v17.super_class = (Class)SUUISettingDescriptionView;
  [(SUUISettingDescriptionView *)&v17 layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(SUUISettingDescriptionView *)self hasDisclosureChevron];
  double v12 = fmax(v10, 36.0);
  if (v11) {
    double v13 = v12;
  }
  else {
    double v13 = v10;
  }
  double v14 = v4;
  double v15 = v6;
  double v16 = v8;
  result.right = v13;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

@end
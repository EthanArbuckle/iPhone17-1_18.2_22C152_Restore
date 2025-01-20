@interface PKDashboardFooterTextItem
+ (id)identifier;
+ (id)initWithFDICConfiguration:(id)a3;
+ (id)itemWithFooterText:(id)a3;
- (BOOL)useCustomContentInsets;
- (NSArray)sources;
- (NSString)footerText;
- (PKFDICSignageConfiguration)fdicConfiguration;
- (UIColor)linkTextColor;
- (UIEdgeInsets)customContentInsets;
- (UIFont)font;
- (int64_t)maximumNumberOfLines;
- (unint64_t)bottomInsetType;
- (void)setBottomInsetType:(unint64_t)a3;
- (void)setCustomContentInsets:(UIEdgeInsets)a3;
- (void)setFDICConfiguration:(id)a3;
- (void)setFont:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setMaximumNumberOfLines:(int64_t)a3;
- (void)setSources:(id)a3;
- (void)setUseCustomContentInsets:(BOOL)a3;
@end

@implementation PKDashboardFooterTextItem

+ (id)itemWithFooterText:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKDashboardFooterTextItem);
  [(PKDashboardFooterTextItem *)v4 setFooterText:v3];

  [(PKDashboardFooterTextItem *)v4 setBottomInsetType:1];
  [(PKDashboardFooterTextItem *)v4 setUseCustomContentInsets:0];

  return v4;
}

+ (id)initWithFDICConfiguration:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKDashboardFooterTextItem);
  [(PKDashboardFooterTextItem *)v4 setFDICConfiguration:v3];

  [(PKDashboardFooterTextItem *)v4 setBottomInsetType:1];
  [(PKDashboardFooterTextItem *)v4 setUseCustomContentInsets:0];

  return v4;
}

+ (id)identifier
{
  return @"footerTextItem";
}

- (unint64_t)bottomInsetType
{
  return self->_bottomInsetType;
}

- (void)setBottomInsetType:(unint64_t)a3
{
  self->_bottomInsetType = a3;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (void)setLinkTextColor:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (int64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(int64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (BOOL)useCustomContentInsets
{
  return self->_useCustomContentInsets;
}

- (void)setUseCustomContentInsets:(BOOL)a3
{
  self->_useCustomContentInsets = a3;
}

- (UIEdgeInsets)customContentInsets
{
  double top = self->_customContentInsets.top;
  double left = self->_customContentInsets.left;
  double bottom = self->_customContentInsets.bottom;
  double right = self->_customContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCustomContentInsets:(UIEdgeInsets)a3
{
  self->_customContentInsets = a3;
}

- (PKFDICSignageConfiguration)fdicConfiguration
{
  return self->_fdicConfiguration;
}

- (void)setFDICConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdicConfiguration, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_footerText, 0);
}

@end
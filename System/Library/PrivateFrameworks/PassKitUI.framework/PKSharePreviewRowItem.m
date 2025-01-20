@interface PKSharePreviewRowItem
- (BOOL)accessoryEnabled;
- (BOOL)displayCheckmark;
- (BOOL)displayChevron;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharePreviewRowItem:(id)a3;
- (BOOL)isShowingSensitiveContent;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (PKSharePreviewRowItem)init;
- (PKSharePreviewRowItem)initWithIdentifier:(id)a3;
- (UIColor)titleColor;
- (UIImage)icon;
- (unint64_t)displayToggleState;
- (unint64_t)hash;
- (void)setAccessoryEnabled:(BOOL)a3;
- (void)setDisplayCheckmark:(BOOL)a3;
- (void)setDisplayChevron:(BOOL)a3;
- (void)setDisplayToggleState:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIsShowingSensitiveContent:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation PKSharePreviewRowItem

- (PKSharePreviewRowItem)init
{
  return 0;
}

- (PKSharePreviewRowItem)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharePreviewRowItem;
  v6 = [(PKSharePreviewRowItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_title) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_subtitle) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_icon) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_titleColor) {
    objc_msgSend(v4, "addObject:");
  }
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKSharePreviewRowItem *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSharePreviewRowItem *)self isEqualToSharePreviewRowItem:v5];

  return v6;
}

- (BOOL)isEqualToSharePreviewRowItem:(id)a3
{
  v4 = a3;
  BOOL v5 = v4
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && self->_displayChevron == *((unsigned __int8 *)v4 + 8)
    && self->_displayToggleState == v4[7]
    && self->_displayCheckmark == *((unsigned __int8 *)v4 + 9)
    && self->_accessoryEnabled == *((unsigned __int8 *)v4 + 10)
    && self->_enabled == *((unsigned __int8 *)v4 + 11);

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (BOOL)displayChevron
{
  return self->_displayChevron;
}

- (void)setDisplayChevron:(BOOL)a3
{
  self->_displayChevron = a3;
}

- (BOOL)displayCheckmark
{
  return self->_displayCheckmark;
}

- (void)setDisplayCheckmark:(BOOL)a3
{
  self->_displayCheckmark = a3;
}

- (unint64_t)displayToggleState
{
  return self->_displayToggleState;
}

- (void)setDisplayToggleState:(unint64_t)a3
{
  self->_displayToggleState = a3;
}

- (BOOL)accessoryEnabled
{
  return self->_accessoryEnabled;
}

- (void)setAccessoryEnabled:(BOOL)a3
{
  self->_accessoryEnabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isShowingSensitiveContent
{
  return self->_isShowingSensitiveContent;
}

- (void)setIsShowingSensitiveContent:(BOOL)a3
{
  self->_isShowingSensitiveContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
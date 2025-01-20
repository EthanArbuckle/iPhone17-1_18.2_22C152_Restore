@interface PKPayLaterTileDetailIconRow
- (BOOL)centerDetailText;
- (BOOL)centerTitleText;
- (BOOL)isEqual:(id)a3;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)axID;
- (NSString)detail;
- (NSString)title;
- (PKPayLaterTileDetailIconRow)initWithTitle:(id)a3 detail:(id)a4 iconImage:(id)a5;
- (UIColor)detailTextColor;
- (UIColor)titleTextColor;
- (UIFont)detailFont;
- (UIFont)titleFont;
- (UIImage)icon;
- (double)additionalIconPadding;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)setAdditionalIconPadding:(double)a3;
- (void)setAxID:(id)a3;
- (void)setCenterDetailText:(BOOL)a3;
- (void)setCenterTitleText:(BOOL)a3;
- (void)setDetail:(id)a3;
- (void)setDetailFont:(id)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation PKPayLaterTileDetailIconRow

- (PKPayLaterTileDetailIconRow)initWithTitle:(id)a3 detail:(id)a4 iconImage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterTileDetailIconRow;
  v12 = [(PKPayLaterTileDetailIconRow *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_detail, a4);
    objc_storeStrong((id *)&v13->_icon, a5);
  }

  return v13;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_title) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_detail) {
    objc_msgSend(v3, "appendString:");
  }
  v6 = (void *)[v3 copy];

  return (NSCopying *)v6;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKPayLaterTileDetailIconRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    title = self->_title;
    id v5 = v6;
    [v5 setTitleText:title];
    [v5 setDetailText:self->_detail];
    [v5 setTitleFont:self->_titleFont];
    [v5 setDetailFont:self->_detailFont];
    [v5 setTitleTextColor:self->_titleTextColor];
    [v5 setDetailTextColor:self->_detailTextColor];
    [v5 setIcon:self->_icon];
    [v5 setAdditionalIconPadding:self->_additionalIconPadding];
    [v5 setCenterTitleText:self->_centerTitleText];
    [v5 setCenterDetailText:self->_centerDetailText];
    [v5 setAccessibilityIdentifier:self->_axID];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_detail];
  [v3 safelyAddObject:self->_icon];
  [v3 safelyAddObject:self->_titleFont];
  [v3 safelyAddObject:self->_detailFont];
  [v3 safelyAddObject:self->_titleTextColor];
  [v3 safelyAddObject:self->_detailTextColor];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterTileDetailIconRow *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        title = v6->_title;
        v8 = self->_title;
        id v9 = title;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_17;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_27;
          }
        }
        detail = v6->_detail;
        v8 = self->_detail;
        v14 = detail;
        if (v8 == v14)
        {

LABEL_19:
          if (PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && PKEqualObjects()
            && self->_additionalIconPadding == v6->_additionalIconPadding
            && self->_centerTitleText == v6->_centerTitleText)
          {
            BOOL v12 = self->_centerDetailText == v6->_centerDetailText;
LABEL_28:

            goto LABEL_29;
          }
LABEL_27:
          BOOL v12 = 0;
          goto LABEL_28;
        }
        id v10 = v14;
        if (v8 && v14)
        {
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_27;
          }
          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_27;
      }
    }
    BOOL v12 = 0;
  }
LABEL_29:

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (void)setDetailFont:(id)a3
{
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void)setDetailTextColor:(id)a3
{
}

- (double)additionalIconPadding
{
  return self->_additionalIconPadding;
}

- (void)setAdditionalIconPadding:(double)a3
{
  self->_additionalIconPadding = a3;
}

- (BOOL)centerTitleText
{
  return self->_centerTitleText;
}

- (void)setCenterTitleText:(BOOL)a3
{
  self->_centerTitleText = a3;
}

- (BOOL)centerDetailText
{
  return self->_centerDetailText;
}

- (void)setCenterDetailText:(BOOL)a3
{
  self->_centerDetailText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
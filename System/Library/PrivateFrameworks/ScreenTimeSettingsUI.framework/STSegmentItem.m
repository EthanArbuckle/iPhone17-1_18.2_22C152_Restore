@interface STSegmentItem
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (NSString)detailText;
- (NSString)titleText;
- (STSegmentItem)initWithTitleText:(id)a3 detailText:(id)a4 titleColor:(id)a5 detailImage:(id)a6 detailImageTintColor:(id)a7;
- (UIColor)detailImageTintColor;
- (UIColor)titleColor;
- (UIImage)detailImage;
- (unint64_t)hash;
- (void)setAccessibilityText:(id)a3;
@end

@implementation STSegmentItem

- (STSegmentItem)initWithTitleText:(id)a3 detailText:(id)a4 titleColor:(id)a5 detailImage:(id)a6 detailImageTintColor:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)STSegmentItem;
  v17 = [(STSegmentItem *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    titleText = v17->_titleText;
    v17->_titleText = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    detailText = v17->_detailText;
    v17->_detailText = (NSString *)v20;

    objc_storeStrong((id *)&v17->_titleColor, a5);
    objc_storeStrong((id *)&v17->_detailImage, a6);
    uint64_t v22 = [v16 copy];
    detailImageTintColor = v17->_detailImageTintColor;
    v17->_detailImageTintColor = (UIColor *)v22;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(STSegmentItem *)self titleText];
    v7 = [v5 titleText];
    if (![v6 isEqualToString:v7])
    {
      char v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v8 = [(STSegmentItem *)self detailText];
    v9 = [v5 detailText];
    if (![v8 isEqualToString:v9])
    {
      char v14 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v10 = [(STSegmentItem *)self titleColor];
    v11 = [v5 titleColor];
    if (![v10 isEqual:v11])
    {
      char v14 = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v12 = [(STSegmentItem *)self detailImage];
    v26 = [v5 detailImage];
    if (v12 == v26)
    {
      v23 = v12;
    }
    else
    {
      v21 = v11;
      id v13 = [(STSegmentItem *)self detailImage];
      v24 = [v5 detailImage];
      objc_super v25 = v13;
      if (!objc_msgSend(v13, "isEqual:"))
      {
        char v14 = 0;
        v11 = v21;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v23 = v12;
      v11 = v21;
    }
    id v15 = [(STSegmentItem *)self detailImageTintColor];
    uint64_t v16 = [v5 detailImageTintColor];
    if (v15 == (void *)v16)
    {

      char v14 = 1;
    }
    else
    {
      uint64_t v20 = (void *)v16;
      v19 = [(STSegmentItem *)self detailImageTintColor];
      [v5 detailImageTintColor];
      v17 = uint64_t v22 = v10;
      char v14 = [v19 isEqual:v17];

      v10 = v22;
    }
    id v12 = v23;
    if (v23 == v26) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  char v14 = 0;
LABEL_23:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(STSegmentItem *)self titleText];
  uint64_t v4 = [v3 hash];
  id v5 = [(STSegmentItem *)self detailText];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(STSegmentItem *)self titleColor];
  uint64_t v8 = [v7 hash];
  v9 = [(STSegmentItem *)self detailImage];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(STSegmentItem *)self detailImageTintColor];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (NSString)accessibilityText
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessibilityText:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIImage)detailImage
{
  return self->_detailImage;
}

- (UIColor)detailImageTintColor
{
  return (UIColor *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailImageTintColor, 0);
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
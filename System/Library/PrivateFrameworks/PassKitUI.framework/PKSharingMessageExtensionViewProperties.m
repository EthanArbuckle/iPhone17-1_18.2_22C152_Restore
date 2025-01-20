@interface PKSharingMessageExtensionViewProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharingMessageExtensionViewProperties:(id)a3;
- (NSString)buttonText;
- (NSString)fallbackCardImageName;
- (NSString)leftTitleText;
- (NSString)rightTitleText;
- (NSString)subtitle;
- (NSString)title;
- (PKSharingMessageExtensionViewProperties)initWithCoder:(id)a3;
- (UIImage)cardImage;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setCardImage:(id)a3;
- (void)setFallbackCardImageName:(id)a3;
- (void)setLeftTitleText:(id)a3;
- (void)setRightTitleText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKSharingMessageExtensionViewProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMessageExtensionViewProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKSharingMessageExtensionViewProperties;
  v5 = [(PKSharingMessageExtensionViewProperties *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonText"];
    buttonText = v5->_buttonText;
    v5->_buttonText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leftTitleText"];
    leftTitleText = v5->_leftTitleText;
    v5->_leftTitleText = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rightTitleText"];
    rightTitleText = v5->_rightTitleText;
    v5->_rightTitleText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardImage"];
    cardImage = v5->_cardImage;
    v5->_cardImage = (UIImage *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackCardImageName"];
    fallbackCardImageName = v5->_fallbackCardImageName;
    v5->_fallbackCardImageName = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_buttonText forKey:@"buttonText"];
  [v5 encodeObject:self->_leftTitleText forKey:@"leftTitleText"];
  [v5 encodeObject:self->_rightTitleText forKey:@"rightTitleText"];
  [v5 encodeObject:self->_cardImage forKey:@"cardImage"];
  [v5 encodeObject:self->_fallbackCardImageName forKey:@"fallbackCardImageName"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"title: '%@'; ", self->_title];
  [v6 appendFormat:@"subtitle: '%@'; ", self->_subtitle];
  [v6 appendFormat:@"buttonText: '%@'; ", self->_buttonText];
  [v6 appendFormat:@"leftTitleText: '%@'; ", self->_leftTitleText];
  [v6 appendFormat:@"rightTitleText: '%@'; ", self->_rightTitleText];
  [v6 appendFormat:@"cardImage: '%@'; ", self->_cardImage];
  [v6 appendFormat:@"fallbackCardImageName: '%@'; ", self->_fallbackCardImageName];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_title) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_subtitle) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_buttonText) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_leftTitleText) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_rightTitleText) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_cardImage) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_fallbackCardImageName) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSharingMessageExtensionViewProperties *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSharingMessageExtensionViewProperties *)self isEqualToSharingMessageExtensionViewProperties:v5];

  return v6;
}

- (BOOL)isEqualToSharingMessageExtensionViewProperties:(id)a3
{
  id v3 = a3;
  if (v3
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects())
  {
    char v4 = PKEqualObjects();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
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

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
}

- (NSString)leftTitleText
{
  return self->_leftTitleText;
}

- (void)setLeftTitleText:(id)a3
{
}

- (NSString)rightTitleText
{
  return self->_rightTitleText;
}

- (void)setRightTitleText:(id)a3
{
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void)setCardImage:(id)a3
{
}

- (NSString)fallbackCardImageName
{
  return self->_fallbackCardImageName;
}

- (void)setFallbackCardImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackCardImageName, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_rightTitleText, 0);
  objc_storeStrong((id *)&self->_leftTitleText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
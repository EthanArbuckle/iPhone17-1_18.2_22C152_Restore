@interface SUUIOnboardingAffiliationItem
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)imageName;
- (NSString)imageTreatment;
- (NSString)title;
- (NSURL)imageURL;
- (UIColor)fillColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)userAffinityCount;
- (unint64_t)hash;
- (void)setFillColor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageName:(id)a3;
- (void)setImageTreatment:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserAffinityCount:(int64_t)a3;
@end

@implementation SUUIOnboardingAffiliationItem

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setFillColor:self->_fillColor];
  [v4 setIdentifier:self->_identifier];
  [v4 setImageName:self->_imageName];
  [v4 setImageTreatment:self->_imageTreatment];
  [v4 setImageURL:self->_imageURL];
  [v4 setTitle:self->_title];
  [v4 setUserAffinityCount:self->_userAffinityCount];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIOnboardingAffiliationItem;
  v4 = [(SUUIOnboardingAffiliationItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: [%@, %@]", v4, self->_identifier, self->_title];

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_super v7 = [(SUUIOnboardingAffiliationItem *)self identifier];
    v8 = [v4 identifier];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)userAffinityCount
{
  return self->_userAffinityCount;
}

- (void)setUserAffinityCount:(int64_t)a3
{
  self->_userAffinityCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageTreatment, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
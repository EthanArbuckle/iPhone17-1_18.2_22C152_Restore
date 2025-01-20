@interface SKUIOnboardingAffiliationItem
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
- (void)description;
- (void)hash;
- (void)setFillColor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageName:(id)a3;
- (void)setImageTreatment:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserAffinityCount:(int64_t)a3;
@end

@implementation SKUIOnboardingAffiliationItem

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIOnboardingAffiliationItem copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v13 setFillColor:self->_fillColor];
  [v13 setIdentifier:self->_identifier];
  [v13 setImageName:self->_imageName];
  [v13 setImageTreatment:self->_imageTreatment];
  [v13 setImageURL:self->_imageURL];
  [v13 setTitle:self->_title];
  [v13 setUserAffinityCount:self->_userAffinityCount];
  return v13;
}

- (id)description
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIOnboardingAffiliationItem *)v3 description];
      }
    }
  }
  uint64_t v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SKUIOnboardingAffiliationItem;
  uint64_t v12 = [(SKUIOnboardingAffiliationItem *)&v15 description];
  v13 = [v11 stringWithFormat:@"%@: [%@, %@]", v12, self->_identifier, self->_title];

  return v13;
}

- (unint64_t)hash
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIOnboardingAffiliationItem *)v3 hash];
      }
    }
  }
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIOnboardingAffiliationItem isEqual:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    objc_super v15 = [(SKUIOnboardingAffiliationItem *)self identifier];
    v16 = [v4 identifier];
    char v14 = [v15 isEqualToString:v16];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
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

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)description
{
}

- (void)hash
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
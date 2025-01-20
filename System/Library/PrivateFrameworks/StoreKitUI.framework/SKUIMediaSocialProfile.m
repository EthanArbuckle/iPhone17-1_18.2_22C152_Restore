@interface SKUIMediaSocialProfile
- (NSString)bio;
- (NSString)handle;
- (NSString)identifier;
- (NSString)name;
- (NSString)profileType;
- (NSURL)backgroundImageURL;
- (NSURL)profileImageURL;
- (SKUIMediaSocialProfile)initWithProfileDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundImageURL:(id)a3;
- (void)setBio:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setProfileImageURL:(id)a3;
- (void)setProfileType:(id)a3;
@end

@implementation SKUIMediaSocialProfile

- (SKUIMediaSocialProfile)initWithProfileDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialProfile initWithProfileDictionary:]();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaSocialProfile;
  v5 = [(SKUIMediaSocialProfile *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"entityId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"entityType"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      profileType = v5->_profileType;
      v5->_profileType = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      name = v5->_name;
      v5->_name = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"handle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_handle, v15);
    }
    v16 = [v4 objectForKey:@"bio"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v16 copy];
      bio = v5->_bio;
      v5->_bio = (NSString *)v17;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setBackgroundImageURL:self->_backgroundImageURL];
  [v4 setBio:self->_bio];
  [v4 setHandle:self->_handle];
  [v4 setIdentifier:self->_identifier];
  [v4 setName:self->_name];
  [v4 setProfileImageURL:self->_profileImageURL];
  [v4 setProfileType:self->_profileType];
  return v4;
}

- (NSURL)backgroundImageURL
{
  return self->_backgroundImageURL;
}

- (void)setBackgroundImageURL:(id)a3
{
}

- (NSString)bio
{
  return self->_bio;
}

- (void)setBio:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSURL)profileImageURL
{
  return self->_profileImageURL;
}

- (void)setProfileImageURL:(id)a3
{
}

- (NSString)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImageURL, 0);
  objc_storeStrong((id *)&self->_profileType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_bio, 0);

  objc_storeStrong((id *)&self->_backgroundImageURL, 0);
}

- (void)initWithProfileDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialProfile initWithProfileDictionary:]";
}

@end
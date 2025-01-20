@interface SKUIMediaSocialAuthor
- (BOOL)isEqual:(id)a3;
- (NSArray)permissions;
- (NSDictionary)storePlatformData;
- (NSString)authorType;
- (NSString)dsid;
- (NSString)identifier;
- (NSString)name;
- (NSURL)thumbnailImageURL;
- (SKUIMediaSocialAuthor)initWithAuthorDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAuthorType:(id)a3;
- (void)setDsid:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPermissions:(id)a3;
- (void)setStorePlatformData:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
@end

@implementation SKUIMediaSocialAuthor

- (SKUIMediaSocialAuthor)initWithAuthorDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialAuthor initWithAuthorDictionary:]();
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUIMediaSocialAuthor;
  v5 = [(SKUIMediaSocialAuthor *)&v31 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"dsId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      dsid = v5->_dsid;
      v5->_dsid = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"entityId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"entityType"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      authorType = v5->_authorType;
      v5->_authorType = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"permissions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v12;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v16 addObject:v22];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v19);
      }

      if ([v16 count])
      {
        uint64_t v23 = [v16 copy];
        permissions = v5->_permissions;
        v5->_permissions = (NSArray *)v23;
      }
      v12 = v26;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAuthorType:self->_authorType];
  [v4 setDsid:self->_dsid];
  [v4 setIdentifier:self->_identifier];
  [v4 setName:self->_name];
  [v4 setPermissions:self->_permissions];
  [v4 setStorePlatformData:self->_storePlatformData];
  [v4 setThumbnailImageURL:self->_thumbnailImageURL];
  return v4;
}

- (unint64_t)hash
{
  identifier = self->_identifier;
  if (identifier) {
    unint64_t v4 = [(NSString *)identifier hash];
  }
  else {
    unint64_t v4 = 0;
  }
  authorType = self->_authorType;
  if (authorType) {
    v4 ^= [(NSString *)authorType hash];
  }
  if (!v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIMediaSocialAuthor;
    return [(SKUIMediaSocialAuthor *)&v7 hash];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_super v7 = [(SKUIMediaSocialAuthor *)self identifier];
    v8 = [v4 identifier];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(SKUIMediaSocialAuthor *)self authorType];
      uint64_t v10 = [v4 authorType];
      char v6 = [v9 isEqualToString:v10];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)authorType
{
  return self->_authorType;
}

- (void)setAuthorType:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
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

- (NSArray)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
}

- (NSDictionary)storePlatformData
{
  return self->_storePlatformData;
}

- (void)setStorePlatformData:(id)a3
{
}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_storePlatformData, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dsid, 0);

  objc_storeStrong((id *)&self->_authorType, 0);
}

- (void)initWithAuthorDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialAuthor initWithAuthorDictionary:]";
}

@end
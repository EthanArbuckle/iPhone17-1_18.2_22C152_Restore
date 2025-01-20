@interface SKUIMediaSocialPhotoUpload
- (BOOL)hasAlpha;
- (NSNumber)uniqueIdentifier;
- (NSString)MD5;
- (NSString)token;
- (NSString)tokenType;
- (NSString)type;
- (SKUIMediaSocialPhotoUpload)initWithUploadDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)height;
- (unint64_t)length;
- (unint64_t)width;
- (void)setHasAlpha:(BOOL)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)setMD5:(id)a3;
- (void)setToken:(id)a3;
- (void)setTokenType:(id)a3;
- (void)setType:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation SKUIMediaSocialPhotoUpload

- (SKUIMediaSocialPhotoUpload)initWithUploadDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialPhotoUpload initWithUploadDictionary:]();
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIMediaSocialPhotoUpload;
  v5 = [(SKUIMediaSocialPhotoUpload *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"dsId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      uniqueIdentifier = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSNumber *)v7;
    }
    v9 = [v4 objectForKey:@"hasAlpha"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_hasAlpha = [v9 BOOLValue];
    }
    v10 = [v4 objectForKey:@"height"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_height = [v10 unsignedIntegerValue];
    }
    v11 = [v4 objectForKey:@"length"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_length = [v11 unsignedIntegerValue];
    }
    v12 = [v4 objectForKey:@"md5"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      MD5 = v5->_MD5;
      v5->_MD5 = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"token"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      token = v5->_token;
      v5->_token = (NSString *)v16;
    }
    v18 = [v4 objectForKey:@"tokenType"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v18 copy];
      tokenType = v5->_tokenType;
      v5->_tokenType = (NSString *)v19;
    }
    v21 = [v4 objectForKey:@"type"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v21 copy];
      type = v5->_type;
      v5->_type = (NSString *)v22;
    }
    v24 = [v4 objectForKey:@"width"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_width = [v24 unsignedIntegerValue];
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setHasAlpha:self->_hasAlpha];
  [v4 setHeight:self->_height];
  [v4 setLength:self->_length];
  [v4 setMD5:self->_MD5];
  [v4 setToken:self->_token];
  [v4 setTokenType:self->_tokenType];
  [v4 setType:self->_type];
  [v4 setWidth:self->_width];
  return v4;
}

- (BOOL)hasAlpha
{
  return self->_hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_hasAlpha = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSString)MD5
{
  return self->_MD5;
}

- (void)setMD5:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSNumber)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_MD5, 0);
}

- (void)initWithUploadDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialPhotoUpload initWithUploadDictionary:]";
}

@end
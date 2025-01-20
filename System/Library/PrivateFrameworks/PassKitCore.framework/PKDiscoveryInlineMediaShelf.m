@interface PKDiscoveryInlineMediaShelf
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)captionKey;
- (NSString)localizedCaption;
- (PKDiscoveryInlineMediaShelf)initWithCoder:(id)a3;
- (PKDiscoveryInlineMediaShelf)initWithDictionary:(id)a3;
- (PKDiscoveryMedia)media;
- (id)description;
- (int64_t)displayType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)localizeWithBundle:(id)a3 table:(id)a4;
- (void)setLocalizedCaption:(id)a3;
@end

@implementation PKDiscoveryInlineMediaShelf

- (PKDiscoveryInlineMediaShelf)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryInlineMediaShelf;
  v5 = [(PKDiscoveryInlineMediaShelf *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(PKDiscoveryShelf *)v5 setType:2];
    v7 = [v4 PKDictionaryForKey:@"media"];
    v8 = [[PKDiscoveryMedia alloc] initWithDictionary:v7];
    media = v6->_media;
    v6->_media = v8;

    uint64_t v10 = [v4 PKStringForKey:@"captionKey"];
    captionKey = v6->_captionKey;
    v6->_captionKey = (NSString *)v10;

    v12 = [v4 PKStringForKey:@"inlineDisplayType"];
    if ([@"inline" isEqualToString:v12])
    {
      uint64_t v13 = 1;
    }
    else
    {
      int v14 = [@"fullWidth" isEqualToString:v12];
      uint64_t v13 = 2;
      if (!v14) {
        uint64_t v13 = 0;
      }
    }
    v6->_displayType = v13;
  }
  return v6;
}

- (void)localizeWithBundle:(id)a3
{
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  captionKey = self->_captionKey;
  if (captionKey)
  {
    v6 = [a3 localizedStringForKey:captionKey value:&stru_1EE0F5368 table:a4];
    localizedCaption = self->_localizedCaption;
    self->_localizedCaption = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryInlineMediaShelf;
  if (![(PKDiscoveryShelf *)&v15 isEqual:v4]) {
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  media = self->_media;
  v6 = (PKDiscoveryMedia *)v4[4];
  if (media) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (media != v6) {
      goto LABEL_23;
    }
  }
  else if (!-[PKDiscoveryMedia isEqual:](media, "isEqual:"))
  {
    goto LABEL_23;
  }
  captionKey = self->_captionKey;
  v9 = (NSString *)v4[5];
  if (captionKey) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (-[NSString isEqual:](captionKey, "isEqual:")) {
      goto LABEL_19;
    }
LABEL_23:
    char v13 = 0;
    goto LABEL_24;
  }
  if (captionKey != v9) {
    goto LABEL_23;
  }
LABEL_19:
  if (self->_displayType != v4[6]) {
    goto LABEL_23;
  }
  localizedCaption = self->_localizedCaption;
  v12 = (NSString *)v4[7];
  if (localizedCaption && v12) {
    char v13 = -[NSString isEqual:](localizedCaption, "isEqual:");
  }
  else {
    char v13 = localizedCaption == v12;
  }
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryInlineMediaShelf;
  id v3 = [(PKDiscoveryShelf *)&v8 hash];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 safelyAddObject:self->_media];
  [v4 safelyAddObject:self->_captionKey];
  [v4 safelyAddObject:self->_localizedCaption];
  uint64_t v5 = PKCombinedHash((uint64_t)v3, v4);
  unint64_t v6 = self->_displayType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"media", self->_media];
  [v3 appendFormat:@"%@: '%@'; ", @"captionKey", self->_captionKey];
  [v3 appendFormat:@"%@: '%ld'; ", @"inlineDisplayType", self->_displayType];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedCaption", self->_localizedCaption];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryInlineMediaShelf;
  id v4 = a3;
  [(PKDiscoveryShelf *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_media, @"media", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_captionKey forKey:@"captionKey"];
  [v4 encodeInteger:self->_displayType forKey:@"inlineDisplayType"];
  [v4 encodeObject:self->_localizedCaption forKey:@"localizedCaption"];
}

- (PKDiscoveryInlineMediaShelf)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryInlineMediaShelf;
  objc_super v5 = [(PKDiscoveryShelf *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"media"];
    media = v5->_media;
    v5->_media = (PKDiscoveryMedia *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captionKey"];
    captionKey = v5->_captionKey;
    v5->_captionKey = (NSString *)v8;

    v5->_displayType = [v4 decodeIntegerForKey:@"inlineDisplayType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedCaption"];
    localizedCaption = v5->_localizedCaption;
    v5->_localizedCaption = (NSString *)v10;
  }
  return v5;
}

- (PKDiscoveryMedia)media
{
  return self->_media;
}

- (NSString)captionKey
{
  return self->_captionKey;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSString)localizedCaption
{
  return self->_localizedCaption;
}

- (void)setLocalizedCaption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCaption, 0);
  objc_storeStrong((id *)&self->_captionKey, 0);
  objc_storeStrong((id *)&self->_media, 0);
}

@end
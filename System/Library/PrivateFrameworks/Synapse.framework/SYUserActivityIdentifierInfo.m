@interface SYUserActivityIdentifierInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActivityIdentifierInfo:(id)a3;
- (NSString)activityType;
- (NSString)description;
- (NSString)persistentIdentifier;
- (NSString)targetContentIdentifier;
- (NSURL)canonicalURL;
- (NSURL)webpageURL;
- (SYUserActivityIdentifierInfo)init;
- (SYUserActivityIdentifierInfo)initWithActivityType:(id)a3;
- (SYUserActivityIdentifierInfo)initWithCoder:(id)a3;
- (SYUserActivityIdentifierInfo)initWithUserActivity:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCanonicalURL:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation SYUserActivityIdentifierInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalURL, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (SYUserActivityIdentifierInfo)initWithUserActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  v6 = [(SYUserActivityIdentifierInfo *)self initWithActivityType:v5];

  if (v6)
  {
    v7 = [v4 webpageURL];
    uint64_t v8 = [v7 copy];
    webpageURL = v6->_webpageURL;
    v6->_webpageURL = (NSURL *)v8;

    v10 = [v4 _canonicalURL];
    uint64_t v11 = [v10 copy];
    canonicalURL = v6->_canonicalURL;
    v6->_canonicalURL = (NSURL *)v11;

    v13 = [v4 targetContentIdentifier];
    uint64_t v14 = [v13 copy];
    targetContentIdentifier = v6->_targetContentIdentifier;
    v6->_targetContentIdentifier = (NSString *)v14;

    v16 = [v4 persistentIdentifier];
    uint64_t v17 = [v16 copy];
    persistentIdentifier = v6->_persistentIdentifier;
    v6->_persistentIdentifier = (NSString *)v17;
  }
  return v6;
}

- (SYUserActivityIdentifierInfo)initWithActivityType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SYUserActivityIdentifierInfo.m", 27, @"Invalid parameter not satisfying: %@", @"activityType" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SYUserActivityIdentifierInfo;
  v6 = [(SYUserActivityIdentifierInfo *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    activityType = v6->_activityType;
    v6->_activityType = (NSString *)v7;
  }
  return v6;
}

- (SYUserActivityIdentifierInfo)init
{
  return [(SYUserActivityIdentifierInfo *)self initWithActivityType:&stru_1F1E16740];
}

- (NSString)description
{
  v21.receiver = self;
  v21.super_class = (Class)SYUserActivityIdentifierInfo;
  v20 = [(SYUserActivityIdentifierInfo *)&v21 description];
  v19 = [(SYUserActivityIdentifierInfo *)self activityType];
  v3 = [(SYUserActivityIdentifierInfo *)self webpageURL];
  uint64_t v4 = [v3 absoluteString];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_1F1E16740;
  }
  uint64_t v7 = [(SYUserActivityIdentifierInfo *)self canonicalURL];
  uint64_t v8 = [v7 absoluteString];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1F1E16740;
  }
  uint64_t v11 = [(SYUserActivityIdentifierInfo *)self targetContentIdentifier];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1F1E16740;
  }
  uint64_t v14 = [(SYUserActivityIdentifierInfo *)self persistentIdentifier];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_1F1E16740;
  }
  uint64_t v17 = [v20 stringByAppendingFormat:@" activityType: %@, webpageURL: %@, canonicalURL: %@, targetContentID: %@, persistendID: %@", v19, v6, v10, v13, v16];

  return (NSString *)v17;
}

- (BOOL)isEqualToActivityIdentifierInfo:(id)a3
{
  id v5 = a3;
  activityType = self->_activityType;
  uint64_t v7 = [v5 activityType];
  LODWORD(activityType) = [(NSString *)activityType isEqualToString:v7];

  if (activityType)
  {
    webpageURL = self->_webpageURL;
    v9 = [v5 webpageURL];
    if (webpageURL != v9)
    {
      uint64_t v10 = [v5 webpageURL];
      if (!v10)
      {
        LOBYTE(v13) = 0;
        goto LABEL_39;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_webpageURL;
      v12 = [v5 webpageURL];
      if (![(NSURL *)v11 isEqual:v12])
      {
        LOBYTE(v13) = 0;
LABEL_38:

        goto LABEL_39;
      }
      v39 = v12;
    }
    canonicalURL = self->_canonicalURL;
    v15 = [v5 canonicalURL];
    if (canonicalURL == v15)
    {
      v38 = canonicalURL;
    }
    else
    {
      uint64_t v16 = [v5 canonicalURL];
      if (!v16)
      {
        LOBYTE(v13) = 0;
LABEL_36:

LABEL_37:
        v12 = v39;
        if (webpageURL != v9) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v17 = (void *)v16;
      v18 = self->_canonicalURL;
      v13 = [v5 canonicalURL];
      if (([(NSURL *)v18 isEqual:v13] & 1) == 0)
      {

        LOBYTE(v13) = 0;
        goto LABEL_37;
      }
      v38 = canonicalURL;
      v35 = v13;
      v36 = v17;
    }
    targetContentIdentifier = self->_targetContentIdentifier;
    v20 = [v5 targetContentIdentifier];
    if (targetContentIdentifier == v20)
    {
      v37 = v3;
    }
    else
    {
      v13 = [v5 targetContentIdentifier];
      if (!v13)
      {
LABEL_30:

        goto LABEL_31;
      }
      objc_super v21 = self->_targetContentIdentifier;
      uint64_t v22 = [v5 targetContentIdentifier];
      v23 = v21;
      v24 = (void *)v22;
      if (![(NSString *)v23 isEqualToString:v22])
      {

        LOBYTE(v13) = 0;
LABEL_31:
        v31 = v38;
LABEL_34:
        if (v31 != v15)
        {
        }
        goto LABEL_36;
      }
      v33 = v24;
      v34 = v13;
      v37 = v3;
    }
    persistentIdentifier = self->_persistentIdentifier;
    uint64_t v26 = [v5 persistentIdentifier];
    LOBYTE(v13) = persistentIdentifier == (NSString *)v26;
    if (persistentIdentifier == (NSString *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      uint64_t v28 = [v5 persistentIdentifier];
      if (v28)
      {
        v29 = (void *)v28;
        v13 = self->_persistentIdentifier;
        v30 = [v5 persistentIdentifier];
        LOBYTE(v13) = [v13 isEqualToString:v30];

        if (targetContentIdentifier == v20)
        {
        }
        else
        {
        }
        v3 = v37;
        v31 = v38;
        goto LABEL_34;
      }
    }
    v3 = v37;
    if (targetContentIdentifier != v20)
    {
    }
    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_40:

  return (char)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SYUserActivityIdentifierInfo *)self isEqualToActivityIdentifierInfo:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(SYUserActivityIdentifierInfo *)self activityType];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(SYUserActivityIdentifierInfo *)self webpageURL];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(SYUserActivityIdentifierInfo *)self targetContentIdentifier];
  uint64_t v8 = [v7 hash];
  v9 = [(SYUserActivityIdentifierInfo *)self persistentIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYUserActivityIdentifierInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &stru_1F1E16740;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  v9 = [(SYUserActivityIdentifierInfo *)self initWithActivityType:v8];
  if (v9)
  {
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webpageURL"];
    webpageURL = v9->_webpageURL;
    v9->_webpageURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canonicalURL"];
    canonicalURL = v9->_canonicalURL;
    v9->_canonicalURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetContentIdentifier"];
    targetContentIdentifier = v9->_targetContentIdentifier;
    v9->_targetContentIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentIdentifier"];
    persistentIdentifier = v9->_persistentIdentifier;
    v9->_persistentIdentifier = (NSString *)v16;
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYUserActivityIdentifierInfo *)self activityType];
  [v4 encodeObject:v5 forKey:@"activityType"];

  uint64_t v6 = [(SYUserActivityIdentifierInfo *)self webpageURL];
  [v4 encodeObject:v6 forKey:@"webpageURL"];

  uint64_t v7 = [(SYUserActivityIdentifierInfo *)self canonicalURL];
  [v4 encodeObject:v7 forKey:@"canonicalURL"];

  uint64_t v8 = [(SYUserActivityIdentifierInfo *)self targetContentIdentifier];
  [v4 encodeObject:v8 forKey:@"targetContentIdentifier"];

  id v9 = [(SYUserActivityIdentifierInfo *)self persistentIdentifier];
  [v4 encodeObject:v9 forKey:@"persistentIdentifier"];
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)webpageURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWebpageURL:(id)a3
{
}

- (NSURL)canonicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCanonicalURL:(id)a3
{
}

- (NSString)targetContentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (NSString)persistentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistentIdentifier:(id)a3
{
}

@end
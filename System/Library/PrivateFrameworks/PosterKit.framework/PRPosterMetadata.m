@interface PRPosterMetadata
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)decodeObjectWithJSON:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)attributeType;
- (NSString)displayNameLocalizationKey;
- (PRPosterMetadata)init;
- (PRPosterMetadata)initWithBSXPCCoder:(id)a3;
- (PRPosterMetadata)initWithCoder:(id)a3;
- (PRPosterMetadata)initWithDisplayNameLocalizationKey:(id)a3;
- (id)encodeJSON;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeJSON;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
@end

@implementation PRPosterMetadata

- (PRPosterMetadata)initWithDisplayNameLocalizationKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterMetadata;
  v5 = [(PRPosterMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    displayNameLocalizationKey = v5->_displayNameLocalizationKey;
    v5->_displayNameLocalizationKey = (NSString *)v6;
  }
  return v5;
}

- (PRPosterMetadata)init
{
  return [(PRPosterMetadata *)self initWithDisplayNameLocalizationKey:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PRMutablePosterMetadata allocWithZone:a3];
  v5 = [(PRPosterMetadata *)self displayNameLocalizationKey];
  uint64_t v6 = [(PRPosterMetadata *)v4 initWithDisplayNameLocalizationKey:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterMetadata *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      v8 = [(PRPosterMetadata *)self displayNameLocalizationKey];
      objc_super v9 = [(PRPosterMetadata *)v7 displayNameLocalizationKey];

      char v10 = BSEqualStrings();
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(PRPosterMetadata *)self displayNameLocalizationKey];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterMetadata *)self displayNameLocalizationKey];
  [v4 encodeObject:v5 forKey:@"displayNameLocalizationKey"];
}

- (PRPosterMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"displayNameLocalizationKey"];

  v7 = [(PRPosterMetadata *)self initWithDisplayNameLocalizationKey:v6];
  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterMetadata *)self displayNameLocalizationKey];
  [v4 encodeObject:v5 forKey:@"displayNameLocalizationKey"];
}

- (PRPosterMetadata)initWithBSXPCCoder:(id)a3
{
  id v4 = [a3 decodeStringForKey:@"displayNameLocalizationKey"];
  id v5 = [(PRPosterMetadata *)self initWithDisplayNameLocalizationKey:v4];

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterMetadata *)self displayNameLocalizationKey];
  [v4 appendString:v5 withName:@"displayNameLocalizationKey" skipIfEmpty:1];
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeMetadata";
}

- (id)encodeJSON
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PRPosterMetadata *)self displayNameLocalizationKey];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"displayNameLocalizationKey");

  id v5 = [(PRPosterMetadata *)self attributeType];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"attributeType");

  id v10 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v10];
  id v7 = v10;
  if (v7)
  {
    v8 = PRLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(PRPosterMetadata *)(uint64_t)self encodeJSON];
    }
  }
  return v6;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  id v9 = 0;
  unint64_t v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v9];
  id v4 = v9;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !v4)
  {
    id v5 = [PRPosterMetadata alloc];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"displayNameLocalizationKey"];
    id v7 = [(PRPosterMetadata *)v5 initWithDisplayNameLocalizationKey:v6];
  }
  else
  {
    uint64_t v6 = PRLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PRPosterMetadata decodeObjectWithJSON:]((uint64_t)v4, v6);
    }
    id v7 = 0;
  }

  return v7;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeJSON
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Error encoding to JSON: %@ : %@", (uint8_t *)&v3, 0x16u);
}

+ (void)decodeObjectWithJSON:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Error decoding object from JSON: %@", (uint8_t *)&v2, 0xCu);
}

@end
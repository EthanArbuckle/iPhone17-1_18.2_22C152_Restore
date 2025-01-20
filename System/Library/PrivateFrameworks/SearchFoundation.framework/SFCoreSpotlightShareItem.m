@interface SFCoreSpotlightShareItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (NSString)shareProviderTypeIdentifier;
- (SFCoreSpotlightShareItem)initWithCoder:(id)a3;
- (SFCoreSpotlightShareItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setShareProviderTypeIdentifier:(id)a3;
@end

@implementation SFCoreSpotlightShareItem

- (SFCoreSpotlightShareItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFCoreSpotlightShareItem;
  v5 = [(SFCoreSpotlightShareItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 shareProviderTypeIdentifier];

    if (v6)
    {
      v7 = [v4 shareProviderTypeIdentifier];
      [(SFCoreSpotlightShareItem *)v5 setShareProviderTypeIdentifier:v7];
    }
    v8 = [v4 applicationBundleIdentifier];

    if (v8)
    {
      v9 = [v4 applicationBundleIdentifier];
      [(SFCoreSpotlightShareItem *)v5 setApplicationBundleIdentifier:v9];
    }
    v10 = [v4 coreSpotlightIdentifier];

    if (v10)
    {
      v11 = [v4 coreSpotlightIdentifier];
      [(SFCoreSpotlightShareItem *)v5 setCoreSpotlightIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shareProviderTypeIdentifier, 0);
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setShareProviderTypeIdentifier:(id)a3
{
}

- (NSString)shareProviderTypeIdentifier
{
  return self->_shareProviderTypeIdentifier;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFCoreSpotlightShareItem;
  unint64_t v3 = [(SFShareItem *)&v11 hash];
  id v4 = [(SFCoreSpotlightShareItem *)self shareProviderTypeIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCoreSpotlightShareItem *)self applicationBundleIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCoreSpotlightShareItem *)self coreSpotlightIdentifier];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFCoreSpotlightShareItem *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFCoreSpotlightShareItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFCoreSpotlightShareItem;
      if ([(SFShareItem *)&v32 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCoreSpotlightShareItem *)self shareProviderTypeIdentifier];
        v8 = [(SFCoreSpotlightShareItem *)v6 shareProviderTypeIdentifier];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        unint64_t v9 = [(SFCoreSpotlightShareItem *)self shareProviderTypeIdentifier];
        if (v9)
        {
          unint64_t v3 = [(SFCoreSpotlightShareItem *)self shareProviderTypeIdentifier];
          v10 = [(SFCoreSpotlightShareItem *)v6 shareProviderTypeIdentifier];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        v12 = [(SFCoreSpotlightShareItem *)self applicationBundleIdentifier];
        v13 = [(SFCoreSpotlightShareItem *)v6 applicationBundleIdentifier];
        objc_super v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_28;
        }
        v15 = [(SFCoreSpotlightShareItem *)self applicationBundleIdentifier];
        if (v15)
        {
          v25 = v12;
          v16 = [(SFCoreSpotlightShareItem *)self applicationBundleIdentifier];
          v27 = [(SFCoreSpotlightShareItem *)v6 applicationBundleIdentifier];
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            char v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        v17 = [(SFCoreSpotlightShareItem *)self coreSpotlightIdentifier];
        v18 = [(SFCoreSpotlightShareItem *)v6 coreSpotlightIdentifier];
        if ((v17 == 0) == (v18 != 0))
        {

          char v11 = 0;
          v15 = v29;
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
        else
        {
          v24 = v17;
          v26 = v18;
          uint64_t v19 = [(SFCoreSpotlightShareItem *)self coreSpotlightIdentifier];
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            v22 = [(SFCoreSpotlightShareItem *)self coreSpotlightIdentifier];
            v20 = [(SFCoreSpotlightShareItem *)v6 coreSpotlightIdentifier];
            char v11 = objc_msgSend(v22, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFCoreSpotlightShareItem;
  id v4 = [(SFShareItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFCoreSpotlightShareItem *)self shareProviderTypeIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setShareProviderTypeIdentifier:v6];

  uint64_t v7 = [(SFCoreSpotlightShareItem *)self applicationBundleIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setApplicationBundleIdentifier:v8];

  unint64_t v9 = [(SFCoreSpotlightShareItem *)self coreSpotlightIdentifier];
  v10 = (void *)[v9 copy];
  [v4 setCoreSpotlightIdentifier:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCoreSpotlightShareItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCoreSpotlightShareItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCoreSpotlightShareItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCoreSpotlightShareItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCoreSpotlightShareItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCoreSpotlightShareItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCoreSpotlightShareItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCoreSpotlightShareItem alloc] initWithData:v5];
  uint64_t v7 = [(SFCoreSpotlightShareItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
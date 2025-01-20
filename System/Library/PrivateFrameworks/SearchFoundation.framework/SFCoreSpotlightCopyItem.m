@interface SFCoreSpotlightCopyItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)dataProviderTypeIdentifiers;
- (NSArray)fileProviderTypeIdentifiers;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (SFCoreSpotlightCopyItem)initWithCoder:(id)a3;
- (SFCoreSpotlightCopyItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setDataProviderTypeIdentifiers:(id)a3;
- (void)setFileProviderTypeIdentifiers:(id)a3;
@end

@implementation SFCoreSpotlightCopyItem

- (SFCoreSpotlightCopyItem)initWithProtobuf:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFCoreSpotlightCopyItem;
  v5 = [(SFCoreSpotlightCopyItem *)&v34 init];
  if (v5)
  {
    v6 = [v4 dataProviderTypeIdentifiers];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = [v4 dataProviderTypeIdentifiers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v30 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v10);
    }

    [(SFCoreSpotlightCopyItem *)v5 setDataProviderTypeIdentifiers:v7];
    v13 = [v4 fileProviderTypeIdentifiers];
    if (v13) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v14 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v15 = objc_msgSend(v4, "fileProviderTypeIdentifiers", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          if (*(void *)(*((void *)&v26 + 1) + 8 * j)) {
            objc_msgSend(v14, "addObject:");
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v17);
    }

    [(SFCoreSpotlightCopyItem *)v5 setFileProviderTypeIdentifiers:v14];
    v20 = [v4 applicationBundleIdentifier];

    if (v20)
    {
      v21 = [v4 applicationBundleIdentifier];
      [(SFCoreSpotlightCopyItem *)v5 setApplicationBundleIdentifier:v21];
    }
    v22 = [v4 coreSpotlightIdentifier];

    if (v22)
    {
      v23 = [v4 coreSpotlightIdentifier];
      [(SFCoreSpotlightCopyItem *)v5 setCoreSpotlightIdentifier:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataProviderTypeIdentifiers, 0);
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

- (void)setFileProviderTypeIdentifiers:(id)a3
{
}

- (NSArray)fileProviderTypeIdentifiers
{
  return self->_fileProviderTypeIdentifiers;
}

- (void)setDataProviderTypeIdentifiers:(id)a3
{
}

- (NSArray)dataProviderTypeIdentifiers
{
  return self->_dataProviderTypeIdentifiers;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)SFCoreSpotlightCopyItem;
  unint64_t v3 = [(SFCopyItem *)&v13 hash];
  id v4 = [(SFCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCoreSpotlightCopyItem *)self applicationBundleIdentifier];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = [(SFCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
  unint64_t v11 = v9 ^ [v10 hash] ^ v3;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFCoreSpotlightCopyItem *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFCoreSpotlightCopyItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v42.receiver = self;
      v42.super_class = (Class)SFCoreSpotlightCopyItem;
      if ([(SFCopyItem *)&v42 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
        v8 = [(SFCoreSpotlightCopyItem *)v6 dataProviderTypeIdentifiers];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
        uint64_t v9 = [(SFCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
        if (v9)
        {
          uint64_t v10 = [(SFCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
          unint64_t v3 = [(SFCoreSpotlightCopyItem *)v6 dataProviderTypeIdentifiers];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_36;
          }
          v41 = v10;
        }
        v12 = [(SFCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
        objc_super v13 = [(SFCoreSpotlightCopyItem *)v6 fileProviderTypeIdentifiers];
        id v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_35;
        }
        uint64_t v15 = [(SFCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
        v40 = (void *)v15;
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          v35 = v14;
          uint64_t v17 = v12;
          uint64_t v18 = [(SFCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
          uint64_t v37 = [(SFCoreSpotlightCopyItem *)v6 fileProviderTypeIdentifiers];
          v38 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            char v11 = 0;
            v12 = v17;
            id v14 = v35;
            goto LABEL_33;
          }
          v39 = v3;
          v12 = v17;
          id v14 = v35;
        }
        else
        {
          v39 = v3;
        }
        v19 = [(SFCoreSpotlightCopyItem *)self applicationBundleIdentifier];
        v20 = [(SFCoreSpotlightCopyItem *)v6 applicationBundleIdentifier];
        if ((v19 == 0) == (v20 != 0))
        {

          char v11 = 0;
          unint64_t v3 = v39;
          uint64_t v16 = v40;
          if (!v40) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        long long v33 = v20;
        objc_super v34 = v19;
        [(SFCoreSpotlightCopyItem *)self applicationBundleIdentifier];
        v36 = uint64_t v16 = v40;
        if (!v36
          || ([(SFCoreSpotlightCopyItem *)self applicationBundleIdentifier],
              v21 = objc_claimAutoreleasedReturnValue(),
              [(SFCoreSpotlightCopyItem *)v6 applicationBundleIdentifier],
              long long v31 = objc_claimAutoreleasedReturnValue(),
              long long v32 = v21,
              objc_msgSend(v21, "isEqual:")))
        {
          v22 = [(SFCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
          v23 = [(SFCoreSpotlightCopyItem *)v6 coreSpotlightIdentifier];
          if ((v22 == 0) == (v23 != 0))
          {

            char v11 = 0;
            uint64_t v16 = v40;
          }
          else
          {
            long long v29 = v22;
            long long v30 = v23;
            uint64_t v24 = [(SFCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
            uint64_t v16 = v40;
            if (v24)
            {
              long long v28 = (void *)v24;
              long long v27 = [(SFCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
              v25 = [(SFCoreSpotlightCopyItem *)v6 coreSpotlightIdentifier];
              char v11 = objc_msgSend(v27, "isEqual:");
            }
            else
            {

              char v11 = 1;
            }
          }
          unint64_t v3 = v39;
          if (!v36)
          {
LABEL_32:

            if (!v16)
            {
LABEL_34:

LABEL_35:
              uint64_t v10 = v41;
              if (!v9)
              {
LABEL_37:

                goto LABEL_38;
              }
LABEL_36:

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        else
        {
          char v11 = 0;
          unint64_t v3 = v39;
        }

        goto LABEL_32;
      }
    }
    char v11 = 0;
  }
LABEL_39:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SFCoreSpotlightCopyItem;
  id v4 = [(SFCopyItem *)&v14 copyWithZone:a3];
  uint64_t v5 = [(SFCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
  v6 = (void *)[v5 copy];
  [v4 setDataProviderTypeIdentifiers:v6];

  uint64_t v7 = [(SFCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
  v8 = (void *)[v7 copy];
  [v4 setFileProviderTypeIdentifiers:v8];

  uint64_t v9 = [(SFCoreSpotlightCopyItem *)self applicationBundleIdentifier];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setApplicationBundleIdentifier:v10];

  char v11 = [(SFCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
  v12 = (void *)[v11 copy];
  [v4 setCoreSpotlightIdentifier:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCoreSpotlightCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCoreSpotlightCopyItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCoreSpotlightCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCoreSpotlightCopyItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCoreSpotlightCopyItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCoreSpotlightCopyItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCoreSpotlightCopyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCoreSpotlightCopyItem alloc] initWithData:v5];
  uint64_t v7 = [(SFCoreSpotlightCopyItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
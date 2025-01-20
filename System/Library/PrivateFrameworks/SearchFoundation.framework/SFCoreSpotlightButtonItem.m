@interface SFCoreSpotlightButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)actionItemTypes;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (SFCoreSpotlightButtonItem)initWithCoder:(id)a3;
- (SFCoreSpotlightButtonItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionItemTypes:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
@end

@implementation SFCoreSpotlightButtonItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionItemTypes, 0);
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

- (void)setActionItemTypes:(id)a3
{
}

- (NSArray)actionItemTypes
{
  return self->_actionItemTypes;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFCoreSpotlightButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v12 hash];
  v4 = [(SFCoreSpotlightButtonItem *)self actionItemTypes];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCoreSpotlightButtonItem *)self applicationBundleIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFCoreSpotlightButtonItem *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFCoreSpotlightButtonItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)SFCoreSpotlightButtonItem;
      if ([(SFButtonItem *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCoreSpotlightButtonItem *)self actionItemTypes];
        v8 = [(SFCoreSpotlightButtonItem *)v6 actionItemTypes];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(SFCoreSpotlightButtonItem *)self actionItemTypes];
        if (v9)
        {
          unint64_t v10 = [(SFCoreSpotlightButtonItem *)self actionItemTypes];
          unint64_t v3 = [(SFCoreSpotlightButtonItem *)v6 actionItemTypes];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(SFCoreSpotlightButtonItem *)self applicationBundleIdentifier];
        v13 = [(SFCoreSpotlightButtonItem *)v6 applicationBundleIdentifier];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          goto LABEL_30;
        }
        v15 = [(SFCoreSpotlightButtonItem *)self applicationBundleIdentifier];
        if (v15)
        {
          v26 = v12;
          v16 = [(SFCoreSpotlightButtonItem *)self applicationBundleIdentifier];
          v29 = [(SFCoreSpotlightButtonItem *)v6 applicationBundleIdentifier];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            BOOL v11 = 0;
            objc_super v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          objc_super v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        v17 = [(SFCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
        v18 = [(SFCoreSpotlightButtonItem *)v6 coreSpotlightIdentifier];
        if ((v17 == 0) == (v18 != 0))
        {

          BOOL v11 = 0;
          v15 = v31;
          unint64_t v3 = v28;
          if (!v31) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        [(SFCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
        v27 = v15 = v31;
        if (!v27
          || ([(SFCoreSpotlightButtonItem *)self coreSpotlightIdentifier],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFCoreSpotlightButtonItem *)v6 coreSpotlightIdentifier],
              v22 = objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          unint64_t v3 = v28;
          unint64_t v20 = [(SFButtonItem *)self uniqueId];
          BOOL v11 = v20 == [(SFButtonItem *)v6 uniqueId];
          if (!v27) {
            goto LABEL_27;
          }
        }
        else
        {
          BOOL v11 = 0;
          unint64_t v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          unint64_t v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFCoreSpotlightButtonItem;
  id v4 = [(SFButtonItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFCoreSpotlightButtonItem *)self actionItemTypes];
  v6 = (void *)[v5 copy];
  [v4 setActionItemTypes:v6];

  uint64_t v7 = [(SFCoreSpotlightButtonItem *)self applicationBundleIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setApplicationBundleIdentifier:v8];

  uint64_t v9 = [(SFCoreSpotlightButtonItem *)self coreSpotlightIdentifier];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setCoreSpotlightIdentifier:v10];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCoreSpotlightButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCoreSpotlightButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCoreSpotlightButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCoreSpotlightButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCoreSpotlightButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCoreSpotlightButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCoreSpotlightButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCoreSpotlightButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFCoreSpotlightButtonItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCoreSpotlightButtonItem)initWithProtobuf:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFCoreSpotlightButtonItem;
  uint64_t v5 = [(SFCoreSpotlightButtonItem *)&v23 init];
  if (v5)
  {
    v6 = [v4 actionItemTypes];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = objc_msgSend(v4, "actionItemTypes", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v19 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    [(SFCoreSpotlightButtonItem *)v5 setActionItemTypes:v7];
    v13 = [v4 applicationBundleIdentifier];

    if (v13)
    {
      v14 = [v4 applicationBundleIdentifier];
      [(SFCoreSpotlightButtonItem *)v5 setApplicationBundleIdentifier:v14];
    }
    v15 = [v4 coreSpotlightIdentifier];

    if (v15)
    {
      v16 = [v4 coreSpotlightIdentifier];
      [(SFCoreSpotlightButtonItem *)v5 setCoreSpotlightIdentifier:v16];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v17 = v5;
  }
  return v5;
}

@end
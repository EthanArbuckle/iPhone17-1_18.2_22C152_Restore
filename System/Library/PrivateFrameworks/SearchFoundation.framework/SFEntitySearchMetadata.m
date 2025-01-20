@interface SFEntitySearchMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)entityIdentifier;
- (NSString)entitySearchQuery;
- (NSString)tokenQuery;
- (NSString)viewConfigName;
- (SFEntitySearchMetadata)initWithCoder:(id)a3;
- (SFEntitySearchMetadata)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntitySearchQuery:(id)a3;
- (void)setTokenQuery:(id)a3;
- (void)setViewConfigName:(id)a3;
@end

@implementation SFEntitySearchMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_tokenQuery, 0);
  objc_storeStrong((id *)&self->_entitySearchQuery, 0);
}

- (void)setViewConfigName:(id)a3
{
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setTokenQuery:(id)a3
{
}

- (NSString)tokenQuery
{
  return self->_tokenQuery;
}

- (void)setEntitySearchQuery:(id)a3
{
}

- (NSString)entitySearchQuery
{
  return self->_entitySearchQuery;
}

- (unint64_t)hash
{
  v3 = [(SFEntitySearchMetadata *)self entitySearchQuery];
  uint64_t v4 = [v3 hash];
  v5 = [(SFEntitySearchMetadata *)self tokenQuery];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFEntitySearchMetadata *)self entityIdentifier];
  uint64_t v8 = [v7 hash];
  v9 = [(SFEntitySearchMetadata *)self viewConfigName];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFEntitySearchMetadata *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFEntitySearchMetadata *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFEntitySearchMetadata *)self entitySearchQuery];
      uint64_t v8 = [(SFEntitySearchMetadata *)v6 entitySearchQuery];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v9 = [(SFEntitySearchMetadata *)self entitySearchQuery];
      if (v9)
      {
        unint64_t v10 = [(SFEntitySearchMetadata *)self entitySearchQuery];
        v3 = [(SFEntitySearchMetadata *)v6 entitySearchQuery];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      v12 = [(SFEntitySearchMetadata *)self tokenQuery];
      v13 = [(SFEntitySearchMetadata *)v6 tokenQuery];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_34;
      }
      uint64_t v15 = [(SFEntitySearchMetadata *)self tokenQuery];
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        v18 = [(SFEntitySearchMetadata *)self tokenQuery];
        v37 = [(SFEntitySearchMetadata *)v6 tokenQuery];
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      v19 = [(SFEntitySearchMetadata *)self entityIdentifier];
      v20 = [(SFEntitySearchMetadata *)v6 entityIdentifier];
      if ((v19 == 0) == (v20 != 0))
      {

        char v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      [(SFEntitySearchMetadata *)self entityIdentifier];
      v36 = v16 = v40;
      if (!v36
        || ([(SFEntitySearchMetadata *)self entityIdentifier],
            v21 = objc_claimAutoreleasedReturnValue(),
            [(SFEntitySearchMetadata *)v6 entityIdentifier],
            v31 = objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        v22 = [(SFEntitySearchMetadata *)self viewConfigName];
        v23 = [(SFEntitySearchMetadata *)v6 viewConfigName];
        if ((v22 == 0) == (v23 != 0))
        {

          char v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          uint64_t v24 = [(SFEntitySearchMetadata *)self viewConfigName];
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            v27 = [(SFEntitySearchMetadata *)self viewConfigName];
            v25 = [(SFEntitySearchMetadata *)v6 viewConfigName];
            char v11 = objc_msgSend(v27, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            unint64_t v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        char v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_38:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFEntitySearchMetadata *)self entitySearchQuery];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setEntitySearchQuery:v6];

  v7 = [(SFEntitySearchMetadata *)self tokenQuery];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setTokenQuery:v8];

  v9 = [(SFEntitySearchMetadata *)self entityIdentifier];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setEntityIdentifier:v10];

  char v11 = [(SFEntitySearchMetadata *)self viewConfigName];
  v12 = (void *)[v11 copy];
  [v4 setViewConfigName:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBEntitySearchMetadata alloc] initWithFacade:self];
  v3 = [(_SFPBEntitySearchMetadata *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBEntitySearchMetadata alloc] initWithFacade:self];
  v3 = [(_SFPBEntitySearchMetadata *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBEntitySearchMetadata alloc] initWithFacade:self];
  v5 = [(_SFPBEntitySearchMetadata *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFEntitySearchMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBEntitySearchMetadata alloc] initWithData:v5];
  v7 = [(SFEntitySearchMetadata *)self initWithProtobuf:v6];

  return v7;
}

- (SFEntitySearchMetadata)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFEntitySearchMetadata;
  v5 = [(SFEntitySearchMetadata *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 entitySearchQuery];

    if (v6)
    {
      v7 = [v4 entitySearchQuery];
      [(SFEntitySearchMetadata *)v5 setEntitySearchQuery:v7];
    }
    uint64_t v8 = [v4 tokenQuery];

    if (v8)
    {
      v9 = [v4 tokenQuery];
      [(SFEntitySearchMetadata *)v5 setTokenQuery:v9];
    }
    unint64_t v10 = [v4 entityIdentifier];

    if (v10)
    {
      char v11 = [v4 entityIdentifier];
      [(SFEntitySearchMetadata *)v5 setEntityIdentifier:v11];
    }
    v12 = [v4 viewConfigName];

    if (v12)
    {
      v13 = [v4 viewConfigName];
      [(SFEntitySearchMetadata *)v5 setViewConfigName:v13];
    }
    v14 = v5;
  }

  return v5;
}

@end
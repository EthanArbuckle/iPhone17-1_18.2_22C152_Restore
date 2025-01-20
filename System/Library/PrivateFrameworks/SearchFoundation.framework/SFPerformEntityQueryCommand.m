@interface SFPerformEntityQueryCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEntityType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)entityIdentifier;
- (NSString)searchString;
- (NSString)tokenString;
- (SFColor)entityBackgroundColor;
- (SFDrillDownMetadata)drilldownMetadata;
- (SFDrillDownMetadata)metadata;
- (SFImage)tokenImage;
- (SFPerformEntityQueryCommand)initWithCoder:(id)a3;
- (SFPerformEntityQueryCommand)initWithProtobuf:(id)a3;
- (SFSymbolImage)symbolImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int)entityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDrilldownMetadata:(id)a3;
- (void)setEntityBackgroundColor:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSymbolImage:(id)a3;
- (void)setTokenImage:(id)a3;
- (void)setTokenString:(id)a3;
@end

@implementation SFPerformEntityQueryCommand

- (SFPerformEntityQueryCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFPerformEntityQueryCommand;
  v5 = [(SFPerformEntityQueryCommand *)&v34 init];
  if (v5)
  {
    v6 = [v4 searchString];

    if (v6)
    {
      v7 = [v4 searchString];
      [(SFPerformEntityQueryCommand *)v5 setSearchString:v7];
    }
    v8 = [v4 tokenString];

    if (v8)
    {
      v9 = [v4 tokenString];
      [(SFPerformEntityQueryCommand *)v5 setTokenString:v9];
    }
    v10 = [v4 symbolImage];

    if (v10)
    {
      v11 = [SFSymbolImage alloc];
      v12 = [v4 symbolImage];
      v13 = [(SFSymbolImage *)v11 initWithProtobuf:v12];
      [(SFPerformEntityQueryCommand *)v5 setSymbolImage:v13];
    }
    if ([v4 entityType]) {
      -[SFPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", [v4 entityType]);
    }
    v14 = [v4 entityIdentifier];

    if (v14)
    {
      v15 = [v4 entityIdentifier];
      [(SFPerformEntityQueryCommand *)v5 setEntityIdentifier:v15];
    }
    v16 = [v4 entityBackgroundColor];

    if (v16)
    {
      v17 = [SFColor alloc];
      v18 = [v4 entityBackgroundColor];
      v19 = [(SFColor *)v17 initWithProtobuf:v18];
      [(SFPerformEntityQueryCommand *)v5 setEntityBackgroundColor:v19];
    }
    v20 = [v4 metadata];

    if (v20)
    {
      v21 = [SFDrillDownMetadata alloc];
      v22 = [v4 metadata];
      v23 = [(SFDrillDownMetadata *)v21 initWithProtobuf:v22];
      [(SFPerformEntityQueryCommand *)v5 setMetadata:v23];
    }
    v24 = [v4 drilldownMetadata];

    if (v24)
    {
      v25 = [SFDrillDownMetadata alloc];
      v26 = [v4 drilldownMetadata];
      v27 = [(SFDrillDownMetadata *)v25 initWithProtobuf:v26];
      [(SFPerformEntityQueryCommand *)v5 setDrilldownMetadata:v27];
    }
    v28 = [v4 tokenImage];

    if (v28)
    {
      v29 = [SFImage alloc];
      v30 = [v4 tokenImage];
      v31 = [(SFImage *)v29 initWithProtobuf:v30];
      [(SFPerformEntityQueryCommand *)v5 setTokenImage:v31];
    }
    v32 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenImage, 0);
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityBackgroundColor, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (void)setTokenImage:(id)a3
{
}

- (SFImage)tokenImage
{
  return self->_tokenImage;
}

- (void)setDrilldownMetadata:(id)a3
{
}

- (SFDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (void)setMetadata:(id)a3
{
}

- (SFDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (void)setEntityBackgroundColor:(id)a3
{
}

- (SFColor)entityBackgroundColor
{
  return self->_entityBackgroundColor;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int)entityType
{
  return self->_entityType;
}

- (void)setSymbolImage:(id)a3
{
}

- (SFSymbolImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setTokenString:(id)a3
{
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)hash
{
  v22.receiver = self;
  v22.super_class = (Class)SFPerformEntityQueryCommand;
  unint64_t v3 = [(SFCommand *)&v22 hash];
  id v4 = [(SFPerformEntityQueryCommand *)self searchString];
  uint64_t v5 = [v4 hash];
  v6 = [(SFPerformEntityQueryCommand *)self tokenString];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFPerformEntityQueryCommand *)self symbolImage];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFPerformEntityQueryCommand *)self entityType];
  v11 = [(SFPerformEntityQueryCommand *)self entityIdentifier];
  uint64_t v12 = v10 ^ [v11 hash] ^ v3;
  v13 = [(SFPerformEntityQueryCommand *)self entityBackgroundColor];
  uint64_t v14 = [v13 hash];
  v15 = [(SFPerformEntityQueryCommand *)self metadata];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SFPerformEntityQueryCommand *)self drilldownMetadata];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(SFPerformEntityQueryCommand *)self tokenImage];
  unint64_t v20 = v12 ^ v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFPerformEntityQueryCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFPerformEntityQueryCommand *)v4 isMemberOfClass:objc_opt_class()])
    {
      v72.receiver = self;
      v72.super_class = (Class)SFPerformEntityQueryCommand;
      if ([(SFCommand *)&v72 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFPerformEntityQueryCommand *)self searchString];
        uint64_t v7 = [(SFPerformEntityQueryCommand *)v5 searchString];
        if ((v6 == 0) == (v7 != 0))
        {
          char v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v8 = [(SFPerformEntityQueryCommand *)self searchString];
        if (v8)
        {
          uint64_t v9 = [(SFPerformEntityQueryCommand *)self searchString];
          uint64_t v10 = [(SFPerformEntityQueryCommand *)v5 searchString];
          if (![v9 isEqual:v10])
          {
            char v11 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v70 = v10;
          v71 = v9;
        }
        uint64_t v12 = [(SFPerformEntityQueryCommand *)self tokenString];
        v13 = [(SFPerformEntityQueryCommand *)v5 tokenString];
        if ((v12 == 0) == (v13 != 0)) {
          goto LABEL_23;
        }
        uint64_t v14 = [(SFPerformEntityQueryCommand *)self tokenString];
        if (v14)
        {
          v15 = [(SFPerformEntityQueryCommand *)self tokenString];
          v67 = [(SFPerformEntityQueryCommand *)v5 tokenString];
          v68 = v15;
          if (![v15 isEqual:v67]) {
            goto LABEL_21;
          }
        }
        v69 = v14;
        uint64_t v16 = [(SFPerformEntityQueryCommand *)self symbolImage];
        v17 = [(SFPerformEntityQueryCommand *)v5 symbolImage];
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_22:

LABEL_23:
            char v11 = 0;
            if (!v8)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        v64 = v16;
        v65 = v17;
        v66 = [(SFPerformEntityQueryCommand *)self symbolImage];
        if (v66)
        {
          uint64_t v18 = [(SFPerformEntityQueryCommand *)self symbolImage];
          uint64_t v19 = [(SFPerformEntityQueryCommand *)v5 symbolImage];
          v63 = (void *)v18;
          unint64_t v20 = (void *)v18;
          uint64_t v16 = (void *)v19;
          if (![v20 isEqual:v19]) {
            goto LABEL_35;
          }
        }
        int v22 = [(SFPerformEntityQueryCommand *)self entityType];
        if (v22 != [(SFPerformEntityQueryCommand *)v5 entityType])
        {
          uint64_t v14 = v69;
          if (!v66) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
        v62 = v16;
        v23 = [(SFPerformEntityQueryCommand *)self entityIdentifier];
        v24 = [(SFPerformEntityQueryCommand *)v5 entityIdentifier];
        if ((v23 == 0) == (v24 != 0))
        {

          uint64_t v14 = v69;
          goto LABEL_54;
        }
        v59 = v23;
        v60 = v24;
        [(SFPerformEntityQueryCommand *)self entityIdentifier];
        v61 = uint64_t v14 = v69;
        if (v61)
        {
          v25 = [(SFPerformEntityQueryCommand *)self entityIdentifier];
          v57 = [(SFPerformEntityQueryCommand *)v5 entityIdentifier];
          v58 = v25;
          if (![v25 isEqual:v57]) {
            goto LABEL_52;
          }
        }
        v26 = [(SFPerformEntityQueryCommand *)self entityBackgroundColor];
        v27 = [(SFPerformEntityQueryCommand *)v5 entityBackgroundColor];
        if ((v26 == 0) == (v27 != 0))
        {

          goto LABEL_51;
        }
        v55 = v26;
        v56 = v27;
        v28 = [(SFPerformEntityQueryCommand *)self entityBackgroundColor];
        if (v28)
        {
          v29 = [(SFPerformEntityQueryCommand *)self entityBackgroundColor];
          v52 = [(SFPerformEntityQueryCommand *)v5 entityBackgroundColor];
          v53 = v29;
          if (!objc_msgSend(v29, "isEqual:")) {
            goto LABEL_49;
          }
        }
        v54 = v28;
        v30 = [(SFPerformEntityQueryCommand *)self metadata];
        v31 = [(SFPerformEntityQueryCommand *)v5 metadata];
        if ((v30 == 0) == (v31 != 0))
        {

          v28 = v54;
          if (!v54)
          {
LABEL_50:

LABEL_51:
            uint64_t v14 = v69;
            if (!v61)
            {
LABEL_53:

LABEL_54:
              uint64_t v16 = v62;
              if (!v66)
              {
LABEL_36:

                if (!v14) {
                  goto LABEL_22;
                }
                goto LABEL_21;
              }
LABEL_35:

              goto LABEL_36;
            }
LABEL_52:

            goto LABEL_53;
          }
LABEL_49:

          goto LABEL_50;
        }
        v50 = v31;
        v32 = [(SFPerformEntityQueryCommand *)self metadata];
        v51 = v30;
        if (v32)
        {
          v33 = [(SFPerformEntityQueryCommand *)self metadata];
          v47 = [(SFPerformEntityQueryCommand *)v5 metadata];
          v48 = v33;
          if (!objc_msgSend(v33, "isEqual:"))
          {
            char v11 = 0;
            v37 = v55;
LABEL_72:

LABEL_73:
            if (v54)
            {
            }
            if (v61)
            {
            }
            if (v66)
            {
            }
            if (v69)
            {
            }
            if (!v8) {
              goto LABEL_26;
            }
LABEL_24:
            uint64_t v10 = v70;
            uint64_t v9 = v71;
            goto LABEL_25;
          }
          v49 = v32;
        }
        else
        {
          v49 = 0;
        }
        objc_super v34 = [(SFPerformEntityQueryCommand *)self drilldownMetadata];
        v35 = [(SFPerformEntityQueryCommand *)v5 drilldownMetadata];
        if ((v34 == 0) == (v35 != 0))
        {

          char v11 = 0;
          goto LABEL_71;
        }
        v45 = v35;
        v46 = [(SFPerformEntityQueryCommand *)self drilldownMetadata];
        if (!v46
          || ([(SFPerformEntityQueryCommand *)self drilldownMetadata],
              v36 = objc_claimAutoreleasedReturnValue(),
              [(SFPerformEntityQueryCommand *)v5 drilldownMetadata],
              v43 = objc_claimAutoreleasedReturnValue(),
              v44 = v36,
              objc_msgSend(v36, "isEqual:")))
        {
          v42 = [(SFPerformEntityQueryCommand *)self tokenImage];
          v41 = [(SFPerformEntityQueryCommand *)v5 tokenImage];
          if ((v42 == 0) == (v41 != 0))
          {

            char v11 = 0;
          }
          else
          {
            v40 = [(SFPerformEntityQueryCommand *)self tokenImage];
            if (v40)
            {
              v39 = [(SFPerformEntityQueryCommand *)self tokenImage];
              v38 = [(SFPerformEntityQueryCommand *)v5 tokenImage];
              char v11 = [v39 isEqual:v38];
            }
            else
            {

              char v11 = 1;
            }
          }
          if (!v46) {
            goto LABEL_70;
          }
        }
        else
        {
          char v11 = 0;
        }

LABEL_70:
LABEL_71:
        v37 = v55;
        v32 = v49;
        if (!v49) {
          goto LABEL_73;
        }
        goto LABEL_72;
      }
    }
    char v11 = 0;
  }
LABEL_28:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SFPerformEntityQueryCommand;
  id v4 = [(SFCommand *)&v22 copyWithZone:a3];
  uint64_t v5 = [(SFPerformEntityQueryCommand *)self searchString];
  v6 = (void *)[v5 copy];
  [v4 setSearchString:v6];

  uint64_t v7 = [(SFPerformEntityQueryCommand *)self tokenString];
  v8 = (void *)[v7 copy];
  [v4 setTokenString:v8];

  uint64_t v9 = [(SFPerformEntityQueryCommand *)self symbolImage];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setSymbolImage:v10];

  objc_msgSend(v4, "setEntityType:", -[SFPerformEntityQueryCommand entityType](self, "entityType"));
  char v11 = [(SFPerformEntityQueryCommand *)self entityIdentifier];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setEntityIdentifier:v12];

  v13 = [(SFPerformEntityQueryCommand *)self entityBackgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setEntityBackgroundColor:v14];

  v15 = [(SFPerformEntityQueryCommand *)self metadata];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setMetadata:v16];

  v17 = [(SFPerformEntityQueryCommand *)self drilldownMetadata];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setDrilldownMetadata:v18];

  uint64_t v19 = [(SFPerformEntityQueryCommand *)self tokenImage];
  unint64_t v20 = (void *)[v19 copy];
  [v4 setTokenImage:v20];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPerformEntityQueryCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPerformEntityQueryCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPerformEntityQueryCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPerformEntityQueryCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFPerformEntityQueryCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFPerformEntityQueryCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFPerformEntityQueryCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCommand *)v8 searchString];
    [(SFPerformEntityQueryCommand *)v5 setSearchString:v9];

    uint64_t v10 = [(SFCommand *)v8 tokenString];
    [(SFPerformEntityQueryCommand *)v5 setTokenString:v10];

    char v11 = [(SFCommand *)v8 symbolImage];
    [(SFPerformEntityQueryCommand *)v5 setSymbolImage:v11];

    [(SFPerformEntityQueryCommand *)v5 setEntityType:[(SFCommand *)v8 entityType]];
    uint64_t v12 = [(SFCommand *)v8 entityIdentifier];
    [(SFPerformEntityQueryCommand *)v5 setEntityIdentifier:v12];

    v13 = [(SFCommand *)v8 entityBackgroundColor];
    [(SFPerformEntityQueryCommand *)v5 setEntityBackgroundColor:v13];

    uint64_t v14 = [(SFCommand *)v8 metadata];
    [(SFPerformEntityQueryCommand *)v5 setMetadata:v14];

    v15 = [(SFCommand *)v8 drilldownMetadata];
    [(SFPerformEntityQueryCommand *)v5 setDrilldownMetadata:v15];

    uint64_t v16 = [(SFCommand *)v8 tokenImage];
    [(SFPerformEntityQueryCommand *)v5 setTokenImage:v16];

    v17 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v17];

    uint64_t v18 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v18];

    uint64_t v19 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v19];

    unint64_t v20 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v20];
  }
  return v5;
}

- (BOOL)hasEntityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_entityType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface SFOpenFileProviderItemCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasShouldRevealFile;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRevealFile;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)coreSpotlightIdentifier;
- (NSString)fileProviderIdentifier;
- (SFOpenFileProviderItemCommand)initWithCoder:(id)a3;
- (SFOpenFileProviderItemCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setFileProviderIdentifier:(id)a3;
- (void)setShouldRevealFile:(BOOL)a3;
@end

@implementation SFOpenFileProviderItemCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

- (BOOL)shouldRevealFile
{
  return self->_shouldRevealFile;
}

- (void)setFileProviderIdentifier:(id)a3
{
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)SFOpenFileProviderItemCommand;
  unint64_t v3 = [(SFCommand *)&v10 hash];
  v4 = [(SFOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(SFOpenFileProviderItemCommand *)self fileProviderIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  unint64_t v8 = v7 ^ [(SFOpenFileProviderItemCommand *)self shouldRevealFile] ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFOpenFileProviderItemCommand *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFOpenFileProviderItemCommand *)v5 isMemberOfClass:objc_opt_class()])
    {
      v23.receiver = self;
      v23.super_class = (Class)SFOpenFileProviderItemCommand;
      if ([(SFCommand *)&v23 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
        unint64_t v8 = [(SFOpenFileProviderItemCommand *)v6 coreSpotlightIdentifier];
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_25:

          goto LABEL_26;
        }
        v9 = [(SFOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
        if (v9)
        {
          objc_super v10 = [(SFOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
          unint64_t v3 = [(SFOpenFileProviderItemCommand *)v6 coreSpotlightIdentifier];
          if (![v10 isEqual:v3])
          {
            LOBYTE(v11) = 0;
            goto LABEL_23;
          }
          v22 = v10;
        }
        v12 = [(SFOpenFileProviderItemCommand *)self fileProviderIdentifier];
        v13 = [(SFOpenFileProviderItemCommand *)v6 fileProviderIdentifier];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_22;
        }
        v15 = [(SFOpenFileProviderItemCommand *)self fileProviderIdentifier];
        if (v15)
        {
          v19 = v3;
          v16 = [(SFOpenFileProviderItemCommand *)self fileProviderIdentifier];
          v20 = [(SFOpenFileProviderItemCommand *)v6 fileProviderIdentifier];
          v21 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            unint64_t v3 = v19;
LABEL_20:

LABEL_21:
LABEL_22:
            objc_super v10 = v22;
            if (!v9)
            {
LABEL_24:

              goto LABEL_25;
            }
LABEL_23:

            goto LABEL_24;
          }
          unint64_t v3 = v19;
        }
        BOOL v17 = [(SFOpenFileProviderItemCommand *)self shouldRevealFile];
        BOOL v11 = v17 ^ [(SFOpenFileProviderItemCommand *)v6 shouldRevealFile] ^ 1;
        if (!v15) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_26:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFOpenFileProviderItemCommand;
  id v4 = [(SFCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setCoreSpotlightIdentifier:v6];

  uint64_t v7 = [(SFOpenFileProviderItemCommand *)self fileProviderIdentifier];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setFileProviderIdentifier:v8];

  objc_msgSend(v4, "setShouldRevealFile:", -[SFOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBOpenFileProviderItemCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBOpenFileProviderItemCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBOpenFileProviderItemCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBOpenFileProviderItemCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFOpenFileProviderItemCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFOpenFileProviderItemCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFOpenFileProviderItemCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  unint64_t v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 coreSpotlightIdentifier];
    [(SFOpenFileProviderItemCommand *)v5 setCoreSpotlightIdentifier:v9];

    objc_super v10 = [(SFCommand *)v8 fileProviderIdentifier];
    [(SFOpenFileProviderItemCommand *)v5 setFileProviderIdentifier:v10];

    [(SFOpenFileProviderItemCommand *)v5 setShouldRevealFile:[(SFCommand *)v8 shouldRevealFile]];
    BOOL v11 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v11];

    v12 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v12];

    v13 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v13];

    v14 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v14];
  }
  return v5;
}

- (BOOL)hasShouldRevealFile
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldRevealFile:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldRevealFile = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFOpenFileProviderItemCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFOpenFileProviderItemCommand;
  uint64_t v5 = [(SFOpenFileProviderItemCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 coreSpotlightIdentifier];

    if (v6)
    {
      uint64_t v7 = [v4 coreSpotlightIdentifier];
      [(SFOpenFileProviderItemCommand *)v5 setCoreSpotlightIdentifier:v7];
    }
    unint64_t v8 = [v4 fileProviderIdentifier];

    if (v8)
    {
      v9 = [v4 fileProviderIdentifier];
      [(SFOpenFileProviderItemCommand *)v5 setFileProviderIdentifier:v9];
    }
    if ([v4 shouldRevealFile]) {
      -[SFOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", [v4 shouldRevealFile]);
    }
    objc_super v10 = v5;
  }

  return v5;
}

@end
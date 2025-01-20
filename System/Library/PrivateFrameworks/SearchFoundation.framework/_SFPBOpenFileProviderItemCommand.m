@interface _SFPBOpenFileProviderItemCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldRevealFile;
- (NSData)jsonData;
- (NSString)coreSpotlightIdentifier;
- (NSString)fileProviderIdentifier;
- (_SFPBOpenFileProviderItemCommand)initWithDictionary:(id)a3;
- (_SFPBOpenFileProviderItemCommand)initWithFacade:(id)a3;
- (_SFPBOpenFileProviderItemCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setFileProviderIdentifier:(id)a3;
- (void)setShouldRevealFile:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBOpenFileProviderItemCommand

- (_SFPBOpenFileProviderItemCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBOpenFileProviderItemCommand *)self init];
  if (v5)
  {
    v6 = [v4 coreSpotlightIdentifier];

    if (v6)
    {
      v7 = [v4 coreSpotlightIdentifier];
      [(_SFPBOpenFileProviderItemCommand *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 fileProviderIdentifier];

    if (v8)
    {
      v9 = [v4 fileProviderIdentifier];
      [(_SFPBOpenFileProviderItemCommand *)v5 setFileProviderIdentifier:v9];
    }
    if ([v4 hasShouldRevealFile]) {
      -[_SFPBOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", [v4 shouldRevealFile]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

- (BOOL)shouldRevealFile
{
  return self->_shouldRevealFile;
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (_SFPBOpenFileProviderItemCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBOpenFileProviderItemCommand;
  v5 = [(_SFPBOpenFileProviderItemCommand *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"coreSpotlightIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBOpenFileProviderItemCommand *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"fileProviderIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBOpenFileProviderItemCommand *)v5 setFileProviderIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"shouldRevealFile"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBOpenFileProviderItemCommand setShouldRevealFile:](v5, "setShouldRevealFile:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBOpenFileProviderItemCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBOpenFileProviderItemCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBOpenFileProviderItemCommand *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_coreSpotlightIdentifier)
  {
    id v4 = [(_SFPBOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"coreSpotlightIdentifier"];
  }
  if (self->_fileProviderIdentifier)
  {
    v6 = [(_SFPBOpenFileProviderItemCommand *)self fileProviderIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"fileProviderIdentifier"];
  }
  if (self->_shouldRevealFile)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBOpenFileProviderItemCommand shouldRevealFile](self, "shouldRevealFile"));
    [v3 setObject:v8 forKeyedSubscript:@"shouldRevealFile"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_coreSpotlightIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_fileProviderIdentifier hash];
  uint64_t v5 = 2654435761;
  if (!self->_shouldRevealFile) {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_SFPBOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
  v6 = [v4 coreSpotlightIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
    v10 = [v4 coreSpotlightIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBOpenFileProviderItemCommand *)self fileProviderIdentifier];
  v6 = [v4 fileProviderIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBOpenFileProviderItemCommand *)self fileProviderIdentifier];
    if (!v12)
    {

LABEL_15:
      int shouldRevealFile = self->_shouldRevealFile;
      BOOL v17 = shouldRevealFile == [v4 shouldRevealFile];
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(_SFPBOpenFileProviderItemCommand *)self fileProviderIdentifier];
    v15 = [v4 fileProviderIdentifier];
    int v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBOpenFileProviderItemCommand *)self coreSpotlightIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  uint64_t v5 = [(_SFPBOpenFileProviderItemCommand *)self fileProviderIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBOpenFileProviderItemCommand *)self shouldRevealFile]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBOpenFileProviderItemCommandReadFrom(self, (uint64_t)a3);
}

- (void)setShouldRevealFile:(BOOL)a3
{
  self->_int shouldRevealFile = a3;
}

- (void)setFileProviderIdentifier:(id)a3
{
  self->_fileProviderIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  self->_coreSpotlightIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end
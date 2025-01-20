@interface _SFPBOpenMediaCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)clientSelectedBundleIdentifier;
- (_SFPBMediaMetadata)mediaMetadata;
- (_SFPBOpenMediaCommand)initWithDictionary:(id)a3;
- (_SFPBOpenMediaCommand)initWithFacade:(id)a3;
- (_SFPBOpenMediaCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setClientSelectedBundleIdentifier:(id)a3;
- (void)setMediaMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBOpenMediaCommand

- (_SFPBOpenMediaCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBOpenMediaCommand *)self init];
  if (v5)
  {
    v6 = [v4 mediaMetadata];

    if (v6)
    {
      v7 = [_SFPBMediaMetadata alloc];
      v8 = [v4 mediaMetadata];
      v9 = [(_SFPBMediaMetadata *)v7 initWithFacade:v8];
      [(_SFPBOpenMediaCommand *)v5 setMediaMetadata:v9];
    }
    v10 = [v4 clientSelectedBundleIdentifier];

    if (v10)
    {
      v11 = [v4 clientSelectedBundleIdentifier];
      [(_SFPBOpenMediaCommand *)v5 setClientSelectedBundleIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

- (NSString)clientSelectedBundleIdentifier
{
  return self->_clientSelectedBundleIdentifier;
}

- (_SFPBMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (_SFPBOpenMediaCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBOpenMediaCommand;
  v5 = [(_SFPBOpenMediaCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBMediaMetadata alloc] initWithDictionary:v6];
      [(_SFPBOpenMediaCommand *)v5 setMediaMetadata:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"clientSelectedBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBOpenMediaCommand *)v5 setClientSelectedBundleIdentifier:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBOpenMediaCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBOpenMediaCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBOpenMediaCommand *)self dictionaryRepresentation];
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
  if (self->_clientSelectedBundleIdentifier)
  {
    id v4 = [(_SFPBOpenMediaCommand *)self clientSelectedBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"clientSelectedBundleIdentifier"];
  }
  if (self->_mediaMetadata)
  {
    v6 = [(_SFPBOpenMediaCommand *)self mediaMetadata];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"mediaMetadata"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"mediaMetadata"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBMediaMetadata *)self->_mediaMetadata hash];
  return [(NSString *)self->_clientSelectedBundleIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBOpenMediaCommand *)self mediaMetadata];
  v6 = [v4 mediaMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBOpenMediaCommand *)self mediaMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBOpenMediaCommand *)self mediaMetadata];
    v10 = [v4 mediaMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBOpenMediaCommand *)self clientSelectedBundleIdentifier];
  v6 = [v4 clientSelectedBundleIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBOpenMediaCommand *)self clientSelectedBundleIdentifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBOpenMediaCommand *)self clientSelectedBundleIdentifier];
    v15 = [v4 clientSelectedBundleIdentifier];
    char v16 = [v14 isEqual:v15];

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
  id v4 = [(_SFPBOpenMediaCommand *)self mediaMetadata];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBOpenMediaCommand *)self clientSelectedBundleIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBOpenMediaCommandReadFrom(self, (uint64_t)a3);
}

- (void)setClientSelectedBundleIdentifier:(id)a3
{
  self->_clientSelectedBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMediaMetadata:(id)a3
{
}

@end
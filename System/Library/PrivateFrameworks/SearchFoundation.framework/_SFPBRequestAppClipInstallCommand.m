@interface _SFPBRequestAppClipInstallCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)applicationBundleIdentifier;
- (_SFPBRequestAppClipInstallCommand)initWithDictionary:(id)a3;
- (_SFPBRequestAppClipInstallCommand)initWithFacade:(id)a3;
- (_SFPBRequestAppClipInstallCommand)initWithJSON:(id)a3;
- (_SFPBURL)url;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRequestAppClipInstallCommand

- (_SFPBRequestAppClipInstallCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRequestAppClipInstallCommand *)self init];
  if (v5)
  {
    v6 = [v4 url];

    if (v6)
    {
      v7 = [_SFPBURL alloc];
      v8 = [v4 url];
      v9 = [(_SFPBURL *)v7 initWithNSURL:v8];
      [(_SFPBRequestAppClipInstallCommand *)v5 setUrl:v9];
    }
    v10 = [v4 applicationBundleIdentifier];

    if (v10)
    {
      v11 = [v4 applicationBundleIdentifier];
      [(_SFPBRequestAppClipInstallCommand *)v5 setApplicationBundleIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (_SFPBURL)url
{
  return self->_url;
}

- (_SFPBRequestAppClipInstallCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRequestAppClipInstallCommand;
  v5 = [(_SFPBRequestAppClipInstallCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBURL alloc] initWithDictionary:v6];
      [(_SFPBRequestAppClipInstallCommand *)v5 setUrl:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"applicationBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBRequestAppClipInstallCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRequestAppClipInstallCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRequestAppClipInstallCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRequestAppClipInstallCommand *)self dictionaryRepresentation];
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
  if (self->_applicationBundleIdentifier)
  {
    id v4 = [(_SFPBRequestAppClipInstallCommand *)self applicationBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_url)
  {
    v6 = [(_SFPBRequestAppClipInstallCommand *)self url];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"url"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"url"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBURL *)self->_url hash];
  return [(NSString *)self->_applicationBundleIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRequestAppClipInstallCommand *)self url];
  v6 = [v4 url];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRequestAppClipInstallCommand *)self url];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRequestAppClipInstallCommand *)self url];
    v10 = [v4 url];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRequestAppClipInstallCommand *)self applicationBundleIdentifier];
  v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRequestAppClipInstallCommand *)self applicationBundleIdentifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRequestAppClipInstallCommand *)self applicationBundleIdentifier];
    v15 = [v4 applicationBundleIdentifier];
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
  id v4 = [(_SFPBRequestAppClipInstallCommand *)self url];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRequestAppClipInstallCommand *)self applicationBundleIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRequestAppClipInstallCommandReadFrom(self, (uint64_t)a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUrl:(id)a3
{
}

@end
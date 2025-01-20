@interface SFRequestAppClipInstallCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSURL)url;
- (SFRequestAppClipInstallCommand)initWithCoder:(id)a3;
- (SFRequestAppClipInstallCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFRequestAppClipInstallCommand

- (SFRequestAppClipInstallCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFRequestAppClipInstallCommand;
  v5 = [(SFRequestAppClipInstallCommand *)&v13 init];
  if (v5)
  {
    v6 = [v4 url];

    if (v6)
    {
      v7 = [v4 url];
      v8 = _SFPBURLHandwrittenTranslator(v7);
      [(SFRequestAppClipInstallCommand *)v5 setUrl:v8];
    }
    v9 = [v4 applicationBundleIdentifier];

    if (v9)
    {
      v10 = [v4 applicationBundleIdentifier];
      [(SFRequestAppClipInstallCommand *)v5 setApplicationBundleIdentifier:v10];
    }
    v11 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SFRequestAppClipInstallCommand;
  unint64_t v3 = [(SFCommand *)&v9 hash];
  id v4 = [(SFRequestAppClipInstallCommand *)self url];
  uint64_t v5 = [v4 hash];
  v6 = [(SFRequestAppClipInstallCommand *)self applicationBundleIdentifier];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFRequestAppClipInstallCommand *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFRequestAppClipInstallCommand *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)SFRequestAppClipInstallCommand;
      if ([(SFCommand *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(SFRequestAppClipInstallCommand *)self url];
        v8 = [(SFRequestAppClipInstallCommand *)v6 url];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(SFRequestAppClipInstallCommand *)self url];
        if (v9)
        {
          unint64_t v3 = [(SFRequestAppClipInstallCommand *)self url];
          v10 = [(SFRequestAppClipInstallCommand *)v6 url];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(SFRequestAppClipInstallCommand *)self applicationBundleIdentifier];
        objc_super v13 = [(SFRequestAppClipInstallCommand *)v6 applicationBundleIdentifier];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(SFRequestAppClipInstallCommand *)self applicationBundleIdentifier];
          if (v15)
          {
            v16 = (void *)v15;
            v19 = [(SFRequestAppClipInstallCommand *)self applicationBundleIdentifier];
            [(SFRequestAppClipInstallCommand *)v6 applicationBundleIdentifier];
            v17 = v20 = v3;
            char v11 = [v19 isEqual:v17];

            unint64_t v3 = v20;
          }
          else
          {

            char v11 = 1;
          }
        }
        v10 = v21;
        if (!v9) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFRequestAppClipInstallCommand;
  id v4 = [(SFCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFRequestAppClipInstallCommand *)self url];
  v6 = (void *)[v5 copy];
  [v4 setUrl:v6];

  unint64_t v7 = [(SFRequestAppClipInstallCommand *)self applicationBundleIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setApplicationBundleIdentifier:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRequestAppClipInstallCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRequestAppClipInstallCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRequestAppClipInstallCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRequestAppClipInstallCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRequestAppClipInstallCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFRequestAppClipInstallCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFRequestAppClipInstallCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCommand *)v8 url];
    [(SFRequestAppClipInstallCommand *)v5 setUrl:v9];

    objc_super v10 = [(SFCommand *)v8 applicationBundleIdentifier];
    [(SFRequestAppClipInstallCommand *)v5 setApplicationBundleIdentifier:v10];

    char v11 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v11];

    v12 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v12];

    objc_super v13 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v13];

    v14 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v14];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
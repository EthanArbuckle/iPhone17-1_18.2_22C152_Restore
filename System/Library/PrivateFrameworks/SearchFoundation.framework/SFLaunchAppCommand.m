@interface SFLaunchAppCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (SFLaunchAppCommand)initWithCoder:(id)a3;
- (SFLaunchAppCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
@end

@implementation SFLaunchAppCommand

- (SFLaunchAppCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFLaunchAppCommand;
  v5 = [(SFLaunchAppCommand *)&v10 init];
  if (v5)
  {
    v6 = [v4 applicationBundleIdentifier];

    if (v6)
    {
      v7 = [v4 applicationBundleIdentifier];
      [(SFLaunchAppCommand *)v5 setApplicationBundleIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFLaunchAppCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  id v4 = [(SFLaunchAppCommand *)self applicationBundleIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFLaunchAppCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFLaunchAppCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFLaunchAppCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFLaunchAppCommand *)self applicationBundleIdentifier];
    objc_super v7 = [(SFLaunchAppCommand *)v5 applicationBundleIdentifier];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFLaunchAppCommand *)self applicationBundleIdentifier];
      if (v8)
      {
        v9 = [(SFLaunchAppCommand *)self applicationBundleIdentifier];
        objc_super v10 = [(SFLaunchAppCommand *)v5 applicationBundleIdentifier];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFLaunchAppCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFLaunchAppCommand *)self applicationBundleIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setApplicationBundleIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBLaunchAppCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLaunchAppCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBLaunchAppCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLaunchAppCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFLaunchAppCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFLaunchAppCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFLaunchAppCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 applicationBundleIdentifier];
    [(SFLaunchAppCommand *)v5 setApplicationBundleIdentifier:v9];

    objc_super v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    char v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    objc_super v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
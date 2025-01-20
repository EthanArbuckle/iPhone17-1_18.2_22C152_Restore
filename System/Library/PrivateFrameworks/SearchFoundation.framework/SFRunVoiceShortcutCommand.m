@interface SFRunVoiceShortcutCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSString)voiceShortcutIdentifier;
- (SFRunVoiceShortcutCommand)initWithCoder:(id)a3;
- (SFRunVoiceShortcutCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setVoiceShortcutIdentifier:(id)a3;
@end

@implementation SFRunVoiceShortcutCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceShortcutIdentifier, 0);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setVoiceShortcutIdentifier:(id)a3
{
}

- (NSString)voiceShortcutIdentifier
{
  return self->_voiceShortcutIdentifier;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SFRunVoiceShortcutCommand;
  unint64_t v3 = [(SFCommand *)&v9 hash];
  v4 = [(SFRunVoiceShortcutCommand *)self voiceShortcutIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(SFRunVoiceShortcutCommand *)self applicationBundleIdentifier];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFRunVoiceShortcutCommand *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFRunVoiceShortcutCommand *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)SFRunVoiceShortcutCommand;
      if ([(SFCommand *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(SFRunVoiceShortcutCommand *)self voiceShortcutIdentifier];
        v8 = [(SFRunVoiceShortcutCommand *)v6 voiceShortcutIdentifier];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(SFRunVoiceShortcutCommand *)self voiceShortcutIdentifier];
        if (v9)
        {
          unint64_t v3 = [(SFRunVoiceShortcutCommand *)self voiceShortcutIdentifier];
          v10 = [(SFRunVoiceShortcutCommand *)v6 voiceShortcutIdentifier];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(SFRunVoiceShortcutCommand *)self applicationBundleIdentifier];
        v13 = [(SFRunVoiceShortcutCommand *)v6 applicationBundleIdentifier];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(SFRunVoiceShortcutCommand *)self applicationBundleIdentifier];
          if (v15)
          {
            v16 = (void *)v15;
            v19 = [(SFRunVoiceShortcutCommand *)self applicationBundleIdentifier];
            [(SFRunVoiceShortcutCommand *)v6 applicationBundleIdentifier];
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
  v10.super_class = (Class)SFRunVoiceShortcutCommand;
  id v4 = [(SFCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFRunVoiceShortcutCommand *)self voiceShortcutIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setVoiceShortcutIdentifier:v6];

  unint64_t v7 = [(SFRunVoiceShortcutCommand *)self applicationBundleIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setApplicationBundleIdentifier:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRunVoiceShortcutCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRunVoiceShortcutCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRunVoiceShortcutCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRunVoiceShortcutCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRunVoiceShortcutCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFRunVoiceShortcutCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFRunVoiceShortcutCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCommand *)v8 voiceShortcutIdentifier];
    [(SFRunVoiceShortcutCommand *)v5 setVoiceShortcutIdentifier:v9];

    objc_super v10 = [(SFCommand *)v8 applicationBundleIdentifier];
    [(SFRunVoiceShortcutCommand *)v5 setApplicationBundleIdentifier:v10];

    char v11 = [(SFCommand *)v8 commandDetail];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRunVoiceShortcutCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFRunVoiceShortcutCommand;
  uint64_t v5 = [(SFRunVoiceShortcutCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 voiceShortcutIdentifier];

    if (v6)
    {
      unint64_t v7 = [v4 voiceShortcutIdentifier];
      [(SFRunVoiceShortcutCommand *)v5 setVoiceShortcutIdentifier:v7];
    }
    v8 = [v4 applicationBundleIdentifier];

    if (v8)
    {
      objc_super v9 = [v4 applicationBundleIdentifier];
      [(SFRunVoiceShortcutCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    objc_super v10 = v5;
  }

  return v5;
}

@end
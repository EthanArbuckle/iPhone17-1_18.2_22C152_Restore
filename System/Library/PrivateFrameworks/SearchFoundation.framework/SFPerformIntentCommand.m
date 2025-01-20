@interface SFPerformIntentCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsRunnableWorkflow;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunnableWorkflow;
- (NSData)intentMessageData;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSString)biomeStreamIdentifier;
- (NSString)intentMessageName;
- (SFPerformIntentCommand)initWithCoder:(id)a3;
- (SFPerformIntentCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBiomeStreamIdentifier:(id)a3;
- (void)setIntentMessageData:(id)a3;
- (void)setIntentMessageName:(id)a3;
- (void)setIsRunnableWorkflow:(BOOL)a3;
@end

@implementation SFPerformIntentCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
}

- (void)setBiomeStreamIdentifier:(id)a3
{
}

- (NSString)biomeStreamIdentifier
{
  return self->_biomeStreamIdentifier;
}

- (BOOL)isRunnableWorkflow
{
  return self->_isRunnableWorkflow;
}

- (void)setIntentMessageData:(id)a3
{
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setIntentMessageName:(id)a3
{
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)SFPerformIntentCommand;
  unint64_t v3 = [(SFCommand *)&v14 hash];
  v4 = [(SFPerformIntentCommand *)self intentMessageName];
  uint64_t v5 = [v4 hash];
  v6 = [(SFPerformIntentCommand *)self applicationBundleIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFPerformIntentCommand *)self intentMessageData];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFPerformIntentCommand *)self isRunnableWorkflow];
  v11 = [(SFPerformIntentCommand *)self biomeStreamIdentifier];
  unint64_t v12 = v10 ^ [v11 hash] ^ v3;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFPerformIntentCommand *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFPerformIntentCommand *)v5 isMemberOfClass:objc_opt_class()])
    {
      v44.receiver = self;
      v44.super_class = (Class)SFPerformIntentCommand;
      if ([(SFCommand *)&v44 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFPerformIntentCommand *)self intentMessageName];
        v8 = [(SFPerformIntentCommand *)v6 intentMessageName];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
        uint64_t v9 = [(SFPerformIntentCommand *)self intentMessageName];
        if (v9)
        {
          uint64_t v10 = [(SFPerformIntentCommand *)self intentMessageName];
          unint64_t v3 = [(SFPerformIntentCommand *)v6 intentMessageName];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_38;
          }
          v43 = v10;
        }
        unint64_t v12 = [(SFPerformIntentCommand *)self applicationBundleIdentifier];
        v13 = [(SFPerformIntentCommand *)v6 applicationBundleIdentifier];
        objc_super v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_37;
        }
        v15 = [(SFPerformIntentCommand *)self applicationBundleIdentifier];
        if (v15)
        {
          v36 = v9;
          v16 = v14;
          v17 = v12;
          v18 = [(SFPerformIntentCommand *)self applicationBundleIdentifier];
          v38 = [(SFPerformIntentCommand *)v6 applicationBundleIdentifier];
          v39 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            char v11 = 0;
            unint64_t v12 = v17;
            objc_super v14 = v16;
            uint64_t v9 = v36;
            goto LABEL_35;
          }
          v40 = v3;
          v42 = v15;
          unint64_t v12 = v17;
          objc_super v14 = v16;
          uint64_t v9 = v36;
        }
        else
        {
          v40 = v3;
          v42 = 0;
        }
        v19 = [(SFPerformIntentCommand *)self intentMessageData];
        v20 = [(SFPerformIntentCommand *)v6 intentMessageData];
        if ((v19 == 0) == (v20 != 0))
        {

          char v11 = 0;
          unint64_t v3 = v40;
          v15 = v42;
          if (!v42) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
        v34 = v20;
        v35 = v19;
        [(SFPerformIntentCommand *)self intentMessageData];
        v37 = v15 = v42;
        if (v37)
        {
          v21 = [(SFPerformIntentCommand *)self intentMessageData];
          v32 = [(SFPerformIntentCommand *)v6 intentMessageData];
          v33 = v21;
          int v22 = objc_msgSend(v21, "isEqual:");
          unint64_t v3 = v40;
          if (!v22)
          {
            char v11 = 0;
LABEL_33:

LABEL_34:
            if (!v15)
            {
LABEL_36:

LABEL_37:
              uint64_t v10 = v43;
              if (!v9)
              {
LABEL_39:

                goto LABEL_40;
              }
LABEL_38:

              goto LABEL_39;
            }
LABEL_35:

            goto LABEL_36;
          }
        }
        else
        {
          unint64_t v3 = v40;
        }
        BOOL v23 = [(SFPerformIntentCommand *)self isRunnableWorkflow];
        if (v23 == [(SFPerformIntentCommand *)v6 isRunnableWorkflow])
        {
          v24 = [(SFPerformIntentCommand *)self biomeStreamIdentifier];
          v25 = [(SFPerformIntentCommand *)v6 biomeStreamIdentifier];
          if ((v24 == 0) != (v25 != 0))
          {
            v31 = v25;
            v41 = v24;
            uint64_t v26 = [(SFPerformIntentCommand *)self biomeStreamIdentifier];
            if (v26)
            {
              v30 = (void *)v26;
              v29 = [(SFPerformIntentCommand *)self biomeStreamIdentifier];
              v27 = [(SFPerformIntentCommand *)v6 biomeStreamIdentifier];
              char v11 = [v29 isEqual:v27];
            }
            else
            {

              char v11 = 1;
            }
LABEL_32:
            v15 = v42;
            if (!v37) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
        }
        char v11 = 0;
        goto LABEL_32;
      }
    }
    char v11 = 0;
  }
LABEL_41:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SFPerformIntentCommand;
  id v4 = [(SFCommand *)&v14 copyWithZone:a3];
  uint64_t v5 = [(SFPerformIntentCommand *)self intentMessageName];
  v6 = (void *)[v5 copy];
  [v4 setIntentMessageName:v6];

  uint64_t v7 = [(SFPerformIntentCommand *)self applicationBundleIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setApplicationBundleIdentifier:v8];

  uint64_t v9 = [(SFPerformIntentCommand *)self intentMessageData];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setIntentMessageData:v10];

  objc_msgSend(v4, "setIsRunnableWorkflow:", -[SFPerformIntentCommand isRunnableWorkflow](self, "isRunnableWorkflow"));
  char v11 = [(SFPerformIntentCommand *)self biomeStreamIdentifier];
  unint64_t v12 = (void *)[v11 copy];
  [v4 setBiomeStreamIdentifier:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPerformIntentCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPerformIntentCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPerformIntentCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPerformIntentCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFPerformIntentCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFPerformIntentCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFPerformIntentCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCommand *)v8 intentMessageName];
    [(SFPerformIntentCommand *)v5 setIntentMessageName:v9];

    uint64_t v10 = [(SFCommand *)v8 applicationBundleIdentifier];
    [(SFPerformIntentCommand *)v5 setApplicationBundleIdentifier:v10];

    char v11 = [(SFCommand *)v8 intentMessageData];
    [(SFPerformIntentCommand *)v5 setIntentMessageData:v11];

    [(SFPerformIntentCommand *)v5 setIsRunnableWorkflow:[(SFCommand *)v8 isRunnableWorkflow]];
    unint64_t v12 = [(SFCommand *)v8 biomeStreamIdentifier];
    [(SFPerformIntentCommand *)v5 setBiomeStreamIdentifier:v12];

    v13 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v13];

    objc_super v14 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v14];

    v15 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v15];

    v16 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v16];
  }
  return v5;
}

- (BOOL)hasIsRunnableWorkflow
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsRunnableWorkflow:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isRunnableWorkflow = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPerformIntentCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPerformIntentCommand;
  uint64_t v5 = [(SFPerformIntentCommand *)&v16 init];
  if (v5)
  {
    v6 = [v4 intentMessageName];

    if (v6)
    {
      uint64_t v7 = [v4 intentMessageName];
      [(SFPerformIntentCommand *)v5 setIntentMessageName:v7];
    }
    v8 = [v4 applicationBundleIdentifier];

    if (v8)
    {
      uint64_t v9 = [v4 applicationBundleIdentifier];
      [(SFPerformIntentCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    uint64_t v10 = [v4 intentMessageData];

    if (v10)
    {
      char v11 = [v4 intentMessageData];
      [(SFPerformIntentCommand *)v5 setIntentMessageData:v11];
    }
    if ([v4 isRunnableWorkflow]) {
      -[SFPerformIntentCommand setIsRunnableWorkflow:](v5, "setIsRunnableWorkflow:", [v4 isRunnableWorkflow]);
    }
    unint64_t v12 = [v4 biomeStreamIdentifier];

    if (v12)
    {
      v13 = [v4 biomeStreamIdentifier];
      [(SFPerformIntentCommand *)v5 setBiomeStreamIdentifier:v13];
    }
    objc_super v14 = v5;
  }

  return v5;
}

@end
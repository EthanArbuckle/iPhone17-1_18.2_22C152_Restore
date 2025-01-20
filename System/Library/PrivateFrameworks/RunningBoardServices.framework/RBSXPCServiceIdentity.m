@interface RBSXPCServiceIdentity
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (RBSXPCServiceIdentity)identityWithDefinition:(id)a3 sessionID:(id)a4 host:(id)a5 UUID:(id)a6;
+ (RBSXPCServiceIdentity)identityWithDefinition:(id)a3 sessionID:(id)a4 host:(id)a5 UUID:(id)a6 persona:(id)a7 validationToken:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSData)validationToken;
- (NSString)description;
- (NSString)personaString;
- (NSString)sessionID;
- (NSUUID)uuid;
- (RBSProcessInstance)host;
- (RBSXPCServiceDefinition)definition;
- (RBSXPCServiceIdentity)initWithRBSXPCCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSXPCServiceIdentity

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSXPCServiceIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RBSXPCServiceIdentity *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_definition"];
    definition = v5->_definition;
    v5->_definition = (RBSXPCServiceDefinition *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_host"];
    host = v5->_host;
    v5->_host = (RBSProcessInstance *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personaString"];
    personaString = v5->_personaString;
    v5->_personaString = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_validationToken"];
    validationToken = v5->_validationToken;
    v5->_validationToken = (NSData *)v16;
  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  definition = self->_definition;
  id v5 = a3;
  [v5 encodeObject:definition forKey:@"_definition"];
  [v5 encodeObject:self->_sessionID forKey:@"_sessionID"];
  [v5 encodeObject:self->_host forKey:@"_host"];
  [v5 encodeObject:self->_uuid forKey:@"_uuid"];
  [v5 encodeObject:self->_personaString forKey:@"_personaString"];
  [v5 encodeObject:self->_validationToken forKey:@"_validationToken"];
}

- (RBSXPCServiceDefinition)definition
{
  return self->_definition;
}

- (RBSProcessInstance)host
{
  return self->_host;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)personaString
{
  return self->_personaString;
}

- (NSData)validationToken
{
  return self->_validationToken;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RBSXPCServiceDefinition *)self->_definition hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash] ^ v3;
  unint64_t v5 = [(RBSProcessInstance *)self->_host hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSUUID *)self->_uuid hash];
  NSUInteger v7 = [(NSString *)self->_personaString hash];
  return v6 ^ v7 ^ [(NSData *)self->_validationToken hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  definition = self->_definition;
  uint64_t v6 = [v4 definition];
  NSUInteger v7 = (void *)v6;
  if (definition == (RBSXPCServiceDefinition *)v6
    || (definition ? (BOOL v8 = v6 == 0) : (BOOL v8 = 1), !v8 && [(RBSXPCServiceDefinition *)definition isEqual:v6]))
  {
    sessionID = self->_sessionID;
    uint64_t v10 = [v4 sessionID];
    v11 = (void *)v10;
    if (sessionID != (NSString *)v10)
    {
      char v12 = 0;
      if (!sessionID || !v10) {
        goto LABEL_37;
      }
      if (![(NSString *)sessionID isEqual:v10])
      {
        char v12 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    host = self->_host;
    uint64_t v14 = [v4 host];
    v15 = (void *)v14;
    if (host != (RBSProcessInstance *)v14)
    {
      char v12 = 0;
      if (!host || !v14) {
        goto LABEL_36;
      }
      if (![(RBSProcessInstance *)host isEqual:v14])
      {
        char v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    uuid = self->_uuid;
    uint64_t v17 = [v4 uuid];
    v18 = (void *)v17;
    if (uuid != (NSUUID *)v17)
    {
      char v12 = 0;
      if (!uuid || !v17) {
        goto LABEL_35;
      }
      if (![(NSUUID *)uuid isEqual:v17])
      {
        char v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    personaString = self->_personaString;
    uint64_t v20 = [v4 personaString];
    v21 = (void *)v20;
    if (personaString == (NSString *)v20) {
      goto LABEL_23;
    }
    char v12 = 0;
    if (personaString && v20)
    {
      if ([(NSString *)personaString isEqual:v20])
      {
LABEL_23:
        validationToken = self->_validationToken;
        uint64_t v23 = [v4 validationToken];
        v24 = (void *)v23;
        if (validationToken == (NSData *)v23)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (validationToken && v23) {
            char v12 = [(NSData *)validationToken isEqual:v23];
          }
        }

        goto LABEL_34;
      }
      char v12 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  char v12 = 0;
LABEL_38:

  return v12;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_personaString, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

+ (RBSXPCServiceIdentity)identityWithDefinition:(id)a3 sessionID:(id)a4 host:(id)a5 UUID:(id)a6 persona:(id)a7 validationToken:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  uint64_t v20 = objc_alloc_init((Class)a1);
  v21 = (void *)v20[1];
  v20[1] = v14;
  id v22 = v14;

  uint64_t v23 = [v19 copy];
  v24 = (void *)v20[2];
  v20[2] = v23;

  v25 = (void *)v20[3];
  v20[3] = v15;
  id v26 = v15;

  v27 = (void *)v20[4];
  v20[4] = v16;
  id v28 = v16;

  uint64_t v29 = [v18 copy];
  v30 = (void *)v20[5];
  v20[5] = v29;

  uint64_t v31 = [v17 copy];
  v32 = (void *)v20[6];
  v20[6] = v31;

  return (RBSXPCServiceIdentity *)v20;
}

+ (RBSXPCServiceIdentity)identityWithDefinition:(id)a3 sessionID:(id)a4 host:(id)a5 UUID:(id)a6
{
  return (RBSXPCServiceIdentity *)[a1 identityWithDefinition:a3 sessionID:a4 host:a5 UUID:a6 persona:0 validationToken:0];
}

- (NSString)description
{
  unint64_t v3 = [(RBSXPCServiceDefinition *)self->_definition description];
  id v4 = v3;
  if (self->_host)
  {
    uint64_t v5 = [v3 stringByAppendingFormat:@"[%@]", self->_host];

    id v4 = (void *)v5;
  }
  if (self->_uuid)
  {
    uint64_t v6 = [v4 stringByAppendingFormat:@":%@", self->_uuid];

    id v4 = (void *)v6;
  }
  if (self->_personaString)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@":%@", self->_personaString];

    id v4 = (void *)v7;
  }
  validationToken = self->_validationToken;
  if (validationToken)
  {
    uint64_t v9 = objc_msgSend(v4, "stringByAppendingFormat:", @":{%lu}", -[NSData hash](validationToken, "hash"));

    id v4 = (void *)v9;
  }
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
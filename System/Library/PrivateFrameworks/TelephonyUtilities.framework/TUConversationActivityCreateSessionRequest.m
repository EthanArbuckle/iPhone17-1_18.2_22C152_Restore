@interface TUConversationActivityCreateSessionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationActivitySessionCreationRequest:(id)a3;
- (CKShare)share;
- (NSData)applicationContext;
- (NSString)activityIdentifier;
- (NSString)staticIdentifier;
- (NSUUID)UUID;
- (TUConversationActivityCreateSessionRequest)initWithCoder:(id)a3;
- (TUConversationActivityCreateSessionRequest)initWithMetadata:(id)a3 applicationContext:(id)a4 activityIdentifier:(id)a5 uuid:(id)a6;
- (TUConversationActivityCreateSessionRequest)initWithMetadata:(id)a3 applicationContext:(id)a4 activityIdentifier:(id)a5 uuid:(id)a6 staticIdentifier:(id)a7;
- (TUConversationActivityMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setShare:(id)a3;
- (void)setStaticIdentifier:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUConversationActivityCreateSessionRequest

- (TUConversationActivityCreateSessionRequest)initWithMetadata:(id)a3 applicationContext:(id)a4 activityIdentifier:(id)a5 uuid:(id)a6
{
  return [(TUConversationActivityCreateSessionRequest *)self initWithMetadata:a3 applicationContext:a4 activityIdentifier:a5 uuid:a6 staticIdentifier:0];
}

- (TUConversationActivityCreateSessionRequest)initWithMetadata:(id)a3 applicationContext:(id)a4 activityIdentifier:(id)a5 uuid:(id)a6 staticIdentifier:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TUConversationActivityCreateSessionRequest;
  v17 = [(TUConversationActivityCreateSessionRequest *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_metadata, a3);
    objc_storeStrong((id *)&v18->_applicationContext, a4);
    objc_storeStrong((id *)&v18->_activityIdentifier, a5);
    objc_storeStrong((id *)&v18->_UUID, a6);
    objc_storeStrong((id *)&v18->_staticIdentifier, a7);
  }

  return v18;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];

  if (v4)
  {
    v5 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];
    [v3 appendFormat:@" activityIdentifier=%@", v5];
  }
  v6 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];

  if (v6)
  {
    v7 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];
    [v3 appendFormat:@" applicationContext=%@", v7];
  }
  v8 = [(TUConversationActivityCreateSessionRequest *)self metadata];

  if (v8)
  {
    v9 = [(TUConversationActivityCreateSessionRequest *)self metadata];
    [v3 appendFormat:@" metadata=%@", v9];
  }
  v10 = [(TUConversationActivityCreateSessionRequest *)self UUID];

  if (v10)
  {
    v11 = [(TUConversationActivityCreateSessionRequest *)self UUID];
    [v3 appendFormat:@" UUID=%@", v11];
  }
  v12 = [(TUConversationActivityCreateSessionRequest *)self share];

  if (v12)
  {
    id v13 = [(TUConversationActivityCreateSessionRequest *)self share];
    [v3 appendFormat:@" share=%@", v13];
  }
  id v14 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];

  if (v14)
  {
    id v15 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];
    [v3 appendFormat:@" staticIdentifier=%@", v15];
  }
  [v3 appendString:@">"];
  id v16 = (void *)[v3 copy];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationActivityCreateSessionRequest *)self isEqualToConversationActivitySessionCreationRequest:v4];

  return v5;
}

- (BOOL)isEqualToConversationActivitySessionCreationRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];
  v6 = [v4 activityIdentifier];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];
    v8 = [v4 applicationContext];
    if ([v7 isEqual:v8])
    {
      v9 = [(TUConversationActivityCreateSessionRequest *)self metadata];
      v10 = [v4 metadata];
      if ([v9 isEqual:v10])
      {
        v11 = [(TUConversationActivityCreateSessionRequest *)self UUID];
        v12 = [v4 UUID];
        if ([v11 isEqual:v12])
        {
          objc_super v21 = v11;
          uint64_t v13 = [(TUConversationActivityCreateSessionRequest *)self share];
          uint64_t v14 = [v4 share];
          v22 = (void *)v13;
          unint64_t v15 = v13;
          id v16 = (void *)v14;
          if (TUObjectsAreEqualOrNil(v15, v14))
          {
            id v20 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];
            v19 = [v4 staticIdentifier];
            char v17 = TUObjectsAreEqualOrNil((unint64_t)v20, (uint64_t)v19);
          }
          else
          {
            char v17 = 0;
          }

          v11 = v21;
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(TUConversationActivityCreateSessionRequest *)self metadata];
  uint64_t v8 = [v7 hash];
  v9 = [(TUConversationActivityCreateSessionRequest *)self UUID];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(TUConversationActivityCreateSessionRequest *)self share];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUConversationActivityCreateSessionRequest *)self metadata];
  uint64_t v6 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];
  v7 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];
  uint64_t v8 = [(TUConversationActivityCreateSessionRequest *)self UUID];
  v9 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];
  uint64_t v10 = (void *)[v4 initWithMetadata:v5 applicationContext:v6 activityIdentifier:v7 uuid:v8 staticIdentifier:v9];

  v11 = [(TUConversationActivityCreateSessionRequest *)self share];
  [v10 setShare:v11];

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TUMutableConversationActivityCreateSessionRequest alloc];
  BOOL v5 = [(TUConversationActivityCreateSessionRequest *)self metadata];
  uint64_t v6 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];
  v7 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];
  uint64_t v8 = [(TUConversationActivityCreateSessionRequest *)self UUID];
  v9 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];
  uint64_t v10 = [(TUConversationActivityCreateSessionRequest *)v4 initWithMetadata:v5 applicationContext:v6 activityIdentifier:v7 uuid:v8 staticIdentifier:v9];

  v11 = [(TUConversationActivityCreateSessionRequest *)self share];
  [(TUConversationActivityCreateSessionRequest *)v10 setShare:v11];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivityCreateSessionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_activityIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(sel_applicationContext);
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = NSStringFromSelector(sel_metadata);
      uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        unint64_t v15 = NSStringFromSelector(sel_UUID);
        id v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

        if (v16)
        {
          uint64_t v17 = objc_opt_class();
          v18 = NSStringFromSelector(sel_staticIdentifier);
          v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

          id v20 = NSStringFromSelector(sel_share);
          int v21 = [v4 containsValueForKey:v20];

          if (v21)
          {
            uint64_t v30 = 0;
            v31 = &v30;
            uint64_t v32 = 0x2050000000;
            v22 = (void *)getCKShareClass_softClass;
            uint64_t v33 = getCKShareClass_softClass;
            if (!getCKShareClass_softClass)
            {
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __getCKShareClass_block_invoke;
              v29[3] = &unk_1E58E5F90;
              v29[4] = &v30;
              __getCKShareClass_block_invoke((uint64_t)v29);
              v22 = (void *)v31[3];
            }
            id v23 = v22;
            _Block_object_dispose(&v30, 8);
            v24 = NSStringFromSelector(sel_share);
            v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
          }
          else
          {
            v25 = 0;
          }
          v27 = [(TUConversationActivityCreateSessionRequest *)self initWithMetadata:v13 applicationContext:v10 activityIdentifier:v7 uuid:v16 staticIdentifier:v19];
          [(TUConversationActivityCreateSessionRequest *)v27 setShare:v25];
          self = v27;

          v26 = self;
        }
        else
        {
          v26 = 0;
        }
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationActivityCreateSessionRequest *)self activityIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_activityIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUConversationActivityCreateSessionRequest *)self applicationContext];
  uint64_t v8 = NSStringFromSelector(sel_applicationContext);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(TUConversationActivityCreateSessionRequest *)self metadata];
  uint64_t v10 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUConversationActivityCreateSessionRequest *)self UUID];
  uint64_t v12 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUConversationActivityCreateSessionRequest *)self share];
  uint64_t v14 = NSStringFromSelector(sel_share);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(TUConversationActivityCreateSessionRequest *)self staticIdentifier];
  unint64_t v15 = NSStringFromSelector(sel_staticIdentifier);
  [v4 encodeObject:v16 forKey:v15];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
}

- (TUConversationActivityMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (NSString)staticIdentifier
{
  return self->_staticIdentifier;
}

- (void)setStaticIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticIdentifier, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
@interface SMConversation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEqualPrimaryHandlesAsConversation:(id)a3;
- (BOOL)hasEqualPrimaryHandlesAsSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (NSArray)receiverHandles;
- (NSArray)receiverPrimaryHandles;
- (NSString)displayName;
- (NSString)identifier;
- (SMConversation)initWithCoder:(id)a3;
- (SMConversation)initWithDictionary:(id)a3;
- (SMConversation)initWithReceiverHandles:(id)a3 identifier:(id)a4 displayName:(id)a5;
- (id)description;
- (id)descriptionDictionary;
- (id)outputToDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMConversation

- (SMConversation)initWithReceiverHandles:(id)a3 identifier:(id)a4 displayName:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SMConversation;
  v12 = [(SMConversation *)&v28 init];
  if (v12)
  {
    if (!v9 || ![v9 count])
    {
      v22 = 0;
      goto LABEL_14;
    }
    objc_storeStrong((id *)&v12->_receiverHandles, a3);
    objc_storeStrong((id *)&v12->_identifier, a4);
    objc_storeStrong((id *)&v12->_displayName, a5);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v18), "primaryHandle", (void)v24);
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [v13 copy];
    receiverPrimaryHandles = v12->_receiverPrimaryHandles;
    v12->_receiverPrimaryHandles = (NSArray *)v20;

    v12->_isGroup = (unint64_t)[v14 count] > 1;
  }
  v22 = v12;
LABEL_14:

  return v22;
}

- (BOOL)hasEqualPrimaryHandlesAsConversation:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [a3 receiverPrimaryHandles];
  v6 = [v4 setWithArray:v5];

  LOBYTE(self) = [(SMConversation *)self hasEqualPrimaryHandlesAsSet:v6];
  return (char)self;
}

- (BOOL)hasEqualPrimaryHandlesAsSet:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v6 = [(SMConversation *)self receiverPrimaryHandles];
  v7 = [v4 setWithArray:v6];

  LOBYTE(v6) = [v7 isEqualToSet:v5];
  return (char)v6;
}

- (SMConversation)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 valueForKey:@"__kSMReceiverHandlesKey"];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        v13 = [SMHandle alloc];
        id v14 = -[SMHandle initWithDictionary:](v13, "initWithDictionary:", v12, (void)v21);
        if (v14) {
          [v6 addObject:v14];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [v4 valueForKey:@"__kSMConversationIDKey"];
  uint64_t v16 = [v4 valueForKey:@"__kSMChatDisplayNameKey"];
  uint64_t v17 = [SMConversation alloc];
  uint64_t v18 = (void *)[v6 copy];
  v19 = [(SMConversation *)v17 initWithReceiverHandles:v18 identifier:v15 displayName:v16];

  return v19;
}

- (id)outputToDictionary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  id v5 = [(SMConversation *)self receiverHandles];
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(SMConversation *)self receiverHandles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) outputToDictionary];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  [v3 setObject:v13 forKey:@"__kSMReceiverHandlesKey"];

  id v14 = [(SMConversation *)self identifier];

  if (v14)
  {
    uint64_t v15 = [(SMConversation *)self identifier];
    [v3 setObject:v15 forKey:@"__kSMConversationIDKey"];
  }
  uint64_t v16 = [(SMConversation *)self displayName];

  if (v16)
  {
    uint64_t v17 = [(SMConversation *)self displayName];
    [v3 setObject:v17 forKey:@"__kSMChatDisplayNameKey"];
  }
  uint64_t v18 = (void *)[v3 copy];

  return v18;
}

- (id)descriptionDictionary
{
  v3 = objc_opt_new();
  id v4 = [(SMConversation *)self receiverHandles];
  [v3 setObject:v4 forKey:@"__kSMReceiverHandlesKey"];

  id v5 = [(SMConversation *)self identifier];

  if (v5)
  {
    v6 = [(SMConversation *)self identifier];
    [v3 setObject:v6 forKey:@"__kSMConversationIDKey"];
  }
  id v7 = [(SMConversation *)self displayName];

  if (v7)
  {
    uint64_t v8 = [(SMConversation *)self displayName];
    [v3 setObject:v8 forKey:@"__kSMChatDisplayNameKey"];
  }
  return v3;
}

- (id)description
{
  v2 = NSString;
  v3 = [(SMConversation *)self descriptionDictionary];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(SMConversation *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(SMConversation *)self receiverHandles];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(SMConversation *)self displayName];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SMConversation *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      unint64_t v8 = [(SMConversation *)self identifier];
      uint64_t v9 = [(SMConversation *)v7 identifier];
      if (v8 != v9)
      {
        v3 = [(SMConversation *)self identifier];
        uint64_t v4 = [(SMConversation *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v11 = [(SMConversation *)self receiverHandles];
      uint64_t v12 = [(SMConversation *)v7 receiverHandles];
      if (v11 == v12)
      {
        uint64_t v25 = v11;
      }
      else
      {
        v13 = [(SMConversation *)self receiverHandles];
        uint64_t v26 = [(SMConversation *)v7 receiverHandles];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        long long v24 = v13;
        uint64_t v25 = v11;
      }
      id v14 = [(SMConversation *)self displayName];
      uint64_t v15 = [(SMConversation *)v7 displayName];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(SMConversation *)self displayName];
        uint64_t v17 = v23 = v3;
        [(SMConversation *)v7 displayName];
        long long v22 = v4;
        uint64_t v18 = v9;
        long long v20 = v19 = v8;
        char v10 = [v17 isEqual:v20];

        unint64_t v8 = v19;
        uint64_t v9 = v18;
        uint64_t v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      uint64_t v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  receiverHandles = self->_receiverHandles;
  id v5 = a3;
  [v5 encodeObject:receiverHandles forKey:@"__kSMReceiverHandlesKey"];
  [v5 encodeObject:self->_identifier forKey:@"__kSMConversationIDKey"];
  [v5 encodeObject:self->_displayName forKey:@"__kSMChatDisplayNameKey"];
}

- (SMConversation)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  unint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"__kSMReceiverHandlesKey"];
  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMConversationIDKey"];
  char v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMChatDisplayNameKey"];

  uint64_t v11 = [(SMConversation *)self initWithReceiverHandles:v8 identifier:v9 displayName:v10];
  return v11;
}

- (NSArray)receiverHandles
{
  return self->_receiverHandles;
}

- (NSArray)receiverPrimaryHandles
{
  return self->_receiverPrimaryHandles;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_receiverPrimaryHandles, 0);
  objc_storeStrong((id *)&self->_receiverHandles, 0);
}

@end
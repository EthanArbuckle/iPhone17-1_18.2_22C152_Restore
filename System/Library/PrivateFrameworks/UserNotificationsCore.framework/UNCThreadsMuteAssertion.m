@interface UNCThreadsMuteAssertion
+ (BOOL)supportsSecureCoding;
+ (id)threadsMuteAssertion;
+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)expirationDateByThreadID;
- (NSSet)threadIDs;
- (UNCThreadsMuteAssertion)initWithCoder:(id)a3;
- (id)_initWithExpirationDateByThreadID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4;
- (void)setMutedUntilDate:(id)a3 forThreadIdentifier:(id)a4;
- (void)setUnmutedForThreadIdentifier:(id)a3;
@end

@implementation UNCThreadsMuteAssertion

+ (id)threadsMuteAssertion
{
  v2 = [UNCThreadsMuteAssertion alloc];
  id v3 = [(UNCThreadsMuteAssertion *)v2 _initWithExpirationDateByThreadID:MEMORY[0x263EFFA78]];

  return v3;
}

+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3
{
  id v3 = a3;
  id v4 = [[UNCThreadsMuteAssertion alloc] _initWithExpirationDateByThreadID:v3];

  return v4;
}

- (id)_initWithExpirationDateByThreadID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCThreadsMuteAssertion;
  v5 = [(UNCMuteAssertion *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (NSDictionary)expirationDateByThreadID
{
  v2 = (void *)[(NSMutableDictionary *)self->_mutableExpirationDateByThreadID copy];

  return (NSDictionary *)v2;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID objectForKey:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [MEMORY[0x263EFF910] now];
  if (v6) {
    BOOL v8 = [v6 compare:v7] == 1;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setMutedUntilDate:(id)a3 forThreadIdentifier:(id)a4
{
}

- (void)setUnmutedForThreadIdentifier:(id)a3
{
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *a4 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    objc_super v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID valueForKey:v12];
        if ([(UNCThreadsMuteAssertion *)self isActiveForThreadIdentifier:v12])
        {
          if (!v9 || [v13 compare:v9] == -1)
          {
            id v14 = v13;

            objc_super v9 = v14;
          }
        }
        else
        {
          [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID removeObjectForKey:v12];
          *a4 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    objc_super v9 = 0;
  }

  id v15 = v9;
  *a3 = v15;
}

- (NSSet)threadIDs
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID allKeys];
  id v4 = (void *)[v3 copy];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 31;
  mutableExpirationDateByThreadID = self->_mutableExpirationDateByThreadID;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__UNCThreadsMuteAssertion_hash__block_invoke;
  v5[3] = &unk_265567C98;
  v5[4] = &v7;
  v5[5] = v6;
  [(NSMutableDictionary *)mutableExpirationDateByThreadID enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __31__UNCThreadsMuteAssertion_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v7 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 hash] + v6 * v5;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v10 = [v7 hash];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 + v9 * v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (id v4 = v3) != 0)
  {
    uint64_t v5 = v4;
    char v6 = BSEqualDictionaries();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; expirationDateByThreadID: %@>",
               objc_opt_class(),
               self,
               self->_mutableExpirationDateByThreadID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID mutableCopy];
  char v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UNCThreadsMuteAssertion;
  id v4 = a3;
  [(UNCMuteAssertion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_mutableExpirationDateByThreadID, @"expirationDateByThreadID", v5.receiver, v5.super_class);
}

- (UNCThreadsMuteAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UNCThreadsMuteAssertion;
  objc_super v5 = [(UNCMuteAssertion *)&v12 initWithCoder:v4];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"expirationDateByThreadID"];
    mutableExpirationDateByThreadID = v5->_mutableExpirationDateByThreadID;
    v5->_mutableExpirationDateByThreadID = (NSMutableDictionary *)v9;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end
@interface SSVSubscriptionResponse
- (SSVSubscriptionResponse)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)subscriptionStatusForAccountUniqueIdentifier:(unint64_t)a3;
- (void)setSubscriptionStatus:(id)a3 forAccountUniqueIdentifier:(unint64_t)a4;
@end

@implementation SSVSubscriptionResponse

- (id)subscriptionStatusForAccountUniqueIdentifier:(unint64_t)a3
{
  accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
  v4 = [NSNumber numberWithUnsignedLongLong:a3];
  v5 = [(NSMutableDictionary *)accountUniqueIdentifierToSubscriptionStatus objectForKey:v4];

  return v5;
}

- (void)setSubscriptionStatus:(id)a3 forAccountUniqueIdentifier:(unint64_t)a4
{
  id v6 = a3;
  accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
  id v12 = v6;
  if (v6)
  {
    if (!accountUniqueIdentifierToSubscriptionStatus)
    {
      v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      v9 = self->_accountUniqueIdentifierToSubscriptionStatus;
      self->_accountUniqueIdentifierToSubscriptionStatus = v8;

      accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
    }
    v10 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableDictionary *)accountUniqueIdentifierToSubscriptionStatus setObject:v12 forKey:v10];
    goto LABEL_5;
  }
  v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)accountUniqueIdentifierToSubscriptionStatus removeObjectForKey:v11];

  if (![(NSMutableDictionary *)self->_accountUniqueIdentifierToSubscriptionStatus count])
  {
    v10 = self->_accountUniqueIdentifierToSubscriptionStatus;
    self->_accountUniqueIdentifierToSubscriptionStatus = 0;
LABEL_5:
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->_accountUniqueIdentifierToSubscriptionStatus mutableCopy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (SSVSubscriptionResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && (uint64_t v6 = MEMORY[0x1A62689E0](v4), v7 = MEMORY[0x1E4F14590], v6 == MEMORY[0x1E4F14590]))
  {
    v14.receiver = self;
    v14.super_class = (Class)SSVSubscriptionResponse;
    v8 = [(SSVSubscriptionResponse *)&v14 init];
    if (v8)
    {
      uint64_t v10 = xpc_dictionary_get_value(v5, "0");
      v11 = (void *)v10;
      if (v10 && MEMORY[0x1A62689E0](v10) == v7)
      {
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __47__SSVSubscriptionResponse_initWithXPCEncoding___block_invoke;
        applier[3] = &unk_1E5BAAA68;
        v13 = v8;
        xpc_dictionary_apply(v11, applier);
      }
    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

uint64_t __47__SSVSubscriptionResponse_initWithXPCEncoding___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [[SSVFairPlaySubscriptionStatus alloc] initWithXPCEncoding:v5];

  if (v6) {
    objc_msgSend(*(id *)(a1 + 32), "setSubscriptionStatus:forAccountUniqueIdentifier:", v6, strtoull(a2, 0, 10));
  }

  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__25;
  id v12 = __Block_byref_object_dispose__25;
  id v13 = 0;
  accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SSVSubscriptionResponse_copyXPCEncoding__block_invoke;
  v7[3] = &unk_1E5BAAA90;
  v7[4] = &v8;
  [(NSMutableDictionary *)accountUniqueIdentifierToSubscriptionStatus enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (void *)v9[5];
  if (v5) {
    xpc_dictionary_set_value(v3, "0", v5);
  }
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __42__SSVSubscriptionResponse_copyXPCEncoding__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  v9 = (void *)[v5 copyXPCEncoding];
  if (v9)
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lli", objc_msgSend(v13, "longLongValue"));
    v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v12 = v10;
    xpc_dictionary_set_value(v11, (const char *)[v12 UTF8String], v9);
  }
}

- (void).cxx_destruct
{
}

@end
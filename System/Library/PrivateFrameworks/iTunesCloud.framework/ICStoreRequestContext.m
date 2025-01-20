@interface ICStoreRequestContext
+ (BOOL)supportsSecureCoding;
+ (id)activeStoreAccountRequestContext;
- (BOOL)allowsExpiredBags;
- (BOOL)isEqual:(id)a3;
- (ICStoreDialogResponseHandler)storeDialogResponseHandler;
- (ICStoreRequestContext)initWithBlock:(id)a3;
- (ICStoreRequestContext)initWithCoder:(id)a3;
- (ICStoreRequestContext)initWithIdentity:(id)a3;
- (ICStoreRequestContext)initWithIdentity:(id)a3 clientInfo:(id)a4;
- (ICStoreRequestContext)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5;
- (ICStoreRequestContext)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5 authenticationProvider:(id)a6;
- (ICUserIdentity)delegatedIdentity;
- (ICUserIdentity)identity;
- (ICUserIdentityStore)identityStore;
- (id)copyWithBlock:(id)a3;
- (id)description;
- (id)userAgent;
- (int64_t)personalizationStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsExpiredBags:(BOOL)a3;
- (void)setDelegatedIdentity:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setIdentityStore:(id)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setStoreDialogResponseHandler:(id)a3;
@end

@implementation ICStoreRequestContext

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (ICUserIdentity)identity
{
  return self->_identity;
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ICRequestContext *)self clientInfo];
  v6 = [v5 clientIdentifier];
  v7 = [(ICRequestContext *)self clientInfo];
  v8 = [v7 clientVersion];
  v9 = [v3 stringWithFormat:@"<%@: %p [%@/%@; %@]>", v4, self, v6, v8, self->_identity];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDialogResponseHandler, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_delegatedIdentity, 0);
}

- (ICStoreRequestContext)initWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__ICStoreRequestContext_initWithBlock___block_invoke;
  v9[3] = &unk_1E5AC6D70;
  id v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)ICStoreRequestContext;
  id v5 = v4;
  v6 = [(ICRequestContext *)&v8 initWithBlock:v9];

  return v6;
}

void __39__ICStoreRequestContext_initWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:2];
  [v11 setAuthenticationProvider:v3];

  uint64_t v4 = +[ICUserIdentity nullIdentity];
  id v5 = (void *)*((void *)v11 + 7);
  *((void *)v11 + 7) = v4;

  uint64_t v6 = +[ICUserIdentityStore nullIdentityStore];
  v7 = (void *)*((void *)v11 + 8);
  *((void *)v11 + 8) = v6;

  *((unsigned char *)v11 + 88) = 1;
  *((void *)v11 + 10) = 1;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_super v8 = +[ICUserIdentityStore nullIdentityStore];
  LODWORD(v3) = [v8 isEqual:*((void *)v11 + 8)];

  if (v3)
  {
    uint64_t v9 = +[ICUserIdentityStore defaultIdentityStore];
    id v10 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v9;
  }
}

- (void)setAllowsExpiredBags:(BOOL)a3
{
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICStoreRequestContext.m" lineNumber:248 description:@"Mutation not allowed beyond initialization."];
  }
  self->_allowsExpiredBags = a3;
}

- (void)setIdentity:(id)a3
{
  id v8 = a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICStoreRequestContext.m" lineNumber:233 description:@"Mutation not allowed beyond initialization."];
  }
  id v5 = (ICUserIdentity *)[v8 copy];
  identity = self->_identity;
  self->_identity = v5;
}

void __39__ICStoreRequestContext_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 6, *(id *)(*(void *)(a1 + 32) + 48));
  uint64_t v4 = a2;
  objc_storeStrong(v4 + 7, *(id *)(*(void *)(a1 + 32) + 56));
  objc_storeStrong(v4 + 8, *(id *)(*(void *)(a1 + 32) + 64));
  objc_storeStrong(v4 + 9, *(id *)(*(void *)(a1 + 32) + 72));
  *((unsigned char *)v4 + 88) = *(unsigned char *)(*(void *)(a1 + 32) + 88);
  v4[10] = *(id *)(*(void *)(a1 + 32) + 80);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__ICStoreRequestContext_initWithIdentity_identityStore_clientInfo_authenticationProvider___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setClientInfo:v3];
  [v4 setIdentity:a1[5]];
  [v4 setIdentityStore:a1[6]];
  [v4 setAuthenticationProvider:a1[7]];
}

- (void)setIdentityStore:(id)a3
{
  id v5 = (ICUserIdentityStore *)a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICStoreRequestContext.m" lineNumber:238 description:@"Mutation not allowed beyond initialization."];
  }
  identityStore = self->_identityStore;
  self->_identityStore = v5;
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICStoreRequestContext.m" lineNumber:253 description:@"Mutation not allowed beyond initialization."];
  }
  self->_personalizationStyle = a3;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__ICStoreRequestContext_copyWithBlock___block_invoke;
  v9[3] = &unk_1E5AC6D98;
  void v9[4] = self;
  id v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)ICStoreRequestContext;
  id v5 = v4;
  id v6 = [(ICRequestContext *)&v8 copyWithBlock:v9];

  return v6;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3
{
  id v4 = a3;
  id v5 = +[ICClientInfo defaultInfo];
  id v6 = [(ICStoreRequestContext *)self initWithIdentity:v4 clientInfo:v5];

  return v6;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3 clientInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = +[ICUserIdentityStore defaultIdentityStore];
  uint64_t v9 = [(ICStoreRequestContext *)self initWithIdentity:v7 identityStore:v8 clientInfo:v6];

  return v9;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = +[ICUserIdentityStore defaultIdentityStore];
  id v10 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:2];
  id v11 = [(ICStoreRequestContext *)self initWithIdentity:v8 identityStore:v9 clientInfo:v7 authenticationProvider:v10];

  return v11;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5 authenticationProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 || !v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"ICStoreRequestContext.m", 48, @"Invalid parameter not satisfying: %@", @"identityStore != nil && identity != nil" object file lineNumber description];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__ICStoreRequestContext_initWithIdentity_identityStore_clientInfo_authenticationProvider___block_invoke;
  v22[3] = &unk_1E5AC6D48;
  id v23 = v13;
  id v24 = v11;
  id v25 = v12;
  id v26 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  v19 = [(ICStoreRequestContext *)self initWithBlock:v22];

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICStoreRequestContext;
  id v4 = a3;
  [(ICRequestContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "ic_encodeUserIdentity:withStore:forKey:", self->_delegatedIdentity, self->_identityStore, @"delegatedIdentity", v5.receiver, v5.super_class);
  objc_msgSend(v4, "ic_encodeUserIdentity:withStore:forKey:", self->_identity, self->_identityStore, @"identity");
  [v4 encodeObject:self->_identityStore forKey:@"identityStore"];
  [v4 encodeObject:self->_storeDialogResponseHandler forKey:@"storeDialogResponseHandler"];
  [v4 encodeBool:self->_allowsExpiredBags forKey:@"allowsExpiredBags"];
  [v4 encodeInteger:self->_personalizationStyle forKey:@"personalizationStyle"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICStoreRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICStoreRequestContext;
  objc_super v5 = [(ICRequestContext *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delegatedIdentity"];
    delegatedIdentity = v5->_delegatedIdentity;
    v5->_delegatedIdentity = (ICUserIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (ICUserIdentity *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityStore"];
    identityStore = v5->_identityStore;
    v5->_identityStore = (ICUserIdentityStore *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeDialogResponseHandler"];
    storeDialogResponseHandler = v5->_storeDialogResponseHandler;
    v5->_storeDialogResponseHandler = (ICStoreDialogResponseHandler *)v12;

    v5->_allowsExpiredBags = [v4 decodeBoolForKey:@"allowsExpiredBags"];
    v5->_personalizationStyle = [v4 decodeIntegerForKey:@"personalizationStyle"];
  }

  return v5;
}

- (ICUserIdentity)delegatedIdentity
{
  return self->_delegatedIdentity;
}

- (void)setStoreDialogResponseHandler:(id)a3
{
  objc_super v5 = (ICStoreDialogResponseHandler *)a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICStoreRequestContext.m" lineNumber:243 description:@"Mutation not allowed beyond initialization."];
  }
  storeDialogResponseHandler = self->_storeDialogResponseHandler;
  self->_storeDialogResponseHandler = v5;
}

- (id)userAgent
{
  uint64_t v3 = [(ICRequestContext *)self deviceInfo];
  id v4 = [(ICRequestContext *)self _userAgentWithPlatformVersion];
  objc_super v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = +[ICDeviceInfo currentDeviceInfo];
  char v7 = [v6 isMac];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v3 deviceModel];
    if ([v8 length]) {
      [v5 appendFormat:@" model/%@", v8];
    }
  }
  uint64_t v9 = [v3 hardwarePlatform];
  if ([v9 length]) {
    [v5 appendFormat:@" hwp/%@", v9];
  }
  uint64_t v10 = [v3 buildVersion];
  if ([v10 length]) {
    [v5 appendFormat:@" build/%@", v10];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = +[ICDeviceInfo currentDeviceInfo];
  char v13 = [v12 isMac];

  if ((v13 & 1) == 0)
  {
    unsigned int v14 = [v3 deviceClass] - 1;
    if (v14 <= 5 && ((0x2Fu >> v14) & 1) != 0) {
      [v11 addObject:off_1E5AC6DB8[v14]];
    }
  }
  uint64_t v15 = [v3 fairPlayDeviceType];
  if (v15)
  {
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"dt:%d", v15);
    [v11 addObject:v16];
  }
  if ([v11 count])
  {
    id v17 = [v11 componentsJoinedByString:@"; "];
    [v5 appendFormat:@" (%@)", v17];
  }

  return v5;
}

- (BOOL)allowsExpiredBags
{
  return self->_allowsExpiredBags;
}

- (ICStoreDialogResponseHandler)storeDialogResponseHandler
{
  return self->_storeDialogResponseHandler;
}

- (void)setDelegatedIdentity:(id)a3
{
  id v8 = a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICStoreRequestContext.m" lineNumber:228 description:@"Mutation not allowed beyond initialization."];
  }
  objc_super v5 = (ICUserIdentity *)[v8 copy];
  delegatedIdentity = self->_delegatedIdentity;
  self->_delegatedIdentity = v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICStoreRequestContext *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(ICStoreRequestContext *)v4 isMemberOfClass:objc_opt_class()])
    {
      objc_super v5 = v4;
      v29.receiver = self;
      v29.super_class = (Class)ICStoreRequestContext;
      if (![(ICRequestContext *)&v29 isEqual:v5]) {
        goto LABEL_22;
      }
      identityStore = self->_identityStore;
      char v7 = v5->_identityStore;
      if (identityStore == v7)
      {
      }
      else
      {
        id v8 = v7;
        uint64_t v9 = identityStore;
        BOOL v10 = [(ICUserIdentityStore *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_22;
        }
      }
      delegatedIdentity = v5->_delegatedIdentity;
      char v13 = self->_identityStore;
      unsigned int v14 = self->_delegatedIdentity;
      uint64_t v15 = delegatedIdentity;
      id v16 = v13;
      id v17 = v16;
      if (v14 == v15)
      {
      }
      else
      {
        if (!v14 || !v15) {
          goto LABEL_21;
        }
        BOOL v18 = [(ICUserIdentity *)v14 isEqualToIdentity:v15 inStore:v16];

        if (!v18) {
          goto LABEL_22;
        }
      }
      identity = v5->_identity;
      v20 = self->_identityStore;
      unsigned int v14 = self->_identity;
      uint64_t v15 = identity;
      v21 = v20;
      id v17 = v21;
      if (v14 == v15)
      {

LABEL_26:
        storeDialogResponseHandler = self->_storeDialogResponseHandler;
        id v25 = v5->_storeDialogResponseHandler;
        if (storeDialogResponseHandler == v25)
        {
        }
        else
        {
          id v26 = v25;
          v27 = storeDialogResponseHandler;
          BOOL v28 = [(ICStoreDialogResponseHandler *)v27 isEqual:v26];

          if (!v28) {
            goto LABEL_22;
          }
        }
        if (!self->_allowsExpiredBags != v5->_allowsExpiredBags)
        {
          BOOL v11 = self->_personalizationStyle == v5->_personalizationStyle;
          goto LABEL_23;
        }
LABEL_22:
        BOOL v11 = 0;
LABEL_23:

        goto LABEL_24;
      }
      if (v14 && v15)
      {
        BOOL v22 = [(ICUserIdentity *)v14 isEqualToIdentity:v15 inStore:v21];

        if (!v22) {
          goto LABEL_22;
        }
        goto LABEL_26;
      }
LABEL_21:

      goto LABEL_22;
    }
    BOOL v11 = 0;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v341 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  memset(&v337.hash[3], 0, 168);
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v336 = 1000;
  uint64_t v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v17 = v14 + v13;
  v337.hash[0] = __ROR8__(v17, 32);
  v337.hash[1] = v16 ^ __ROR8__(v15, 43);
  v337.count[0] = v16 ^ v11;
  v337.count[1] = v17 ^ __ROR8__(v13, 47);
  v337.hash[2] = 0x800000000000000;

  v335.receiver = self;
  v335.super_class = (Class)ICStoreRequestContext;
  unint64_t v18 = [(ICRequestContext *)&v335 hash];
  *(void *)&data[0] = v18;
  if (v336 <= 3000)
  {
    unint64_t v19 = v18;
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        objc_super v29 = (char *)BYTE3(v337.count[1]);
        unint64_t v30 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            unint64_t v31 = v18 >> 8;
            unint64_t v32 = v18 >> 16;
            unsigned __int8 v33 = v18;
            unint64_t v19 = v18 >> 24;
            break;
          case 1:
            unint64_t v32 = v18 >> 8;
            unsigned __int8 v33 = v337.count[1];
            LOBYTE(v31) = v18;
            unint64_t v19 = v18 >> 16;
            break;
          case 2:
            LOBYTE(v32) = v18;
            unint64_t v19 = v18 >> 8;
            unsigned __int8 v33 = v337.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            unsigned __int8 v33 = v337.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v32) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_30:
            LOBYTE(v31) = 0;
            unsigned __int8 v33 = 0;
            LOBYTE(v32) = 0;
            LODWORD(v19) = 0;
            break;
        }
        int v41 = (v32 << 16) | (v19 << 24) | v33 | (v31 << 8);
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        int v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v43;
        v44 = (char *)((char *)data - v29 + 4);
        objc_super v29 = (char *)(v30 + (char *)data - v29);
        if (v30 >= 5)
        {
          do
          {
            int v45 = *(_DWORD *)v44;
            v44 += 4;
            HIDWORD(v46) = (461845907 * ((380141568 * v45) | ((-862048943 * v45) >> 17))) ^ v43;
            LODWORD(v46) = HIDWORD(v46);
            unint64_t v30 = 5 * (v46 >> 19);
            int v43 = v30 - 430675100;
          }
          while (v44 < v29);
          LODWORD(v337.count[0]) = v30 - 430675100;
        }
        switch((int)v29)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v29;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v29;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v29;
            BYTE2(v337.count[1]) = v29[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        unint64_t v20 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            v318 = [MEMORY[0x1E4F28B00] currentHandler];
            v319 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v318, "handleFailureInFunction:file:lineNumber:description:", v319, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

            unint64_t v20 = v337.hash[2];
          }
          uint64_t v34 = v20 & 0xFFFFFFFFFFFFFFLL | (v19 << 32);
          CC_LONG64 v35 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v36 = v337.hash[0] + (v34 ^ v337.hash[1]);
          uint64_t v37 = __ROR8__(v34 ^ v337.hash[1], 48);
          CC_LONG64 v38 = (v36 ^ v37) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          CC_LONG64 v40 = v36 + v35;
          v337.hash[0] = __ROR8__(v40, 32);
          v337.hash[1] = v39;
          v337.count[0] = v38 ^ v34;
          v337.count[1] = v40 ^ __ROR8__(v35, 47);
          unint64_t v20 = v20 & 0xFF00000000000000 | HIDWORD(v19);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v303 = [MEMORY[0x1E4F28B00] currentHandler];
            v304 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v303 handleFailureInFunction:v304, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

            unint64_t v20 = v337.hash[2];
          }
          CC_LONG64 v21 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v22 = v337.hash[0] + (v337.hash[1] ^ v19);
          uint64_t v23 = __ROR8__(v337.hash[1] ^ v19, 48);
          CC_LONG64 v24 = (v22 ^ v23) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v25 = v24 ^ __ROR8__(v22 ^ v23, 43);
          CC_LONG64 v26 = v22 + v21;
          v337.hash[0] = __ROR8__(v26, 32);
          v337.hash[1] = v25;
          v337.count[0] = v24 ^ v19;
          v337.count[1] = v26 ^ __ROR8__(v21, 47);
        }
        v337.hash[2] = v20 + 0x800000000000000;
      }
    }
    else
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v27 handleFailureInFunction:v28 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  v47 = self->_identityStore;
  unint64_t v48 = [(ICUserIdentityStore *)v47 hash];
  *(void *)&data[0] = v48;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v58 = (char *)BYTE3(v337.count[1]);
        unint64_t v59 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            unint64_t v60 = v48 >> 8;
            unint64_t v61 = v48 >> 16;
            unsigned __int8 v62 = v48;
            unint64_t v63 = v48 >> 24;
            goto LABEL_75;
          case 1:
            unint64_t v61 = v48 >> 8;
            unsigned __int8 v62 = v337.count[1];
            LOBYTE(v60) = v48;
            unint64_t v63 = v48 >> 16;
            goto LABEL_75;
          case 2:
            LOBYTE(v61) = v48;
            unint64_t v63 = v48 >> 8;
            unsigned __int8 v62 = v337.count[1];
            LODWORD(v60) = HIBYTE(LOWORD(v337.count[1]));
LABEL_75:
            LODWORD(v48) = v63;
            break;
          case 3:
            unsigned __int8 v62 = v337.count[1];
            LODWORD(v60) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v61) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_72:
            LOBYTE(v60) = 0;
            unsigned __int8 v62 = 0;
            LOBYTE(v61) = 0;
            LODWORD(v48) = 0;
            break;
        }
        int v71 = (v61 << 16) | (v48 << 24) | v62 | (v60 << 8);
        HIDWORD(v72) = (461845907 * ((380141568 * v71) | ((-862048943 * v71) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v72) = HIDWORD(v72);
        int v73 = 5 * (v72 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v73;
        v74 = (char *)((char *)data - v58 + 4);
        v58 = (char *)(v59 + (char *)data - v58);
        if (v59 >= 5)
        {
          do
          {
            int v75 = *(_DWORD *)v74;
            v74 += 4;
            HIDWORD(v76) = (461845907 * ((380141568 * v75) | ((-862048943 * v75) >> 17))) ^ v73;
            LODWORD(v76) = HIDWORD(v76);
            unint64_t v59 = 5 * (v76 >> 19);
            int v73 = v59 - 430675100;
          }
          while (v74 < v58);
          LODWORD(v337.count[0]) = v59 - 430675100;
        }
        switch((int)v58)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v58;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v58;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v58;
            BYTE2(v337.count[1]) = v58[2];
            break;
          default:
            goto LABEL_72;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        unint64_t v49 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            unint64_t v334 = v48;
            v320 = [MEMORY[0x1E4F28B00] currentHandler];
            v321 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v320, "handleFailureInFunction:file:lineNumber:description:", v321, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

            unint64_t v48 = v334;
            unint64_t v49 = v337.hash[2];
          }
          uint64_t v64 = v49 & 0xFFFFFFFFFFFFFFLL | (v48 << 32);
          CC_LONG64 v65 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v66 = v337.hash[0] + (v64 ^ v337.hash[1]);
          uint64_t v67 = __ROR8__(v64 ^ v337.hash[1], 48);
          CC_LONG64 v68 = (v66 ^ v67) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
          CC_LONG64 v70 = v66 + v65;
          v337.hash[0] = __ROR8__(v70, 32);
          v337.hash[1] = v69;
          v337.count[0] = v68 ^ v64;
          v337.count[1] = v70 ^ __ROR8__(v65, 47);
          unint64_t v49 = v49 & 0xFF00000000000000 | HIDWORD(v48);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unint64_t v333 = v48;
            v305 = [MEMORY[0x1E4F28B00] currentHandler];
            v306 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v305 handleFailureInFunction:v306, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

            unint64_t v48 = v333;
            unint64_t v49 = v337.hash[2];
          }
          CC_LONG64 v50 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v51 = v337.hash[0] + (v337.hash[1] ^ v48);
          uint64_t v52 = __ROR8__(v337.hash[1] ^ v48, 48);
          CC_LONG64 v53 = (v51 ^ v52) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
          CC_LONG64 v55 = v51 + v50;
          v337.hash[0] = __ROR8__(v55, 32);
          v337.hash[1] = v54;
          v337.count[0] = v53 ^ v48;
          v337.count[1] = v55 ^ __ROR8__(v50, 47);
        }
        v337.hash[2] = v49 + 0x800000000000000;
      }
    }
    else
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      v57 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v56 handleFailureInFunction:v57 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }

  unint64_t v77 = [(ICUserIdentity *)self->_delegatedIdentity hashInStore:self->_identityStore];
  *(void *)&data[0] = v77;
  if (v336 <= 3000)
  {
    unint64_t v78 = v77;
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v88 = (char *)BYTE3(v337.count[1]);
        unint64_t v89 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            unint64_t v90 = v77 >> 8;
            unint64_t v91 = v77 >> 16;
            unsigned __int8 v92 = v77;
            unint64_t v78 = v77 >> 24;
            break;
          case 1:
            unint64_t v91 = v77 >> 8;
            unsigned __int8 v92 = v337.count[1];
            LOBYTE(v90) = v77;
            unint64_t v78 = v77 >> 16;
            break;
          case 2:
            LOBYTE(v91) = v77;
            unint64_t v78 = v77 >> 8;
            unsigned __int8 v92 = v337.count[1];
            LODWORD(v90) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            unsigned __int8 v92 = v337.count[1];
            LODWORD(v90) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v91) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_114:
            LOBYTE(v90) = 0;
            unsigned __int8 v92 = 0;
            LOBYTE(v91) = 0;
            LODWORD(v78) = 0;
            break;
        }
        int v100 = (v91 << 16) | (v78 << 24) | v92 | (v90 << 8);
        HIDWORD(v101) = (461845907 * ((380141568 * v100) | ((-862048943 * v100) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v101) = HIDWORD(v101);
        int v102 = 5 * (v101 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v102;
        v103 = (char *)((char *)data - v88 + 4);
        v88 = (char *)(v89 + (char *)data - v88);
        if (v89 >= 5)
        {
          do
          {
            int v104 = *(_DWORD *)v103;
            v103 += 4;
            HIDWORD(v105) = (461845907 * ((380141568 * v104) | ((-862048943 * v104) >> 17))) ^ v102;
            LODWORD(v105) = HIDWORD(v105);
            unint64_t v89 = 5 * (v105 >> 19);
            int v102 = v89 - 430675100;
          }
          while (v103 < v88);
          LODWORD(v337.count[0]) = v89 - 430675100;
        }
        switch((int)v88)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v88;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v88;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v88;
            BYTE2(v337.count[1]) = v88[2];
            break;
          default:
            goto LABEL_114;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        unint64_t v79 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            v322 = [MEMORY[0x1E4F28B00] currentHandler];
            v323 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v322, "handleFailureInFunction:file:lineNumber:description:", v323, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

            unint64_t v79 = v337.hash[2];
          }
          uint64_t v93 = v79 & 0xFFFFFFFFFFFFFFLL | (v78 << 32);
          CC_LONG64 v94 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v95 = v337.hash[0] + (v93 ^ v337.hash[1]);
          uint64_t v96 = __ROR8__(v93 ^ v337.hash[1], 48);
          CC_LONG64 v97 = (v95 ^ v96) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v98 = v97 ^ __ROR8__(v95 ^ v96, 43);
          CC_LONG64 v99 = v95 + v94;
          v337.hash[0] = __ROR8__(v99, 32);
          v337.hash[1] = v98;
          v337.count[0] = v97 ^ v93;
          v337.count[1] = v99 ^ __ROR8__(v94, 47);
          unint64_t v79 = v79 & 0xFF00000000000000 | HIDWORD(v78);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v307 = [MEMORY[0x1E4F28B00] currentHandler];
            v308 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v307 handleFailureInFunction:v308, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

            unint64_t v79 = v337.hash[2];
          }
          CC_LONG64 v80 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v81 = v337.hash[0] + (v337.hash[1] ^ v78);
          uint64_t v82 = __ROR8__(v337.hash[1] ^ v78, 48);
          CC_LONG64 v83 = (v81 ^ v82) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v84 = v83 ^ __ROR8__(v81 ^ v82, 43);
          CC_LONG64 v85 = v81 + v80;
          v337.hash[0] = __ROR8__(v85, 32);
          v337.hash[1] = v84;
          v337.count[0] = v83 ^ v78;
          v337.count[1] = v85 ^ __ROR8__(v80, 47);
        }
        v337.hash[2] = v79 + 0x800000000000000;
      }
    }
    else
    {
      v86 = [MEMORY[0x1E4F28B00] currentHandler];
      v87 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v86 handleFailureInFunction:v87 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  unint64_t v106 = [(ICUserIdentity *)self->_identity hashInStore:self->_identityStore];
  *(void *)&data[0] = v106;
  if (v336 <= 3000)
  {
    unint64_t v107 = v106;
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v117 = (char *)BYTE3(v337.count[1]);
        unint64_t v118 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            unint64_t v119 = v106 >> 8;
            unint64_t v120 = v106 >> 16;
            unsigned __int8 v121 = v106;
            unint64_t v107 = v106 >> 24;
            break;
          case 1:
            unint64_t v120 = v106 >> 8;
            unsigned __int8 v121 = v337.count[1];
            LOBYTE(v119) = v106;
            unint64_t v107 = v106 >> 16;
            break;
          case 2:
            LOBYTE(v120) = v106;
            unint64_t v107 = v106 >> 8;
            unsigned __int8 v121 = v337.count[1];
            LODWORD(v119) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            unsigned __int8 v121 = v337.count[1];
            LODWORD(v119) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v120) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_156:
            LOBYTE(v119) = 0;
            unsigned __int8 v121 = 0;
            LOBYTE(v120) = 0;
            LODWORD(v107) = 0;
            break;
        }
        int v129 = (v120 << 16) | (v107 << 24) | v121 | (v119 << 8);
        HIDWORD(v130) = (461845907 * ((380141568 * v129) | ((-862048943 * v129) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v130) = HIDWORD(v130);
        int v131 = 5 * (v130 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v131;
        v132 = (char *)((char *)data - v117 + 4);
        v117 = (char *)(v118 + (char *)data - v117);
        if (v118 >= 5)
        {
          do
          {
            int v133 = *(_DWORD *)v132;
            v132 += 4;
            HIDWORD(v134) = (461845907 * ((380141568 * v133) | ((-862048943 * v133) >> 17))) ^ v131;
            LODWORD(v134) = HIDWORD(v134);
            unint64_t v118 = 5 * (v134 >> 19);
            int v131 = v118 - 430675100;
          }
          while (v132 < v117);
          LODWORD(v337.count[0]) = v118 - 430675100;
        }
        switch((int)v117)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v117;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v117;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v117;
            BYTE2(v337.count[1]) = v117[2];
            break;
          default:
            goto LABEL_156;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        unint64_t v108 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            v324 = [MEMORY[0x1E4F28B00] currentHandler];
            v325 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v324, "handleFailureInFunction:file:lineNumber:description:", v325, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

            unint64_t v108 = v337.hash[2];
          }
          uint64_t v122 = v108 & 0xFFFFFFFFFFFFFFLL | (v107 << 32);
          CC_LONG64 v123 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v124 = v337.hash[0] + (v122 ^ v337.hash[1]);
          uint64_t v125 = __ROR8__(v122 ^ v337.hash[1], 48);
          CC_LONG64 v126 = (v124 ^ v125) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v127 = v126 ^ __ROR8__(v124 ^ v125, 43);
          CC_LONG64 v128 = v124 + v123;
          v337.hash[0] = __ROR8__(v128, 32);
          v337.hash[1] = v127;
          v337.count[0] = v126 ^ v122;
          v337.count[1] = v128 ^ __ROR8__(v123, 47);
          unint64_t v108 = v108 & 0xFF00000000000000 | HIDWORD(v107);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v309 = [MEMORY[0x1E4F28B00] currentHandler];
            v310 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v309 handleFailureInFunction:v310, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

            unint64_t v108 = v337.hash[2];
          }
          CC_LONG64 v109 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v110 = v337.hash[0] + (v337.hash[1] ^ v107);
          uint64_t v111 = __ROR8__(v337.hash[1] ^ v107, 48);
          CC_LONG64 v112 = (v110 ^ v111) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v113 = v112 ^ __ROR8__(v110 ^ v111, 43);
          CC_LONG64 v114 = v110 + v109;
          v337.hash[0] = __ROR8__(v114, 32);
          v337.hash[1] = v113;
          v337.count[0] = v112 ^ v107;
          v337.count[1] = v114 ^ __ROR8__(v109, 47);
        }
        v337.hash[2] = v108 + 0x800000000000000;
      }
    }
    else
    {
      v115 = [MEMORY[0x1E4F28B00] currentHandler];
      v116 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v115 handleFailureInFunction:v116 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  v135 = self->_storeDialogResponseHandler;
  unint64_t v136 = [(ICStoreDialogResponseHandler *)v135 hash];
  *(void *)&data[0] = v136;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v146 = (char *)BYTE3(v337.count[1]);
        unint64_t v147 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            unint64_t v148 = v136 >> 8;
            unint64_t v149 = v136 >> 16;
            unsigned __int8 v150 = v136;
            unint64_t v151 = v136 >> 24;
            goto LABEL_201;
          case 1:
            unint64_t v149 = v136 >> 8;
            unsigned __int8 v150 = v337.count[1];
            LOBYTE(v148) = v136;
            unint64_t v151 = v136 >> 16;
            goto LABEL_201;
          case 2:
            LOBYTE(v149) = v136;
            unint64_t v151 = v136 >> 8;
            unsigned __int8 v150 = v337.count[1];
            LODWORD(v148) = HIBYTE(LOWORD(v337.count[1]));
LABEL_201:
            LODWORD(v136) = v151;
            break;
          case 3:
            unsigned __int8 v150 = v337.count[1];
            LODWORD(v148) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v149) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_198:
            LOBYTE(v148) = 0;
            unsigned __int8 v150 = 0;
            LOBYTE(v149) = 0;
            LODWORD(v136) = 0;
            break;
        }
        int v159 = (v149 << 16) | (v136 << 24) | v150 | (v148 << 8);
        HIDWORD(v160) = (461845907 * ((380141568 * v159) | ((-862048943 * v159) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v160) = HIDWORD(v160);
        int v161 = 5 * (v160 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v161;
        v162 = (char *)((char *)data - v146 + 4);
        v146 = (char *)(v147 + (char *)data - v146);
        if (v147 >= 5)
        {
          do
          {
            int v163 = *(_DWORD *)v162;
            v162 += 4;
            HIDWORD(v164) = (461845907 * ((380141568 * v163) | ((-862048943 * v163) >> 17))) ^ v161;
            LODWORD(v164) = HIDWORD(v164);
            unint64_t v147 = 5 * (v164 >> 19);
            int v161 = v147 - 430675100;
          }
          while (v162 < v146);
          LODWORD(v337.count[0]) = v147 - 430675100;
        }
        switch((int)v146)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v146;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v146;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v146;
            BYTE2(v337.count[1]) = v146[2];
            break;
          default:
            goto LABEL_198;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        unint64_t v137 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            unint64_t v326 = v136;
            v327 = [MEMORY[0x1E4F28B00] currentHandler];
            v328 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            objc_msgSend(v327, "handleFailureInFunction:file:lineNumber:description:", v328, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

            unint64_t v136 = v326;
            unint64_t v137 = v337.hash[2];
          }
          uint64_t v152 = v137 & 0xFFFFFFFFFFFFFFLL | (v136 << 32);
          CC_LONG64 v153 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v154 = v337.hash[0] + (v152 ^ v337.hash[1]);
          uint64_t v155 = __ROR8__(v152 ^ v337.hash[1], 48);
          CC_LONG64 v156 = (v154 ^ v155) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v157 = v156 ^ __ROR8__(v154 ^ v155, 43);
          CC_LONG64 v158 = v154 + v153;
          v337.hash[0] = __ROR8__(v158, 32);
          v337.hash[1] = v157;
          v337.count[0] = v156 ^ v152;
          v337.count[1] = v158 ^ __ROR8__(v153, 47);
          unint64_t v137 = v137 & 0xFF00000000000000 | HIDWORD(v136);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            unint64_t v311 = v136;
            v312 = [MEMORY[0x1E4F28B00] currentHandler];
            v313 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            [v312 handleFailureInFunction:v313, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

            unint64_t v136 = v311;
            unint64_t v137 = v337.hash[2];
          }
          CC_LONG64 v138 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v139 = v337.hash[0] + (v337.hash[1] ^ v136);
          uint64_t v140 = __ROR8__(v337.hash[1] ^ v136, 48);
          CC_LONG64 v141 = (v139 ^ v140) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v142 = v141 ^ __ROR8__(v139 ^ v140, 43);
          CC_LONG64 v143 = v139 + v138;
          v337.hash[0] = __ROR8__(v143, 32);
          v337.hash[1] = v142;
          v337.count[0] = v141 ^ v136;
          v337.count[1] = v143 ^ __ROR8__(v138, 47);
        }
        v337.hash[2] = v137 + 0x800000000000000;
      }
    }
    else
    {
      v144 = [MEMORY[0x1E4F28B00] currentHandler];
      v145 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v144 handleFailureInFunction:v145 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }

  uint64_t allowsExpiredBags = self->_allowsExpiredBags;
  LODWORD(data[0]) = self->_allowsExpiredBags;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v170 = (char *)BYTE3(v337.count[1]);
        unint64_t v171 = (BYTE3(v337.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            int v172 = 0;
            int v173 = 0;
            unsigned __int8 v174 = allowsExpiredBags;
            goto LABEL_243;
          case 1:
            int v173 = 0;
            unsigned __int8 v174 = v337.count[1];
            int v172 = allowsExpiredBags;
            goto LABEL_243;
          case 2:
            unsigned __int8 v174 = v337.count[1];
            int v172 = HIBYTE(LOWORD(v337.count[1]));
            int v173 = allowsExpiredBags;
            goto LABEL_243;
          case 3:
            unsigned __int8 v174 = v337.count[1];
            int v172 = HIBYTE(LOWORD(v337.count[1]));
            int v173 = BYTE2(v337.count[1]);
            goto LABEL_245;
          default:
            while (2)
            {
              int v172 = 0;
              unsigned __int8 v174 = 0;
              int v173 = 0;
LABEL_243:
              LODWORD(allowsExpiredBags) = 0;
LABEL_245:
              int v182 = (v173 << 16) | (allowsExpiredBags << 24) | v174 | (v172 << 8);
              HIDWORD(v183) = (461845907 * ((380141568 * v182) | ((-862048943 * v182) >> 17))) ^ LODWORD(v337.count[0]);
              LODWORD(v183) = HIDWORD(v183);
              int v184 = 5 * (v183 >> 19) - 430675100;
              LODWORD(v337.count[0]) = v184;
              v185 = (char *)((char *)data - v170 + 4);
              v170 = (char *)(v171 + (char *)data - v170);
              if (v171 >= 5)
              {
                do
                {
                  int v186 = *(_DWORD *)v185;
                  v185 += 4;
                  HIDWORD(v187) = (461845907 * ((380141568 * v186) | ((-862048943 * v186) >> 17))) ^ v184;
                  LODWORD(v187) = HIDWORD(v187);
                  unint64_t v171 = 5 * (v187 >> 19);
                  int v184 = v171 - 430675100;
                }
                while (v185 < v170);
                LODWORD(v337.count[0]) = v171 - 430675100;
              }
              switch((int)v170)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v337.count[1]) = *v170;
                  break;
                case 2:
                  LOWORD(v337.count[1]) = *(_WORD *)v170;
                  break;
                case 3:
                  LOWORD(v337.count[1]) = *(_WORD *)v170;
                  BYTE2(v337.count[1]) = v170[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v337.count[1]) &= 3u;
            HIDWORD(v337.count[0]) += 4;
            break;
        }
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 4uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        CC_LONG64 v166 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            v329 = [MEMORY[0x1E4F28B00] currentHandler];
            v330 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            objc_msgSend(v329, "handleFailureInFunction:file:lineNumber:description:", v330, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

            CC_LONG64 v166 = v337.hash[2];
          }
          uint64_t v175 = v166 & 0xFFFFFFFFFFFFFFLL | (allowsExpiredBags << 32);
          CC_LONG64 v176 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          CC_LONG64 v177 = v337.hash[0] + (v175 ^ v337.hash[1]);
          uint64_t v178 = __ROR8__(v175 ^ v337.hash[1], 48);
          CC_LONG64 v179 = (v177 ^ v178) + __ROR8__(v337.count[0] + v337.count[1], 32);
          CC_LONG64 v180 = v179 ^ __ROR8__(v177 ^ v178, 43);
          CC_LONG64 v181 = v177 + v176;
          v337.hash[0] = __ROR8__(v181, 32);
          v337.hash[1] = v180;
          v337.count[0] = v179 ^ v175;
          v337.count[1] = v181 ^ __ROR8__(v176, 47);
          unint64_t v167 = v166 & 0xFF00000000000000;
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v314 = [MEMORY[0x1E4F28B00] currentHandler];
            v315 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            [v314 handleFailureInFunction:v315, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

            CC_LONG64 v166 = v337.hash[2];
          }
          unint64_t v167 = v166 | allowsExpiredBags;
        }
        v337.hash[2] = v167 + 0x400000000000000;
      }
    }
    else
    {
      v168 = [MEMORY[0x1E4F28B00] currentHandler];
      v169 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      [v168 handleFailureInFunction:v169 file:@"MSVHasher+Algorithms.h" lineNumber:192 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 4uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  unint64_t personalizationStyle = self->_personalizationStyle;
  *(void *)&data[0] = personalizationStyle;
  uint64_t v189 = v336;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v199 = (char *)BYTE3(v337.count[1]);
        unint64_t v200 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            unint64_t v201 = personalizationStyle >> 8;
            unint64_t v202 = personalizationStyle >> 16;
            unsigned __int8 v203 = personalizationStyle;
            personalizationStyle >>= 24;
            break;
          case 1:
            unint64_t v202 = personalizationStyle >> 8;
            unsigned __int8 v203 = v337.count[1];
            LOBYTE(v201) = personalizationStyle;
            personalizationStyle >>= 16;
            break;
          case 2:
            LOBYTE(v202) = personalizationStyle;
            personalizationStyle >>= 8;
            unsigned __int8 v203 = v337.count[1];
            LODWORD(v201) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            unsigned __int8 v203 = v337.count[1];
            LODWORD(v201) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v202) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_282:
            LOBYTE(v201) = 0;
            unsigned __int8 v203 = 0;
            LOBYTE(v202) = 0;
            LODWORD(personalizationStyle) = 0;
            break;
        }
        int v211 = (v202 << 16) | (personalizationStyle << 24) | v203 | (v201 << 8);
        HIDWORD(v212) = (461845907 * ((380141568 * v211) | ((-862048943 * v211) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v212) = HIDWORD(v212);
        int v213 = 5 * (v212 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v213;
        v214 = (char *)((char *)data - v199 + 4);
        v199 = (char *)(v200 + (char *)data - v199);
        if (v200 >= 5)
        {
          do
          {
            int v215 = *(_DWORD *)v214;
            v214 += 4;
            HIDWORD(v216) = (461845907 * ((380141568 * v215) | ((-862048943 * v215) >> 17))) ^ v213;
            LODWORD(v216) = HIDWORD(v216);
            unint64_t v200 = 5 * (v216 >> 19);
            int v213 = v200 - 430675100;
          }
          while (v214 < v199);
          LODWORD(v337.count[0]) = v200 - 430675100;
        }
        switch((int)v199)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v199;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v199;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v199;
            BYTE2(v337.count[1]) = v199[2];
            break;
          default:
            goto LABEL_282;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else
      {
        if (v336 != 3000) {
          goto LABEL_296;
        }
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 != 1000) {
        goto LABEL_296;
      }
      unint64_t v190 = v337.hash[2];
      if ((v337.hash[2] & 0x400000000000000) != 0)
      {
        if ((v337.hash[2] & 0x300000000000000) != 0)
        {
          v331 = [MEMORY[0x1E4F28B00] currentHandler];
          v332 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          objc_msgSend(v331, "handleFailureInFunction:file:lineNumber:description:", v332, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v337.hash[2]);

          unint64_t v190 = v337.hash[2];
        }
        uint64_t v204 = v190 & 0xFFFFFFFFFFFFFFLL | (personalizationStyle << 32);
        CC_LONG64 v205 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
        CC_LONG64 v206 = v337.hash[0] + (v204 ^ v337.hash[1]);
        uint64_t v207 = __ROR8__(v204 ^ v337.hash[1], 48);
        CC_LONG64 v208 = (v206 ^ v207) + __ROR8__(v337.count[0] + v337.count[1], 32);
        CC_LONG64 v209 = v208 ^ __ROR8__(v206 ^ v207, 43);
        CC_LONG64 v210 = v206 + v205;
        v337.hash[0] = __ROR8__(v210, 32);
        v337.hash[1] = v209;
        v337.count[0] = v208 ^ v204;
        v337.count[1] = v210 ^ __ROR8__(v205, 47);
        unint64_t v190 = v190 & 0xFF00000000000000 | HIDWORD(personalizationStyle);
      }
      else
      {
        if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
        {
          v316 = [MEMORY[0x1E4F28B00] currentHandler];
          v317 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          [v316 handleFailureInFunction:v317, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v337.hash[2] file lineNumber description];

          unint64_t v190 = v337.hash[2];
        }
        CC_LONG64 v191 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
        CC_LONG64 v192 = v337.hash[0] + (v337.hash[1] ^ personalizationStyle);
        uint64_t v193 = __ROR8__(v337.hash[1] ^ personalizationStyle, 48);
        CC_LONG64 v194 = (v192 ^ v193) + __ROR8__(v337.count[0] + v337.count[1], 32);
        CC_LONG64 v195 = v194 ^ __ROR8__(v192 ^ v193, 43);
        CC_LONG64 v196 = v192 + v191;
        v337.hash[0] = __ROR8__(v196, 32);
        v337.hash[1] = v195;
        v337.count[0] = v194 ^ personalizationStyle;
        v337.count[1] = v196 ^ __ROR8__(v191, 47);
      }
      v337.hash[2] = v190 + 0x800000000000000;
    }
    else
    {
      v197 = [MEMORY[0x1E4F28B00] currentHandler];
      v198 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      [v197 handleFailureInFunction:v198 file:@"MSVHasher+Algorithms.h" lineNumber:227 description:@"Cannot append to unknown hasher algorithm"];
    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else
    {
      if (v336 != 4000) {
        goto LABEL_296;
      }
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
      default:
        goto LABEL_296;
    }
  }
  uint64_t v189 = v336;
LABEL_296:
  memset(&v338[8], 0, 64);
  *(void *)v338 = v189;
  if (v189 <= 3000)
  {
    if (v189 <= 1999)
    {
      if (!v189)
      {
        v250 = [MEMORY[0x1E4F28B00] currentHandler];
        v251 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v250 handleFailureInFunction:v251 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_343;
      }
      if (v189 != 1000) {
        goto LABEL_343;
      }
      CC_LONG64 v217 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
      CC_LONG64 v218 = v337.hash[0] + (v337.hash[1] ^ v337.hash[2]);
      uint64_t v219 = __ROR8__(v337.hash[1] ^ v337.hash[2], 48);
      CC_LONG64 v220 = (v218 ^ v219) + __ROR8__(v337.count[0] + v337.count[1], 32);
      CC_LONG64 v221 = v220 ^ __ROR8__(v218 ^ v219, 43);
      CC_LONG64 v222 = v218 + v217;
      CC_LONG64 v223 = v222 ^ __ROR8__(v217, 47);
      CC_LONG64 v224 = (v220 ^ v337.hash[2]) + v223;
      CC_LONG64 v225 = v224 ^ __ROR8__(v223, 51);
      CC_LONG64 v226 = (__ROR8__(v222, 32) ^ 0xFFLL) + v221;
      uint64_t v227 = __ROR8__(v221, 48);
      uint64_t v228 = __ROR8__(v224, 32) + (v226 ^ v227);
      uint64_t v229 = v228 ^ __ROR8__(v226 ^ v227, 43);
      CC_LONG64 v230 = v225 + v226;
      CC_LONG64 v231 = v230 ^ __ROR8__(v225, 47);
      CC_LONG64 v232 = v231 + v228;
      uint64_t v233 = v232 ^ __ROR8__(v231, 51);
      uint64_t v234 = __ROR8__(v230, 32) + v229;
      uint64_t v235 = __ROR8__(v229, 48);
      uint64_t v236 = __ROR8__(v232, 32) + (v234 ^ v235);
      uint64_t v237 = v236 ^ __ROR8__(v234 ^ v235, 43);
      uint64_t v238 = v233 + v234;
      uint64_t v239 = v238 ^ __ROR8__(v233, 47);
      uint64_t v240 = v239 + v236;
      uint64_t v241 = v240 ^ __ROR8__(v239, 51);
      uint64_t v242 = __ROR8__(v238, 32) + v237;
      uint64_t v243 = __ROR8__(v237, 48);
      CC_LONG64 v244 = __ROR8__(v240, 32) + (v242 ^ v243);
      CC_LONG64 v245 = v244 ^ __ROR8__(v242 ^ v243, 43);
      uint64_t v246 = v241 + v242;
      v337.count[0] = v244;
      v337.count[1] = v246 ^ __ROR8__(v241, 47);
      v337.hash[0] = __ROR8__(v246, 32);
      v337.hash[1] = v245;
      CC_LONG64 v247 = v337.count[1] ^ v244 ^ v337.hash[0] ^ v245;
      goto LABEL_330;
    }
    if (v189 != 2000)
    {
      if (v189 != 3000) {
        goto LABEL_343;
      }
      v248 = &v337.hash[1];
      if (HIDWORD(v337.count[0])) {
        int v249 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v337.count[1], (uint32x4_t)xmmword_1A3032BE0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v337.count[1], (uint32x4_t)xmmword_1A3032BD0)));
      }
      else {
        int v249 = LODWORD(v337.hash[0]) + 374761393;
      }
      unsigned int v261 = LODWORD(v337.count[0]) + v249;
      unint64_t v262 = v337.hash[3] & 0xF;
      if (v262 >= 4)
      {
        do
        {
          int v263 = *(_DWORD *)v248;
          v248 = (CC_LONG64 *)((char *)v248 + 4);
          HIDWORD(v264) = v261 - 1028477379 * v263;
          LODWORD(v264) = HIDWORD(v264);
          unsigned int v261 = 668265263 * (v264 >> 15);
          v262 -= 4;
        }
        while (v262 > 3);
      }
      for (; v262; --v262)
      {
        int v265 = *(unsigned __int8 *)v248;
        v248 = (CC_LONG64 *)((char *)v248 + 1);
        HIDWORD(v266) = v261 + 374761393 * v265;
        LODWORD(v266) = HIDWORD(v266);
        unsigned int v261 = -1640531535 * (v266 >> 21);
      }
      unsigned int v267 = -1028477379 * ((-2048144777 * (v261 ^ (v261 >> 15))) ^ ((-2048144777 * (v261 ^ (v261 >> 15))) >> 13));
      unsigned int v268 = v267 ^ HIWORD(v267);
      goto LABEL_342;
    }
    switch(BYTE3(v337.count[1]))
    {
      case 1u:
        int v254 = LOBYTE(v337.count[1]);
        break;
      case 2u:
        int v254 = LOWORD(v337.count[1]);
        break;
      case 3u:
        int v254 = LOWORD(v337.count[1]) | (BYTE2(v337.count[1]) << 16);
        break;
      default:
        unsigned int v269 = v337.count[0];
        goto LABEL_341;
    }
    unsigned int v269 = (461845907 * ((380141568 * v254) | ((-862048943 * v254) >> 17))) ^ LODWORD(v337.count[0]);
LABEL_341:
    unsigned int v270 = -2048144789 * (v269 ^ HIDWORD(v337.count[0]) ^ ((v269 ^ HIDWORD(v337.count[0])) >> 16));
    unsigned int v268 = (-1028477387 * (v270 ^ (v270 >> 13))) ^ ((-1028477387 * (v270 ^ (v270 >> 13))) >> 16);
    LODWORD(v337.count[0]) = v268;
LABEL_342:
    *(_DWORD *)&v338[8] = v268;
    goto LABEL_343;
  }
  if (v189 > 4000)
  {
    switch(v189)
    {
      case 4001:
        CC_SHA1_Final(&v338[8], (CC_SHA1_CTX *)&v337);
        break;
      case 4256:
        CC_SHA256_Final(&v338[8], (CC_SHA256_CTX *)&v337);
        break;
      case 4512:
        CC_SHA512_Final(&v338[8], &v337);
        break;
    }
    goto LABEL_343;
  }
  if (v189 == 3001)
  {
    v252 = &v337.hash[3];
    if (v337.count[0] < 0x20) {
      CC_LONG64 v253 = v337.hash[1] + 0x27D4EB2F165667C5;
    }
    else {
      CC_LONG64 v253 = 0x85EBCA77C2B2AE63
    }
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((0x85EBCA77C2B2AE63
               - 0x61C8864E7A143579
               * ((0x85EBCA77C2B2AE63
                 - 0x61C8864E7A143579
                 * ((__ROR8__(v337.hash[0], 57)
                   + __ROR8__(v337.count[1], 63)
                   + __ROR8__(v337.hash[1], 52)
                   + __ROR8__(v337.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                  * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.count[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.hash[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.hash[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.hash[2], 33)));
    unint64_t v255 = v253 + v337.count[0];
    unint64_t v256 = v337.count[0] & 0x1F;
    if (v256 >= 8)
    {
      do
      {
        uint64_t v257 = *v252++;
        unint64_t v255 = 0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v257, 33)) ^ v255, 37);
        v256 -= 8;
      }
      while (v256 > 7);
    }
    if (v256 >= 4)
    {
      unsigned int v258 = *(_DWORD *)v252;
      v252 = (CC_LONG64 *)((char *)v252 + 4);
      unint64_t v255 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v258) ^ v255, 41);
      v256 -= 4;
    }
    for (; v256; --v256)
    {
      unsigned int v259 = *(unsigned __int8 *)v252;
      v252 = (CC_LONG64 *)((char *)v252 + 1);
      unint64_t v255 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v259) ^ v255, 53);
    }
    unint64_t v260 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v255 ^ (v255 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v255 ^ (v255 >> 33))) >> 29));
    CC_LONG64 v247 = v260 ^ HIDWORD(v260);
LABEL_330:
    *(void *)&v338[8] = v247;
    goto LABEL_343;
  }
  if (v189 == 4000) {
    CC_MD5_Final(&v338[8], (CC_MD5_CTX *)&v337);
  }
LABEL_343:
  data[0] = *(_OWORD *)v338;
  data[1] = *(_OWORD *)&v338[16];
  data[2] = *(_OWORD *)&v338[32];
  data[3] = *(_OWORD *)&v338[48];
  uint64_t v340 = *(void *)&v338[64];
  if (*(uint64_t *)v338 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(void *)&data[0] == 4256)
      {
        v293 = (unsigned __int8 *)data + 8;
        v294 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v295 = v294;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v297 = *v293++;
          v298 = &v294[i];
          char *v298 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v297 >> 4];
          v298[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v297 & 0xF];
        }
        id v277 = [NSString alloc];
        v278 = v295;
        uint64_t v279 = 64;
      }
      else
      {
        if (*(void *)&data[0] != 4512) {
          goto LABEL_371;
        }
        v281 = (unsigned __int8 *)data + 8;
        v282 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v283 = v282;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v285 = *v281++;
          v286 = &v282[j];
          char *v286 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v285 >> 4];
          v286[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v285 & 0xF];
        }
        id v277 = [NSString alloc];
        v278 = v283;
        uint64_t v279 = 128;
      }
    }
    else if (*(void *)&data[0] == 4000)
    {
      v287 = (unsigned __int8 *)data + 8;
      v288 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v289 = v288;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v291 = *v287++;
        v292 = &v288[k];
        char *v292 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v291 >> 4];
        v292[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v291 & 0xF];
      }
      id v277 = [NSString alloc];
      v278 = v289;
      uint64_t v279 = 32;
    }
    else
    {
      if (*(void *)&data[0] != 4001) {
        goto LABEL_371;
      }
      v271 = (unsigned __int8 *)data + 8;
      v272 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v273 = v272;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v275 = *v271++;
        v276 = &v272[m];
        char *v276 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v275 >> 4];
        v276[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v275 & 0xF];
      }
      id v277 = [NSString alloc];
      v278 = v273;
      uint64_t v279 = 40;
    }
    v299 = (void *)[v277 initWithBytesNoCopy:v278 length:v279 encoding:4 freeWhenDone:1];
    unint64_t v280 = [v299 hash];

    return v280;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(void *)&data[0] != 1000)
    {
      if (*(void *)&data[0] != 2000) {
        goto LABEL_371;
      }
      return DWORD2(data[0]);
    }
    return *((void *)&data[0] + 1);
  }
  if (*(void *)&data[0] == 3000) {
    return DWORD2(data[0]);
  }
  if (*(void *)&data[0] != 3001)
  {
LABEL_371:
    v301 = [MEMORY[0x1E4F28B00] currentHandler];
    v302 = [NSString stringWithUTF8String:"NSUInteger _MSVHashGetHash(MSVHash)"];
    [v301 handleFailureInFunction:v302 file:@"MSVHasher+Algorithms.h" lineNumber:301 description:@"Cannot obtain hash from unknown hasher algorithm"];

    return 0;
  }
  return *((void *)&data[0] + 1);
}

+ (id)activeStoreAccountRequestContext
{
  id v2 = objc_alloc((Class)a1);
  uint64_t v3 = +[ICUserIdentity activeAccount];
  uint64_t v4 = (void *)[v2 initWithIdentity:v3];

  return v4;
}

@end
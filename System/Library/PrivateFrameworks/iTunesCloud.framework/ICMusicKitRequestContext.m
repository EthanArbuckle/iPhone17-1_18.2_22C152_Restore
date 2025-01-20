@interface ICMusicKitRequestContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICDeveloperTokenProvider)developerTokenProvider;
- (ICMusicKitRequestContext)initWithBlock:(id)a3;
- (ICMusicKitRequestContext)initWithCoder:(id)a3;
- (id)_description;
- (id)copyWithBlock:(id)a3;
- (id)description;
- (int64_t)_storeRequestPersonalizationStyle;
- (int64_t)personalizationMethod;
- (int64_t)personalizationStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeveloperTokenProvider:(id)a3;
- (void)setPersonalizationMethod:(int64_t)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
@end

@implementation ICMusicKitRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);

  objc_storeStrong((id *)&self->_developerTokenProvider, 0);
}

- (int64_t)personalizationMethod
{
  return self->_personalizationMethod;
}

- (ICDeveloperTokenProvider)developerTokenProvider
{
  return self->_developerTokenProvider;
}

- (int64_t)_storeRequestPersonalizationStyle
{
  v3.receiver = self;
  v3.super_class = (Class)ICMusicKitRequestContext;
  return [(ICStoreRequestContext *)&v3 personalizationStyle];
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  if (![(ICRequestContext *)self _allowsMutation])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICMusicKitRequestContext.m" lineNumber:234 description:@"Mutation not allowed beyond initialization."];
  }
  if (a3 == 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = a3 == 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICMusicKitRequestContext;
  [(ICStoreRequestContext *)&v8 setPersonalizationStyle:v6];
}

- (int64_t)personalizationStyle
{
  v3.receiver = self;
  v3.super_class = (Class)ICMusicKitRequestContext;
  int64_t result = [(ICStoreRequestContext *)&v3 personalizationStyle];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)setPersonalizationMethod:(int64_t)a3
{
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICMusicKitRequestContext.m" lineNumber:212 description:@"Mutation not allowed beyond initialization."];
  }
  self->_personalizationMethod = a3;
}

- (void)setDeveloperTokenProvider:(id)a3
{
  v5 = (ICDeveloperTokenProvider *)a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicKitRequestContext.m" lineNumber:201 description:@"Mutation not allowed beyond initialization."];
  }
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (([v10 isEqual:v6] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ICMusicKitRequestContext.m" lineNumber:206 description:@"Setting up a MusicKit request context with a developer token provider that is not provided by iTunesCloud.framework is not supported."];
  }
  developerTokenProvider = self->_developerTokenProvider;
  self->_developerTokenProvider = v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicKitRequestContext;
  [(ICStoreRequestContext *)&v9 encodeWithCoder:v4];
  [v4 encodeInteger:self->_personalizationMethod forKey:@"personalizationMethod"];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  if (_ICDeveloperTokenProviderIsAllowedForClassName(v6))
  {
    [v4 encodeObject:v6 forKey:@"developerTokenProviderClassName"];
    [v4 encodeObject:self->_developerTokenProvider forKey:@"developerTokenProvider"];
  }
  else
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Attempted to encode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %{public}@.", buf, 0xCu);
    }

    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, @"Attempted to encode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %@.", v6);
    [v4 failWithError:v8];
  }
}

- (ICMusicKitRequestContext)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICMusicKitRequestContext;
  v5 = [(ICStoreRequestContext *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_personalizationMethod = [v4 decodeIntegerForKey:@"personalizationMethod"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerTokenProviderClassName"];
    if (_ICDeveloperTokenProviderIsAllowedForClassName(v6))
    {
      Class v7 = NSClassFromString(v6);
      if (v7)
      {
        uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"developerTokenProvider"];
        developerTokenProvider = v5->_developerTokenProvider;
        v5->_developerTokenProvider = (ICDeveloperTokenProvider *)v8;
        goto LABEL_13;
      }
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v6;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "Failed to look up class of developer token provider with name: %{public}@.", buf, 0xCu);
      }
      v11 = @"Failed to look up class of developer token provider with name: %@.";
    }
    else
    {
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v6;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "Attempted to decode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %{public}@.", buf, 0xCu);
      }
      v11 = @"Attempted to decode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %@.";
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, v11, v6);
    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }
    developerTokenProvider = (void *)v12;
    [v4 failWithError:v12];

    v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICMusicKitRequestContext *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(ICMusicKitRequestContext *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)ICMusicKitRequestContext;
      if ([(ICStoreRequestContext *)&v13 isEqual:v5])
      {
        developerTokenProvider = self->_developerTokenProvider;
        Class v7 = v5->_developerTokenProvider;
        if (developerTokenProvider == v7)
        {
        }
        else
        {
          uint64_t v8 = v7;
          objc_super v9 = developerTokenProvider;
          int v10 = [(ICDeveloperTokenProvider *)v9 isEqual:v8];

          if (!v10) {
            goto LABEL_6;
          }
        }
        BOOL v11 = self->_personalizationMethod == v5->_personalizationMethod;
        goto LABEL_11;
      }
LABEL_6:
      BOOL v11 = 0;
LABEL_11:

      goto LABEL_12;
    }
    BOOL v11 = 0;
  }
LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  objc_super v9 = (objc_class *)objc_opt_class();
  int v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v66 = __ROR8__(v14 + v13, 32);
  uint64_t v68 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_developerTokenProvider;
  uint64_t v19 = [(ICDeveloperTokenProvider *)v18 hash];
  uint64_t v20 = (v17 + v63) ^ __ROR8__(v63, 51);
  uint64_t v21 = v66 + (v68 ^ v19);
  uint64_t v22 = __ROR8__(v68 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v63, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v67 = __ROR8__(v25, 32);
  uint64_t v69 = v24;
  uint64_t v62 = v23 ^ v19;
  uint64_t v64 = v25 ^ __ROR8__(v20, 47);

  int64_t personalizationMethod = self->_personalizationMethod;
  uint64_t v27 = (v62 + v64) ^ __ROR8__(v64, 51);
  uint64_t v28 = v67 + (v69 ^ personalizationMethod);
  uint64_t v29 = __ROR8__(v69 ^ personalizationMethod, 48);
  uint64_t v30 = (v28 ^ v29) + __ROR8__(v62 + v64, 32);
  uint64_t v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  uint64_t v32 = v28 + v27;
  uint64_t v65 = v32 ^ __ROR8__(v27, 47);
  int64_t v33 = ((v30 ^ personalizationMethod) + v65) ^ __ROR8__(v65, 51);
  uint64_t v34 = __ROR8__(v32, 32) + (v31 ^ 0x1800000000000000);
  uint64_t v35 = __ROR8__(v31 ^ 0x1800000000000000, 48);
  uint64_t v36 = (v34 ^ v35) + __ROR8__((v30 ^ personalizationMethod) + v65, 32);
  uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  uint64_t v38 = v34 + v33;
  uint64_t v39 = v38 ^ __ROR8__(v33, 47);
  uint64_t v40 = (v36 ^ 0x1800000000000000) + v39;
  uint64_t v41 = v40 ^ __ROR8__(v39, 51);
  uint64_t v42 = (__ROR8__(v38, 32) ^ 0xFFLL) + v37;
  uint64_t v43 = __ROR8__(v37, 48);
  uint64_t v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  uint64_t v46 = v41 + v42;
  uint64_t v47 = v46 ^ __ROR8__(v41, 47);
  uint64_t v48 = v47 + v44;
  uint64_t v49 = v48 ^ __ROR8__(v47, 51);
  uint64_t v50 = __ROR8__(v46, 32) + v45;
  uint64_t v51 = __ROR8__(v45, 48);
  uint64_t v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  uint64_t v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  uint64_t v54 = v49 + v50;
  uint64_t v55 = v54 ^ __ROR8__(v49, 47);
  uint64_t v56 = v55 + v52;
  uint64_t v57 = v56 ^ __ROR8__(v55, 51);
  uint64_t v58 = __ROR8__(v54, 32) + v53;
  uint64_t v59 = __ROR8__(v53, 48);
  uint64_t v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  return (v57 + v58) ^ __ROR8__(v57, 47) ^ v60 ^ __ROR8__(v57 + v58, 32) ^ v60 ^ __ROR8__(v58 ^ v59, 43);
}

- (id)description
{
  uint64_t v3 = self->_cachedDescription;
  if (!v3)
  {
    uint64_t v4 = [(ICMusicKitRequestContext *)self _description];
    uint64_t v5 = (NSString *)[v4 copy];
    cachedDescription = self->_cachedDescription;
    self->_cachedDescription = v5;

    uint64_t v3 = self->_cachedDescription;
  }

  return v3;
}

- (id)_description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(ICRequestContext *)self clientInfo];
  uint64_t v8 = [v7 clientIdentifier];
  objc_super v9 = [v7 clientVersion];
  [v6 appendFormat:@"; client = %@/%@", v8, v9];

  int64_t personalizationMethod = self->_personalizationMethod;
  if (personalizationMethod)
  {
    if (personalizationMethod != 1) {
      goto LABEL_6;
    }
    uint64_t v11 = @"musicUserToken";
  }
  else
  {
    uint64_t v11 = @"legacy";
  }
  [v6 appendFormat:@"; int64_t personalizationMethod = %@", v11];
LABEL_6:
  int64_t v12 = [(ICMusicKitRequestContext *)self personalizationStyle];
  if (v12 == 1)
  {
    uint64_t v13 = @"automatic";
  }
  else
  {
    if (v12 != 2) {
      goto LABEL_11;
    }
    uint64_t v13 = @"always";
  }
  [v6 appendFormat:@"; personalizationStyle = %@", v13];
LABEL_11:
  if ((-[ICDeveloperTokenProvider isMemberOfClass:](self->_developerTokenProvider, "isMemberOfClass:", objc_opt_class()) & 1) == 0)[v6 appendFormat:@"; developerTokenProvider = %@", self->_developerTokenProvider]; {
  [v6 appendString:@">"];
  }

  return v6;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICMusicKitRequestContext_copyWithBlock___block_invoke;
  v9[3] = &unk_1E5AC7F00;
  v9[4] = self;
  id v10 = v4;
  v8.receiver = self;
  v8.super_class = (Class)ICMusicKitRequestContext;
  id v5 = v4;
  id v6 = [(ICStoreRequestContext *)&v8 copyWithBlock:v9];

  return v6;
}

void __42__ICMusicKitRequestContext_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 12, *(id *)(*(void *)(a1 + 32) + 96));
  id v4 = a2;
  v4[13] = *(id *)(*(void *)(a1 + 32) + 104);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICMusicKitRequestContext)initWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICMusicKitRequestContext_initWithBlock___block_invoke;
  v9[3] = &unk_1E5AC7F00;
  id v11 = v4;
  id v10 = self;
  v8.receiver = v10;
  v8.super_class = (Class)ICMusicKitRequestContext;
  id v5 = v4;
  id v6 = [(ICStoreRequestContext *)&v8 initWithBlock:v9];

  return v6;
}

void __42__ICMusicKitRequestContext_initWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[ICDeveloperTokenDefaultProvider sharedProvider];
  id v5 = (void *)v3[12];
  v3[12] = v4;

  v3[13] = 0;
  id v6 = [v3 clientInfo];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = [v3 clientInfo];

  if (v7 == v6)
  {
    objc_super v8 = [v6 bundleIdentifier];
    objc_super v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v6 processName];
    }
    id v11 = v10;

    int64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = @"1";
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Instantiated MusicKit request context with a default client info.\nThis is not recommended, as you need to be explicit about the client identifier and client version your application is meant to use, per agreement with the AMP Core Services team.\nNevertheless, proceeding with clientIdentifier = \"%{public}@\" and clientVersion = \"%{public}@\".", (uint8_t *)&v15, 0x20u);
    }

    uint64_t v14 = +[ICClientInfo clientInfoForMusicKitRequestWithClientIdentifier:v11 clientVersion:@"1"];
    [v3 setClientInfo:v14];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
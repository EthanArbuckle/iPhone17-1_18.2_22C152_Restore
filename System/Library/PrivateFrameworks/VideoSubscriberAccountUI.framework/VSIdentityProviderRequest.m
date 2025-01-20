@interface VSIdentityProviderRequest
+ (id)STBOptOutRequestWithStorage:(id)a3;
+ (id)accountMetadataRequestWithAccount:(id)a3 storage:(id)a4 accountMetadataRequest:(id)a5 requestingAppDisplayName:(id)a6 requestingAppAdamID:(id)a7 accountProviderAuthenticationToken:(id)a8;
+ (id)deleteAccountRequestWithAccount:(id)a3 storage:(id)a4;
+ (id)makeAccountRequestWithStorage:(id)a3;
+ (id)silentMakeAccountRequestWithStorage:(id)a3;
- (BOOL)allowsUI;
- (BOOL)forceAuthentication;
- (BOOL)requiresUI;
- (NSString)accountProviderAuthenticationToken;
- (NSString)requestingAppAdamID;
- (NSString)requestingAppDisplayName;
- (VSAccount)account;
- (VSIdentityProviderRequest)init;
- (VSOptional)accountMetadataRequest;
- (VSPersistentStorage)storage;
- (id)_initWithRequestType:(int64_t)a3 account:(id)a4 storage:(id)a5;
- (id)description;
- (int64_t)type;
- (void)setAccount:(id)a3;
- (void)setAccountMetadataRequest:(id)a3;
- (void)setAccountProviderAuthenticationToken:(id)a3;
- (void)setRequestingAppAdamID:(id)a3;
- (void)setRequestingAppDisplayName:(id)a3;
- (void)setStorage:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VSIdentityProviderRequest

+ (id)makeAccountRequestWithStorage:(id)a3
{
  id v3 = a3;
  id v4 = [[VSIdentityProviderRequest alloc] _initWithRequestType:1 account:0 storage:v3];

  return v4;
}

+ (id)silentMakeAccountRequestWithStorage:(id)a3
{
  id v3 = a3;
  id v4 = [[VSIdentityProviderRequest alloc] _initWithRequestType:4 account:0 storage:v3];

  return v4;
}

+ (id)accountMetadataRequestWithAccount:(id)a3 storage:(id)a4 accountMetadataRequest:(id)a5 requestingAppDisplayName:(id)a6 requestingAppAdamID:(id)a7 accountProviderAuthenticationToken:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v15) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The accountMetadataRequest parameter must not be nil."];
  }
  id v19 = [[VSIdentityProviderRequest alloc] _initWithRequestType:3 account:v13 storage:v14];
  v20 = [MEMORY[0x263F1E250] optionalWithObject:v15];
  [v19 setAccountMetadataRequest:v20];

  v21 = (void *)[v16 copy];
  [v19 setRequestingAppDisplayName:v21];

  v22 = (void *)[v17 copy];
  [v19 setRequestingAppAdamID:v22];

  v23 = (void *)[v18 copy];
  [v19 setAccountProviderAuthenticationToken:v23];

  return v19;
}

+ (id)deleteAccountRequestWithAccount:(id)a3 storage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The account parameter must not be nil."];
  }
  id v7 = [[VSIdentityProviderRequest alloc] _initWithRequestType:2 account:v5 storage:v6];

  return v7;
}

+ (id)STBOptOutRequestWithStorage:(id)a3
{
  id v3 = a3;
  id v4 = [[VSIdentityProviderRequest alloc] _initWithRequestType:5 account:0 storage:v3];

  [v4 setType:5];
  return v4;
}

- (VSIdentityProviderRequest)init
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (BOOL)allowsUI
{
  if ([(VSIdentityProviderRequest *)self requiresUI]) {
    return 1;
  }
  if ([(VSIdentityProviderRequest *)self type] != 3) {
    return 0;
  }
  uint64_t v4 = [(VSIdentityProviderRequest *)self accountMetadataRequest];
  id v5 = [v4 forceUnwrapObject];
  char v6 = [v5 isInterruptionAllowed];

  return v6;
}

- (BOOL)requiresUI
{
  return [(VSIdentityProviderRequest *)self type] == 1;
}

- (id)_initWithRequestType:(int64_t)a3 account:(id)a4 storage:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The storage parameter must not be nil."];
  }
  v16.receiver = self;
  v16.super_class = (Class)VSIdentityProviderRequest;
  v11 = [(VSIdentityProviderRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_storage, a5);
    id v13 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    accountMetadataRequest = v12->_accountMetadataRequest;
    v12->_accountMetadataRequest = v13;
  }
  return v12;
}

- (BOOL)forceAuthentication
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(VSIdentityProviderRequest *)self accountMetadataRequest];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__VSIdentityProviderRequest_forceAuthentication__block_invoke;
  v4[3] = &unk_265077828;
  v4[4] = &v5;
  [v2 conditionallyUnwrapObject:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __48__VSIdentityProviderRequest_forceAuthentication__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 forceAuthentication];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[VSIdentityProviderRequest type](self, "type"));
  char v6 = [v4 stringWithFormat:@"%@ = %@", @"type", v5];
  [v3 addObject:v6];

  uint64_t v7 = NSString;
  char v8 = [(VSIdentityProviderRequest *)self requestingAppDisplayName];
  id v9 = [v7 stringWithFormat:@"%@ = %@", @"requestingAppDisplayName", v8];
  [v3 addObject:v9];

  id v10 = NSString;
  v11 = [(VSIdentityProviderRequest *)self requestingAppAdamID];
  v12 = [v10 stringWithFormat:@"%@ = %@", @"requestingAppAdamID", v11];
  [v3 addObject:v12];

  id v13 = NSString;
  id v14 = [(VSIdentityProviderRequest *)self account];
  id v15 = [v13 stringWithFormat:@"%@ = %@", @"account", v14];
  [v3 addObject:v15];

  objc_super v16 = NSString;
  id v17 = [(VSIdentityProviderRequest *)self storage];
  id v18 = [v16 stringWithFormat:@"%@ = %@", @"storage", v17];
  [v3 addObject:v18];

  id v19 = NSString;
  v20 = [(VSIdentityProviderRequest *)self accountMetadataRequest];
  v21 = [v19 stringWithFormat:@"%@ = %@", @"accountMetadataRequest", v20];
  [v3 addObject:v21];

  v22 = NSString;
  v23 = objc_msgSend(NSString, "vs_yesNoStringValueFromBool:", -[VSIdentityProviderRequest forceAuthentication](self, "forceAuthentication"));
  v24 = [v22 stringWithFormat:@"%@ = %@", @"forceAuthentication", v23];
  [v3 addObject:v24];

  v25 = NSString;
  v26 = objc_msgSend(NSString, "vs_yesNoStringValueFromBool:", -[VSIdentityProviderRequest allowsUI](self, "allowsUI"));
  v27 = [v25 stringWithFormat:@"%@ = %@", @"allowsUI", v26];
  [v3 addObject:v27];

  v28 = NSString;
  v29 = objc_msgSend(NSString, "vs_yesNoStringValueFromBool:", -[VSIdentityProviderRequest requiresUI](self, "requiresUI"));
  v30 = [v28 stringWithFormat:@"%@ = %@", @"requiresUI", v29];
  [v3 addObject:v30];

  v31 = NSString;
  v36.receiver = self;
  v36.super_class = (Class)VSIdentityProviderRequest;
  v32 = [(VSIdentityProviderRequest *)&v36 description];
  v33 = [v3 componentsJoinedByString:@", "];
  v34 = [v31 stringWithFormat:@"<%@ %@>", v32, v33];

  return v34;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)requestingAppDisplayName
{
  return self->_requestingAppDisplayName;
}

- (void)setRequestingAppDisplayName:(id)a3
{
}

- (NSString)requestingAppAdamID
{
  return self->_requestingAppAdamID;
}

- (void)setRequestingAppAdamID:(id)a3
{
}

- (VSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSOptional)accountMetadataRequest
{
  return self->_accountMetadataRequest;
}

- (void)setAccountMetadataRequest:(id)a3
{
}

- (NSString)accountProviderAuthenticationToken
{
  return self->_accountProviderAuthenticationToken;
}

- (void)setAccountProviderAuthenticationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_accountMetadataRequest, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requestingAppAdamID, 0);
  objc_storeStrong((id *)&self->_requestingAppDisplayName, 0);
}

@end
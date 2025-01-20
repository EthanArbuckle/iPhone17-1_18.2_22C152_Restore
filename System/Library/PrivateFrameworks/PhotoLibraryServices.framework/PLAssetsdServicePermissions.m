@interface PLAssetsdServicePermissions
- (BOOL)_isAuthorizedForReadWriteWithContext:(id)a3;
- (BOOL)_isAuthorizedForWriteOnlyWithContext:(id)a3;
- (BOOL)_isAuthorizedViaPhotoKitEntitlementWithContext:(id)a3;
- (BOOL)_isAuthorizedViaTCCWithContext:(id)a3;
- (BOOL)allowsAuthorizationWithPhotoKitEntitlement;
- (NSArray)requiredEntitlements;
- (PLAssetsdServicePermissions)initWithPermissions:(id)a3;
- (id)_errorForMissingEntitlements:(id)a3 withContext:(id)a4;
- (id)_verifyAuthorizationWithContext:(id)a3;
- (id)_verifyEntitlementsWithContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)verifyPermissionsWithContext:(id)a3;
- (int64_t)requiredAuthorization;
- (void)refreshCachedAuthorizationsWithContext:(id)a3;
- (void)setAllowsAuthorizationWithPhotoKitEntitlement:(BOOL)a3;
- (void)setRequiredAuthorization:(int64_t)a3;
- (void)setRequiredEntitlements:(id)a3;
@end

@implementation PLAssetsdServicePermissions

- (void).cxx_destruct
{
}

- (void)setAllowsAuthorizationWithPhotoKitEntitlement:(BOOL)a3
{
  self->_allowsAuthorizationWithPhotoKitEntitlement = a3;
}

- (PLAssetsdServicePermissions)initWithPermissions:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLAssetsdServicePermissions.m", 20, @"Invalid parameter not satisfying: %@", @"permissions != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLAssetsdServicePermissions;
  v6 = [(PLAssetsdServicePermissions *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_requiredAuthorization = *((void *)v5 + 2);
    v6->_allowsAuthorizationWithPhotoKitEntitlement = *((unsigned char *)v5 + 8);
    uint64_t v8 = [*((id *)v5 + 3) copy];
    requiredEntitlements = v7->_requiredEntitlements;
    v7->_requiredEntitlements = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PLAssetsdServicePermissions alloc];
  return [(PLAssetsdServicePermissions *)v4 initWithPermissions:self];
}

- (id)verifyPermissionsWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLAssetsdServicePermissions *)self _verifyAuthorizationWithContext:v4];
  if (v5)
  {
    v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [v4 clientDebugDescription];
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Authorization error: %@ for client: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v8 = v5;
  }
  else
  {
    id v8 = [(PLAssetsdServicePermissions *)self _verifyEntitlementsWithContext:v4];
    if (v8)
    {
      v9 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [v4 clientDebugDescription];
        int v13 = 138412546;
        id v14 = v8;
        __int16 v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Entitlements error: %@ for client: %{public}@", (uint8_t *)&v13, 0x16u);
      }
      id v11 = v8;
    }
  }
  return v8;
}

- (void)refreshCachedAuthorizationsWithContext:(id)a3
{
  id v3 = a3;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating cached client authorizations", v5, 2u);
  }

  [v3 invalidateClientAuthorizationCache];
}

- (id)_verifyAuthorizationWithContext:(id)a3
{
  id v4 = a3;
  if ([(PLAssetsdServicePermissions *)self _isAuthorizedViaTCCWithContext:v4]
    || [(PLAssetsdServicePermissions *)self _isAuthorizedViaPhotoKitEntitlementWithContext:v4])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46104 userInfo:0];
  }

  return v5;
}

- (BOOL)_isAuthorizedViaTCCWithContext:(id)a3
{
  id v4 = a3;
  int64_t requiredAuthorization = self->_requiredAuthorization;
  if (requiredAuthorization)
  {
    if (requiredAuthorization == 2)
    {
      BOOL v6 = [(PLAssetsdServicePermissions *)self _isAuthorizedForWriteOnlyWithContext:v4];
    }
    else
    {
      if (requiredAuthorization != 1)
      {
        BOOL v7 = 0;
        goto LABEL_9;
      }
      BOOL v6 = [(PLAssetsdServicePermissions *)self _isAuthorizedForReadWriteWithContext:v4];
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (id)_verifyEntitlementsWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    requiredEntitlements = self->_requiredEntitlements;
    BOOL v7 = [v4 clientDebugDescription];
    *(_DWORD *)buf = 138412546;
    v18 = requiredEntitlements;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Checking entitlements: %@ for client: %@", buf, 0x16u);
  }
  id v8 = self->_requiredEntitlements;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__PLAssetsdServicePermissions__verifyEntitlementsWithContext___block_invoke;
  v15[3] = &unk_1E58650E8;
  id v9 = v4;
  id v16 = v9;
  v10 = [(NSArray *)v8 _pl_filter:v15];
  id v11 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = [v9 clientDebugDescription];
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Missing entitlements: %@ for client: %@", buf, 0x16u);
  }
  if ([(NSArray *)v10 count])
  {
    int v13 = [(PLAssetsdServicePermissions *)self _errorForMissingEntitlements:v10 withContext:v9];
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (BOOL)_isAuthorizedForWriteOnlyWithContext:(id)a3
{
  id v3 = a3;
  if ([v3 isClientAuthorizedForTCCServicePhotosAdd]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isClientAuthorizedForTCCServicePhotos];
  }

  return v4;
}

- (void)setRequiredEntitlements:(id)a3
{
}

- (void)setRequiredAuthorization:(int64_t)a3
{
  self->_int64_t requiredAuthorization = a3;
}

uint64_t __62__PLAssetsdServicePermissions__verifyEntitlementsWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasEntitlement:a2] ^ 1;
}

- (NSArray)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (BOOL)allowsAuthorizationWithPhotoKitEntitlement
{
  return self->_allowsAuthorizationWithPhotoKitEntitlement;
}

- (int64_t)requiredAuthorization
{
  return self->_requiredAuthorization;
}

- (id)_errorForMissingEntitlements:(id)a3 withContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v6 clientDebugDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v8;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "assetsd client %{public}@ is missing required entitlements: %{public}@", buf, 0x16u);
  }
  v12 = @"MissingEntitlements";
  id v13 = v5;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46104 userInfo:v9];

  return v10;
}

- (BOOL)_isAuthorizedViaPhotoKitEntitlementWithContext:(id)a3
{
  if (self->_allowsAuthorizationWithPhotoKitEntitlement) {
    return [a3 hasEntitlement:*MEMORY[0x1E4F8C5B8]];
  }
  else {
    return 0;
  }
}

- (BOOL)_isAuthorizedForReadWriteWithContext:(id)a3
{
  return [a3 isClientAuthorizedForTCCServicePhotos];
}

@end
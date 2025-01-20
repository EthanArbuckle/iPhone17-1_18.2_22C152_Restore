@interface PLXPCPhotoLibraryStorePolicySandbox
- (BOOL)hasSandboxAccessForPath:(id)a3;
- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4;
@end

@implementation PLXPCPhotoLibraryStorePolicySandbox

- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v21 = *(_OWORD *)a4->var0;
  *(_OWORD *)&v21[16] = v7;
  if ([MEMORY[0x1E4F8B9D8] hasXPCStoreEntitlementOptInForToken:v21])
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      v9 = "Token has XPCStore Opt-In Entitlement";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      uint32_t v12 = 2;
LABEL_14:
      _os_log_impl(&dword_19B3C7000, v10, v11, v9, v21, v12);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  BOOL v13 = [(PLXPCPhotoLibraryStorePolicySandbox *)self hasSandboxAccessForPath:v6];
  char v14 = !v13;
  v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = @"NOT ";
    if (v13) {
      v17 = &stru_1EEB2EB80;
    }
    else {
      v17 = @"NOT ";
    }
    if (!v13) {
      v16 = &stru_1EEB2EB80;
    }
    *(_DWORD *)v21 = 138412546;
    *(void *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v16;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "We do %@have access to the database path, so we are %@using XPC store", v21, 0x16u);
  }

  v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v19 = [v18 BOOLForKey:@"com.apple.Photos.forceXPCStore"];

  if (v19)
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 138412290;
      *(void *)&v21[4] = @"com.apple.Photos.forceXPCStore";
      v9 = "Forcing XPCStore due to %@ user default being set";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_14;
    }
LABEL_15:

    char v14 = 1;
  }

  return v14;
}

- (BOOL)hasSandboxAccessForPath:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 isReadableFileAtPath:v5];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v5 stringByDeletingLastPathComponent];

    id v5 = (id)v8;
  }
  if (PLIsAssetsd()) {
    goto LABEL_4;
  }
  getpid();
  id v10 = v5;
  uint64_t v18 = [v10 fileSystemRepresentation];
  int v11 = sandbox_check();
  if (v11 < 0)
  {
    BOOL v13 = NSString;
    char v14 = __error();
    v15 = objc_msgSend(v13, "stringWithUTF8String:", strerror(*v14), v18);
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLXPCPhotoLibraryStorePolicy.m", 39, @"Error performing sandbox check in shouldUseXPCPhotoLibraryStore:%@ %@", v10, v15 object file lineNumber description];

LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  if (v11)
  {
    uint32_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "We do NOT have access to the database path, so we are using XPC store", buf, 2u);
    }

    goto LABEL_11;
  }
LABEL_4:
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

@end
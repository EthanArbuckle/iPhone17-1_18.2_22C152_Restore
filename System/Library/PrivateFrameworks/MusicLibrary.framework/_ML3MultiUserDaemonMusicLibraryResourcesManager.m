@interface _ML3MultiUserDaemonMusicLibraryResourcesManager
- (ACAccountStore)accountStore;
- (BOOL)shouldExecuteAccountChangeOperation:(id)a3 reason:(id *)a4;
- (MLMediaLibraryAccountChangeObserver)accountChangeObserver;
- (NSOperationQueue)accountChangeOperationQueue;
- (NSString)currentActiveAccountDSID;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)serialQueue;
- (_ML3MultiUserDaemonMusicLibraryResourcesManager)initWithAccountInfo:(id)a3 accountChangeObserver:(id)a4;
- (_MSVAccountInformationProviding)accountInfo;
- (id)_blockingCurrentActiveAccountDSID;
- (id)_libraryContainerPathForDSID:(id)a3;
- (id)databasePathForDSID:(id)a3;
- (id)libraryContainerPath;
- (id)musicAssetsContainerPath;
- (void)_accountStoreDidChangeNotification:(id)a3;
- (void)_notifyClients:(id)a3;
- (void)_processAccountChangeNotification;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)accountChangeOperationWillStartPerformingDatabasePathChange:(id)a3 newDatabasePath:(id)a4;
- (void)dealloc;
- (void)setAccountChangeObserver:(id)a3;
- (void)setAccountChangeOperationQueue:(id)a3;
- (void)setAccountInfo:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setCurrentActiveAccountDSID:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation _ML3MultiUserDaemonMusicLibraryResourcesManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_destroyWeak((id *)&self->_accountChangeObserver);
  objc_storeStrong((id *)&self->_accountInfo, 0);
  objc_storeStrong((id *)&self->_accountChangeOperationQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_currentActiveAccountDSID, 0);
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountChangeObserver);

  return (MLMediaLibraryAccountChangeObserver *)WeakRetained;
}

- (void)setAccountInfo:(id)a3
{
}

- (_MSVAccountInformationProviding)accountInfo
{
  return self->_accountInfo;
}

- (void)setAccountChangeOperationQueue:(id)a3
{
}

- (NSOperationQueue)accountChangeOperationQueue
{
  return self->_accountChangeOperationQueue;
}

- (void)setCalloutQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)accountChangeOperationWillStartPerformingDatabasePathChange:(id)a3 newDatabasePath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 finalDSID];
    int v11 = 138543619;
    v12 = self;
    __int16 v13 = 2113;
    v14 = v9;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - accountChangeOperationWillStartPerformingDatabasePathChange - final DSID: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [v6 finalDSID];
  [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self setCurrentActiveAccountDSID:v10];

  +[ML3MusicLibrary setAutoupdatingSharedLibraryPath:v7];
}

- (id)databasePathForDSID:(id)a3
{
  v4 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self _libraryContainerPathForDSID:a3];
  v7.receiver = self;
  v7.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  v5 = [(_ML3BaseMusicLibraryResourcesManager *)&v7 pathForResourceFileOrFolder:15 basePath:v4 relativeToBase:0 createParentFolderIfNecessary:1];

  return v5;
}

- (BOOL)shouldExecuteAccountChangeOperation:(id)a3 reason:(id *)a4
{
  *a4 = &stru_1F08D4D70;
  id v6 = a3;
  objc_super v7 = [v6 finalDSID];
  v8 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self currentActiveAccountDSID];
  int v9 = [v7 isEqualToString:v8];

  v10 = NSString;
  int v11 = [v6 finalDSID];

  if (v9)
  {
    *a4 = [v10 stringWithFormat:@"final and current dsid are identical: %@", v11];
  }
  else
  {
    v12 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self currentActiveAccountDSID];
    *a4 = [v10 stringWithFormat:@"final (%@) and current (%@) dsid are different", v11, v12];
  }
  return v9 ^ 1;
}

- (void)_notifyClients:(id)a3
{
  id v4 = a3;
  v5 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self calloutQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___ML3MultiUserDaemonMusicLibraryResourcesManager__notifyClients___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_processAccountChangeNotification
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountInfo];
  id v4 = [v3 accountDSID];

  v5 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self currentActiveAccountDSID];
  id v6 = v5;
  if (v4)
  {
    int v7 = [v4 isEqualToString:v5];

    if (v7)
    {
      id v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 138543362;
        v19 = self;
        int v9 = "%{public}@ - User was logged-in and is still logged-in with the same dsid: nothing to to";
LABEL_11:
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v18, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
LABEL_6:
    v10 = [_ML3MultiUserDaemonAccountChangeOperation alloc];
    int v11 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self currentActiveAccountDSID];
    v12 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountChangeObserver];
    id v8 = [(_ML3MultiUserDaemonAccountChangeOperation *)v10 initWithInitialDSID:v11 finalDSID:v4 accountChangeObserver:v12];

    [v8 setDelegate:self];
    __int16 v13 = os_log_create("com.apple.amp.medialibrary", "MultiUser_Oversize");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self currentActiveAccountDSID];
      uint64_t v15 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountChangeOperationQueue];
      v16 = [v15 operations];
      int v18 = 138544387;
      v19 = self;
      __int16 v20 = 2113;
      v21 = v14;
      __int16 v22 = 2113;
      v23 = v4;
      __int16 v24 = 2048;
      v25 = v8;
      __int16 v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - current dsid: %{private}@ - new dsid: %{private}@ - Enqueueing change operation=%p, all operations on queue=%{public}@", (uint8_t *)&v18, 0x34u);
    }
    v17 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountChangeOperationQueue];
    [v17 addOperation:v8];

    goto LABEL_12;
  }

  if (v6) {
    goto LABEL_6;
  }
  id v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543362;
    v19 = self;
    int v9 = "%{public}@ - User was logged-out and is still logged-out: nothing to to";
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - Received account change notification", (uint8_t *)&v5, 0xCu);
  }

  [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self _processAccountChangeNotification];
}

- (void)_tearDownNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_setupNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__accountStoreDidChangeNotification_ name:*MEMORY[0x1E4F178D8] object:0];
}

- (id)_libraryContainerPathForDSID:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v61, 0, sizeof(v61));
  uint64_t v60 = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)v61);
  id v5 = v4;
  CC_SHA1_Update((CC_SHA1_CTX *)v61, (const void *)[v5 UTF8String], objc_msgSend(v5, "length"));

  memset(&v62[8], 0, 64);
  *(void *)v62 = 4001;
  CC_SHA1_Final(&v62[8], (CC_SHA1_CTX *)v61);
  v63[0] = *(_OWORD *)v62;
  v63[1] = *(_OWORD *)&v62[16];
  v63[2] = *(_OWORD *)&v62[32];
  v63[3] = *(_OWORD *)&v62[48];
  uint64_t v64 = *(void *)&v62[64];
  if (*(uint64_t *)v62 > 3999)
  {
    if (*(uint64_t *)v62 > 4255)
    {
      if (*(void *)v62 == 4256)
      {
        v47 = (unsigned __int8 *)v63 + 8;
        v48 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v49 = v48;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v51 = *v47++;
          v52 = &v48[i];
          char *v52 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v51 >> 4];
          v52[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v51 & 0xF];
        }
        id v18 = [NSString alloc];
        v19 = v49;
        uint64_t v20 = 64;
      }
      else
      {
        if (*(void *)v62 != 4512) {
          goto LABEL_50;
        }
        v25 = (unsigned __int8 *)v63 + 8;
        __int16 v26 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v27 = v26;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v29 = *v25++;
          v30 = &v26[j];
          char *v30 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v29 & 0xF];
        }
        id v18 = [NSString alloc];
        v19 = v27;
        uint64_t v20 = 128;
      }
    }
    else if (*(void *)v62 == 4000)
    {
      v37 = (unsigned __int8 *)v63 + 8;
      v38 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v39 = v38;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v41 = *v37++;
        v42 = &v38[k];
        char *v42 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v41 >> 4];
        v42[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v41 & 0xF];
      }
      id v18 = [NSString alloc];
      v19 = v39;
      uint64_t v20 = 32;
    }
    else
    {
      if (*(void *)v62 != 4001) {
        goto LABEL_50;
      }
      v12 = (unsigned __int8 *)v63 + 8;
      __int16 v13 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v14 = v13;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v16 = *v12++;
        v17 = &v13[m];
        char *v17 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v16 >> 4];
        v17[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v16 & 0xF];
      }
      id v18 = [NSString alloc];
      v19 = v14;
      uint64_t v20 = 40;
    }
LABEL_45:
    CFStringRef v36 = (CFStringRef)[v18 initWithBytesNoCopy:v19 length:v20 encoding:4 freeWhenDone:1];
    goto LABEL_46;
  }
  if (*(uint64_t *)v62 > 2999)
  {
    if (*(void *)v62 == 3000)
    {
      LODWORD(v65[0]) = bswap32(DWORD2(v63[0]));
      v43 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v44 = 0;
      v45 = v43 + 1;
      do
      {
        unint64_t v46 = *((unsigned __int8 *)v65 + v44);
        *(v45 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v46 >> 4];
        unsigned char *v45 = MSVFastHexStringFromBytes_hexCharacters_27232[v46 & 0xF];
        v45 += 2;
        ++v44;
      }
      while (v44 != 4);
      id v18 = [NSString alloc];
      v19 = v43;
      uint64_t v20 = 8;
    }
    else
    {
      if (*(void *)v62 != 3001) {
        goto LABEL_50;
      }
      v65[0] = bswap64(*((unint64_t *)&v63[0] + 1));
      v21 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v22 = 0;
      v23 = v21 + 1;
      do
      {
        unint64_t v24 = *((unsigned __int8 *)v65 + v22);
        *(v23 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v24 >> 4];
        unsigned char *v23 = MSVFastHexStringFromBytes_hexCharacters_27232[v24 & 0xF];
        v23 += 2;
        ++v22;
      }
      while (v22 != 8);
      id v18 = [NSString alloc];
      v19 = v21;
      uint64_t v20 = 16;
    }
    goto LABEL_45;
  }
  if (*(void *)v62 == 1000)
  {
    uint64_t v31 = *((void *)&v63[0] + 1);
    v32 = (char *)&v66 + 1;
    uint64_t quot = *((void *)&v63[0] + 1);
    do
    {
      lldiv_t v34 = lldiv(quot, 10);
      uint64_t quot = v34.quot;
      if (v34.rem >= 0) {
        LOBYTE(v35) = v34.rem;
      }
      else {
        uint64_t v35 = -v34.rem;
      }
      *(v32 - 2) = v35 + 48;
      int v11 = (const UInt8 *)(v32 - 2);
      --v32;
    }
    while (v34.quot);
    if (v31 < 0)
    {
      *(v32 - 2) = 45;
      int v11 = (const UInt8 *)(v32 - 2);
    }
    v10 = (char *)((char *)&v66 - (char *)v11);
    goto LABEL_35;
  }
  if (*(void *)v62 == 2000)
  {
    uint64_t v6 = DWORD2(v63[0]);
    uint64_t v7 = &v66;
    do
    {
      ldiv_t v8 = ldiv(v6, 10);
      uint64_t v6 = v8.quot;
      if (v8.rem >= 0) {
        LOBYTE(v9) = v8.rem;
      }
      else {
        uint64_t v9 = -v8.rem;
      }
      *((unsigned char *)v7 - 1) = v9 + 48;
      uint64_t v7 = (uint64_t *)((char *)v7 - 1);
    }
    while (v8.quot);
    v10 = (char *)((char *)&v66 - (char *)v7);
    int v11 = (const UInt8 *)v7;
LABEL_35:
    CFStringRef v36 = CFStringCreateWithBytes(0, v11, (CFIndex)v10, 0x8000100u, 0);
LABEL_46:
    v53 = (__CFString *)v36;
    goto LABEL_47;
  }
LABEL_50:
  v57 = [MEMORY[0x1E4F28B00] currentHandler];
  v58 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v57 handleFailureInFunction:v58 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v53 = &stru_1F08D4D70;
LABEL_47:

  v59.receiver = self;
  v59.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  v54 = [(_ML3BaseMusicLibraryResourcesManager *)&v59 libraryContainerPath];
  v55 = [v54 stringByAppendingPathComponent:v53];

  return v55;
}

- (void)setCurrentActiveAccountDSID:(id)a3
{
  id v4 = a3;
  id v5 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79___ML3MultiUserDaemonMusicLibraryResourcesManager_setCurrentActiveAccountDSID___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSString)currentActiveAccountDSID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20630;
  int v11 = __Block_byref_object_dispose__20631;
  id v12 = 0;
  id v3 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75___ML3MultiUserDaemonMusicLibraryResourcesManager_currentActiveAccountDSID__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)_blockingCurrentActiveAccountDSID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountChangeOperationQueue];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - BLOCKING - Retrieving libraryContainerPath on serial queue: %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__20630;
  id v18 = __Block_byref_object_dispose__20631;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84___ML3MultiUserDaemonMusicLibraryResourcesManager__blockingCurrentActiveAccountDSID__block_invoke;
  v11[3] = &unk_1E5FB8360;
  v11[4] = self;
  v11[5] = buf;
  id v5 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v11];
  id v6 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountChangeOperationQueue];
  [v6 addOperation:v5];

  [v5 waitUntilFinished];
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self accountChangeOperationQueue];
    *(_DWORD *)id v12 = 138543618;
    __int16 v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - UNBLOCKED - Retrieved libraryContainerPath on serial queue: %{public}@", v12, 0x16u);
  }
  id v9 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v9;
}

- (id)libraryContainerPath
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self _blockingCurrentActiveAccountDSID];
  id v4 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self _libraryContainerPathForDSID:v3];
  id v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ - Retrieved libraryContainerPath %{public}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)musicAssetsContainerPath
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self _blockingCurrentActiveAccountDSID];
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  long long v69 = 0u;
  long long v68 = 0u;
  long long v67 = 0u;
  long long v66 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  memset(&buf[8], 0, 32);
  *(void *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
  id v4 = v3;
  CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], (const void *)[v4 UTF8String], objc_msgSend(v4, "length"));

  memset(&v74[8], 0, 64);
  *(void *)v74 = 4001;
  CC_SHA1_Final(&v74[8], (CC_SHA1_CTX *)&buf[8]);
  v75[0] = *(_OWORD *)v74;
  v75[1] = *(_OWORD *)&v74[16];
  v75[2] = *(_OWORD *)&v74[32];
  v75[3] = *(_OWORD *)&v74[48];
  uint64_t v76 = *(void *)&v74[64];
  if (*(uint64_t *)v74 > 3999)
  {
    if (*(uint64_t *)v74 > 4255)
    {
      if (*(void *)v74 == 4256)
      {
        unint64_t v46 = (unsigned __int8 *)v75 + 8;
        v47 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v48 = v47;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v50 = *v46++;
          unsigned int v51 = &v47[i];
          *unsigned int v51 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v50 >> 4];
          v51[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v50 & 0xF];
        }
        id v17 = [NSString alloc];
        id v18 = v48;
        uint64_t v19 = 64;
      }
      else
      {
        if (*(void *)v74 != 4512) {
          goto LABEL_54;
        }
        unint64_t v24 = (unsigned __int8 *)v75 + 8;
        v25 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        __int16 v26 = v25;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v28 = *v24++;
          unsigned int v29 = &v25[j];
          *unsigned int v29 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v28 >> 4];
          v29[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v28 & 0xF];
        }
        id v17 = [NSString alloc];
        id v18 = v26;
        uint64_t v19 = 128;
      }
    }
    else if (*(void *)v74 == 4000)
    {
      CFStringRef v36 = (unsigned __int8 *)v75 + 8;
      v37 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v38 = v37;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v40 = *v36++;
        unsigned int v41 = &v37[k];
        *unsigned int v41 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v40 >> 4];
        v41[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v40 & 0xF];
      }
      id v17 = [NSString alloc];
      id v18 = v38;
      uint64_t v19 = 32;
    }
    else
    {
      if (*(void *)v74 != 4001) {
        goto LABEL_54;
      }
      uint64_t v11 = (unsigned __int8 *)v75 + 8;
      id v12 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      __int16 v13 = v12;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v15 = *v11++;
        unsigned int v16 = &v12[m];
        char *v16 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v15 >> 4];
        v16[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v15 & 0xF];
      }
      id v17 = [NSString alloc];
      id v18 = v13;
      uint64_t v19 = 40;
    }
LABEL_45:
    CFStringRef v35 = (CFStringRef)[v17 initWithBytesNoCopy:v18 length:v19 encoding:4 freeWhenDone:1];
    goto LABEL_46;
  }
  if (*(uint64_t *)v74 > 2999)
  {
    if (*(void *)v74 == 3000)
    {
      LODWORD(v77[0]) = bswap32(DWORD2(v75[0]));
      v42 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v43 = 0;
      uint64_t v44 = v42 + 1;
      do
      {
        unint64_t v45 = *((unsigned __int8 *)v77 + v43);
        *(v44 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v45 >> 4];
        *uint64_t v44 = MSVFastHexStringFromBytes_hexCharacters_27232[v45 & 0xF];
        v44 += 2;
        ++v43;
      }
      while (v43 != 4);
      id v17 = [NSString alloc];
      id v18 = v42;
      uint64_t v19 = 8;
    }
    else
    {
      if (*(void *)v74 != 3001) {
        goto LABEL_54;
      }
      v77[0] = bswap64(*((unint64_t *)&v75[0] + 1));
      uint64_t v20 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v21 = 0;
      uint64_t v22 = v20 + 1;
      do
      {
        unint64_t v23 = *((unsigned __int8 *)v77 + v21);
        *(v22 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v23 >> 4];
        *uint64_t v22 = MSVFastHexStringFromBytes_hexCharacters_27232[v23 & 0xF];
        v22 += 2;
        ++v21;
      }
      while (v21 != 8);
      id v17 = [NSString alloc];
      id v18 = v20;
      uint64_t v19 = 16;
    }
    goto LABEL_45;
  }
  if (*(void *)v74 == 1000)
  {
    uint64_t v30 = *((void *)&v75[0] + 1);
    uint64_t v31 = (char *)&v78 + 1;
    uint64_t quot = *((void *)&v75[0] + 1);
    do
    {
      lldiv_t v33 = lldiv(quot, 10);
      uint64_t quot = v33.quot;
      if (v33.rem >= 0) {
        LOBYTE(v34) = v33.rem;
      }
      else {
        uint64_t v34 = -v33.rem;
      }
      *(v31 - 2) = v34 + 48;
      v10 = (const UInt8 *)(v31 - 2);
      --v31;
    }
    while (v33.quot);
    if (v30 < 0)
    {
      *(v31 - 2) = 45;
      v10 = (const UInt8 *)(v31 - 2);
    }
    __int16 v9 = (char *)((char *)&v78 - (char *)v10);
    goto LABEL_35;
  }
  if (*(void *)v74 == 2000)
  {
    uint64_t v5 = DWORD2(v75[0]);
    id v6 = &v78;
    do
    {
      ldiv_t v7 = ldiv(v5, 10);
      uint64_t v5 = v7.quot;
      if (v7.rem >= 0) {
        LOBYTE(v8) = v7.rem;
      }
      else {
        uint64_t v8 = -v7.rem;
      }
      *((unsigned char *)v6 - 1) = v8 + 48;
      id v6 = (uint64_t *)((char *)v6 - 1);
    }
    while (v7.quot);
    __int16 v9 = (char *)((char *)&v78 - (char *)v6);
    v10 = (const UInt8 *)v6;
LABEL_35:
    CFStringRef v35 = CFStringCreateWithBytes(0, v10, (CFIndex)v9, 0x8000100u, 0);
LABEL_46:
    v52 = (__CFString *)v35;
    goto LABEL_47;
  }
LABEL_54:
  objc_super v59 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v60 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v59 handleFailureInFunction:v60 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v52 = &stru_1F08D4D70;
LABEL_47:

  v61.receiver = self;
  v61.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  v53 = [(_ML3BaseMusicLibraryResourcesManager *)&v61 musicAssetsContainerPath];
  v54 = [v53 lastPathComponent];
  char v55 = [v54 isEqualToString:@"Music"];

  if ((v55 & 1) == 0)
  {
    v56 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543875;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v53;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&unsigned char buf[24] = v52;
      _os_log_impl(&dword_1B022D000, v56, OS_LOG_TYPE_FAULT, "%{public}@ - Unexpected musicAssetsContainerPath from base implementation. path=%{private}@ hashedDSID=%{public}@", buf, 0x20u);
    }
  }
  v57 = [v53 stringByAppendingPathComponent:v52];

  return v57;
}

- (void)dealloc
{
  [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)self _tearDownNotifications];
  v3.receiver = self;
  v3.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)&v3 dealloc];
}

- (_ML3MultiUserDaemonMusicLibraryResourcesManager)initWithAccountInfo:(id)a3 accountChangeObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  __int16 v9 = [(_ML3BaseMusicLibraryResourcesManager *)&v22 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.medialibraryd.multi-user-deamon-resources-serial-queue", 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.medialibraryd.multi-user-deamon-resources-callout-queue", MEMORY[0x1E4F14430]);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v12;

    __int16 v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    accountChangeOperationQueue = v9->_accountChangeOperationQueue;
    v9->_accountChangeOperationQueue = v14;

    [(NSOperationQueue *)v9->_accountChangeOperationQueue setName:@"com.apple.medialibraryd.multi-user-deamon-resources-account-change-queue"];
    [(NSOperationQueue *)v9->_accountChangeOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v9->_accountChangeOperationQueue setQualityOfService:25];
    objc_storeStrong((id *)&v9->_accountInfo, a3);
    objc_storeWeak((id *)&v9->_accountChangeObserver, v8);
    unsigned int v16 = [(_MSVAccountInformationProviding *)v9->_accountInfo accountDSID];
    uint64_t v17 = [v16 copy];
    currentActiveAccountDSID = v9->_currentActiveAccountDSID;
    v9->_currentActiveAccountDSID = (NSString *)v17;

    uint64_t v19 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v9->_accountStore;
    v9->_accountStore = (ACAccountStore *)v19;

    [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)v9 _setupNotifications];
  }

  return v9;
}

@end
@interface PLAppUninstallNotificationHandler
+ (id)applicationBundlesToValidate;
- (PLAppUninstallNotificationHandler)initWithLibraryBundleController:(id)a3;
- (void)_removeAppPhotoLibrariesForApplication:(id)a3;
- (void)handleApplicationUninstalledNotification:(id)a3;
@end

@implementation PLAppUninstallNotificationHandler

- (void).cxx_destruct
{
}

- (void)_removeAppPhotoLibrariesForApplication:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    v51 = NSStringFromSelector(a2);
    [v50 handleFailureInMethod:a2, self, @"PLAppUninstallNotificationHandler.m", 84, @"%@ can only be called from assetsd", v51 object file lineNumber description];
  }
  v6 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
  [(PLPhotoLibrarySearchCriteria *)v6 setDomain:3];
  if ([(__CFString *)v5 isEqualToString:@"com.apple.GenerativePlaygroundApp"]) {
    v7 = @"com.apple.GenerativePlayground";
  }
  else {
    v7 = v5;
  }
  [(PLPhotoLibrarySearchCriteria *)v6 setContainerIdentifier:v7];
  v8 = [[PLPhotoLibraryFinder alloc] initWithSearchCriteria:v6];
  id v66 = 0;
  v9 = [(PLPhotoLibraryFinder *)v8 findMatchingPhotoLibraryIdentifiersAndReturnError:&v66];
  v10 = v66;
  if (![v9 count])
  {
    v45 = PLBackendGetLog();
    v11 = v45;
    if (v9)
    {
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138412290;
      v70 = v5;
      v46 = "_removeAppPhotoLibrariesForApplication: No libraries found for %@";
      v47 = v11;
      os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
      uint32_t v49 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138412546;
      v70 = v5;
      __int16 v71 = 2112;
      v72 = v10;
      v46 = "_removeAppPhotoLibrariesForApplication: Failed to find libraries for %@: %@";
      v47 = v11;
      os_log_type_t v48 = OS_LOG_TYPE_ERROR;
      uint32_t v49 = 22;
    }
    _os_log_impl(&dword_19B3C7000, v47, v48, v46, buf, v49);
    goto LABEL_43;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v73 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v52 = v10;
    v53 = v9;
    v54 = v8;
    v55 = v6;
    v56 = v5;
    uint64_t v14 = *(void *)v63;
    uint64_t v57 = *MEMORY[0x1E4F289D0];
    uint64_t v58 = *MEMORY[0x1E4F8C500];
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v59 = v13;
      do
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v62 + 1) + 8 * v15) libraryURL];
        v17 = [(PLPhotoLibraryBundleController *)self->_libraryBundleController openBundleAtLibraryURL:v16];
        v18 = v17;
        if (v17)
        {
          v19 = [v17 libraryServicesManager];
          v20 = v19;
          if (v19)
          {
            id v61 = 0;
            int v21 = [v19 disableiCPLForLibraryDeletionWithError:&v61];
            v22 = v61;
            v23 = v22;
            if (!v21)
            {
              v44 = PLBackendGetLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v70 = v16;
                __int16 v71 = 2112;
                v72 = v23;
                _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "_removeAppPhotoLibrariesForApplication: unable to prepare library for iCPL disable at URL: %@, error: %@", buf, 0x16u);
              }

              goto LABEL_32;
            }
          }
          libraryBundleController = self->_libraryBundleController;
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v67 = v57;
          v68 = v16;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          v26 = self;
          uint64_t v27 = v14;
          v29 = v28 = v11;
          v30 = [v25 errorWithDomain:v58 code:46020 userInfo:v29];
          [(PLPhotoLibraryBundleController *)libraryBundleController shutdownBundle:v18 reason:v30];

          v11 = v28;
          uint64_t v14 = v27;
          self = v26;
          uint64_t v13 = v59;
        }
        else
        {
          v20 = PLBackendGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v70 = v16;
            _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "_removeAppPhotoLibrariesForApplication: No bundle found for libraryURL %@", buf, 0xCu);
          }
        }

        v31 = [MEMORY[0x1E4F8B908] fileManager];
        v32 = [(__CFString *)v16 path];
        int v33 = [v31 fileExistsAtPath:v32];

        if (v33)
        {
          v34 = PLBackendGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v70 = v16;
            _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Deleting photo library from file system at %@", buf, 0xCu);
          }

          id v60 = 0;
          BOOL v35 = +[PLPhotoLibraryOpener deleteLibraryFromFilesystemAtURL:v16 error:&v60];
          v36 = v60;
          v37 = PLBackendGetLog();
          v38 = v37;
          if (v35)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v16;
              v39 = v38;
              os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
              v41 = "_removeAppPhotoLibrariesForApplication deleted photo library bundle at URL: %@";
              uint32_t v42 = 12;
              goto LABEL_27;
            }
          }
          else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v70 = v16;
            __int16 v71 = 2112;
            v72 = v36;
            v39 = v38;
            os_log_type_t v40 = OS_LOG_TYPE_ERROR;
            v41 = "_removeAppPhotoLibrariesForApplication failed to delete photo library bundle at URL: %@, error: %@";
            uint32_t v42 = 22;
LABEL_27:
            _os_log_impl(&dword_19B3C7000, v39, v40, v41, buf, v42);
          }

          v43 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
          [v43 removeSSBForLibraryURL:v16];

          goto LABEL_34;
        }
LABEL_32:
        v36 = PLBackendGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v16;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "_removeAppPhotoLibrariesForApplication: No photo library bundle exists at libraryURL %@", buf, 0xCu);
        }
LABEL_34:

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (!v13)
      {
        v6 = v55;
        v5 = v56;
        v9 = v53;
        v8 = v54;
        v10 = v52;
        break;
      }
    }
  }
LABEL_43:
}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Handling application uninstall event with %@", buf, 0xCu);
  }

  v5 = [v3 objectForKeyedSubscript:@"bundleIDs"];
  v6 = [(id)objc_opt_class() applicationBundlesToValidate];
  if ([v5 count])
  {
    v7 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
    [v7 intersectSet:v6];

    v6 = v7;
  }
  if ([v6 count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v29 = v6;
      v30 = v5;
      id v31 = v3;
      uint64_t v11 = *(void *)v36;
      uint64_t v12 = *MEMORY[0x1E4F28760];
      unint64_t v13 = 0x1E4F22000uLL;
      while (1)
      {
        uint64_t v14 = 0;
        uint64_t v33 = v10;
        do
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
          v16 = *(void **)(v13 + 1016);
          id v34 = 0;
          v17 = objc_msgSend(v16, "bundleRecordWithApplicationIdentifier:error:", v15, &v34, v29, v30, v31);
          id v18 = v34;
          v19 = v18;
          if (!v17)
          {
            v20 = [v18 domain];
            if (![v20 isEqualToString:v12])
            {

LABEL_19:
              v28 = PLBackendGetLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v41 = v15;
                _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to validate application bundle for %{public}@", buf, 0xCu);
              }

              goto LABEL_22;
            }
            uint64_t v21 = v11;
            unint64_t v22 = v13;
            v23 = v8;
            uint64_t v24 = v12;
            uint64_t v25 = [v19 code];

            BOOL v26 = v25 == -10814;
            uint64_t v12 = v24;
            v8 = v23;
            unint64_t v13 = v22;
            uint64_t v11 = v21;
            uint64_t v10 = v33;
            if (!v26) {
              goto LABEL_19;
            }
            uint64_t v27 = PLBackendGetLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v41 = v15;
              _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Deleting application photo library for %{public}@", buf, 0xCu);
            }

            [(PLAppUninstallNotificationHandler *)self _removeAppPhotoLibrariesForApplication:v15];
          }
LABEL_22:

          ++v14;
        }
        while (v10 != v14);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (!v10)
        {
          v5 = v30;
          id v3 = v31;
          v6 = v29;
          break;
        }
      }
    }
  }
  else
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Skipping app validation, no recognzied app bundles for application uninstall event with %@", buf, 0xCu);
    }
  }
}

- (PLAppUninstallNotificationHandler)initWithLibraryBundleController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLAppUninstallNotificationHandler;
  v6 = [(PLAppUninstallNotificationHandler *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryBundleController, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)applicationBundlesToValidate
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.GenerativePlaygroundApp"];
}

@end
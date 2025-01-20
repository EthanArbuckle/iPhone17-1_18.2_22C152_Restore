@interface ML3MusicLibraryResourcesManager
+ (BOOL)supportsSecureCoding;
+ (ML3MusicLibraryResourcesManager)sharedManager;
- (ML3MusicLibraryResourcesManager)initWithBaseResourcesManager:(id)a3;
- (ML3MusicLibraryResourcesManager)initWithCoder:(id)a3;
- (ML3MusicLibraryResourcesManager)initWithContext:(id)a3;
- (ML3MusicLibraryResourcesManagerContext)context;
- (_ML3BaseMusicLibraryResourcesManager)implementation;
- (id)libraryContainerPath;
- (id)libraryContainerPathByAppendingPathComponent:(id)a3;
- (id)libraryContainerRelativePath:(id)a3;
- (id)mediaFolderRelativePath:(id)a3;
- (id)musicAssetsContainerPath;
- (id)pathForBaseLocationPath:(int64_t)a3;
- (id)pathForResourceFileOrFolder:(int)a3;
- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setImplementation:(id)a3;
@end

@implementation ML3MusicLibraryResourcesManager

- (id)pathForResourceFileOrFolder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(ML3MusicLibraryResourcesManager *)self implementation];
  v5 = [v4 pathForResourceFileOrFolder:v3];

  return v5;
}

- (_ML3BaseMusicLibraryResourcesManager)implementation
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_implementation)
  {
    v5 = [(ML3MusicLibraryResourcesManager *)self context];
    if ([v5 isMultiUserSupported])
    {
      v6 = [(ML3MusicLibraryResourcesManager *)self context];
      int v7 = [v6 isRunningInDaemon];

      if (v7)
      {
        v8 = [(ML3MusicLibraryResourcesManager *)self context];
        uint64_t v9 = [v8 accountInfo];
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [(ML3MusicLibraryResourcesManager *)self context];
          v12 = [v11 accountChangeObserver];

          if (v12)
          {
LABEL_7:
            v14 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v49) = 0;
              _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEBUG, "Creating a multi-users daemon library resource manager", (uint8_t *)&v49, 2u);
            }

            v15 = [_ML3MultiUserDaemonMusicLibraryResourcesManager alloc];
            v16 = [(ML3MusicLibraryResourcesManager *)self context];
            v17 = [v16 accountInfo];
            v18 = [(ML3MusicLibraryResourcesManager *)self context];
            v19 = [v18 accountChangeObserver];
            v20 = [(_ML3MultiUserDaemonMusicLibraryResourcesManager *)v15 initWithAccountInfo:v17 accountChangeObserver:v19];
            implementation = self->_implementation;
            self->_implementation = v20;

            goto LABEL_32;
          }
        }
        else
        {
        }
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"ML3MusicLibraryResourcesManager.m" lineNumber:159 description:@"Daemon multi-users resources manager context must specify both account info provider and a media library account change observer"];

        goto LABEL_7;
      }
    }
    else
    {
    }
    v22 = [(ML3MusicLibraryResourcesManager *)self context];
    if ([v22 isMultiUserSupported])
    {
      v23 = [(ML3MusicLibraryResourcesManager *)self context];
      char v24 = [v23 isRunningInDaemon];

      if ((v24 & 1) == 0)
      {
        v25 = [(ML3MusicLibraryResourcesManager *)self context];
        v26 = [v25 resourcesService];

        if (!v26)
        {
          v48 = [MEMORY[0x1E4F28B00] currentHandler];
          [v48 handleFailureInMethod:a2 object:self file:@"ML3MusicLibraryResourcesManager.m" lineNumber:164 description:@"Non-daemon multi-users resources manager context must specify the resources service"];
        }
        v27 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v49) = 0;
          _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEBUG, "Creating a multi-users client resource manager", (uint8_t *)&v49, 2u);
        }

        v28 = [_ML3MultiUserMusicLibraryResourcesManager alloc];
        v16 = [(ML3MusicLibraryResourcesManager *)self context];
        v17 = [v16 resourcesService];
        v29 = [(_ML3MultiUserMusicLibraryResourcesManager *)v28 initWithLibraryResourcesService:v17];
LABEL_31:
        v45 = self->_implementation;
        self->_implementation = v29;

LABEL_32:
        goto LABEL_33;
      }
    }
    else
    {
    }
    v30 = [(ML3MusicLibraryResourcesManager *)self context];
    char v31 = [v30 isMultiUserSupported];

    if (v31)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"ML3MusicLibraryResourcesManager.m" lineNumber:184 description:@"No implementation of ML3MusicLibraryResourcesManager supports the current configuration"];
LABEL_33:

      goto LABEL_34;
    }
    v32 = [(ML3MusicLibraryResourcesManager *)self context];
    v33 = [v32 libraryContainerIdentifier];

    if (v33)
    {
      v34 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v35 = [(ML3MusicLibraryResourcesManager *)self context];
        v36 = [v35 libraryContainerIdentifier];
        int v49 = 138543362;
        v50 = v36;
        _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_DEBUG, "Creating a single library resource manager with library container: %{public}@", (uint8_t *)&v49, 0xCu);
      }
      v37 = [_ML3BaseMusicLibraryResourcesManager alloc];
      v16 = [(ML3MusicLibraryResourcesManager *)self context];
      v17 = [v16 libraryContainerIdentifier];
      v29 = [(_ML3BaseMusicLibraryResourcesManager *)v37 initWithLibraryContainerIdentifier:v17];
    }
    else
    {
      v38 = [(ML3MusicLibraryResourcesManager *)self context];
      v39 = [v38 accountInfo];

      v40 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
      if (v39)
      {
        if (v41)
        {
          v42 = [(ML3MusicLibraryResourcesManager *)self context];
          v43 = [v42 accountInfo];
          int v49 = 138543362;
          v50 = v43;
          _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEBUG, "Creating a single library resource manager for account info: %{public}@", (uint8_t *)&v49, 0xCu);
        }
      }
      else if (v41)
      {
        LOWORD(v49) = 0;
        _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEBUG, "Creating a single library resource manager for the default media folder", (uint8_t *)&v49, 2u);
      }

      v44 = [_ML3BaseMusicLibraryResourcesManager alloc];
      v16 = [(ML3MusicLibraryResourcesManager *)self context];
      v17 = [v16 accountInfo];
      v29 = [(_ML3BaseMusicLibraryResourcesManager *)v44 initWithAccountInfo:v17];
    }
    goto LABEL_31;
  }
LABEL_34:
  os_unfair_lock_unlock(p_lock);
  v46 = self->_implementation;

  return v46;
}

- (ML3MusicLibraryResourcesManagerContext)context
{
  return self->_context;
}

+ (ML3MusicLibraryResourcesManager)sharedManager
{
  if (sharedManager_onceToken[0] != -1) {
    dispatch_once(sharedManager_onceToken, &__block_literal_global_19843);
  }
  v2 = (void *)sharedManager___sharedManager;

  return (ML3MusicLibraryResourcesManager *)v2;
}

void __48__ML3MusicLibraryResourcesManager_sharedManager__block_invoke()
{
  v0 = [ML3MusicLibraryResourcesManager alloc];
  id v3 = +[ML3MusicLibraryResourcesManagerContext contextForAutoupdatingSharedLibrary];
  uint64_t v1 = [(ML3MusicLibraryResourcesManager *)v0 initWithContext:v3];
  v2 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = v1;
}

- (ML3MusicLibraryResourcesManager)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3MusicLibraryResourcesManager;
  v6 = [(ML3MusicLibraryResourcesManager *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_implementation, 0);
}

- (void)setImplementation:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(ML3MusicLibraryResourcesManager *)self context];
  if ([v4 isMultiUserSupported])
  {

    [v7 encodeBool:0 forKey:@"isManagingResourceForSingleUserWithAccountInfoKey"];
  }
  else
  {
    id v5 = [(ML3MusicLibraryResourcesManager *)self context];
    v6 = [v5 accountInfo];

    [v7 encodeBool:v6 != 0 forKey:@"isManagingResourceForSingleUserWithAccountInfoKey"];
    if (v6) {
      [v7 encodeObject:self->_implementation forKey:@"implementationKey"];
    }
  }
}

- (ML3MusicLibraryResourcesManager)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"isManagingResourceForSingleUserWithAccountInfoKey"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"implementationKey"];
    self = [(ML3MusicLibraryResourcesManager *)self initWithBaseResourcesManager:v5];

    v6 = self;
  }
  else
  {
    v6 = +[ML3MusicLibraryResourcesManager sharedManager];
  }

  return v6;
}

- (ML3MusicLibraryResourcesManager)initWithBaseResourcesManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3MusicLibraryResourcesManager;
  v6 = [(ML3MusicLibraryResourcesManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_implementation, a3);
  }

  return v7;
}

- (id)mediaFolderRelativePath:(id)a3
{
  id v4 = a3;
  id v5 = [(ML3MusicLibraryResourcesManager *)self implementation];
  v6 = [v5 mediaFolderRelativePath:v4];

  return v6;
}

- (id)pathForBaseLocationPath:(int64_t)a3
{
  id v4 = [(ML3MusicLibraryResourcesManager *)self implementation];
  id v5 = [v4 pathForBaseLocationPath:a3];

  return v5;
}

- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v11 = [(ML3MusicLibraryResourcesManager *)self implementation];
  v12 = [v11 pathForResourceFileOrFolder:v8 basePath:v10 relativeToBase:v7 createParentFolderIfNecessary:v6];

  return v12;
}

- (id)musicAssetsContainerPath
{
  v2 = [(ML3MusicLibraryResourcesManager *)self implementation];
  id v3 = [v2 musicAssetsContainerPath];

  return v3;
}

- (id)libraryContainerRelativePath:(id)a3
{
  id v4 = a3;
  id v5 = [(ML3MusicLibraryResourcesManager *)self implementation];
  BOOL v6 = [v5 libraryContainerRelativePath:v4];

  return v6;
}

- (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(ML3MusicLibraryResourcesManager *)self implementation];
  BOOL v6 = [v5 libraryContainerPathByAppendingPathComponent:v4];

  return v6;
}

- (id)libraryContainerPath
{
  v2 = [(ML3MusicLibraryResourcesManager *)self implementation];
  id v3 = [v2 libraryContainerPath];

  return v3;
}

- (void)setContext:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    id v5 = (ML3MusicLibraryResourcesManagerContext *)v4;
  }
  else
  {
    id v5 = +[ML3MusicLibraryResourcesManagerContext contextForAutoupdatingSharedLibrary];
  }
  context = self->_context;
  self->_context = v5;

  implementation = self->_implementation;
  self->_implementation = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface _ML3BaseMusicLibraryResourcesManager
+ (BOOL)supportsSecureCoding;
- (BOOL)_mediaResourceRequiresLibraryContainerAccess:(int)a3;
- (NSString)libraryContainerIdentifier;
- (_ML3BaseMusicLibraryResourcesManager)init;
- (_ML3BaseMusicLibraryResourcesManager)initWithAccountInfo:(id)a3;
- (_ML3BaseMusicLibraryResourcesManager)initWithCoder:(id)a3;
- (_ML3BaseMusicLibraryResourcesManager)initWithLibraryContainerIdentifier:(id)a3;
- (id)_controlDirectoryPathWithBasePath:(id)a3;
- (id)_libraryContainerPathForDSID:(id)a3;
- (id)_mediaPath;
- (id)_mediaRelativeMusicAssetsDirectoryPath;
- (id)_musicAssetsPathRelativeToBasePath:(id)a3;
- (id)_pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 isFolder:(BOOL *)a6;
- (id)libraryContainerPath;
- (id)libraryContainerPathByAppendingPathComponent:(id)a3;
- (id)libraryContainerRelativePath:(id)a3;
- (id)mediaFolderRelativePath:(id)a3;
- (id)musicAssetsContainerPath;
- (id)pathForBaseLocationPath:(int64_t)a3;
- (id)pathForResourceFileOrFolder:(int)a3;
- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ML3BaseMusicLibraryResourcesManager

- (id)pathForResourceFileOrFolder:(int)a3
{
  return [(_ML3BaseMusicLibraryResourcesManager *)self _pathForResourceFileOrFolder:*(void *)&a3 basePath:0 relativeToBase:0 isFolder:0];
}

- (id)_pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 isFolder:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  v130[4] = *MEMORY[0x1E4F143B8];
  v11 = (__CFString *)a4;
  v12 = v11;
  if (v7) {
    goto LABEL_6;
  }
  if (v11 && [(__CFString *)v11 length]) {
    goto LABEL_8;
  }
  if (![(_ML3BaseMusicLibraryResourcesManager *)self _mediaResourceRequiresLibraryContainerAccess:v8])
  {
LABEL_6:
    v13 = &stru_1F08D4D70;
  }
  else
  {
    v13 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerPath];
  }

  v12 = v13;
LABEL_8:
  v14 = [(_ML3BaseMusicLibraryResourcesManager *)self _controlDirectoryPathWithBasePath:v12];
  v15 = v14;
  switch((int)v8)
  {
    case 0:
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"_ML3BaseMusicLibraryResourcesManager.m" lineNumber:298 description:@"Invalid resource"];

      goto LABEL_10;
    case 1:
      v19 = @"iTunes/iTunesSyncDeletes.plist";
      goto LABEL_19;
    case 2:
      v19 = @"iTunes/PlayCounts.plist";
      goto LABEL_19;
    case 3:
      v19 = @"iTunes/OnTheGoPlaylist.plist";
      goto LABEL_19;
    case 4:
      v19 = @"iTunes/OnTheGoPlaylist_%llu.plist";
      goto LABEL_19;
    case 5:
      v19 = @"iTunes/GeniusPlaylist.plist";
      goto LABEL_19;
    case 6:
      v19 = @"iTunes/GeniusPlaylist_%llu.plist";
      goto LABEL_19;
    case 7:
      v19 = @"iTunes/Playlist_%llu.plist";
LABEL_19:
      v18 = [v14 stringByAppendingPathComponent:v19];
      goto LABEL_56;
    case 8:
      v20 = [(_ML3BaseMusicLibraryResourcesManager *)self _musicAssetsPathRelativeToBasePath:v12];
      v21 = v20;
      v22 = @"Cache";
      goto LABEL_23;
    case 9:
      v20 = [(_ML3BaseMusicLibraryResourcesManager *)self _musicAssetsPathRelativeToBasePath:v12];
      v21 = v20;
      v22 = @"Cache_LoFi";
      goto LABEL_23;
    case 10:
      v20 = [(_ML3BaseMusicLibraryResourcesManager *)self _musicAssetsPathRelativeToBasePath:v12];
      v21 = v20;
      v22 = @"Downloads";
LABEL_23:
      uint64_t v23 = [v20 stringByAppendingPathComponent:v22];
      goto LABEL_42;
    case 11:
      v24 = NSString;
      v21 = MLMobileUserHomeDirectory();
      v130[0] = v21;
      v130[1] = @"Media";
      v130[2] = @"iTunes_Control";
      v130[3] = @"Music";
      v25 = (void *)MEMORY[0x1E4F1C978];
      v26 = v130;
      goto LABEL_64;
    case 12:
      if (!v14)
      {
        dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
        v84 = (void *)MEMORY[0x1E4F77950];
        uint64_t v80 = *MEMORY[0x1E4F778C0];
        v127[0] = @"Resource";
        v88 = [NSNumber numberWithUnsignedInt:12];
        v128[0] = v88;
        v127[1] = @"RelativeToBase";
        uint64_t v28 = [NSNumber numberWithBool:v7];
        v29 = (void *)v28;
        v127[2] = @"BasePath";
        v30 = @"nil";
        if (v12) {
          v30 = v12;
        }
        v128[1] = v28;
        v128[2] = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:3];
        v129 = v31;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __102___ML3BaseMusicLibraryResourcesManager__pathForResourceFileOrFolder_basePath_relativeToBase_isFolder___block_invoke;
        v98[3] = &unk_1E5FB8298;
        dispatch_semaphore_t v99 = v27;
        v33 = v27;
        [v84 snapshotWithDomain:v80 type:@"Bug" subType:@"InvalidPathForResource" context:@"Invalid Control Directory Path" triggerThresholdValues:0 events:v32 completion:v98];

        dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      }
      v34 = NSString;
      v126[0] = v15;
      v126[1] = @"iTunes";
      v126[2] = @"Artwork";
      v35 = (void *)MEMORY[0x1E4F1C978];
      v36 = v126;
      uint64_t v37 = 3;
      goto LABEL_41;
    case 13:
      if (!v14)
      {
        dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
        v85 = (void *)MEMORY[0x1E4F77950];
        uint64_t v81 = *MEMORY[0x1E4F778C0];
        v123[0] = @"Resource";
        v89 = [NSNumber numberWithUnsignedInt:13];
        v124[0] = v89;
        v123[1] = @"RelativeToBase";
        uint64_t v39 = [NSNumber numberWithBool:v7];
        v40 = (void *)v39;
        v123[2] = @"BasePath";
        v41 = @"nil";
        if (v12) {
          v41 = v12;
        }
        v124[1] = v39;
        v124[2] = v41;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:3];
        v125 = v42;
        v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = __102___ML3BaseMusicLibraryResourcesManager__pathForResourceFileOrFolder_basePath_relativeToBase_isFolder___block_invoke_2;
        v96[3] = &unk_1E5FB8298;
        dispatch_semaphore_t v97 = v38;
        v44 = v38;
        [v85 snapshotWithDomain:v81 type:@"Bug" subType:@"InvalidPathForResource" context:@"Invalid Control Directory Path" triggerThresholdValues:0 events:v43 completion:v96];

        dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
      }
      v34 = NSString;
      v122[0] = v15;
      v122[1] = @"iTunes";
      v122[2] = @"Artwork";
      v122[3] = @"Originals";
      v35 = (void *)MEMORY[0x1E4F1C978];
      v36 = v122;
      goto LABEL_40;
    case 14:
      if (!v14)
      {
        dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
        v86 = (void *)MEMORY[0x1E4F77950];
        uint64_t v82 = *MEMORY[0x1E4F778C0];
        v119[0] = @"Resource";
        v90 = [NSNumber numberWithUnsignedInt:14];
        v120[0] = v90;
        v119[1] = @"RelativeToBase";
        uint64_t v46 = [NSNumber numberWithBool:v7];
        v47 = (void *)v46;
        v119[2] = @"BasePath";
        v48 = @"nil";
        if (v12) {
          v48 = v12;
        }
        v120[1] = v46;
        v120[2] = v48;
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:3];
        v121 = v49;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __102___ML3BaseMusicLibraryResourcesManager__pathForResourceFileOrFolder_basePath_relativeToBase_isFolder___block_invoke_3;
        v94[3] = &unk_1E5FB8298;
        dispatch_semaphore_t v95 = v45;
        v51 = v45;
        [v86 snapshotWithDomain:v82 type:@"Bug" subType:@"InvalidPathForResource" context:@"Invalid Control Directory Path" triggerThresholdValues:0 events:v50 completion:v94];

        dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);
      }
      v34 = NSString;
      v118[0] = v15;
      v118[1] = @"iTunes";
      v118[2] = @"Artwork";
      v118[3] = @"Caches";
      v35 = (void *)MEMORY[0x1E4F1C978];
      v36 = v118;
LABEL_40:
      uint64_t v37 = 4;
LABEL_41:
      v21 = [v35 arrayWithObjects:v36 count:v37];
      uint64_t v23 = [v34 pathWithComponents:v21];
LABEL_42:
      v18 = (void *)v23;
      goto LABEL_65;
    case 15:
      if (!v14)
      {
        dispatch_semaphore_t v52 = dispatch_semaphore_create(0);
        v87 = (void *)MEMORY[0x1E4F77950];
        uint64_t v83 = *MEMORY[0x1E4F778C0];
        v115[0] = @"Resource";
        v91 = [NSNumber numberWithUnsignedInt:15];
        v116[0] = v91;
        v115[1] = @"RelativeToBase";
        uint64_t v53 = [NSNumber numberWithBool:v7];
        v54 = (void *)v53;
        v115[2] = @"BasePath";
        v55 = @"nil";
        if (v12) {
          v55 = v12;
        }
        v116[1] = v53;
        v116[2] = v55;
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:3];
        v117 = v56;
        v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __102___ML3BaseMusicLibraryResourcesManager__pathForResourceFileOrFolder_basePath_relativeToBase_isFolder___block_invoke_4;
        v92[3] = &unk_1E5FB8298;
        dispatch_semaphore_t v93 = v52;
        v58 = v52;
        [v87 snapshotWithDomain:v83 type:@"Bug" subType:@"InvalidPathForResource" context:@"Invalid Control Directory Path" triggerThresholdValues:0 events:v57 completion:v92];

        dispatch_semaphore_wait(v58, 0xFFFFFFFFFFFFFFFFLL);
      }
      v59 = NSString;
      v60 = objc_msgSend(v15, "msv_stringByResolvingRealPath");
      v114[0] = v60;
      v114[1] = @"iTunes";
      v114[2] = @"MediaLibrary.sqlitedb";
      v61 = (void *)MEMORY[0x1E4F1C978];
      v62 = v114;
      uint64_t v63 = 3;
      goto LABEL_54;
    case 16:
      v64 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v60 = v64;
      v65 = @"MLSections";
      goto LABEL_50;
    case 17:
      v64 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v60 = v64;
      v65 = @"SortingDetails";
LABEL_50:
      v18 = [v64 pathForResource:v65 ofType:@"plist"];
      goto LABEL_55;
    case 18:
      v59 = NSString;
      v60 = MLMobileUserHomeDirectory();
      v113[0] = v60;
      v113[1] = @"Library";
      v113[2] = @"MusicLibrary";
      v113[3] = @"FailedArtworkConversion.plist";
      v61 = (void *)MEMORY[0x1E4F1C978];
      v62 = v113;
      goto LABEL_53;
    case 19:
      v59 = NSString;
      v60 = MLMobileUserHomeDirectory();
      v112[0] = v60;
      v112[1] = @"Library";
      v112[2] = @"MusicLibrary";
      v112[3] = @"Backups";
      v61 = (void *)MEMORY[0x1E4F1C978];
      v62 = v112;
LABEL_53:
      uint64_t v63 = 4;
LABEL_54:
      v66 = [v61 arrayWithObjects:v62 count:v63];
      v18 = [v59 pathWithComponents:v66];

LABEL_55:
LABEL_56:
      BOOL v17 = 0;
      if (!a6) {
        goto LABEL_70;
      }
      goto LABEL_69;
    case 20:
      v67 = @"Podcasts";
      goto LABEL_62;
    case 21:
      v67 = @"Purchases";
      goto LABEL_62;
    case 22:
      v67 = @"ManagedPurchases/TVApp";
      goto LABEL_62;
    case 23:
      v67 = @"ManagedPurchases/Books";
LABEL_62:
      uint64_t v68 = +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:v67];
      goto LABEL_67;
    case 24:
      v24 = NSString;
      v21 = MLMobileUserHomeDirectory();
      v111[0] = v21;
      v111[1] = @"Library";
      v111[2] = @"Logs";
      v111[3] = @"MediaServices";
      v25 = (void *)MEMORY[0x1E4F1C978];
      v26 = v111;
LABEL_64:
      v69 = [v25 arrayWithObjects:v26 count:4];
      v18 = [v24 pathWithComponents:v69];

LABEL_65:
      goto LABEL_68;
    case 25:
      uint64_t v68 = [v14 stringByAppendingPathComponent:@"iTunes"];
LABEL_67:
      v18 = (void *)v68;
LABEL_68:
      BOOL v17 = 1;
      if (a6) {
        goto LABEL_69;
      }
      goto LABEL_70;
    default:
LABEL_10:
      BOOL v17 = 0;
      v18 = 0;
      if (!a6) {
        goto LABEL_70;
      }
LABEL_69:
      *a6 = v17;
LABEL_70:
      if (!v18 || ![v18 length])
      {
        v70 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          int v104 = v8;
          __int16 v105 = 1024;
          BOOL v106 = v7;
          __int16 v107 = 2114;
          v108 = v12;
          __int16 v109 = 2114;
          v110 = v15;
          _os_log_impl(&dword_1B022D000, v70, OS_LOG_TYPE_ERROR, "Computed invalid path for resource=%d, relativeToBase=%{BOOL}u, basePath=%{public}@, controlDirectoryPath=%{public}@", buf, 0x22u);
        }

        v71 = (void *)MEMORY[0x1E4F77950];
        uint64_t v72 = *MEMORY[0x1E4F778C0];
        v100[0] = @"Resource";
        v73 = [NSNumber numberWithUnsignedInt:v8];
        v101[0] = v73;
        v100[1] = @"RelativeToBase";
        uint64_t v74 = [NSNumber numberWithBool:v7];
        v75 = (void *)v74;
        v100[2] = @"BasePath";
        v76 = @"nil";
        if (v12) {
          v76 = v12;
        }
        v101[1] = v74;
        v101[2] = v76;
        v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];
        v102 = v77;
        v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
        [v71 snapshotWithDomain:v72 type:@"Bug" subType:@"InvalidPathForResource" context:@"Invalid Control Directory Path" triggerThresholdValues:0 events:v78 completion:0];
      }
      return v18;
  }
}

- (id)libraryContainerPath
{
  v3 = [(_ML3BaseMusicLibraryResourcesManager *)self _mediaPath];
  v4 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerIdentifier];

  if (v4)
  {
    v5 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerIdentifier];
    uint64_t v6 = [v3 stringByAppendingPathComponent:v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (NSString)libraryContainerIdentifier
{
  return self->_libraryContainerIdentifier;
}

- (BOOL)_mediaResourceRequiresLibraryContainerAccess:(int)a3
{
  if (a3 > 0x19) {
    goto LABEL_7;
  }
  BOOL result = 1;
  if (((1 << a3) & 0x200F8FE) != 0) {
    return result;
  }
  if (((1 << a3) & 0x1FF0700) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_ML3BaseMusicLibraryResourcesManager.m" lineNumber:201 description:@"Invalid resource"];

LABEL_7:
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_ML3BaseMusicLibraryResourcesManager.m" lineNumber:232 description:@"Invalid resource"];
  }
  return 0;
}

- (id)_mediaPath
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = MLMobileUserHomeDirectory();
  v7[0] = v3;
  v7[1] = @"Media";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v5 = [v2 pathWithComponents:v4];

  return v5;
}

- (id)_controlDirectoryPathWithBasePath:(id)a3
{
  return (id)[a3 stringByAppendingPathComponent:@"iTunes_Control"];
}

- (_ML3BaseMusicLibraryResourcesManager)initWithAccountInfo:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 accountDSID];

  if (v5)
  {
    id v6 = [v4 accountDSID];
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    memset(&v61, 0, sizeof(v61));
    uint64_t v60 = 4001;
    CC_SHA1_Init(&v61);
    id v7 = v6;
    CC_SHA1_Update(&v61, (const void *)[v7 UTF8String], objc_msgSend(v7, "length"));

    memset(&v69[8], 0, 64);
    *(void *)v69 = 4001;
    CC_SHA1_Final(&v69[8], &v61);
    v70[0] = *(_OWORD *)v69;
    v70[1] = *(_OWORD *)&v69[16];
    v70[2] = *(_OWORD *)&v69[32];
    v70[3] = *(_OWORD *)&v69[48];
    uint64_t v71 = *(void *)&v69[64];
    if (*(uint64_t *)v69 > 3999)
    {
      if (*(uint64_t *)v69 > 4255)
      {
        if (*(void *)v69 == 4256)
        {
          v50 = (unsigned __int8 *)v70 + 8;
          v51 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          dispatch_semaphore_t v52 = v51;
          for (uint64_t i = 0; i != 64; i += 2)
          {
            unsigned int v54 = *v50++;
            v55 = &v51[i];
            char *v55 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v54 >> 4];
            v55[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v54 & 0xF];
          }
          id v21 = [NSString alloc];
          v22 = v52;
          uint64_t v23 = 64;
        }
        else
        {
          if (*(void *)v69 != 4512) {
            goto LABEL_52;
          }
          uint64_t v28 = (unsigned __int8 *)v70 + 8;
          v29 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          v30 = v29;
          for (uint64_t j = 0; j != 128; j += 2)
          {
            unsigned int v32 = *v28++;
            v33 = &v29[j];
            char *v33 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v32 >> 4];
            v33[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v32 & 0xF];
          }
          id v21 = [NSString alloc];
          v22 = v30;
          uint64_t v23 = 128;
        }
      }
      else if (*(void *)v69 == 4000)
      {
        v40 = (unsigned __int8 *)v70 + 8;
        v41 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        v42 = v41;
        for (uint64_t k = 0; k != 32; k += 2)
        {
          unsigned int v44 = *v40++;
          dispatch_semaphore_t v45 = &v41[k];
          *dispatch_semaphore_t v45 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v44 >> 4];
          v45[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v44 & 0xF];
        }
        id v21 = [NSString alloc];
        v22 = v42;
        uint64_t v23 = 32;
      }
      else
      {
        if (*(void *)v69 != 4001) {
          goto LABEL_52;
        }
        v15 = (unsigned __int8 *)v70 + 8;
        v16 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        BOOL v17 = v16;
        for (uint64_t m = 0; m != 40; m += 2)
        {
          unsigned int v19 = *v15++;
          v20 = &v16[m];
          char *v20 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v19 >> 4];
          v20[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v19 & 0xF];
        }
        id v21 = [NSString alloc];
        v22 = v17;
        uint64_t v23 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v69 <= 2999)
      {
        if (*(void *)v69 == 1000)
        {
          uint64_t v34 = *((void *)&v70[0] + 1);
          v35 = (char *)&v73 + 1;
          uint64_t quot = *((void *)&v70[0] + 1);
          do
          {
            lldiv_t v37 = lldiv(quot, 10);
            uint64_t quot = v37.quot;
            if (v37.rem >= 0) {
              LOBYTE(v38) = v37.rem;
            }
            else {
              uint64_t v38 = -v37.rem;
            }
            *(v35 - 2) = v38 + 48;
            v14 = (const UInt8 *)(v35 - 2);
            --v35;
          }
          while (v37.quot);
          if (v34 < 0)
          {
            *(v35 - 2) = 45;
            v14 = (const UInt8 *)(v35 - 2);
          }
          v13 = (char *)((char *)&v73 - (char *)v14);
          goto LABEL_38;
        }
        if (*(void *)v69 == 2000)
        {
          uint64_t v9 = DWORD2(v70[0]);
          v10 = &v73;
          do
          {
            ldiv_t v11 = ldiv(v9, 10);
            uint64_t v9 = v11.quot;
            if (v11.rem >= 0) {
              LOBYTE(v12) = v11.rem;
            }
            else {
              uint64_t v12 = -v11.rem;
            }
            *((unsigned char *)v10 - 1) = v12 + 48;
            v10 = (uint64_t *)((char *)v10 - 1);
          }
          while (v11.quot);
          v13 = (char *)((char *)&v73 - (char *)v10);
          v14 = (const UInt8 *)v10;
LABEL_38:
          CFStringRef v39 = CFStringCreateWithBytes(0, v14, (CFIndex)v13, 0x8000100u, 0);
LABEL_49:
          uint64_t v8 = (__CFString *)v39;
LABEL_50:

          goto LABEL_51;
        }
LABEL_52:
        v58 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 4001, *(void *)&v61.h0);
        v59 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
        [v58 handleFailureInFunction:v59 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

        uint64_t v8 = &stru_1F08D4D70;
        goto LABEL_50;
      }
      if (*(void *)v69 == 3000)
      {
        LODWORD(v72[0]) = bswap32(DWORD2(v70[0]));
        uint64_t v46 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v47 = 0;
        v48 = v46 + 1;
        do
        {
          unint64_t v49 = *((unsigned __int8 *)v72 + v47);
          *(v48 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v49 >> 4];
          unsigned char *v48 = MSVFastHexStringFromBytes_hexCharacters_27232[v49 & 0xF];
          v48 += 2;
          ++v47;
        }
        while (v47 != 4);
        id v21 = [NSString alloc];
        v22 = v46;
        uint64_t v23 = 8;
      }
      else
      {
        if (*(void *)v69 != 3001) {
          goto LABEL_52;
        }
        v72[0] = bswap64(*((unint64_t *)&v70[0] + 1));
        v24 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v25 = 0;
        v26 = v24 + 1;
        do
        {
          unint64_t v27 = *((unsigned __int8 *)v72 + v25);
          *(v26 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v27 >> 4];
          unsigned char *v26 = MSVFastHexStringFromBytes_hexCharacters_27232[v27 & 0xF];
          v26 += 2;
          ++v25;
        }
        while (v25 != 8);
        id v21 = [NSString alloc];
        v22 = v24;
        uint64_t v23 = 16;
      }
    }
    CFStringRef v39 = (CFStringRef)objc_msgSend(v21, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v22, v23, 4, 1, 4001, *(void *)&v61.h0);
    goto LABEL_49;
  }
  uint64_t v8 = 0;
LABEL_51:
  v56 = -[_ML3BaseMusicLibraryResourcesManager initWithLibraryContainerIdentifier:](self, "initWithLibraryContainerIdentifier:", v8, v60);

  return v56;
}

- (_ML3BaseMusicLibraryResourcesManager)initWithLibraryContainerIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ML3BaseMusicLibraryResourcesManager;
  v5 = [(_ML3BaseMusicLibraryResourcesManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    libraryContainerIdentifier = v5->_libraryContainerIdentifier;
    v5->_libraryContainerIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (id)_mediaRelativeMusicAssetsDirectoryPath
{
  v3 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerIdentifier];

  if (v3)
  {
    id v4 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerIdentifier];
    v5 = [@"Music" stringByAppendingPathComponent:v4];
  }
  else
  {
    v5 = @"Music";
  }

  return v5;
}

- (id)_musicAssetsPathRelativeToBasePath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_ML3BaseMusicLibraryResourcesManager *)self musicAssetsContainerPath];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v6 = v5;
    if ([v4 length])
    {
      uint64_t v7 = [v5 rangeOfString:v4];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          int v10 = 138543619;
          id v11 = v4;
          __int16 v12 = 2113;
          id v13 = v5;
          _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_FAULT, "_musicAssetsPathWithBasePath recieved invalid base path %{public}@ for music assets path %{private}@", (uint8_t *)&v10, 0x16u);
        }

        uint64_t v6 = v5;
      }
      else
      {
        uint64_t v6 = [v5 substringFromIndex:v7];
      }
    }
  }

  return v6;
}

- (id)_libraryContainerPathForDSID:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v66 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  long long v62 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  memset(&v59, 0, sizeof(v59));
  CC_SHA1_Init(&v59);
  id v5 = v4;
  CC_SHA1_Update(&v59, (const void *)[v5 UTF8String], objc_msgSend(v5, "length"));

  memset(&v67[8], 0, 64);
  *(void *)long long v67 = 4001;
  CC_SHA1_Final(&v67[8], &v59);
  v68[0] = *(_OWORD *)v67;
  v68[1] = *(_OWORD *)&v67[16];
  v68[2] = *(_OWORD *)&v67[32];
  v68[3] = *(_OWORD *)&v67[48];
  uint64_t v69 = *(void *)&v67[64];
  if (*(uint64_t *)v67 > 3999)
  {
    if (*(uint64_t *)v67 > 4255)
    {
      if (*(void *)v67 == 4256)
      {
        uint64_t v47 = (unsigned __int8 *)v68 + 8;
        v48 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        unint64_t v49 = v48;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v51 = *v47++;
          dispatch_semaphore_t v52 = &v48[i];
          *dispatch_semaphore_t v52 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v51 >> 4];
          v52[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v51 & 0xF];
        }
        id v18 = [NSString alloc];
        unsigned int v19 = v49;
        uint64_t v20 = 64;
      }
      else
      {
        if (*(void *)v67 != 4512) {
          goto LABEL_50;
        }
        uint64_t v25 = (unsigned __int8 *)v68 + 8;
        v26 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        unint64_t v27 = v26;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v29 = *v25++;
          v30 = &v26[j];
          char *v30 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v29 & 0xF];
        }
        id v18 = [NSString alloc];
        unsigned int v19 = v27;
        uint64_t v20 = 128;
      }
    }
    else if (*(void *)v67 == 4000)
    {
      lldiv_t v37 = (unsigned __int8 *)v68 + 8;
      uint64_t v38 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      CFStringRef v39 = v38;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v41 = *v37++;
        v42 = &v38[k];
        char *v42 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v41 >> 4];
        v42[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v41 & 0xF];
      }
      id v18 = [NSString alloc];
      unsigned int v19 = v39;
      uint64_t v20 = 32;
    }
    else
    {
      if (*(void *)v67 != 4001) {
        goto LABEL_50;
      }
      __int16 v12 = (unsigned __int8 *)v68 + 8;
      id v13 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v14 = v13;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v16 = *v12++;
        BOOL v17 = &v13[m];
        *BOOL v17 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v16 >> 4];
        v17[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v16 & 0xF];
      }
      id v18 = [NSString alloc];
      unsigned int v19 = v14;
      uint64_t v20 = 40;
    }
LABEL_45:
    CFStringRef v36 = (CFStringRef)objc_msgSend(v18, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v19, v20, 4, 1, 4001, *(void *)&v59.h0);
    goto LABEL_46;
  }
  if (*(uint64_t *)v67 > 2999)
  {
    if (*(void *)v67 == 3000)
    {
      LODWORD(v70[0]) = bswap32(DWORD2(v68[0]));
      v43 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v44 = 0;
      dispatch_semaphore_t v45 = v43 + 1;
      do
      {
        unint64_t v46 = *((unsigned __int8 *)v70 + v44);
        *(v45 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v46 >> 4];
        *dispatch_semaphore_t v45 = MSVFastHexStringFromBytes_hexCharacters_27232[v46 & 0xF];
        v45 += 2;
        ++v44;
      }
      while (v44 != 4);
      id v18 = [NSString alloc];
      unsigned int v19 = v43;
      uint64_t v20 = 8;
    }
    else
    {
      if (*(void *)v67 != 3001) {
        goto LABEL_50;
      }
      v70[0] = bswap64(*((unint64_t *)&v68[0] + 1));
      id v21 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v22 = 0;
      uint64_t v23 = v21 + 1;
      do
      {
        unint64_t v24 = *((unsigned __int8 *)v70 + v22);
        *(v23 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v24 >> 4];
        *uint64_t v23 = MSVFastHexStringFromBytes_hexCharacters_27232[v24 & 0xF];
        v23 += 2;
        ++v22;
      }
      while (v22 != 8);
      id v18 = [NSString alloc];
      unsigned int v19 = v21;
      uint64_t v20 = 16;
    }
    goto LABEL_45;
  }
  if (*(void *)v67 == 1000)
  {
    uint64_t v31 = *((void *)&v68[0] + 1);
    unsigned int v32 = (char *)&v71 + 1;
    uint64_t quot = *((void *)&v68[0] + 1);
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
      id v11 = (const UInt8 *)(v32 - 2);
      --v32;
    }
    while (v34.quot);
    if (v31 < 0)
    {
      *(v32 - 2) = 45;
      id v11 = (const UInt8 *)(v32 - 2);
    }
    int v10 = (char *)((char *)&v71 - (char *)v11);
    goto LABEL_35;
  }
  if (*(void *)v67 == 2000)
  {
    uint64_t v6 = DWORD2(v68[0]);
    uint64_t v7 = &v71;
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
    int v10 = (char *)((char *)&v71 - (char *)v7);
    id v11 = (const UInt8 *)v7;
LABEL_35:
    CFStringRef v36 = CFStringCreateWithBytes(0, v11, (CFIndex)v10, 0x8000100u, 0);
LABEL_46:
    uint64_t v53 = (__CFString *)v36;
    goto LABEL_47;
  }
LABEL_50:
  v57 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 4001, *(void *)&v59.h0);
  v58 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v57 handleFailureInFunction:v58 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  uint64_t v53 = &stru_1F08D4D70;
LABEL_47:

  unsigned int v54 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerPath];
  v55 = [v54 stringByAppendingPathComponent:v53];

  return v55;
}

- (id)musicAssetsContainerPath
{
  v3 = [(_ML3BaseMusicLibraryResourcesManager *)self _mediaPath];
  id v4 = [(_ML3BaseMusicLibraryResourcesManager *)self _mediaRelativeMusicAssetsDirectoryPath];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)mediaFolderRelativePath:(id)a3
{
  id v4 = a3;
  id v5 = [(_ML3BaseMusicLibraryResourcesManager *)self _mediaPath];
  uint64_t v6 = [v4 relativePathFromBasePath:v5];

  return v6;
}

- (id)pathForBaseLocationPath:(int64_t)a3
{
  if (a3 <= 299)
  {
    switch(a3)
    {
      case 100:
        uint64_t v3 = 9;
        goto LABEL_17;
      case 200:
        uint64_t v3 = 8;
        goto LABEL_17;
      case 250:
        uint64_t v3 = 10;
        goto LABEL_17;
    }
  }
  else if (a3 > 499)
  {
    if (a3 == 500)
    {
      uint64_t v3 = 22;
      goto LABEL_17;
    }
    if (a3 == 600)
    {
      uint64_t v3 = 23;
      goto LABEL_17;
    }
  }
  else
  {
    if (a3 == 300)
    {
      uint64_t v3 = 21;
      goto LABEL_17;
    }
    if (a3 == 400)
    {
      uint64_t v3 = 20;
LABEL_17:
      id v4 = [(_ML3BaseMusicLibraryResourcesManager *)self pathForResourceFileOrFolder:v3];
      goto LABEL_18;
    }
  }
  if ((a3 & 0xF00) != 0)
  {
    uint64_t v6 = a3;
    uint64_t v7 = [(_ML3BaseMusicLibraryResourcesManager *)self _pathForResourceFileOrFolder:11 basePath:0 relativeToBase:0 isFolder:0];
    ldiv_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"F%02lld", v6);
    id v4 = [v7 stringByAppendingPathComponent:v8];
  }
  else
  {
    id v4 = 0;
  }
LABEL_18:

  return v4;
}

- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  char v22 = 0;
  uint64_t v7 = [(_ML3BaseMusicLibraryResourcesManager *)self _pathForResourceFileOrFolder:*(void *)&a3 basePath:a4 relativeToBase:a5 isFolder:&v22];
  ldiv_t v8 = v7;
  if (v22)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v7 stringByDeletingLastPathComponent];
  }
  int v10 = v9;
  id v11 = [v9 pathComponents];
  __int16 v12 = v11;
  if (v6 && (unint64_t)[v11 count] >= 2)
  {
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = [v12 objectAtIndex:0];
    uint64_t v15 = [v12 count];
    if (v15 >= 2)
    {
      uint64_t v16 = v15;
      for (uint64_t i = 1; i != v16; ++i)
      {
        id v18 = v14;
        unsigned int v19 = [v12 objectAtIndex:i];
        uint64_t v14 = [v14 stringByAppendingPathComponent:v19];

        if (([v13 fileExistsAtPath:v14 isDirectory:0] & 1) == 0) {
          [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];
        }
      }
    }
  }
  id v20 = v8;

  return v20;
}

- (id)libraryContainerRelativePath:(id)a3
{
  id v4 = a3;
  id v5 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerPath];
  BOOL v6 = [v4 relativePathFromBasePath:v5];

  return v6;
}

- (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerPath];
  BOOL v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_ML3BaseMusicLibraryResourcesManager *)self libraryContainerIdentifier];
  [v4 encodeObject:v5 forKey:@"ah"];
}

- (_ML3BaseMusicLibraryResourcesManager)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ah"];

  BOOL v6 = [(_ML3BaseMusicLibraryResourcesManager *)self initWithLibraryContainerIdentifier:v5];
  return v6;
}

- (_ML3BaseMusicLibraryResourcesManager)init
{
  return [(_ML3BaseMusicLibraryResourcesManager *)self initWithLibraryContainerIdentifier:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface PLPhotoStreamsHelper
+ (void)deletePhotoStreamAssetsWithLibraryServiceManager:(id)a3 withReason:(id)a4 completion:(id)a5;
@end

@implementation PLPhotoStreamsHelper

+ (void)deletePhotoStreamAssetsWithLibraryServiceManager:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F28CB8];
  id v10 = a3;
  v11 = [v9 defaultManager];
  v12 = [v10 pathManager];
  v13 = [v12 photoDirectoryWithType:14];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v15 = [v10 databaseContext];

  v16 = (void *)[v15 newShortLivedLibraryWithName:"+[PLPhotoStreamsHelper deletePhotoStreamAssetsWithLibraryServiceManager:withReason:completion:]"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke;
  v28[3] = &unk_1E5870F88;
  char v34 = 1;
  id v29 = v16;
  id v30 = v14;
  id v31 = v7;
  id v32 = v11;
  id v33 = v13;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke_37;
  v23[3] = &unk_1E5873CA8;
  char v27 = 1;
  id v24 = v33;
  id v25 = v32;
  id v26 = v8;
  id v17 = v8;
  id v18 = v32;
  id v19 = v33;
  id v20 = v7;
  id v21 = v14;
  id v22 = v16;
  [v22 performTransaction:v28 completionHandler:v23];
}

void __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v63 = [MEMORY[0x1E4F1CA48] array];
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = [*(id *)(a1 + 32) photoStreamAlbums];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v92;
      uint64_t v59 = *(void *)v92;
      obuint64_t j = v2;
      do
      {
        uint64_t v6 = 0;
        uint64_t v62 = v4;
        do
        {
          if (*(void *)v92 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v91 + 1) + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = [v7 personID];
            if (v8)
            {
              [*(id *)(a1 + 40) addObject:v8];
              [v63 addObject:v7];
            }
            else
            {
              uint64_t v68 = v6;
              v9 = PLMyPhotoStreamGetLog();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                id v10 = [v7 uuid];
                *(_DWORD *)buf = 138412290;
                v100 = v10;
                _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "found Photo Stream album with no streamID, uuid=%@ . deleting it", buf, 0xCu);
              }
              long long v89 = 0u;
              long long v90 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              v66 = v7;
              v11 = [v7 assets];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v87 objects:v103 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v88;
                do
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    if (*(void *)v88 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    v16 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                    id v17 = PLMyPhotoStreamGetLog();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                    {
                      id v18 = [v16 uuid];
                      id v19 = [v16 directory];
                      *(_DWORD *)buf = 138412546;
                      v100 = v18;
                      __int16 v101 = 2112;
                      id v102 = v19;
                      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "deleting photo %@:%@ in Photo Stream album with no stream ID", buf, 0x16u);
                    }
                    [v16 deleteWithReason:*(void *)(a1 + 48)];
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v87 objects:v103 count:16];
                }
                while (v13);
              }

              [v66 delete];
              uint64_t v5 = v59;
              v2 = obj;
              uint64_t v4 = v62;
              uint64_t v6 = v68;
              id v8 = 0;
            }
          }
          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v91 objects:v104 count:16];
      }
      while (v4);
    }
    id v20 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^[0-9]*$" options:0 error:0];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v21 = [*(id *)(a1 + 56) contentsOfDirectoryAtPath:*(void *)(a1 + 64) error:0];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v83 objects:v98 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v84 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          if (objc_msgSend(v20, "numberOfMatchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length")) == 1) {
            [*(id *)(a1 + 40) addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v83 objects:v98 count:16];
      }
      while (v23);
    }
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obja = v63;
  uint64_t v65 = [obja countByEnumeratingWithState:&v79 objects:v97 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v80;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v80 != v64) {
          objc_enumerationMutation(obja);
        }
        uint64_t v69 = v27;
        v28 = *(void **)(*((void *)&v79 + 1) + 8 * v27);
        id v29 = PLMyPhotoStreamGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          id v30 = [v28 title];
          *(_DWORD *)buf = 138412290;
          v100 = v30;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "albumToDelete %@", buf, 0xCu);
        }
        id v31 = [v28 assets];
        id v32 = *(void **)(a1 + 48);
        id v33 = NSString;
        char v34 = [v32 reason];
        v67 = v28;
        v35 = [v28 title];
        v36 = [v33 stringWithFormat:@"%@. Deleting all assets from PhotoStream album: %@.", v34, v35];
        [v32 setReason:v36];

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v37 = v31;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v75 objects:v96 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v76;
          do
          {
            for (uint64_t k = 0; k != v39; ++k)
            {
              if (*(void *)v76 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = *(void **)(*((void *)&v75 + 1) + 8 * k);
              v43 = PLMyPhotoStreamGetLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                v44 = [v42 uuid];
                v45 = [v42 directory];
                *(_DWORD *)buf = 138412546;
                v100 = v44;
                __int16 v101 = 2112;
                id v102 = v45;
                _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "deleting photo %@:%@", buf, 0x16u);
              }
              [v42 deleteWithReason:*(void *)(a1 + 48)];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v75 objects:v96 count:16];
          }
          while (v39);
        }

        v46 = PLMyPhotoStreamGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v47 = [v67 title];
          *(_DWORD *)buf = 138412290;
          v100 = v47;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEBUG, "deleting album %@", buf, 0xCu);
        }
        [v67 delete];

        uint64_t v27 = v69 + 1;
      }
      while (v69 + 1 != v65);
      uint64_t v65 = [obja countByEnumeratingWithState:&v79 objects:v97 count:16];
    }
    while (v65);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v48 = *(id *)(a1 + 40);
  uint64_t v49 = [v48 countByEnumeratingWithState:&v71 objects:v95 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v72;
    do
    {
      for (uint64_t m = 0; m != v50; ++m)
      {
        if (*(void *)v72 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = [*(id *)(a1 + 64) stringByAppendingPathComponent:*(void *)(*((void *)&v71 + 1) + 8 * m)];
        v54 = PLMyPhotoStreamGetLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v53;
          _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEBUG, "removing Photo Stream directory %@", buf, 0xCu);
        }

        v55 = *(void **)(a1 + 56);
        id v70 = 0;
        char v56 = [v55 removeItemAtPath:v53 error:&v70];
        id v57 = v70;
        if ((v56 & 1) == 0 && [*(id *)(a1 + 56) fileExistsAtPath:v53])
        {
          v58 = PLMyPhotoStreamGetLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v100 = v53;
            __int16 v101 = 2112;
            id v102 = v57;
            _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Failed to delete Photo Stream Data directory at path %@ : %@", buf, 0x16u);
          }
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v71 objects:v95 count:16];
    }
    while (v50);
  }
}

uint64_t __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke_37(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = PLMyPhotoStreamGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "removing Photo Stream data directory %@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    id v11 = 0;
    char v6 = [v4 removeItemAtPath:v5 error:&v11];
    id v7 = v11;
    if ((v6 & 1) == 0 && [*(id *)(a1 + 40) fileExistsAtPath:*(void *)(a1 + 32)])
    {
      id v8 = PLMyPhotoStreamGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed stream data directory %@ : %@", buf, 0x16u);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end
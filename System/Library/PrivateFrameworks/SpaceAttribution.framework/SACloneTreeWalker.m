@interface SACloneTreeWalker
+ (BOOL)isNodeID:(unint64_t)a3 oldestForDStreamID:(unint64_t)a4 forVolPath:(id)a5;
+ (id)getBundlesSetByPathForNodeID:(unint64_t)a3 forFsid:(fsid)a4 andPathList:(id)a5;
+ (id)getBundlesSetOfInode:(unint64_t)a3 withDirKey:(unint64_t)a4 andTag:(unint64_t)a5 inVolume:(statfs *)a6 usingPathList:(id)a7 andDirKeyCache:(id)a8;
+ (id)getDirInfoByDirKey:(unint64_t)a3 inVolume:(statfs *)a4 usingPathList:(id)a5 andDirKeyCache:(id)a6;
+ (void)addAttributedCloneToBundleSet:(id)a3 withCloneSize:(int64_t)a4 withPurgeableSize:(unint64_t)a5 onCloneData:(id)a6;
+ (void)addClonePathOfCloneID:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 dirStatKey:(unint64_t)a7 attributionTag:(unint64_t)a8 bundleSet:(id)a9 cloneData:(id)a10;
+ (void)addPurgeableCloneOfSize:(unint64_t)a3 isPurgeable:(BOOL)a4 withDirInfo:(id)a5 onCloneData:(id)a6;
+ (void)newFromAPFS:(unint64_t)a3 inVolume:(statfs *)a4 reply:(id)a5;
+ (void)processCloneMapOnVol:(id)a3 pathList:(id)a4 appSizeBreakdownList:(id)a5 dirKeyCache:(id)a6 collectClonesPaths:(BOOL)a7 reply:(id)a8;
+ (void)updateAppSizeBreakdownList:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 attributionTag:(unint64_t)a6 bundleSet:(id)a7 appSizeBreakdownList:(id)a8 pathList:(id)a9;
@end

@implementation SACloneTreeWalker

+ (void)newFromAPFS:(unint64_t)a3 inVolume:(statfs *)a4 reply:(id)a5
{
  id v7 = a5;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t v10 = 1;
  unint64_t v11 = 33;
  long long v13 = a3;
  if (fsctl(a4->f_mntonname, 0xC1104A71uLL, &v10, 1u))
  {
    v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000307E0(v8);
    }

    v9 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4866 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
  else
  {
    (*((void (**)(id, unint64_t, unint64_t, void))v7 + 2))(v7, (v11 >> 2) & 1, (v11 >> 3) & 1, 0);
  }
}

+ (id)getBundlesSetByPathForNodeID:(unint64_t)a3 forFsid:(fsid)a4 andPathList:(id)a5
{
  fsid v10 = a4;
  id v6 = a5;
  id v7 = +[SASupport getPathOfNodeID:a3 FSid:&v10];
  if (v7)
  {
    v8 = [v6 getBundlesSetForPath:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getDirInfoByDirKey:(unint64_t)a3 inVolume:(statfs *)a4 usingPathList:(id)a5 andDirKeyCache:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v29 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v11 = v10;
  objc_sync_enter(v11);
  long long v12 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v13 = [v11 objectForKey:v12];

  objc_sync_exit(v11);
  if (!v13)
  {
    f_mntonname = a4->f_mntonname;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    uint64_t v30 = 1;
    unint64_t v31 = 33;
    long long v33 = a3;
    if (fsctl(a4->f_mntonname, 0xC1104A71uLL, &v30, 1u))
    {
      unint64_t v15 = a3;
LABEL_4:
      long long v16 = SALog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000308DC(v15, v16);
      }

      id v13 = 0;
    }
    else
    {
      int v18 = 0;
      unint64_t v15 = a3;
      while (1)
      {
        v18 |= (v31 >> 3) & 1;
        if ((v31 & 4) != 0)
        {
          long long v19 = +[NSNumber numberWithUnsignedLongLong:v15];
          long long v20 = [v9 getBundlesSetForDirStatID:v19];

          if (v20)
          {
            id v13 = +[SADirCacheElement newWithBundleSet:v20 purgeable:v18 & 1 cacheFolder:0];

            goto LABEL_20;
          }
        }
        unint64_t v15 = *((void *)&v33 + 1);
        if (!*((void *)&v33 + 1)) {
          break;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v30 = 1;
        unint64_t v31 = 33;
        *(void *)&long long v33 = v15;
        if (fsctl(f_mntonname, 0xC1104A71uLL, &v30, 1u)) {
          goto LABEL_4;
        }
      }
      long long v21 = SALog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100030870(a3, v21, v22, v23, v24, v25, v26, v27);
      }

      id v13 = +[SADirCacheElement newWithBundleSet:0 purgeable:0 cacheFolder:0];
LABEL_20:
      if (v13)
      {
        id v28 = v11;
        objc_sync_enter(v28);
        [v28 setObject:v13 forKey:v29];
        objc_sync_exit(v28);
      }
    }
  }

  return v13;
}

+ (id)getBundlesSetOfInode:(unint64_t)a3 withDirKey:(unint64_t)a4 andTag:(unint64_t)a5 inVolume:(statfs *)a6 usingPathList:(id)a7 andDirKeyCache:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  if (a4)
  {
    long long v16 = [a1 getDirInfoByDirKey:a4 inVolume:a6 usingPathList:v14 andDirKeyCache:v15];
    long long v17 = v16;
    if (v16)
    {
      int v18 = [v16 bundlesSet];

      if (v18)
      {
        long long v19 = [v17 bundlesSet];

        goto LABEL_11;
      }
    }
  }
  if (a5
    && (+[SAAttributionTag getBundleIdForTag:a5 onVolumeName:a6->f_mntonname], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v21 = (void *)v20;
    long long v19 = +[NSSet setWithObject:v20];
  }
  else
  {
    long long v19 = [a1 getBundlesSetByPathForNodeID:a3 forFsid:*(void *)&a6->f_fsid andPathList:v14];
    if (!v19)
    {
      long long v19 = +[NSSet setWithObject:@"com.apple.fakeapp.SystemData"];
    }
  }
LABEL_11:

  return v19;
}

+ (void)addClonePathOfCloneID:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 dirStatKey:(unint64_t)a7 attributionTag:(unint64_t)a8 bundleSet:(id)a9 cloneData:(id)a10
{
  id v20 = a9;
  id v16 = a10;
  long long v17 = +[SASupport getPathOfNodeID:a3 FSid:a4];
  if (v17)
  {
    id v18 = +[SACloneInfo newWithDataSize:a5 cloneSize:a5 purgeableSize:a6 dirStatKey:a7 attributionTag:a8 clonePath:v17];
    long long v19 = [v16 objectForKeyedSubscript:v20];
    [v19 addCloneInfo:v18];
  }
}

+ (void)updateAppSizeBreakdownList:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 attributionTag:(unint64_t)a6 bundleSet:(id)a7 appSizeBreakdownList:(id)a8 pathList:(id)a9
{
  id v18 = a7;
  id v14 = a8;
  id v15 = a9;
  id v16 = +[SASupport getPathOfNodeID:a3 FSid:a4];
  if (v16)
  {
    if (a6)
    {
      [v14 updateTagsWithCloneSize:a5 bundleId:v18];
    }
    else
    {
      long long v17 = [v15 findAncestorOfPath:v16];
      [v14 updatePath:v17 cloneSize:a5 bundleId:v18];
    }
  }
}

+ (void)addAttributedCloneToBundleSet:(id)a3 withCloneSize:(int64_t)a4 withPurgeableSize:(unint64_t)a5 onCloneData:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v13 = +[SACloneSize newWithDataSize:a4 cloneSize:a4 purgeableSize:a5];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    long long v12 = [v9 objectForKeyedSubscript:v10];

    [v12 updateWithSizeInfo:v13];
    id v10 = v12;
  }
  else
  {
    [v9 setObject:v13 forKeyedSubscript:v10];
  }
}

+ (void)addPurgeableCloneOfSize:(unint64_t)a3 isPurgeable:(BOOL)a4 withDirInfo:(id)a5 onCloneData:(id)a6
{
  BOOL v7 = a4;
  id v16 = a5;
  id v9 = a6;
  if (v16)
  {
    id v10 = [v16 bundlesSet];

    if (v10)
    {
      id v11 = objc_opt_new();
      if ([v16 purgeable] && !v7) {
        objc_msgSend(v11, "setDataSize:", (char *)objc_msgSend(v11, "dataSize") + a3);
      }
      if (v7) {
        objc_msgSend(v11, "setDataSize:", (char *)objc_msgSend(v11, "dataSize") + a3);
      }
      long long v12 = [v16 bundlesSet];
      id v13 = [v9 objectForKeyedSubscript:v12];

      id v14 = [v16 bundlesSet];
      if (v13)
      {
        id v15 = [v9 objectForKeyedSubscript:v14];
        [v15 updateWithSizeInfo:v11];
      }
      else
      {
        [v9 setObject:v11 forKeyedSubscript:v14];
      }
    }
  }
}

+ (void)processCloneMapOnVol:(id)a3 pathList:(id)a4 appSizeBreakdownList:(id)a5 dirKeyCache:(id)a6 collectClonesPaths:(BOOL)a7 reply:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v84 = a5;
  id v88 = a6;
  id v16 = (void (**)(id, void, void *))a8;
  long long v17 = SALog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100030B70((uint64_t)v14, v17, v18, v19, v20, v21, v22, v23);
  }

  bzero(&v95, 0x878uLL);
  v80 = +[NSMutableDictionary dictionaryWithCapacity:100];
  id v24 = v14;
  if (statfs((const char *)[v24 UTF8String], &v95))
  {
    uint64_t v25 = *__error();
    uint64_t v26 = SALog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100030AFC();
    }

    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = v25;
LABEL_7:
    v29 = +[NSError errorWithDomain:v27 code:v28 userInfo:0];
    v16[2](v16, 0, v29);

    uint64_t v30 = 0;
    unint64_t v31 = 0;
    long long v32 = 0;
    goto LABEL_16;
  }
  long long v33 = (char *)malloc_type_malloc(0x1D4C0uLL, 0x1000040504FFAC1uLL);
  if (!v33)
  {
    long long v39 = SALog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100030980();
    }

    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 12;
    goto LABEL_7;
  }
  uint64_t v89 = 0x100000001;
  uint64_t v93 = 0x1D4C000000000;
  v94 = v33;
  v72 = v33;
  uint64_t v90 = 0;
  unint64_t v91 = 0;
  long long v92 = xmmword_10003C250;
  int v34 = fsctl(v95.f_mntonname, 0xC0384A74uLL, &v89, 1u);
  if (v34)
  {
    int v35 = v34;
    uint64_t v30 = 0;
    unint64_t v31 = 0;
    goto LABEL_11;
  }
  uint64_t v70 = (uint64_t)v24;
  v71 = v16;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  uint64_t v85 = 0;
  unint64_t v31 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  unint64_t v42 = 0;
  uint64_t v30 = 0;
  int v73 = !v9;
  int v87 = 1;
  do
  {
    if (HIDWORD(v93)) {
      BOOL v43 = 1;
    }
    else {
      BOOL v43 = v40 == 0;
    }
    if (!v43)
    {
      if (v87) {
        uint64_t v60 = 0;
      }
      else {
        uint64_t v60 = v85;
      }
      if (v87) {
        uint64_t v61 = v85;
      }
      else {
        uint64_t v61 = 0;
      }
      uint64_t v62 = [a1 getBundlesSetOfInode:v42 withDirKey:v82 andTag:v83 inVolume:&v95 usingPathList:v15 andDirKeyCache:v88];

      if (!v30 || ([v30 cacheFolder] & 1) == 0)
      {
        [a1 addAttributedCloneToBundleSet:v62 withCloneSize:v60 withPurgeableSize:v61 onCloneData:v80];
        if (!((v84 == 0) | v87 & 1)) {
          [a1 updateAppSizeBreakdownList:v42 FSId:&v95.f_fsid dataSize:v60 attributionTag:v83 bundleSet:v62 appSizeBreakdownList:v84 pathList:v15];
        }
      }
      if (((v73 | v87) & 1) == 0) {
        [a1 addClonePathOfCloneID:v42 FSId:&v95.f_fsid dataSize:v60 purgeableSize:v61 dirStatKey:v81 attributionTag:v83 bundleSet:v62 cloneData:v80];
      }
      long long v32 = 0;
      unint64_t v31 = (void *)v62;
      id v24 = (id)v70;
      id v16 = v71;
      goto LABEL_15;
    }
    if (HIDWORD(v93) < 0x18)
    {
      id v24 = (id)v70;
      id v16 = v71;
      if (!HIDWORD(v93))
      {
        v63 = SALog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
          sub_100030A00(v70, v63, v64, v65, v66, v67, v68, v69);
        }
      }
      NSErrorDomain v37 = NSPOSIXErrorDomain;
      uint64_t v38 = 5;
      goto LABEL_14;
    }
    uint64_t v44 = v40;
    if (HIDWORD(v93) != 24)
    {
      uint64_t v45 = 0;
      v75 = v94;
      unint64_t v76 = HIDWORD(v93);
      v74 = v94 + 48;
      int v79 = 24;
      long long v46 = v31;
      while (1)
      {
        long long v47 = &v75[v45];
        if (v44 && *(void *)v47 != v44)
        {
          uint64_t v48 = v85;
          if (v87) {
            uint64_t v49 = 0;
          }
          else {
            uint64_t v49 = v85;
          }
          if ((v87 & 1) == 0) {
            uint64_t v48 = 0;
          }
          uint64_t v86 = v48;
          unint64_t v31 = [a1 getBundlesSetOfInode:v42 withDirKey:v82 andTag:v83 inVolume:&v95 usingPathList:v15 andDirKeyCache:v88];

          if (!v30 || ([v30 cacheFolder] & 1) == 0)
          {
            [a1 addAttributedCloneToBundleSet:v31 withCloneSize:v49 withPurgeableSize:v86 onCloneData:v80];
            if (!((v84 == 0) | v87 & 1)) {
              [a1 updateAppSizeBreakdownList:v42 FSId:&v95.f_fsid dataSize:v49 attributionTag:v83 bundleSet:v31 appSizeBreakdownList:v84 pathList:v15];
            }
          }
          if (((v73 | v87) & 1) == 0) {
            [a1 addClonePathOfCloneID:v42 FSId:&v95.f_fsid dataSize:v49 purgeableSize:v86 dirStatKey:v81 attributionTag:v83 bundleSet:v31 cloneData:v80];
          }
          unint64_t v42 = 0;
          uint64_t v82 = 0;
          uint64_t v83 = 0;
          uint64_t v81 = 0;
          int v87 = 1;
        }
        else
        {
          unint64_t v31 = v46;
        }
        uint64_t v85 = *((void *)v47 + 1);
        int v77 = *((void *)v47 + 2);
        uint64_t v78 = *(void *)v47;
        if (*((void *)v47 + 2)) {
          break;
        }
LABEL_71:
        uint64_t v44 = v78;
        uint64_t v45 = (v79 + 32 * v77);
        long long v46 = v31;
        int v79 = v45 + 24;
        if (v45 + 24 >= v76) {
          goto LABEL_72;
        }
      }
      v50 = &v74[v45];
      uint64_t v51 = *((void *)v47 + 2);
      while (2)
      {
        unint64_t v41 = *((void *)v50 - 3);
        uint64_t v52 = *((void *)v50 - 1);
        uint64_t v53 = *(void *)v50 & 1;

        if (v52
          && ([a1 getDirInfoByDirKey:v52 inVolume:&v95 usingPathList:v15 andDirKeyCache:v88],
              (v54 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v30 = v54;
          if (([v54 cacheFolder] & 1) == 0)
          {
            [a1 addPurgeableCloneOfSize:v85 isPurgeable:v53 withDirInfo:v30 onCloneData:v80];
            int v55 = [v30 purgeable] ? 1 : v53;
            LOBYTE(v53) = v55 != 0;
            if (v84)
            {
              if (v55)
              {
                uint64_t v56 = *((void *)v50 - 2);
                v57 = [v30 bundlesSet];
                [a1 updateAppSizeBreakdownList:v41 FSId:&v95.f_fsid dataSize:v85 attributionTag:v56 bundleSet:v57 appSizeBreakdownList:v84 pathList:v15];

                unint64_t v31 = 0;
                goto LABEL_67;
              }
            }
          }
          unint64_t v31 = 0;
          if (v53)
          {
LABEL_67:
            v50 += 32;
            if (!--v51) {
              goto LABEL_71;
            }
            continue;
          }
        }
        else if (*((void *)v50 - 2))
        {
          unint64_t v31 = 0;
          uint64_t v30 = 0;
          if (v53)
          {
            uint64_t v30 = 0;
            goto LABEL_67;
          }
        }
        else
        {
          unint64_t v31 = [a1 getBundlesSetByPathForNodeID:v41 forFsid:*(void *)&v95.f_fsid andPathList:v15];
          uint64_t v30 = 0;
          if (v53) {
            goto LABEL_67;
          }
        }
        break;
      }
      v58 = [v30 bundlesSet];
      if (v58 || *((void *)v50 - 2))
      {

LABEL_64:
        if (v42 - 1 >= v41)
        {
          int v87 = 0;
          uint64_t v82 = v52;
          uint64_t v83 = *((void *)v50 - 2);
          uint64_t v81 = *((void *)v50 - 1);
          unint64_t v42 = v41;
          goto LABEL_67;
        }
      }
      else if (v31)
      {
        goto LABEL_64;
      }
      int v87 = 0;
      goto LABEL_67;
    }
LABEL_72:
    uint64_t v90 = v44;
    unint64_t v91 = v41;
    HIDWORD(v93) = 120000;
    int v59 = fsctl(v95.f_mntonname, 0xC0384A74uLL, &v89, 1u);
    uint64_t v40 = v44;
  }
  while (!v59);
  int v35 = v59;
  id v24 = (id)v70;
  id v16 = v71;
LABEL_11:
  long long v36 = SALog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100030A6C();
  }

  NSErrorDomain v37 = NSPOSIXErrorDomain;
  uint64_t v38 = v35;
LABEL_14:
  long long v32 = +[NSError errorWithDomain:v37 code:v38 userInfo:0];
LABEL_15:
  free(v72);
  ((void (**)(id, void *, void *))v16)[2](v16, v80, 0);
LABEL_16:
}

+ (BOOL)isNodeID:(unint64_t)a3 oldestForDStreamID:(unint64_t)a4 forVolPath:(id)a5
{
  id v7 = a5;
  bzero(&v27, 0x878uLL);
  id v8 = v7;
  if (statfs((const char *)[v8 UTF8String], &v27))
  {
    __error();
    BOOL v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100030C70();
    }
LABEL_4:

    BOOL v10 = 0;
    goto LABEL_35;
  }
  id v11 = (char *)malloc_type_malloc(0x1D4C0uLL, 0x1000040504FFAC1uLL);
  if (!v11)
  {
    BOOL v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100030BDC();
    }
    goto LABEL_4;
  }
  v22[0] = 0x100000001;
  uint64_t v26 = v11;
  long long v25 = xmmword_10003C260;
  unint64_t v23 = 0;
  uint64_t v24 = 0;
  v22[1] = a4;
  HIDWORD(v25) = 120000;
  if (fsctl(v27.f_mntonname, 0xC0384A74uLL, v22, 1u))
  {
    unint64_t v12 = -1;
LABEL_8:
    id v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100030A6C();
    }
  }
  else
  {
    unint64_t v14 = 0;
    unint64_t v12 = -1;
    while (HIDWORD(v25) >= 0x18)
    {
      if (HIDWORD(v25) != 24)
      {
        uint64_t v15 = 0;
        int v16 = 24;
        while (*(void *)&v26[v15] == a4)
        {
          uint64_t v17 = *(void *)&v26[v15 + 16];
          if (v17)
          {
            uint64_t v18 = &v26[v15 + 24];
            uint64_t v19 = v17;
            while (1)
            {
              unint64_t v14 = *(void *)v18;
              if ((v18[24] & 1) == 0 && v14 < v12)
              {
                unint64_t v12 = *(void *)v18;
                if (v14 < a3) {
                  break;
                }
              }
              v18 += 32;
              if (!--v19) {
                goto LABEL_26;
              }
            }
            unint64_t v12 = *(void *)v18;
            goto LABEL_29;
          }
LABEL_26:
          uint64_t v15 = (v16 + 32 * v17);
          int v16 = v15 + 24;
          if (v15 + 24 >= (unint64_t)HIDWORD(v25)) {
            goto LABEL_16;
          }
        }
        break;
      }
LABEL_16:
      unint64_t v23 = v14;
      HIDWORD(v25) = 120000;
      if (fsctl(v27.f_mntonname, 0xC0384A74uLL, v22, 1u)) {
        goto LABEL_8;
      }
    }
  }
LABEL_29:
  if (v12) {
    BOOL v20 = v12 == a3;
  }
  else {
    BOOL v20 = 0;
  }
  BOOL v10 = v20;
LABEL_35:

  return v10;
}

@end
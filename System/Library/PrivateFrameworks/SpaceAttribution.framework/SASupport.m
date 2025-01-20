@interface SASupport
+ (BOOL)isFileCloned:(const char *)a3;
+ (BOOL)isFilePurgeable:(const char *)a3;
+ (BOOL)isItemMountedOnSystemVolume:(id)a3;
+ (BOOL)targetDeviceIsHomePod;
+ (BOOL)targetDeviceIsIpad;
+ (BOOL)targetDeviceIsWatch;
+ (BOOL)volumeSupportsAttributionTags:(id)a3;
+ (BOOL)volumeSupportsCloneMapping:(id)a3;
+ (id)getEnterpriseVolumesPaths;
+ (id)getFSPurgeableDataOnVolumes:(id)a3;
+ (id)getPathOfNodeID:(unint64_t)a3 FSid:(fsid *)a4;
+ (id)getPathOfiNode:(unint64_t)a3 inVolume:(statfs *)a4;
+ (id)getResolvedURL:(id)a3;
+ (id)getURLMountPoint:(id)a3;
+ (id)getVolumesPaths;
+ (int)enableDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 andGetInfo:(id *)a5;
+ (int)enableDirStatsForPath:(id)a3 withOptions:(int64_t)a4;
+ (int)getDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 info:(id *)a5;
+ (unint64_t)getCloneDstreamIDForPath:(id)a3;
+ (unint64_t)getDirStatKeyForOriginID:(unint64_t)a3 ofMount:(char *)a4;
+ (unint64_t)getFSPurgeableOnVolume:(id)a3 purgeableUrgency:(unint64_t)a4;
+ (unint64_t)getINodeForDirStatKey:(unint64_t)a3 ofMount:(char *)a4;
+ (unint64_t)getInodeIDForPath:(id)a3;
+ (void)getLSAppRecordForBundle:(id)a3 reply:(id)a4;
+ (void)getVolSizeFromAttrList:(const char *)a3 completionHandler:(id)a4;
+ (void)markTimeEndForPhase:(id)a3;
+ (void)markTimeStartForPhase:(id)a3;
@end

@implementation SASupport

+ (BOOL)isItemMountedOnSystemVolume:(id)a3
{
  memset(&v6, 0, 512);
  id v3 = a3;
  if (statfs((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0),
         &v6))
  {
    v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002FCE0();
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE1(v6.f_flags) >> 6) & 1;
  }

  return (char)v4;
}

+ (int)enableDirStatsForPath:(id)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  v5 = (const char *)[a3 fileSystemRepresentation];
  int v6 = (int)v5;
  long long v27 = 0u;
  long long v26 = 0u;
  if (v4) {
    uint64_t v7 = 284;
  }
  else {
    uint64_t v7 = 28;
  }
  long long v25 = 0uLL;
  long long v24 = 0uLL;
  long long v23 = 0uLL;
  long long v22 = 0uLL;
  long long v21 = 0uLL;
  long long v20 = 0uLL;
  long long v19 = 0uLL;
  long long v18 = 0uLL;
  long long v17 = 0uLL;
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  long long v14 = 0uLL;
  long long v13 = 0uLL;
  long long v12 = 0uLL;
  v11[0] = 0x100000001;
  v11[1] = v7;
  if (!fsctl(v5, 0xC1104A71uLL, v11, 1u))
  {
    v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002FD94();
    }
    int v8 = 0;
    goto LABEL_11;
  }
  int v8 = *__error();
  if (v8 != 2)
  {
    v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002FE18(v6, v8);
    }
LABEL_11:
  }
  return v8;
}

+ (id)getPathOfiNode:(unint64_t)a3 inVolume:(statfs *)a4
{
  if (fsgetpath(v6, 0x400uLL, &a4->f_fsid, a3) < 1)
  {
    char v4 = 0;
  }
  else
  {
    char v4 = +[NSString stringWithCString:v6 encoding:4];
  }
  return v4;
}

+ (unint64_t)getDirStatKeyForOriginID:(unint64_t)a3 ofMount:(char *)a4
{
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  v6[2] = 0;
  long long v7 = 0u;
  v6[0] = 1;
  v6[1] = 3;
  v6[3] = a3;
  if (!fsctl(a4, 0xC1104A71uLL, v6, 1u)) {
    return v7;
  }
  char v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002FE98();
  }

  return 0;
}

+ (unint64_t)getINodeForDirStatKey:(unint64_t)a3 ofMount:(char *)a4
{
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  v6[0] = 1;
  v6[1] = 33;
  long long v8 = a3;
  if (!fsctl(a4, 0xC1104A71uLL, v6, 0)) {
    return *((void *)&v7 + 1);
  }
  char v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002FF14();
  }

  return 0;
}

+ (int)getDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 info:(id *)a5
{
  char v6 = a4;
  long long v17 = 0u;
  memset(v18, 0, sizeof(v18));
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v13 = 1;
  uint64_t v14 = 1;
  id v7 = a3;
  if (fsctl((const char *)objc_msgSend(v7, "fileSystemRepresentation", 1), 0xC1104A71uLL, &v13, 1u))
  {
    int v8 = *__error();
    if (v8 != 45)
    {
      long long v9 = SALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003013C((int)v7, v8);
      }
    }
    goto LABEL_20;
  }
  if ((v14 & 4) == 0)
  {
    long long v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002FF90();
    }
LABEL_19:

    int v8 = 93;
    goto LABEL_20;
  }
  if ((~(_BYTE)v15 & 3) != 0)
  {
    long long v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000300D0();
    }
    goto LABEL_19;
  }
  if ((v14 & 0x10) != 0)
  {
    long long v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100030068();
    }
    goto LABEL_19;
  }
  if ((v6 & 1) != 0 && (v14 & 0x100) != 0)
  {
    long long v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002FFFC();
    }
    goto LABEL_19;
  }
  int v8 = 0;
  if (a5)
  {
    unint64_t v12 = v16;
    a5->var0 = v18[0].i64[0];
    *(int8x16_t *)&a5->var1 = vextq_s8(*(int8x16_t *)((char *)v18 + 8), *(int8x16_t *)((char *)v18 + 8), 8uLL);
    a5->var3 = v12;
  }
LABEL_20:

  return v8;
}

+ (int)enableDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 andGetInfo:(id *)a5
{
  id v7 = a3;
  int v8 = +[SASupport enableDirStatsForPath:v7 withOptions:a4];
  if (!v8) {
    int v8 = +[SASupport getDirStatInfoForPath:v7 withOptions:a4 info:a5];
  }

  return v8;
}

+ (BOOL)targetDeviceIsIpad
{
  if (qword_10005AA68 != -1) {
    dispatch_once(&qword_10005AA68, &stru_10004CAE8);
  }
  return byte_10005AA60;
}

+ (BOOL)targetDeviceIsHomePod
{
  if (qword_10005AA78 != -1) {
    dispatch_once(&qword_10005AA78, &stru_10004CB08);
  }
  return byte_10005AA70;
}

+ (void)markTimeStartForPhase:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AA80;
  objc_sync_enter(v4);
  if (!qword_10005AA80)
  {
    uint64_t v5 = objc_opt_new();
    char v6 = (void *)qword_10005AA80;
    qword_10005AA80 = v5;
  }
  id v7 = objc_opt_new();
  gettimeofday((timeval *)[v7 getTimeValAddr], 0);
  [(id)qword_10005AA80 setObject:v7 forKeyedSubscript:v3];
  int v8 = SALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "START: App Sizer %@", (uint8_t *)&v9, 0xCu);
  }

  objc_sync_exit(v4);
}

+ (void)markTimeEndForPhase:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AA80;
  objc_sync_enter(v4);
  uint64_t v5 = [(id)qword_10005AA80 objectForKeyedSubscript:v3];

  if (v5)
  {
    char v6 = [(id)qword_10005AA80 objectForKeyedSubscript:v3];
    id v7 = [v6 timeVal];
    int v9 = v8;

    v14.__darwin_time_t tv_sec = 0;
    *(void *)&v14.uint64_t tv_usec = 0;
    gettimeofday(&v14, 0);
    uint64_t tv_usec = v14.tv_usec;
    __darwin_time_t tv_sec = v14.tv_sec;
    unint64_t v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2048;
      double v18 = (float)((float)(1000000 * (tv_sec - (uint64_t)v7) - v9 + tv_usec) / 1000000.0);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "END: App Sizer %@ (%lf)", buf, 0x16u);
    }

    [(id)qword_10005AA80 removeObjectForKey:v3];
  }
  else
  {
    uint64_t v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000301BC();
    }
  }
  objc_sync_exit(v4);
}

+ (BOOL)volumeSupportsAttributionTags:(id)a3
{
  long long v9 = xmmword_10003C1F4;
  uint64_t v10 = 0;
  LODWORD(v8) = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  id v3 = a3;
  if (getattrlist((const char *)objc_msgSend(v3, "UTF8String", 0, 0, 0, 0, v8), &v9, &v6, 0x24uLL, 0))
  {
    id v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100030224();
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE10(v7) >> 6) & 1;
  }

  return (char)v4;
}

+ (BOOL)volumeSupportsCloneMapping:(id)a3
{
  long long v9 = xmmword_10003C1F4;
  uint64_t v10 = 0;
  LODWORD(v8) = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  id v3 = a3;
  if (getattrlist((const char *)objc_msgSend(v3, "UTF8String", 0, 0, 0, 0, v8), &v9, &v6, 0x24uLL, 0))
  {
    id v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003028C();
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE7(v7) >> 2) & 1;
  }

  return (char)v4;
}

+ (id)getResolvedURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ([v3 path], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    id v9 = v4;
    goto LABEL_12;
  }
  bzero(v12, 0x420uLL);
  objc_msgSend(v4, "path", xmmword_10003C20C, 0);
  id v6 = objc_claimAutoreleasedReturnValue();
  long long v7 = (const char *)[v6 fileSystemRepresentation];

  if (getattrlist(v7, &v11, v12, 0x420uLL, 0) < 0)
  {
    uint64_t v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000302F4();
    }
    id v9 = 0;
    goto LABEL_10;
  }
  if (v13[1])
  {
    uint64_t v8 = +[NSString stringWithUTF8String:(char *)v13 + v13[0]];
    id v9 = +[NSURL fileURLWithPath:v8 isDirectory:1];
LABEL_10:

    goto LABEL_12;
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

+ (id)getURLMountPoint:(id)a3
{
  bzero(v10, 0x40CuLL);
  objc_msgSend(a3, "path", xmmword_10003C224, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (const char *)[v4 fileSystemRepresentation];

  if (getattrlist(v5, &v9, v10, 0x40CuLL, 1u) < 0)
  {
    long long v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100030390();
    }
  }
  else if (v11[1])
  {
    id v6 = +[NSString stringWithUTF8String:(char *)v11 + v11[0]];
    goto LABEL_8;
  }
  id v6 = 0;
LABEL_8:
  return v6;
}

+ (BOOL)targetDeviceIsWatch
{
  if (qword_10005AA90 != -1) {
    dispatch_once(&qword_10005AA90, &stru_10004CB28);
  }
  return byte_10005AA88;
}

+ (void)getLSAppRecordForBundle:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, id, id))a4;
  id v6 = a3;
  id v9 = 0;
  id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v9];

  id v8 = v9;
  v5[2](v5, v8, v7);
}

+ (id)getPathOfNodeID:(unint64_t)a3 FSid:(fsid *)a4
{
  if (fsgetpath(v9, 0x400uLL, a4, a3) < 0)
  {
    int v6 = *__error();
    id v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003042C(v6, a3, v7);
    }

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = +[NSString stringWithUTF8String:v9];
  }
  return v5;
}

+ (id)getFSPurgeableDataOnVolumes:(id)a3
{
  id v3 = a3;
  id v26 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  id v22 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v33;
    id v4 = &selRef_setValue_forDirStatsTotalsInfoEntry_;
    uint64_t v5 = &APFSContainerGetBootDevice_ptr;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v6;
        uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * v6);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v25 = [&off_1000502A0 allKeys];
        id v8 = [v25 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            long long v11 = 0;
            id v24 = v9;
            do
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v25);
              }
              uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v11);
              uint64_t v13 = [&off_1000502A0 objectForKeyedSubscript:v12];
              id v14 = [v13 longLongValue];

              id v15 = [v4 + 480 getFSPurgeableOnVolume:v7 purgeableUrgency:v14];
              id v16 = [v26 valueForKey:v7];
              [v5[173] numberWithUnsignedLongLong:v15];
              if (v16) {
                __int16 v17 = {;
              }
                [v16 setObject:v17 forKey:v12];
              }
              else {
                double v18 = {;
              }
                __int16 v17 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v18, v12, 0);

                id v4 = &selRef_setValue_forDirStatsTotalsInfoEntry_;
                uint64_t v5 = &APFSContainerGetBootDevice_ptr;
                id v9 = v24;
                [v26 setValue:v17 forKey:v7];
              }

              long long v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v25 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v22);
  }

  return v26;
}

+ (unint64_t)getFSPurgeableOnVolume:(id)a3 purgeableUrgency:(unint64_t)a4
{
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v11 = 0;
  long long v13 = 0u;
  unint64_t v12 = a4;
  id v5 = a3;
  if (fsctl((const char *)objc_msgSend(v5, "fileSystemRepresentation", __PAIR128__(v12, 0), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 0xC0E84A70uLL,
         &v11,
         1u) < 0)
  {
    uint64_t v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = __error();
      id v9 = strerror(*v8);
      *(_DWORD *)buf = 138412802;
      id v28 = v5;
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      __int16 v31 = 2080;
      long long v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Failed to get FSPurgeable data of urgency (%llu) with error: %s", buf, 0x20u);
    }

    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = v20;
  }

  return v6;
}

+ (BOOL)isFilePurgeable:(const char *)a3
{
  uint64_t v5 = 0;
  if (!fsctl(a3, 0x40084A47uLL, &v5, 1u)) {
    return (v5 & 0xE00) != 0;
  }
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000304B4(v3);
  }

  return 0;
}

+ (BOOL)isFileCloned:(const char *)a3
{
  v6[0] = 0;
  v6[1] = 0;
  if (fsctl(a3, 0x40104A0EuLL, v6, 1u))
  {
    id v3 = SALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003053C(v3);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    return (LOBYTE(v6[0]) >> 1) & 1;
  }
  return v4;
}

+ (unint64_t)getInodeIDForPath:(id)a3
{
  memset(&v7, 0, sizeof(v7));
  id v3 = a3;
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0), &v7))
  {
    BOOL v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000305C4();
    }

    __darwin_ino64_t st_ino = 0;
  }
  else
  {
    __darwin_ino64_t st_ino = v7.st_ino;
  }

  return st_ino;
}

+ (unint64_t)getCloneDstreamIDForPath:(id)a3
{
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  if (!fsctl((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0), 0x40104A0EuLL, &v5, 1u))return v6; {
  id v3 = SALog();
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003053C(v3);
  }

  return 0;
}

+ (void)getVolSizeFromAttrList:(const char *)a3 completionHandler:(id)a4
{
  memset(v11, 0, 28);
  v12[2] = 0;
  v12[0] = 5;
  v12[1] = 2692743172;
  uint64_t v5 = (void (**)(id, uint64_t, void, void *))a4;
  int v6 = getattrlist(a3, v12, v11, 0x1CuLL, 1u);
  stat v7 = SALog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      long long v14 = "+[SASupport getVolSizeFromAttrList:completionHandler:]";
      __int16 v15 = 2080;
      long long v16 = a3;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Can't get volume size for %s (err %li)", buf, 0x20u);
    }

    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v6 userInfo:0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10003062C((uint64_t)a3, (uint64_t)v11, v8);
    }

    id v9 = 0;
  }
  if (*(void *)((char *)&v11[1] + 4) <= *(void *)((char *)&v11[2] + 4)) {
    uint64_t v10 = *(void *)((char *)&v11[2] + 4);
  }
  else {
    uint64_t v10 = *(void *)((char *)&v11[1] + 4);
  }
  v5[2](v5, v10, *(void *)((char *)v11 + 4), v9);
}

+ (id)getVolumesPaths
{
  if (qword_10005AAA0 != -1) {
    dispatch_once(&qword_10005AAA0, &stru_10004CB48);
  }
  v2 = (void *)qword_10005AA98;
  return v2;
}

+ (id)getEnterpriseVolumesPaths
{
  v2 = +[SASupport getVolumesPaths];
  __int16 v18 = 0;
  uint64_t v3 = objc_opt_new();
  BOOL v4 = (void *)qword_10005AAA8;
  qword_10005AAA8 = v3;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v9);
        if (fsctl((const char *)objc_msgSend(v10, "fileSystemRepresentation", (void)v14), 0x40024A6CuLL, &v18, 0))
        {
          uint64_t v11 = SALog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            sub_100030770(v19, &v20, v11);
          }
        }
        else if (v18 == 576)
        {
          [(id)qword_10005AAA8 addObject:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v7);
  }

  id v12 = (id)qword_10005AAA8;
  return v12;
}

@end
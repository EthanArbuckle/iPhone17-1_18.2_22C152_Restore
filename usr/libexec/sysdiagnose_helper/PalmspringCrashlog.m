@interface PalmspringCrashlog
+ (BOOL)writeToDirectory:(id)a3 crashlogData:(id)a4 name:(id)a5 options:(unint64_t)a6 error:(id *)a7;
+ (NSString)crashlogPathExtension;
+ (OS_os_log)log;
- (BOOL)writeToDirectory:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSData)data;
- (PalmspringCrashlog)initWithInfoEntry:(id)a3 data:(id)a4;
- (PalmspringCrashlogInfoEntry)info;
- (id)description;
- (unsigned)blobVersion;
@end

@implementation PalmspringCrashlog

+ (OS_os_log)log
{
  if (qword_100071388 != -1) {
    dispatch_once(&qword_100071388, &stru_10006CE10);
  }
  v2 = (void *)qword_100071380;

  return (OS_os_log *)v2;
}

- (PalmspringCrashlog)initWithInfoEntry:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PalmspringCrashlog;
  v9 = [(PalmspringCrashlog *)&v31 init];
  if (v9)
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000391BC(a2, v10);
    }

    if ((unint64_t)[v8 length] > 7)
    {
      id v13 = v8;
      v14 = (unsigned __int16 *)[v13 bytes];
      v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1000390F8(v7, (unsigned __int8 *)v14, v15);
      }

      v16 = (char *)[v13 length] - 8;
      id v17 = [v13 length];
      if (v17 == (id)[v7 headerAndRawBlobSize]
        && v16 == (char *)*(unsigned int *)(v14 + 1))
      {
        [v13 subdataWithRange:8, v16];
        v11 = objc_claimAutoreleasedReturnValue();
        int v18 = crc16_compute((char *)[v11 bytes], (int)[v11 length]);
        if (v18 == v14[3])
        {
          v19 = [v11 copy];
          data = v9->_data;
          v9->_data = v19;

          v21 = (PalmspringCrashlogInfoEntry *)[v7 copy];
          info = v9->_info;
          v9->_info = v21;

          v9->_blobVersion = *(unsigned char *)v14;
          v12 = v9;
LABEL_17:

          goto LABEL_18;
        }
        int v24 = v18;
        v25 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v29 = [v7 name];
          int v30 = v14[3];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v33 = v24;
          *(_WORD *)&v33[4] = 2112;
          *(void *)&v33[6] = v29;
          __int16 v34 = 1024;
          LODWORD(v35) = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "CRC (0x%04x) of crashlog %@ did not match CRC in header (0x%04x)", buf, 0x18u);
        }
      }
      else
      {
        v11 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v26 = [v13 length];
          unsigned int v27 = [v7 headerAndRawBlobSize];
          int v28 = *(_DWORD *)(v14 + 1);
          *(_DWORD *)buf = 134218752;
          *(void *)v33 = v26;
          *(_WORD *)&v33[8] = 1024;
          *(_DWORD *)&v33[10] = v27;
          __int16 v34 = 2048;
          v35 = v16;
          __int16 v36 = 1024;
          int v37 = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Size of crashlog did not match expected size: header+blob (expected: %ld / actual: %d), blob (expected: %ld, actual %d)", buf, 0x22u);
        }
      }
    }
    else
    {
      v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100039038(v7, v11);
      }
    }
    v12 = 0;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (BOOL)writeToDirectory:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(PalmspringCrashlog *)self data];
  v10 = [(PalmspringCrashlog *)self info];
  v11 = [v10 name];
  LOBYTE(a5) = +[PalmspringCrashlog writeToDirectory:v8 crashlogData:v9 name:v11 options:a4 error:a5];

  return (char)a5;
}

+ (BOOL)writeToDirectory:(id)a3 crashlogData:(id)a4 name:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __int16 v34 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v40 = v34;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 2048;
    unint64_t v44 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@, directory %@, options %lu", buf, 0x20u);
  }
  id v17 = +[NSFileManager defaultManager];
  unsigned __int8 v18 = [v17 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:a7];

  if (v18)
  {
    v19 = objc_alloc_init((Class)NSDateFormatter);
    [v19 setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    id v38 = v15;
    [v15 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    id v20 = a1;
    v21 = a7;
    v23 = id v22 = v13;
    int v24 = +[NSDate date];
    [v19 stringFromDate:v24];
    v25 = unint64_t v36 = a6;
    +[PalmspringCrashlog crashlogPathExtension];
    v27 = id v26 = v14;
    uint64_t v35 = v23;
    int v37 = (void *)v23;
    id v13 = v22;
    int v28 = +[NSString stringWithFormat:@"%@/PalmspringCrashlog_%@_%@.%@", v22, v25, v35, v27];

    id v14 = v26;
    unsigned int v29 = [v26 writeToFile:v28 options:v36 error:v21];
    int v30 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v31 = @"failed";
      if (v29) {
        CFStringRef v31 = @"succeeded";
      }
      if (v21) {
        id v32 = *v21;
      }
      else {
        id v32 = 0;
      }
      *(_DWORD *)buf = 138413058;
      id v40 = v20;
      __int16 v41 = 2112;
      id v42 = v28;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)v31;
      __int16 v45 = 2112;
      id v46 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Writing crashlog %@ to %@ %@, error %@", buf, 0x2Au);
    }

    id v15 = v38;
  }
  else
  {
    v19 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100039250();
    }
    LOBYTE(v29) = 0;
  }

  return v29;
}

- (id)description
{
  v3 = [(PalmspringCrashlog *)self info];
  v4 = +[NSString stringWithFormat:@"(%@, Palmspring Crashlog Header: [blob version: %d])", v3, [(PalmspringCrashlog *)self blobVersion]];

  return v4;
}

+ (NSString)crashlogPathExtension
{
  return (NSString *)@"crash";
}

- (PalmspringCrashlogInfoEntry)info
{
  return self->_info;
}

- (unsigned)blobVersion
{
  return self->_blobVersion;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end
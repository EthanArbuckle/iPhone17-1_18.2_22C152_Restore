@interface ASPCarryLog_NANDDriver
- (id)nandCounters_get;
- (id)nandStats_get_hoursAgo:(unsigned int)a3;
- (int)iolog_disable;
- (int)iolog_enable;
- (int)nandCounters_save:(id)a3;
- (int)nandStats_save:(id)a3;
- (int)writeFullSpdToFileWithHdrBuf:(void *)a3 hdrSize:(unint64_t)a4 totalLbaCnt:(unint64_t)a5 filePtr:(__sFILE *)a6 spdSizeLimit:(unint64_t)a7;
- (unint64_t)iolog_export:(id)a3 max_export_size:(unint64_t)a4;
- (void)addSpdEstSizeExceedLimitToFile:(__sFILE *)a3 limit:(unsigned int)a4;
- (void)getSpdHdrWithSize:(unint64_t *)a3 gcIdle:(BOOL *)a4 totalLbaCnt:(unint64_t *)a5 estSpdSize:(unsigned int *)a6;
@end

@implementation ASPCarryLog_NANDDriver

- (int)iolog_enable
{
  if (sub_10002CFD4(15, 0, 0)) {
    return 1;
  }
  int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1000464E0();
    return 0;
  }
  return result;
}

- (int)iolog_disable
{
  if (sub_10002CFD4(0, 0, 0)) {
    return 1;
  }
  int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100046514();
    return 0;
  }
  return result;
}

- (unint64_t)iolog_export:(id)a3 max_export_size:(unint64_t)a4
{
  size_t v22 = 0;
  v23 = 0;
  id v5 = a3;
  v6 = (const char *)[v5 UTF8String];
  unint64_t v21 = 0;
  v7 = +[NSFileManager defaultManager];
  if (![v7 fileExistsAtPath:v5])
  {
    int v11 = open(v6, 522, 438);
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    v13 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046548((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_17;
  }
  v8 = [v7 attributesOfItemAtPath:v5 error:0];
  id v9 = [v8 fileSize];

  int v10 = open(v6, 522, 438);
  if (v10 < 0) {
    goto LABEL_12;
  }
  int v11 = v10;
  if (v9) {
    goto LABEL_8;
  }
LABEL_6:
  if (!sub_10002CD28(4u, &v23, &v22))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000465B4();
    }
    close(v11);
LABEL_17:
    unint64_t v12 = 0;
    goto LABEL_18;
  }
  write(v11, v23, v22);
  free(v23);
LABEL_8:
  if (!sub_10002CE50(v11, a4, &v21))
  {
    unint64_t v21 = 0;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000465E8();
    }
  }
  close(v11);
  unint64_t v12 = v21;
LABEL_18:

  return v12;
}

- (id)nandCounters_get
{
  v8 = CopyWhitelistedNANDFTLInfo(1, (uint64_t)a2, v2, v3, v4, v5, v6, v7);

  return v8;
}

- (int)nandCounters_save:(id)a3
{
  id v4 = a3;
  uint64_t v6 = +[NSURL fileURLWithPath:v4 isDirectory:0];
  uint64_t v7 = [(ASPCarryLog_NANDDriver *)self nandCounters_get];
  v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_10004661C();
    }
    goto LABEL_8;
  }
  if (([v7 writeToURL:v6 error:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046650();
    }
LABEL_8:
    int v9 = 0;
    goto LABEL_9;
  }
  int v9 = 1;
LABEL_9:

  return v9;
}

- (id)nandStats_get_hoursAgo:(unsigned int)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  if (sub_10002D574(0, a3, 0, &v6, &v5))
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    NSDictFromStatsBuffer((uint64_t *)v6, v5, v3);
    free(v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046684();
    }
    id v3 = 0;
  }

  return v3;
}

- (int)nandStats_save:(id)a3
{
  id v3 = (char *)[a3 UTF8String];
  if (print_all_stats(v3) == 1)
  {
    int result = print_band_stats(v3);
    if (result != 1)
    {
      uint64_t v5 = oslog;
      int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_1000466B8((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
        return 0;
      }
    }
  }
  else
  {
    unint64_t v12 = oslog;
    int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100046724((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);
      return 0;
    }
  }
  return result;
}

- (void)getSpdHdrWithSize:(unint64_t *)a3 gcIdle:(BOOL *)a4 totalLbaCnt:(unint64_t *)a5 estSpdSize:(unsigned int *)a6
{
  uint64_t v9 = 0;
  int v7 = sub_10002D0C0(&v9, a3, a4, a5, a6);
  int result = v9;
  if (!v7)
  {
    if (v9)
    {
      free(v9);
      int result = 0;
      *a3 = 0;
    }
  }
  return result;
}

- (void)addSpdEstSizeExceedLimitToFile:(__sFILE *)a3 limit:(unsigned int)a4
{
  unsigned int __ptr = a4;
  uint64_t v5 = 0x4FBFF00000001;
  fwrite(&v5, 8uLL, 1uLL, a3);
  fwrite(&__ptr, 4uLL, 1uLL, a3);
}

- (int)writeFullSpdToFileWithHdrBuf:(void *)a3 hdrSize:(unint64_t)a4 totalLbaCnt:(unint64_t)a5 filePtr:(__sFILE *)a6 spdSizeLimit:(unint64_t)a7
{
  size_t __size = 0;
  unsigned int __ptr = 0;
  if (!a6 || !fwrite(a3, a4, 1uLL, a6) || !sub_10002D398(a6, a5, a7)) {
    return 0;
  }
  sub_10002D380(&__ptr, &__size);
  BOOL v10 = 0;
  uint64_t v11 = __ptr;
  if (__ptr && __size)
  {
    BOOL v10 = fwrite(__ptr, __size, 1uLL, a6) != 0;
    uint64_t v11 = __ptr;
  }
  if (v11) {
    free(v11);
  }
  return v10;
}

@end
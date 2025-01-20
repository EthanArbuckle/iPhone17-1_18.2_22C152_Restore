@interface NSData
- (id)_cl_initWithFileDescriptor:(int)a3;
- (id)cl_hexadecimalString;
@end

@implementation NSData

- (id)cl_hexadecimalString
{
  id v3 = +[NSMutableString string];
  uint64_t v4 = [(NSData *)self length];
  v5 = [(NSData *)self bytes];
  if (v4 >= 1)
  {
    v6 = v5;
    do
    {
      unsigned int v7 = *v6++;
      [v3 appendFormat:@"%02X", v7];
      --v4;
    }
    while (v4);
  }
  return v3;
}

- (id)_cl_initWithFileDescriptor:(int)a3
{
  memset(&v12, 0, sizeof(v12));
  if (fstat(a3, &v12))
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10230A400);
    }
    v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"fstat failed\"}", (uint8_t *)&buf, 0x12u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10230A400);
      }
    }
    v6 = qword_102419568;
    if (!os_signpost_enabled((os_log_t)qword_102419568)) {
      goto LABEL_10;
    }
    uint64_t buf = 68289026;
    __int16 v14 = 2082;
    v15 = "";
    unsigned int v7 = "fstat failed";
    v8 = "{\"msg%{public}.0s\":\"fstat failed\"}";
LABEL_9:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v7, v8, (uint8_t *)&buf, 0x12u);
LABEL_10:

    return 0;
  }
  v10 = mmap(0, v12.st_size, 1, 2, a3, 0);
  if (v10 == (void *)-1)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10230A400);
    }
    v11 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"mmap failed\"}", (uint8_t *)&buf, 0x12u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10230A400);
      }
    }
    v6 = qword_102419568;
    if (!os_signpost_enabled((os_log_t)qword_102419568)) {
      goto LABEL_10;
    }
    uint64_t buf = 68289026;
    __int16 v14 = 2082;
    v15 = "";
    unsigned int v7 = "mmap failed";
    v8 = "{\"msg%{public}.0s\":\"mmap failed\"}";
    goto LABEL_9;
  }
  return [(NSData *)self initWithBytesNoCopy:v10 length:v12.st_size deallocator:NSDataDeallocatorUnmap];
}

@end
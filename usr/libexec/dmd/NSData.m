@interface NSData
+ (id)dmd_dataWithMappedContentsOfFileHandle:(id)a3 error:(id *)a4;
- (NSData)dmd_sha1Hash;
@end

@implementation NSData

+ (id)dmd_dataWithMappedContentsOfFileHandle:(id)a3 error:(id *)a4
{
  int v5 = [a3 fileDescriptor];
  memset(&v11, 0, sizeof(v11));
  if (fstat(v5, &v11) != -1)
  {
    size_t st_size = v11.st_size;
    v7 = mmap(0, v11.st_size, 1, 2, v5, 0);
    if (v7 != (void *)-1)
    {
      dispatch_data_t v8 = dispatch_data_create(v7, st_size, 0, _dispatch_data_destructor_munmap);
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100088750();
      if (!a4) {
        goto LABEL_9;
      }
    }
    else if (!a4)
    {
      goto LABEL_9;
    }
LABEL_6:
    DMFErrorWithCodeAndUserInfo();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    dispatch_data_t v8 = 0;
    *a4 = v9;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100088708();
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (a4) {
    goto LABEL_6;
  }
LABEL_9:
  dispatch_data_t v8 = 0;
LABEL_10:

  return v8;
}

- (NSData)dmd_sha1Hash
{
  memset(&v6, 0, sizeof(v6));
  CC_SHA1_Init(&v6);
  v3 = self;
  CC_SHA1_Update(&v6, [(NSData *)v3 bytes], (CC_LONG)[(NSData *)v3 length]);
  CC_SHA1_Final(md, &v6);
  v4 = +[NSData dataWithBytes:md length:20];

  return (NSData *)v4;
}

@end
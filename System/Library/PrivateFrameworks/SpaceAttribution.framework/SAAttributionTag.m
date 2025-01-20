@interface SAAttributionTag
+ (id)getBundleIdForTag:(unint64_t)a3 onVolumeName:(char *)a4;
+ (void)enableAttributionTagging:(BOOL)a3;
+ (void)processAttributionTagsForVol:(id)a3 withBlock:(id)a4;
@end

@implementation SAAttributionTag

+ (void)enableAttributionTagging:(BOOL)a3
{
  if (a3)
  {
    int v21 = 1;
    uint64_t v3 = fsctl((const char *)[@"/private/var" fileSystemRepresentation], 0xC0044A75uLL, &v21, 1u);
    if (v3)
    {
      uint64_t v4 = v3;
      v5 = SALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10003265C(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
    int v21 = 1;
    uint64_t v12 = fsctl((const char *)[@"/private/var/mobile" fileSystemRepresentation], 0xC0044A75uLL, &v21, 1u);
    if (v12)
    {
      uint64_t v13 = v12;
      v14 = SALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000325F0(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
}

+ (id)getBundleIdForTag:(unint64_t)a3 onVolumeName:(char *)a4
{
  memset(v11, 0, sizeof(v11));
  long long v10 = 0u;
  long long v9 = 0u;
  unint64_t v8 = a3;
  if (fsctl(a4, 0xC1284A72uLL, &v8, 1u))
  {
    v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000326C8(a3, v5);
    }

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = +[NSString stringWithUTF8String:v11];
  }
  return v6;
}

+ (void)processAttributionTagsForVol:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100032820((uint64_t)v5, v7);
  }

  unint64_t v8 = (char *)malloc_type_malloc(0x169540uLL, 0x100004005247EF8uLL);
  if (v8)
  {
    long long v9 = v8;
    id v32 = v5;
    long long v10 = (const char *)[v5 cStringUsingEncoding:1];
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    while (1)
    {
      LODWORD(v34) = 5000;
      v35 = v9;
      uint64_t v11 = fsctl(v10, 0xC0184A76uLL, &v33, 1u);
      if (v11) {
        break;
      }
      unint64_t v12 = v34;
      if (v34)
      {
        unint64_t v13 = 0;
        v14 = v9 + 40;
        do
        {
          if (*v14 && *((void *)v14 - 2))
          {
            uint64_t v15 = +[NSString stringWithUTF8String:v14];
            (*((void (**)(id, void *, void, void, void, void))v6 + 2))(v6, v15, *((void *)v14 - 2), *((void *)v14 - 1), *((void *)v14 - 3), *((void *)v14 - 5));

            unint64_t v12 = v34;
          }
          ++v13;
          v14 += 296;
        }
        while (v13 < v12);
      }
      if ((v34 & 0x100000000) != 0) {
        goto LABEL_20;
      }
    }
    uint64_t v24 = v11;
    v25 = SALog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000327B4(v24, v25, v26, v27, v28, v29, v30, v31);
    }

LABEL_20:
    free(v9);
    id v5 = v32;
  }
  else
  {
    uint64_t v16 = SALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100032740(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

@end
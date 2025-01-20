@interface UMDPersonaManifestEmbedded
+ (id)manifest;
+ (id)manifestFromData:(id)a3;
+ (unsigned)currentVersion;
- (id)dataValue;
@end

@implementation UMDPersonaManifestEmbedded

+ (unsigned)currentVersion
{
  return 1;
}

+ (id)manifest
{
  id v3 = objc_alloc_init((Class)a1);
  [v3 setVersion:[a1 currentVersion]];

  return v3;
}

+ (id)manifestFromData:(id)a3
{
  id v4 = a3;
  v5 = sub_10008AFE0((uint64_t)v4);
  v6 = v5;
  if (!v5)
  {
    if (qword_1000E4110 != -1) {
      dispatch_once(&qword_1000E4110, &stru_1000D5778);
    }
    v7 = (id)qword_1000E4108;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = sub_100055404(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        v12 = (const char *)_os_log_send_and_compose_impl();
        v13 = (char *)v12;
        if (v12) {
          sub_100055434(v12);
        }
      }
      else
      {
        v13 = 0;
      }
      free(v13);
    }
    goto LABEL_40;
  }
  v7 = [v5 objectForKeyedSubscript:@"UsePersonaManifestVersion"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_1000E4110 != -1) {
        dispatch_once(&qword_1000E4110, &stru_1000D5778);
      }
      v14 = (id)qword_1000E4108;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      unsigned int v15 = sub_100055404(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        v17 = (char *)_os_log_send_and_compose_impl();
        if (!v17) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
LABEL_37:
      v17 = 0;
      goto LABEL_38;
    }
  }
  unsigned int v8 = [v7 unsignedIntValue];
  if (v8 == 1)
  {
    uint64_t v9 = sub_1000596AC((uint64_t)a1, v6);
    goto LABEL_26;
  }
  if (!v8)
  {
    uint64_t v9 = sub_100059348((uint64_t)a1, v4);
LABEL_26:
    v18 = (void *)v9;
    goto LABEL_41;
  }
  if (qword_1000E4110 != -1) {
    dispatch_once(&qword_1000E4110, &stru_1000D5778);
  }
  v14 = (id)qword_1000E4108;
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    goto LABEL_39;
  }
  int v19 = sub_100055404(0);
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    v19 &= ~1u;
  }
  if (!v19) {
    goto LABEL_37;
  }
  v20 = v14;
  [v7 unsignedIntValue];
  v17 = (char *)_os_log_send_and_compose_impl();

  if (v17) {
LABEL_34:
  }
    sub_100055434(v17);
LABEL_38:
  free(v17);
LABEL_39:

LABEL_40:
  v18 = 0;
LABEL_41:

  return v18;
}

- (id)dataValue
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&off_1000D9468 forKeyedSubscript:@"UsePersonaManifestVersion"];
  id v4 = +[NSNumber numberWithUnsignedLongLong:[(UMDPersonaManifest *)self generation]];
  [v3 setObject:v4 forKeyedSubscript:@"UsePersonaGenerationID"];

  v5 = [(UMDPersonaManifest *)self users];
  v6 = +[UMDPersonaManifest dictForUserSet:v5];

  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"UserPersonaDictionary"];
    v7 = sub_10008ACC0((uint64_t)v3);
  }
  else
  {
    if (qword_1000E4110 != -1) {
      dispatch_once(&qword_1000E4110, &stru_1000D5778);
    }
    unsigned int v8 = (id)qword_1000E4108;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        unsigned int v11 = (const char *)_os_log_send_and_compose_impl();
        v12 = (char *)v11;
        if (v11) {
          sub_100055434(v11);
        }
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    v7 = 0;
  }

  return v7;
}

@end
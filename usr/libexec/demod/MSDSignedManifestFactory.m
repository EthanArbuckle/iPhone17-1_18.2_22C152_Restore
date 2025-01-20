@interface MSDSignedManifestFactory
+ (id)createSignedManifestFromManifestFile:(id)a3;
+ (id)readManifestFromFile:(id)a3;
@end

@implementation MSDSignedManifestFactory

+ (id)createSignedManifestFromManifestFile:(id)a3
{
  id v3 = a3;
  v5 = +[MSDSignedManifestFactory readManifestFromFile:v3];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:@"Version"];
    unsigned int v8 = [v7 intValue];
    v9 = &off_100151290;
    if (v8 != 7) {
      v9 = off_100151288;
    }
    v10 = [(__objc2_class *)*v9 signedManifestFromManifestData:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)readManifestFromFile:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D58AC();
    }
    goto LABEL_30;
  }
  uint64_t v6 = +[NSInputStream inputStreamWithFileAtPath:v3];
  if (!v6)
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D5610();
    }
    goto LABEL_30;
  }
  v7 = (void *)v6;
  unsigned int v8 = +[NSRunLoop currentRunLoop];
  [v7 scheduleInRunLoop:v8 forMode:NSDefaultRunLoopMode];

  [v7 open];
  id v18 = 0;
  v9 = +[NSPropertyListSerialization propertyListWithStream:v7 options:2 format:0 error:&v18];
  v10 = v18;
  [v7 close];
  v11 = +[NSRunLoop currentRunLoop];
  [v7 removeFromRunLoop:v11 forMode:NSDefaultRunLoopMode];

  if (!v9)
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000D5684(v10, v9);
    }
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000D5838();
    }
    goto LABEL_28;
  }
  uint64_t v12 = [v9 objectForKey:@"Version"];
  if (!v12)
  {
    v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000D5724();
    }
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  v13 = (void *)v12;
  if (+[MSDPlatform iOSHub]) {
    int v14 = 6;
  }
  else {
    int v14 = 7;
  }
  if ((int)[v13 intValue] >= v14 && (int)objc_msgSend(v13, "intValue") < 8)
  {

    goto LABEL_12;
  }
  v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000D5798(v13, v16);
  }

LABEL_30:
  v9 = 0;
LABEL_12:

  return v9;
}

@end
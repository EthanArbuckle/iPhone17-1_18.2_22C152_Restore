@interface NSURL
+ (id)fileURLWithString:(id)a3;
- (id)directoryHash;
- (id)fileHash;
@end

@implementation NSURL

- (id)fileHash
{
  if ([(NSURL *)self isFileURL])
  {
    v3 = [(NSURL *)self path];
    v4 = +[NSFileHandle fileHandleForReadingAtPath:v3];
  }
  else
  {
    v3 = [(NSURL *)self absoluteString];
    v5 = [v3 stringByRemovingPercentEncoding];
    v4 = +[NSFileHandle fileHandleForReadingAtPath:v5];
  }
  memset(&c, 0, sizeof(c));
  if (v4)
  {
    fcntl((int)[v4 fileDescriptor], 48, 1);
    CC_SHA1_Init(&c);
    while (1)
    {
      id v15 = 0;
      v7 = [v4 readDataUpToLength:0x40000 error:&v15];
      id v8 = v15;
      if (v8) {
        break;
      }
      if (![v7 length])
      {

        CC_SHA1_Final(md, &c);
        v12 = +[NSData dataWithBytes:md length:20];
        v10 = 0;
        goto LABEL_12;
      }
      id v9 = v7;
      CC_SHA1_Update(&c, [v9 bytes], (CC_LONG)[v9 length]);
    }
    v10 = v8;

    v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003077C(self, (uint64_t)v10, v11);
    }

    v12 = 0;
LABEL_12:
    [v4 closeFile];
  }
  else
  {
    v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000306CC(self, v14);
    }

    v12 = 0;
    v10 = 0;
  }

  return v12;
}

- (id)directoryHash
{
  return 0;
}

+ (id)fileURLWithString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"file://"])
  {
    v4 = [v3 substringFromIndex:@"file://".length];
    v5 = +[NSURL fileURLWithPath:v4];
  }
  else
  {
    v5 = +[NSURL fileURLWithPath:v3];
  }

  return v5;
}

@end
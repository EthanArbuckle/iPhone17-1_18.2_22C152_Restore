@interface NSData
- (id)_gkUnzippedData;
- (id)_gkZippedData;
- (void)_gkWriteToImageCacheWithURLString:(id)a3;
@end

@implementation NSData

- (id)_gkZippedData
{
  v2 = self;
  v3 = [(NSData *)v2 bytes];
  id v4 = [(NSData *)v2 length];
  id v5 = 0;
  if (v3)
  {
    id v6 = v4;
    if (v4)
    {
      memset(&v13.avail_in, 0, 104);
      v13.avail_in = v4;
      v13.avail_out = v4;
      v13.next_in = v3;
      id v7 = [objc_alloc((Class)NSMutableData) initWithLength:v4];
      v13.next_out = (Bytef *)[v7 mutableBytes:v13.next_in, *(void *)&v13.avail_in];
      if (v7
        && !deflateInit2_(&v13, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (int v8 = deflate(&v13, 4), v9 = deflateEnd(&v13), v8 == 1))
      {
        int v10 = v9;
        id v11 = 0;
        if (!v10 && v6 == (id)v13.total_in)
        {
          [v7 setLength:v13.total_out];
          id v11 = v7;
        }
      }
      else
      {
        id v11 = 0;
      }
      id v5 = v11;
    }
  }

  return v5;
}

- (id)_gkUnzippedData
{
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [(NSData *)self length];
  strm.next_in = (Bytef *)[(NSData *)self bytes];
  id v3 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    id v3 = objc_alloc_init((Class)NSMutableData);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v8;
      unsigned int v4 = inflate(&strm, 0);
      if (v4 > 1) {
        break;
      }
      unsigned int v5 = v4;
      if (strm.avail_out != 0x4000) {
        [v3 appendBytes:v8 length:0x4000 - strm.avail_out];
      }
      if (v5)
      {
        inflateEnd(&strm);
        goto LABEL_9;
      }
    }
    inflateEnd(&strm);

    id v3 = 0;
  }
LABEL_9:

  return v3;
}

- (void)_gkWriteToImageCacheWithURLString:(id)a3
{
  unsigned int v4 = +[NSURL URLWithString:a3];
  unsigned int v5 = [v4 path];
  id v6 = [v5 stringByDeletingLastPathComponent];
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) == 0)
  {
    int v9 = +[NSFileManager defaultManager];
    id v19 = 0;
    [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v10 = v19;

    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v11 = (id)GKOSLoggers();
      }
      v12 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100137750((uint64_t)v10, v12);
      }
    }
  }
  id v18 = 0;
  [(NSData *)self writeToFile:v5 options:1 error:&v18];
  id v13 = v18;
  if (v13)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    v15 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1001376C8((uint64_t)v5, (uint64_t)v13, v15);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    v17 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Saved new local player avatar image to image cache: %@", buf, 0xCu);
    }
    _gkMarkFileAsPurgeable();
  }
}

@end
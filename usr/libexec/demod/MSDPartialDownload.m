@interface MSDPartialDownload
- (BOOL)didProgress;
- (BOOL)isDownloadComplete;
- (MSDPartialDownload)init;
- (MSDPartialDownload)initWithFilePath:(id)a3;
- (NSString)fileDownloading;
- (id)description;
- (id)getRangeHeaderForDownload;
- (int64_t)downloadedBytes;
- (int64_t)existingFileSize;
- (int64_t)lastDownloadedByte;
- (int64_t)totalFileSize;
- (void)appendDownloadedFileSize:(int64_t)a3;
- (void)processServerRangeResponse:(id)a3;
- (void)pushToTestLog:(id)a3;
- (void)recordDownloadedBytes;
- (void)setDownloadedBytes:(int64_t)a3;
- (void)setExistingFileSize:(int64_t)a3;
- (void)setFileDownloading:(id)a3;
- (void)setLastDownloadedByte:(int64_t)a3;
- (void)setTotalFileSize:(int64_t)a3;
@end

@implementation MSDPartialDownload

- (MSDPartialDownload)init
{
  return self;
}

- (MSDPartialDownload)initWithFilePath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDPartialDownload;
  v5 = [(MSDPartialDownload *)&v10 init];
  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    if ([v6 fileExistsAtPath:v4])
    {
      v7 = [v6 attributesOfItemAtPath:v4 error:0];
      -[MSDPartialDownload setExistingFileSize:](v5, "setExistingFileSize:", [v7 fileSize]);
    }
    else
    {
      [(MSDPartialDownload *)v5 setExistingFileSize:0];
    }
    [(MSDPartialDownload *)v5 setTotalFileSize:-1];
    [(MSDPartialDownload *)v5 setDownloadedBytes:0];
    [(MSDPartialDownload *)v5 setLastDownloadedByte:0];
    v8 = v5;
  }
  return v5;
}

- (BOOL)isDownloadComplete
{
  int64_t v3 = [(MSDPartialDownload *)self downloadedBytes];
  int64_t v4 = [(MSDPartialDownload *)self existingFileSize];
  if ([(MSDPartialDownload *)self totalFileSize] != -1)
  {
    v5 = (void *)(v4 + v3);
    if ((void *)[(MSDPartialDownload *)self totalFileSize] == v5) {
      return 1;
    }
    if ([(MSDPartialDownload *)self totalFileSize] < (uint64_t)v5)
    {
      v6 = +[NSDictionary dictionaryWithObjectsAndKeys:@"Downloaded file size went bigger than total size", @"testEventAdditionalData", &off_100161FB8, @"testLogLevel", 0];
      v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        int64_t v10 = [(MSDPartialDownload *)self totalFileSize];
        __int16 v11 = 2048;
        int64_t v12 = [(MSDPartialDownload *)self downloadedBytes];
        __int16 v13 = 2048;
        int64_t v14 = [(MSDPartialDownload *)self existingFileSize];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error happened totalFileSize = %ld downloadContentSize=%ld existingFileSize=%ld", buf, 0x20u);
      }

      return 1;
    }
  }
  return 0;
}

- (BOOL)didProgress
{
  uint64_t v3 = [(MSDPartialDownload *)self downloadedBytes];
  return v3 > [(MSDPartialDownload *)self lastDownloadedByte];
}

- (void)recordDownloadedBytes
{
  int64_t v3 = [(MSDPartialDownload *)self downloadedBytes];

  [(MSDPartialDownload *)self setLastDownloadedByte:v3];
}

- (id)getRangeHeaderForDownload
{
  v2 = +[NSString stringWithFormat:@"%ld", (char *)[(MSDPartialDownload *)self existingFileSize]+ [(MSDPartialDownload *)self downloadedBytes]];
  int64_t v3 = +[NSString stringWithFormat:@"bytes=%@-%@", v2, &stru_100155450];

  return v3;
}

- (void)processServerRangeResponse:(id)a3
{
  id v9 = a3;
  if ([(MSDPartialDownload *)self totalFileSize] == -1)
  {
    v5 = [v9 componentsSeparatedByString:@"/"];
    int64_t v4 = v5;
    if (v5)
    {
      if ([v5 count] == (id)2)
      {
        v6 = [v4 objectAtIndexedSubscript:1];
        id v7 = [v6 longLongValue];

        if (v7)
        {
          v8 = [v4 objectAtIndexedSubscript:1];
          -[MSDPartialDownload setTotalFileSize:](self, "setTotalFileSize:", [v8 longLongValue]);
        }
      }
    }
  }
  else
  {
    int64_t v4 = 0;
  }
}

- (void)appendDownloadedFileSize:(int64_t)a3
{
  int64_t v4 = (char *)[(MSDPartialDownload *)self downloadedBytes] + a3;

  [(MSDPartialDownload *)self setDownloadedBytes:v4];
}

- (id)description
{
  int64_t v3 = +[NSMutableString stringWithFormat:@"TotalFileSize: %ld\t", [(MSDPartialDownload *)self totalFileSize]];
  [v3 appendFormat:@"DownloadedBytes: %ld", -[MSDPartialDownload downloadedBytes](self, "downloadedBytes")];

  return v3;
}

- (void)pushToTestLog:(id)a3
{
  id v11 = a3;
  if (os_variant_has_internal_content())
  {
    int64_t v4 = [(MSDPartialDownload *)self fileDownloading];
    v5 = [v4 stringByAppendingString:@" -> "];
    v6 = [(MSDPartialDownload *)self description];
    id v7 = [v5 stringByAppendingString:v6];

    if (v11) {
      id v8 = [v11 mutableCopy];
    }
    else {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v9 = v8;
    if (v7)
    {
      int64_t v10 = +[MSDTestInterface sharedInstance];
      [v10 pushTestEvent:v7 ofType:@"partialRangeStatus"];
    }
  }
}

- (int64_t)totalFileSize
{
  return self->_totalFileSize;
}

- (void)setTotalFileSize:(int64_t)a3
{
  self->_totalFileSize = a3;
}

- (int64_t)downloadedBytes
{
  return self->_downloadedBytes;
}

- (void)setDownloadedBytes:(int64_t)a3
{
  self->_downloadedBytes = a3;
}

- (int64_t)existingFileSize
{
  return self->_existingFileSize;
}

- (void)setExistingFileSize:(int64_t)a3
{
  self->_existingFileSize = a3;
}

- (int64_t)lastDownloadedByte
{
  return self->_lastDownloadedByte;
}

- (void)setLastDownloadedByte:(int64_t)a3
{
  self->_lastDownloadedByte = a3;
}

- (NSString)fileDownloading
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileDownloading:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
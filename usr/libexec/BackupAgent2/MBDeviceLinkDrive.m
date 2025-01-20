@interface MBDeviceLinkDrive
+ (id)deviceLinkDriveWithConnection:(void *)a3;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4;
- (BOOL)mapStatus:(int)a3 errorString:(id)a4 path:(id)a5 error:(id *)a6;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6;
- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (MBDeviceLinkDrive)initWithConnection:(void *)a3;
- (__CFDictionary)mapOptions:(id)a3;
- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (id)mapAttributes:(id)a3;
- (id)mapFileType:(id)a3;
- (id)mapResults:(id)a3;
- (int)mapStatus:(int)a3;
- (void)connection;
- (void)dealloc;
- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4;
@end

@implementation MBDeviceLinkDrive

- (int)mapStatus:(int)a3
{
  int v4 = a3 + 15;
  if (a3 + 15) < 0x10 && ((0xE3F5u >> v4)) {
    return dword_1000B0C88[v4];
  }
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No code for DeviceLink error: %d", buf, 8u);
    _MBLog();
  }
  return 100;
}

- (BOOL)mapStatus:(int)a3 errorString:(id)a4 path:(id)a5 error:(id *)a6
{
  if (a3 && a6) {
    *a6 = +[MBError errorWithCode:[(MBDeviceLinkDrive *)self mapStatus:*(void *)&a3], a5, @"%@", a4 path format];
  }
  return a3 == 0;
}

- (__CFDictionary)mapOptions:(id)a3
{
  int v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [a3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [a3 objectForKeyedSubscript:v9];
        if ([v9 isEqualToString:@"FileHandleFactory"])
        {
          v11 = [[MBDeviceLinkDriveContext alloc] initWithFileHandleFactory:v10];
          v13[0] = sub_10001E1F8;
          v13[1] = sub_10001E278;
          v13[2] = sub_10001E2D0;
          v13[3] = sub_10001E330;
          v13[4] = sub_10001E3A0;
          v13[5] = v11;
          [(NSMutableDictionary *)v4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [+[NSData dataWithBytes:v13 length:48] bytes]) forKeyedSubscript:@"DLDeviceIOCallbacks"];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return (__CFDictionary *)v4;
}

- (id)mapResults:(id)a3
{
  int v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [a3 objectForKeyedSubscript:v9];
        v11 = +[NSMutableDictionary dictionaryWithCapacity:0];
        signed int v12 = [-[MBDeviceLinkDrive mapStatus:](self, "mapStatus:", [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"DLFileErrorCode"), "intValue")]);
        CFStringRef v13 = (const __CFString *)[v10 objectForKeyedSubscript:@"DLFileErrorString"];
        if (v13) {
          CFStringRef v14 = v13;
        }
        else {
          CFStringRef v14 = &stru_1000F43B0;
        }
        [(NSMutableDictionary *)v11 setObject:v14 forKeyedSubscript:NSLocalizedDescriptionKey];
        [(NSMutableDictionary *)v4 setObject:+[NSError errorWithDomain:@"MBErrorDomain" code:v12 userInfo:v11] forKeyedSubscript:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)mapFileType:(id)a3
{
  if ([a3 isEqualToString:@"DLFileTypeDirectory"])
  {
    int v4 = (id *)&NSFileTypeDirectory;
  }
  else
  {
    unsigned int v5 = [a3 isEqualToString:@"DLFileTypeRegular"];
    int v4 = (id *)&NSFileTypeUnknown;
    if (v5) {
      int v4 = (id *)&NSFileTypeRegular;
    }
  }
  return *v4;
}

- (id)mapAttributes:(id)a3
{
  unsigned int v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    NSFileAttributeKey v16 = NSFileModificationDate;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [a3 objectForKeyedSubscript:v10, v16];
        if ([v10 isEqualToString:@"DLFileType"])
        {
          id v12 = [(MBDeviceLinkDrive *)self mapFileType:v11];
          CFStringRef v13 = v5;
          NSFileAttributeKey v14 = NSFileType;
        }
        else if ([v10 isEqualToString:@"DLFileSize"])
        {
          CFStringRef v13 = v5;
          id v12 = v11;
          NSFileAttributeKey v14 = NSFileSize;
        }
        else
        {
          if (![v10 isEqualToString:@"DLFileModificationDate"]) {
            continue;
          }
          CFStringRef v13 = v5;
          id v12 = v11;
          NSFileAttributeKey v14 = v16;
        }
        [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
      }
      id v7 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  return v5;
}

+ (id)deviceLinkDriveWithConnection:(void *)a3
{
  v3 = [[MBDeviceLinkDrive alloc] initWithConnection:a3];

  return v3;
}

- (MBDeviceLinkDrive)initWithConnection:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MBDeviceLinkDrive;
  result = [(MBDeviceLinkDrive *)&v5 init];
  if (result) {
    result->_connection = a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MBDeviceLinkDrive;
  [(MBDeviceLinkDrive *)&v2 dealloc];
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v8 = DLCreateDirectory();
  id v9 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v8 errorString:0 path:a3 error:a5];
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v22 = 0;
  id v23 = 0;
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v8 = DLContentsOfDirectory();
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  if (!v8)
  {
    id v11 = +[NSMutableDictionary dictionaryWithCapacity:0];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v23;
    id v13 = [v23 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        NSFileAttributeKey v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", -[MBDeviceLinkDrive mapAttributes:](self, "mapAttributes:", [v23 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16)]), *(void *)(*((void *)&v18 + 1) + 8 * (void)v16));
          NSFileAttributeKey v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v14);
    }
  }
  [(MBDeviceLinkDrive *)self mapStatus:v8 errorString:v22 path:a3 error:a5];
  return v11;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  [(MBDeviceLinkDrive *)self mapOptions:a5];
  uint64_t v9 = DLCopyItem();
  id v10 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v9 errorString:0 path:a3 error:a6];
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  [(MBDeviceLinkDrive *)self mapOptions:a5];
  uint64_t v9 = DLUploadFile();
  id v10 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v9 errorString:0 path:a3 error:a6];
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v9 = DLUploadFiles();
  if (a5) {
    *a5 = [(MBDeviceLinkDrive *)self mapResults:0];
  }

  id v10 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v9 errorString:0 path:0 error:a6];
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  [(MBDeviceLinkDrive *)self mapOptions:a5];
  uint64_t v9 = DLDownloadFile();
  id v10 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v9 errorString:0 path:a3 error:a6];
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v9 = DLDownloadFiles();
  if (a5) {
    *a5 = [(MBDeviceLinkDrive *)self mapResults:0];
  }

  id v10 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v9 errorString:0 path:0 error:a6];
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  [(MBDeviceLinkDrive *)self mapOptions:a5];
  uint64_t v9 = DLMoveItem();
  id v10 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v9 errorString:0 path:a3 error:a6];
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  if (![a3 count]) {
    return 1;
  }
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v10 = DLMoveItems();
  if (a5) {
    *a5 = [(MBDeviceLinkDrive *)self mapResults:0];
  }

  id v11 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v10 errorString:0 path:0 error:a6];
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v8 = DLRemoveItem();
  id v9 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v8 errorString:0 path:a3 error:a5];
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  if (![a3 count]) {
    return 1;
  }
  [(MBDeviceLinkDrive *)self mapOptions:a4];
  uint64_t v10 = DLRemoveItems();
  if (a5) {
    *a5 = [(MBDeviceLinkDrive *)self mapResults:0];
  }

  id v11 = 0;
  return [(MBDeviceLinkDrive *)self mapStatus:v10 errorString:0 path:0 error:a6];
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  return [(MBDeviceLinkDrive *)self mapStatus:DLGetFreeDiskSpace() errorString:0 path:0 error:a4];
}

- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6
{
  return [(MBDeviceLinkDrive *)self mapStatus:DLPurgeDiskSpace() errorString:0 path:0 error:a6];
}

- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4
{
  connection = self->_connection;
  id v6 = +[NSNumber numberWithDouble:a3];
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];

  _DLSetProgress(connection, v6, v7);
}

- (void)connection
{
  return self->_connection;
}

@end
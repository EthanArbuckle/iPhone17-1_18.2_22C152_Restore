@interface MBDrive
+ (BOOL)singleFromMultiErrorWithReturnValue:(BOOL)a3 results:(id)a4 error:(id *)a5;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6;
- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadData:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadPropertyList:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)usageOfDirectoryAtPath:(id)a3 count:(unint64_t *)a4 size:(unint64_t *)a5 options:(id)a6 error:(id *)a7;
- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (id)dataAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (id)enumerateContentsOfDirectoryAtPath:(id)a3 options:(id)a4 foundItem:(id)a5;
- (id)enumerateContentsOfDirectoryAtPath:(id)a3 options:(id)a4 recurse:(BOOL)a5 foundItem:(id)a6;
- (id)propertyListAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (void)finishBatchUploadsWithOptions:(id)a3 completion:(id)a4;
- (void)uploadBatch:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation MBDrive

+ (BOOL)singleFromMultiErrorWithReturnValue:(BOOL)a3 results:(id)a4 error:(id *)a5
{
  if (a5 && !a3 && +[MBError isError:*a5 withCode:2])
  {
    if ([a4 count] != (id)1) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"MBDrive.m" lineNumber:51 description:@"Unexpected result count"];
    }
    *a5 = [objc_msgSend(a4, "allValues") lastObject];
  }
  return a3;
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)enumerateContentsOfDirectoryAtPath:(id)a3 options:(id)a4 recurse:(BOOL)a5 foundItem:(id)a6
{
  BOOL v7 = a5;
  id v33 = 0;
  id v26 = a3;
  id v27 = a4;
  id v12 = [(MBDrive *)self contentsOfDirectoryAtPath:a3 options:a4 error:&v33];
  if (v12)
  {
    v13 = v12;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [v12 allKeys];
    id v14 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v30;
      v25 = v11;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v19 = [v13 objectForKeyedSubscript:v18];
          if (((*((uint64_t (**)(id, uint64_t, id))a6 + 2))(a6, v18, v19) & 1) == 0)
          {
            id v33 = +[MBError errorWithCode:1 format:@"Enumeration canceled"];
LABEL_19:
            v11 = v25;
            goto LABEL_20;
          }
          if (objc_msgSend(objc_msgSend(v19, "fileType"), "isEqualToString:", NSFileTypeDirectory)) {
            BOOL v20 = !v7;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20)
          {
            id v21 = -[MBDrive enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:](self, "enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:", [v26 stringByAppendingPathComponent:v18], v27, 0, a6);
            id v33 = v21;
            if (v21)
            {
              id v23 = v21;
              goto LABEL_19;
            }
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        v11 = v25;
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v22 = v33;
  }
LABEL_20:
  return v33;
}

- (id)enumerateContentsOfDirectoryAtPath:(id)a3 options:(id)a4 foundItem:(id)a5
{
  return [(MBDrive *)self enumerateContentsOfDirectoryAtPath:a3 options:a4 recurse:1 foundItem:a5];
}

- (BOOL)usageOfDirectoryAtPath:(id)a3 count:(unint64_t *)a4 size:(unint64_t *)a5 options:(id)a6 error:(id *)a7
{
  id v9 = [(MBDrive *)self contentsOfDirectoryAtPath:a3 options:a6 error:a7];
  if (v9)
  {
    v10 = v9;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v16 = [v10 objectForKeyedSubscript:v15];
          id v17 = [v16 fileType];
          if ([v17 isEqualToString:NSFileTypeDirectory])
          {
            if (!-[MBDrive usageOfDirectoryAtPath:count:size:options:error:](self, "usageOfDirectoryAtPath:count:size:options:error:", [a3 stringByAppendingPathComponent:v15], a4, a5, a6, a7))
            {
              LOBYTE(v9) = 0;
              return (char)v9;
            }
          }
          else if ([v17 isEqualToString:NSFileTypeRegular])
          {
            ++*a4;
            *a5 += (unint64_t)[v16 fileSize];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v9 = 0;
  BOOL v7 = [(MBDrive *)self uploadFilesAtPaths:+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1] options:a5 results:&v9 error:a6];
  return +[MBDrive singleFromMultiErrorWithReturnValue:v7 results:v9 error:a6];
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  return 0;
}

- (void)uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!-[MBDrive uploadFilesAtPaths:options:results:error:](self, "uploadFilesAtPaths:options:results:error:", objc_msgSend(a3, "paths", 0, 0, 0, 0), a4, &v8, &v7)&& !v7)
  {
    sub_1000990D8();
  }
  (*((void (**)(id, long long *, uint64_t, uint64_t))a5 + 2))(a5, &v6, v8, v7);
}

- (void)finishBatchUploadsWithOptions:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v9 = 0;
  BOOL v7 = [(MBDrive *)self downloadFilesAtPaths:+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1] options:a5 results:&v9 error:a6];
  return +[MBDrive singleFromMultiErrorWithReturnValue:v7 results:v9 error:a6];
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)uploadData:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v11 = MBTemporaryPath();
  id v16 = 0;
  if (![a3 writeToFile:v11 options:1 error:&v16])
  {
    if (objc_msgSend(objc_msgSend(v16, "domain"), "isEqualToString:", NSCocoaErrorDomain)
      && [v16 code] == (id)640
      || objc_msgSend(objc_msgSend(v16, "domain"), "isEqualToString:", NSPOSIXErrorDomain)
      && [v16 code] == (id)28)
    {
      if (a6)
      {
        CFStringRef v13 = @"No space writing data to temporary file";
        uint64_t v14 = 106;
LABEL_11:
        BOOL v12 = 0;
        *a6 = +[MBError errorWithCode:v14 format:v13];
        return v12;
      }
    }
    else if (a6)
    {
      CFStringRef v13 = @"Error writing data to temporary file";
      uint64_t v14 = 102;
      goto LABEL_11;
    }
    return 0;
  }
  BOOL v12 = [(MBDrive *)self uploadFileAtPath:v11 toPath:a4 options:a5 error:a6];
  [+[NSFileManager defaultManager] removeItemAtPath:v11 error:0];
  return v12;
}

- (id)dataAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v9 = MBTemporaryPath();
  if ([(MBDrive *)self downloadFileAtPath:a3 toPath:v9 options:a4 error:a5])
  {
    id v10 = [+[NSFileManager defaultManager] attributesOfItemAtPath:v9 error:0];
    unsigned int v11 = [[a4 objectForKeyedSubscript:@"MemoryMapped"] boolValue];
    BOOL v12 = MBGetDefaultLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (!v13)
      {
        uint64_t v15 = 8;
        goto LABEL_11;
      }
      NSFileAttributeKey v14 = NSFileSize;
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      id v23 = [[-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", NSFileSize) unsignedIntegerValue];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Opening file mapped at '%@' (%{bytes}lu)", buf, 0x16u);
      uint64_t v15 = 8;
    }
    else
    {
      if (!v13)
      {
        uint64_t v15 = 0;
        goto LABEL_11;
      }
      NSFileAttributeKey v14 = NSFileSize;
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      id v23 = [[-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", NSFileSize) unsignedIntegerValue];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Opening file unmapped at '%@' (%{bytes}lu)", buf, 0x16u);
      uint64_t v15 = 0;
    }
    uint64_t v18 = v9;
    id v19 = [[-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v14) unsignedIntegerValue];
    _MBLog();
LABEL_11:
    id v16 = +[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v9, v15, a5, v18, v19);
    [+[NSFileManager defaultManager] removeItemAtPath:v9 error:0];
    return v16;
  }
  return 0;
}

- (BOOL)uploadPropertyList:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v13 = 0;
  id v10 = +[NSPropertyListSerialization dataFromPropertyList:a3 format:200 errorDescription:&v13];
  if (v10) {
    return [(MBDrive *)self uploadData:v10 toPath:a4 options:a5 error:a6];
  }
  if (!a6) {
    return 0;
  }
  BOOL v12 = +[MBError errorWithCode:10, @"Error serializing property list: %@", v13 format];
  BOOL result = 0;
  *a6 = v12;
  return result;
}

- (id)propertyListAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v9 = 0;
  id result = -[MBDrive dataAtPath:options:error:](self, "dataAtPath:options:error:", a3, a4);
  if (result)
  {
    id result = +[NSPropertyListSerialization propertyListFromData:result mutabilityOption:0 format:0 errorDescription:&v9];
    if (!result)
    {
      if (a5)
      {
        uint64_t v8 = +[MBError errorWithCode:11, a3, @"Error deserializing property list: %@", v9 path format];
        id result = 0;
        *a5 = v8;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v9 = 0;
  BOOL v7 = [(MBDrive *)self moveItemsAtPaths:+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1] options:a5 results:&v9 error:a6];
  return +[MBDrive singleFromMultiErrorWithReturnValue:v7 results:v9 error:a6];
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  uint64_t v8 = 0;
  BOOL v6 = [(MBDrive *)self removeItemsAtPaths:+[NSArray arrayWithObjects:&v9 count:1] options:a4 results:&v8 error:a5];
  return +[MBDrive singleFromMultiErrorWithReturnValue:v6 results:v8 error:a5];
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6
{
  if (a6) {
    *a6 = +[MBError errorWithCode:21, @"PurgeDiskSpace not implemented", *(void *)&a5 format];
  }
  return 0;
}

@end
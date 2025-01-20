@interface TransparencyFileSupport
+ (BOOL)deleteFile:(id)a3 error:(id *)a4;
+ (BOOL)deleteFile:(id)a3 inDirectory:(id)a4 error:(id *)a5;
+ (BOOL)setProtectionToClassDForURL:(id)a3 error:(id *)a4;
+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 error:(id *)a5;
+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 inDirectory:(id)a5 error:(id *)a6;
+ (id)applicationSupportPath:(id *)a3;
+ (id)readDataFromFile:(id)a3 error:(id *)a4;
+ (id)readDictionaryFromFile:(id)a3 error:(id *)a4;
+ (id)readDictionaryFromFile:(id)a3 inDirectory:(id)a4 error:(id *)a5;
+ (id)transparencyFilesPath:(id *)a3;
+ (int64_t)directorySizeInKB:(id *)a3;
@end

@implementation TransparencyFileSupport

+ (BOOL)setProtectionToClassDForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  int v7 = v6;
  if (v6)
  {
    if (fcntl(v6, 64, 4) < 0)
    {
      if (a4)
      {
        uint64_t v8 = *__error();
        v9 = __error();
        v10 = strerror(*v9);
        *a4 = +[TransparencyError errorWithDomain:NSPOSIXErrorDomain, v8, @"set protection class error for file %@: %s(%d)", v5, v10, *__error() code description];
      }
      if (qword_10015B3B0 != -1) {
        dispatch_once(&qword_10015B3B0, &stru_100136CA0);
      }
      v11 = (void *)qword_10015B3B8;
      if (os_log_type_enabled((os_log_t)qword_10015B3B8, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = __error();
        v14 = strerror(*v13);
        int v15 = *__error();
        *(_DWORD *)buf = 138412802;
        id v26 = v5;
        __int16 v27 = 2080;
        v28 = v14;
        __int16 v29 = 1024;
        int v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "set protection class error for file %@: %s(%d)", buf, 0x1Cu);
      }
    }
    close(v7);
  }
  else
  {
    if (a4)
    {
      uint64_t v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      *a4 = +[TransparencyError errorWithDomain:NSPOSIXErrorDomain, v16, @"open error for file %@: %s(%d)", v5, v18, *__error() code description];
    }
    if (qword_10015B3B0 != -1) {
      dispatch_once(&qword_10015B3B0, &stru_100136CC0);
    }
    v19 = (void *)qword_10015B3B8;
    if (os_log_type_enabled((os_log_t)qword_10015B3B8, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      v21 = __error();
      v22 = strerror(*v21);
      int v23 = *__error();
      *(_DWORD *)buf = 138412802;
      id v26 = v5;
      __int16 v27 = 2080;
      v28 = v22;
      __int16 v29 = 1024;
      int v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "open error for file %@: %s(%d)", buf, 0x1Cu);
    }
  }

  return v7 != 0;
}

+ (id)applicationSupportPath:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v5 = [v4 URLsForDirectory:14 inDomains:1];

  if ([v5 count])
  {
    int v6 = [v5 objectAtIndexedSubscript:0];
    int v7 = [v6 URLByAppendingPathComponent:@"com.apple.transparencyd" isDirectory:1];

    uint64_t v8 = +[NSFileManager defaultManager];
    NSFileAttributeKey v15 = NSFileProtectionKey;
    NSFileProtectionType v16 = NSFileProtectionNone;
    v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    unsigned int v10 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v9 error:a3];

    id v11 = 0;
    if (v10) {
      id v11 = v7;
    }
  }
  else
  {
    if (a3)
    {
      *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorFile code:-37 description:@"failed to get Application Support dir"];
    }
    if (qword_10015B3B0 != -1) {
      dispatch_once(&qword_10015B3B0, &stru_100136CE0);
    }
    v12 = qword_10015B3B8;
    if (os_log_type_enabled((os_log_t)qword_10015B3B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to get Application Support dir", v14, 2u);
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)transparencyFilesPath:(id *)a3
{
  return _[a1 applicationSupportPath:a3];
}

+ (int64_t)directorySizeInKB:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v5 = +[TransparencyFileSupport transparencyFilesPath:a3];
  if (v5)
  {
    NSURLResourceKey v26 = NSURLFileSizeKey;
    int v6 = +[NSArray arrayWithObjects:&v26 count:1];
    int v7 = [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:a3];

    if (v7)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        id v10 = v9;
        v19 = v4;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v20 = 0;
            [v14 getResourceValue:&v20 forKey:NSURLFileSizeKey error:a3, v19];
            id v15 = v20;
            if (!v15)
            {
              int64_t v17 = -1;
              goto LABEL_14;
            }
            NSFileProtectionType v16 = v15;
            v11 += (uint64_t)[v15 unsignedIntegerValue];
          }
          id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        int64_t v17 = v11 / 1000;
LABEL_14:
        v4 = v19;
      }
      else
      {
        int64_t v17 = 0;
      }
    }
    else
    {
      int64_t v17 = -1;
    }
  }
  else
  {
    int64_t v17 = -1;
  }

  return v17;
}

+ (id)readDictionaryFromFile:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  int v6 = [a4 URLByAppendingPathComponent:a3];
  if (v6)
  {
    int v7 = +[NSDictionary dictionaryWithContentsOfURL:v6 error:a5];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)readDictionaryFromFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [a1 transparencyFilesPath:a4];
  if (v7)
  {
    id v8 = [a1 readDictionaryFromFile:v6 inDirectory:v7 error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)readDataFromFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[TransparencyFileSupport transparencyFilesPath:a4];
  int v7 = v6;
  if (v6)
  {
    id v8 = [v6 URLByAppendingPathComponent:v5];
    id v9 = +[NSData dataWithContentsOfURL:v8 options:0 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 inDirectory:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a5 URLByAppendingPathComponent:a4];
  LODWORD(a4) = [v9 writeToURL:v10 error:a6];

  BOOL v11 = a4
     && +[TransparencyFileSupport setProtectionToClassDForURL:v10 error:a6];

  return v11;
}

+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[TransparencyFileSupport transparencyFilesPath:a5];
  if (v10) {
    unsigned __int8 v11 = [a1 writeDictionaryToFile:v8 fileName:v9 inDirectory:v10 error:a5];
  }
  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (BOOL)deleteFile:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  id v6 = [a4 URLByAppendingPathComponent:a3];
  int v7 = +[NSFileManager defaultManager];
  LOBYTE(a5) = [v7 removeItemAtURL:v6 error:a5];

  return (char)a5;
}

+ (BOOL)deleteFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = +[TransparencyFileSupport transparencyFilesPath:a4];
  if (v7) {
    unsigned __int8 v8 = [a1 deleteFile:v6 inDirectory:v7 error:a4];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end
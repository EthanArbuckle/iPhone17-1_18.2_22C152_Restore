@interface MIIPAPatcherFileManager
+ (id)defaultManager;
- (BOOL)copyFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5;
- (BOOL)createDirectoryAtPath:(id)a3 relativeToURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6;
- (BOOL)createDirectoryAtURL:(id)a3 mode:(unsigned __int16)a4 withError:(id *)a5;
- (BOOL)enumerateDirectoryAtURL:(id)a3 includeTypes:(unint64_t)a4 withError:(id *)a5 enumerator:(id)a6;
- (BOOL)writeData:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6;
- (BOOL)writePlistRepresentation:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6;
- (id)dataFromFileURL:(id)a3 withError:(id *)a4;
- (id)dataFromPlistRepresentation:(id)a3 withError:(id *)a4;
- (id)directoriesOrderedByDepthFromFilePaths:(id)a3;
- (id)plistRepresentationFromData:(id)a3 withError:(id *)a4;
- (id)plistRepresentationFromFileURL:(id)a3 withError:(id *)a4;
@end

@implementation MIIPAPatcherFileManager

+ (id)defaultManager
{
  if (qword_1000A5F68 != -1) {
    dispatch_once(&qword_1000A5F68, &stru_10008CE00);
  }
  v2 = (void *)qword_1000A5F60;

  return v2;
}

- (id)dataFromFileURL:(id)a3 withError:(id *)a4
{
  return +[NSData dataWithContentsOfURL:a3 options:1 error:a4];
}

- (id)plistRepresentationFromFileURL:(id)a3 withError:(id *)a4
{
  return +[NSDictionary dictionaryWithContentsOfURL:a3 error:a4];
}

- (BOOL)writeData:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  return [a3 writeToURL:a4 options:0 error:a6];
}

- (BOOL)writePlistRepresentation:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a4;
  id v18 = 0;
  v11 = [(MIIPAPatcherFileManager *)self dataFromPlistRepresentation:a3 withError:&v18];
  id v12 = v18;
  v13 = v12;
  if (v11)
  {
    id v17 = v12;
    BOOL v14 = [(MIIPAPatcherFileManager *)self writeData:v11 toFileURL:v10 mode:v7 withError:&v17];
    id v15 = v17;

    v13 = v15;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if (!v14) {
    *a6 = v13;
  }
LABEL_7:

  return v14;
}

- (BOOL)enumerateDirectoryAtURL:(id)a3 includeTypes:(unint64_t)a4 withError:(id *)a5 enumerator:(id)a6
{
  id v8 = a3;
  v9 = (uint64_t (**)(id, void *, id *))a6;
  id v10 = v8;
  v11 = opendir((const char *)[v10 fileSystemRepresentation]);
  if (!v11)
  {
    uint64_t v20 = *__error();
    v29[0] = NSLocalizedDescriptionKey;
    id v21 = objc_alloc((Class)NSString);
    v22 = [v10 path];
    id v23 = [v21 initWithFormat:@"Failed to open [%@] for enumeration", v22];
    v30[0] = v23;
    v30[1] = &off_100096F28;
    v29[1] = @"line";
    v29[2] = @"function";
    v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager enumerateDirectoryAtURL:includeTypes:withError:enumerator:]");
    v30[2] = v24;
    v25 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v20 userInfo:v25];

    goto LABEL_30;
  }
  id v12 = 0;
  while (1)
  {
    v13 = readdir(v11);
    if (!v13) {
      break;
    }
    if (v13->d_name[0] != 46)
    {
      int d_type = v13->d_type;
      id v15 = +[NSString stringWithUTF8String:v13->d_name];
      v16 = [v10 URLByAppendingPathComponent:v15 isDirectory:0];

      if (d_type) {
        goto LABEL_8;
      }
      memset(&v28, 0, sizeof(v28));
      if (stat((const char *)[v16 fileSystemRepresentation], &v28))
      {
LABEL_7:
        int d_type = 0;
        goto LABEL_8;
      }
      int v19 = v28.st_mode & 0xF000;
      switch(v19)
      {
        case 16384:
          int d_type = 4;
          break;
        case 32768:
          int d_type = 8;
          break;
        case 40960:
          int d_type = 10;
          break;
        default:
          goto LABEL_7;
      }
LABEL_8:
      if (!a4) {
        goto LABEL_15;
      }
      switch(d_type)
      {
        case 4:
          if ((a4 & 2) != 0) {
            goto LABEL_15;
          }
          break;
        case 10:
          if ((a4 & 4) != 0) {
            goto LABEL_15;
          }
          break;
        case 8:
          if (a4) {
            goto LABEL_15;
          }
          break;
        default:
          if ((a4 & 8) != 0)
          {
LABEL_15:
            id v27 = v12;
            int v17 = v9[2](v9, v16, &v27);
            id v18 = v27;

            id v12 = v18;
            goto LABEL_16;
          }
          break;
      }
      int v17 = 1;
LABEL_16:

      if (!v17) {
        break;
      }
    }
  }
  closedir(v11);
LABEL_30:

  return v11 != 0;
}

- (id)directoriesOrderedByDepthFromFilePaths:(id)a3
{
  id v3 = a3;
  id v31 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v10 hasSuffix:@"/"]) {
          [v10 stringByStandardizingPath];
        }
        else {
        v11 = [v10 stringByDeletingLastPathComponent];
        }
        if ([v11 length])
        {
          id v12 = [v11 pathComponents];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v7);
  }
  id v27 = v5;

  v30 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  if ([v4 count])
  {
    uint64_t v13 = 0;
    id v29 = v4;
    do
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = v4;
      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v33;
        ++v13;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            int v19 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
            uint64_t v20 = [v19 objectAtIndexedSubscript:0];
            unsigned int v21 = [v20 isEqual:@"/"];

            unint64_t v22 = v13 + v21;
            if ((unint64_t)[v19 count] >= v22)
            {
              id v23 = [v19 subarrayWithRange:NSMakeRange(0, v13 + v21)];
              v24 = +[NSString pathWithComponents:v23];
              if (([v31 containsObject:v24] & 1) == 0) {
                [v31 addObject:v24];
              }
            }
            if ((unint64_t)[v19 count] <= v22) {
              [v30 addObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v16);
        id v4 = v29;
      }
      else
      {
        ++v13;
      }

      [v14 minusSet:v30];
      [v30 removeAllObjects];
    }
    while ([v14 count]);
  }

  id v25 = [v31 copy];

  return v25;
}

- (BOOL)createDirectoryAtURL:(id)a3 mode:(unsigned __int16)a4 withError:(id *)a5
{
  id v7 = a3;
  if (mkdir((const char *)[v7 fileSystemRepresentation], a4) && (uint64_t v8 = *__error(), v8 != 17))
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v7 path];
    id v13 = [v11 initWithFormat:@"Could not create directory at [%@]", v12, NSLocalizedDescriptionKey];
    v18[0] = v13;
    v18[1] = &off_100096F40;
    v17[1] = @"line";
    v17[2] = @"function";
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager createDirectoryAtURL:mode:withError:]");
    v18[2] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v8 userInfo:v15];

    if (a5)
    {
      id v9 = v9;
      BOOL v10 = 0;
      *a5 = v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    id v9 = 0;
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)createDirectoryAtPath:(id)a3 relativeToURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7 = a5;
  id v9 = [a4 URLByAppendingPathComponent:a3 isDirectory:1];
  id v14 = 0;
  BOOL v10 = [(MIIPAPatcherFileManager *)self createDirectoryAtURL:v9 mode:v7 withError:&v14];
  id v11 = v14;
  id v12 = v11;
  if (a6 && !v10) {
    *a6 = v11;
  }

  return v10;
}

- (id)plistRepresentationFromData:(id)a3 withError:(id *)a4
{
  id v15 = 0;
  id v5 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:&v15];
  id v6 = v15;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    v16[0] = NSLocalizedDescriptionKey;
    id v7 = objc_alloc((Class)NSString);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v7 initWithFormat:@"Plist data is not a dictionary, got [%@]", v9];
    v17[0] = v10;
    v17[1] = &off_100096F58;
    v16[1] = @"line";
    v16[2] = @"function";
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager plistRepresentationFromData:withError:]");
    v17[2] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    uint64_t v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v12];

    id v6 = (id)v13;
  }
  if (a4)
  {
    id v6 = v6;
    id v5 = 0;
    *a4 = v6;
  }
  else
  {
    id v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)dataFromPlistRepresentation:(id)a3 withError:(id *)a4
{
  return +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:a4];
}

- (BOOL)copyFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = (const char *)[v9 fileSystemRepresentation];
  id v11 = v8;
  int v12 = copyfile(v10, (const char *)[v11 fileSystemRepresentation], 0, 0xC000Fu);
  if (v12)
  {
    uint64_t v21 = *__error();
    unint64_t v22 = a5;
    v23[0] = NSLocalizedDescriptionKey;
    id v13 = objc_alloc((Class)NSString);
    id v14 = [v9 path];
    id v15 = [v11 path];
    id v16 = [v13 initWithFormat:@"Could not copy file from [%@] to [%@]", v14, v15];
    v24[0] = v16;
    v24[1] = &off_100096F70;
    v23[1] = @"line";
    v23[2] = @"function";
    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager copyFromURL:toURL:withError:]");
    v24[2] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    id v19 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v21 userInfo:v18];

    if (v22)
    {
      id v19 = v19;
      id *v22 = v19;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v12 == 0;
}

@end
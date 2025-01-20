@interface STConcreteFilesystemPrimitives
- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)moveFileAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeFileURL:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 toFileURL:(id)a4 error:(id *)a5;
- (id)fileSizeOfDataAtURL:(id)a3 error:(id *)a4;
- (id)readDataFromFileURL:(id)a3 error:(id *)a4;
- (void)enumerateRegularFilesInDirectoryAtURL:(id)a3 withBlock:(id)a4;
@end

@implementation STConcreteFilesystemPrimitives

- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSFileManager defaultManager];
  LOBYTE(a4) = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:a4];

  return (char)a4;
}

- (BOOL)writeData:(id)a3 toFileURL:(id)a4 error:(id *)a5
{
  return [a3 writeToURL:a4 options:1 error:a5];
}

- (BOOL)removeFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSFileManager defaultManager];
  LOBYTE(a4) = [v6 removeItemAtURL:v5 error:a4];

  return (char)a4;
}

- (id)fileSizeOfDataAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSFileManager defaultManager];
  v7 = [v5 path];

  v8 = [v6 attributesOfItemAtPath:v7 error:a4];

  if (v8)
  {
    v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 fileSize]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)readDataFromFileURL:(id)a3 error:(id *)a4
{
  return +[NSData dataWithContentsOfURL:a3 options:1 error:a4];
}

- (BOOL)moveFileAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSFileManager defaultManager];
  LOBYTE(a5) = [v9 moveItemAtURL:v8 toURL:v7 error:a5];

  return (char)a5;
}

- (void)enumerateRegularFilesInDirectoryAtURL:(id)a3 withBlock:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v6 = +[NSFileManager defaultManager];
  NSURLResourceKey v35 = NSURLIsRegularFileKey;
  id v7 = +[NSArray arrayWithObjects:&v35 count:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100017534;
  v27[3] = &unk_1002FB910;
  id v8 = v5;
  id v28 = v8;
  v29 = &v30;
  v9 = [v6 enumeratorAtURL:v19 includingPropertiesForKeys:v7 options:1 errorHandler:v27];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v21 = 0;
        id v22 = 0;
        unsigned __int8 v15 = [v13 getResourceValue:&v22 forKey:NSURLIsRegularFileKey error:&v21];
        id v16 = v22;
        id v17 = v21;
        if (v15)
        {
          if (![v16 BOOLValue]
            || ((*((void (**)(id, void *, void, uint64_t *))v8 + 2))(v8, v13, 0, v31 + 3),
                !*((unsigned char *)v31 + 24)))
          {
            int v18 = 1;
            goto LABEL_12;
          }
        }
        else
        {
          (*((void (**)(id, void, id, uint64_t *))v8 + 2))(v8, 0, v17, v31 + 3);
        }
        int v18 = 0;
LABEL_12:

        if (!v18) {
          goto LABEL_15;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v10);
  }
LABEL_15:

  _Block_object_dispose(&v30, 8);
}

@end
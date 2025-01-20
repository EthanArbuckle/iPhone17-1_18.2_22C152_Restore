@interface NSFileManager
- (BOOL)removeItemsUnderPath:(id)a3 error:(id *)a4;
@end

@implementation NSFileManager

- (BOOL)removeItemsUnderPath:(id)a3 error:(id *)a4
{
  id v21 = 0;
  v7 = -[NSFileManager enumeratorAtPath:](self, "enumeratorAtPath:");
  if (!v7) {
    return 1;
  }
  v8 = v7;
  v20 = a4;
  id v9 = [(NSDirectoryEnumerator *)v7 nextObject];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    char v12 = 0;
    do
    {
      [(NSDirectoryEnumerator *)v8 skipDescendants];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [a3 stringByAppendingPathComponent:v10];
        unsigned int v15 = [(NSFileManager *)self removeItemAtPath:v14 error:&v21];
        v16 = msuSharedLogger();
        v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully removed old CacheDelete subpath %@", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v23 = v14;
            __int16 v24 = 2112;
            id v25 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to remove old CacheDelete subpath %@: %@", buf, 0x16u);
          }

          id v11 = v21;
          char v12 = 1;
        }
      }
      id v10 = [(NSDirectoryEnumerator *)v8 nextObject];
    }
    while (v10);
  }
  else
  {
    char v12 = 0;
    id v11 = 0;
  }
  id v19 = v11;
  if (v20) {
    id *v20 = v11;
  }
  return (v12 & 1) == 0;
}

@end
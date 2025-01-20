@interface NSFileManager
- (BOOL)bc_doesFolderAtURL:(id)a3 containFileAtURL:(id)a4;
- (BOOL)bc_removeFilesWithExtension:(id)a3 fromDirectory:(id)a4;
- (BOOL)im_safeLinkItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
@end

@implementation NSFileManager

- (BOOL)im_safeLinkItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v40 = a4;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = sub_15E830;
  v61 = sub_15E840;
  id v62 = 0;
  v65[0] = NSURLIsDirectoryKey;
  v65[1] = NSURLIsRegularFileKey;
  uint64_t v8 = +[NSArray arrayWithObjects:v65 count:2];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_15E848;
  v56[3] = &unk_2CA510;
  v56[4] = &v57;
  v39 = self;
  id v9 = [(NSFileManager *)self enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:0 errorHandler:v56];
  v36 = v7;
  v37 = (void *)v8;
  v10 = [v7 path];
  v11 = [v10 stringByResolvingSymlinksInPath];

  v12 = v58;
  if (!v58[5])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v9 = v9;
    id v13 = [v9 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v53;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v53 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id obj = 0;
          id v51 = 0;
          v17 = (id *)v58;
          [v16 getResourceValue:&v51 forKey:NSURLIsDirectoryKey error:&obj];
          id v18 = v51;
          objc_storeStrong(v17 + 5, obj);
          if (v58[5]) {
            goto LABEL_13;
          }
          if ([v18 BOOLValue])
          {
            v19 = [v16 path];
            v20 = [v19 im_stringWithPathRelativeTo:v11];

            v21 = [v40 URLByAppendingPathComponent:v20];
            v22 = (id *)(v58 + 5);
            id v49 = (id)v58[5];
            [(NSFileManager *)v39 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:&v49];
            objc_storeStrong(v22, v49);
            LOBYTE(v22) = v58[5] == 0;

            if ((v22 & 1) == 0)
            {
LABEL_13:

              goto LABEL_14;
            }
          }
        }
        id v13 = [v9 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    v12 = v58;
    if (!v58[5])
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_15E874;
      v48[3] = &unk_2CA510;
      v48[4] = &v57;
      v23 = [(NSFileManager *)v39 enumeratorAtURL:v36 includingPropertiesForKeys:v37 options:0 errorHandler:v48];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v9 = v23;
      id v24 = [v9 countByEnumeratingWithState:&v44 objects:v63 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v45;
        while (2)
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(v9);
            }
            v27 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
            id v42 = 0;
            id v43 = 0;
            v28 = (id *)v58;
            [v27 getResourceValue:&v43 forKey:NSURLIsRegularFileKey error:&v42];
            id v29 = v43;
            objc_storeStrong(v28 + 5, v42);
            if (v58[5]) {
              goto LABEL_26;
            }
            if ([v29 BOOLValue])
            {
              v30 = [v27 path];
              v31 = [v30 im_stringWithPathRelativeTo:v11];

              v32 = [v40 URLByAppendingPathComponent:v31];
              v33 = (id *)(v58 + 5);
              id v41 = (id)v58[5];
              [(NSFileManager *)v39 linkItemAtURL:v27 toURL:v32 error:&v41];
              objc_storeStrong(v33, v41);
              LOBYTE(v33) = v58[5] == 0;

              if ((v33 & 1) == 0)
              {
LABEL_26:

                goto LABEL_27;
              }
            }
          }
          id v24 = [v9 countByEnumeratingWithState:&v44 objects:v63 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      v12 = v58;
    }
  }
  if (a5)
  {
    *a5 = (id) v12[5];
    v12 = v58;
  }
  BOOL v34 = v12[5] == 0;

  _Block_object_dispose(&v57, 8);
  return v34;
}

- (BOOL)bc_doesFolderAtURL:(id)a3 containFileAtURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isFileURL] && objc_msgSend(v5, "isFileURL"))
  {
    id v7 = [v6 path];
    uint64_t v8 = [v7 stringByStandardizingPath];

    id v9 = [v8 stringByResolvingSymlinksInPath];

    v10 = [v5 path];
    v11 = [v10 stringByStandardizingPath];

    v12 = [v11 stringByResolvingSymlinksInPath];

    unsigned __int8 v13 = [v9 hasPrefix:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)bc_removeFilesWithExtension:(id)a3 fromDirectory:(id)a4
{
  id v6 = a3;
  id v7 = +[NSURL fileURLWithPath:a4];
  uint64_t v8 = [(NSFileManager *)self enumeratorAtURL:v7 includingPropertiesForKeys:0 options:5 errorHandler:0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v25;
    *(void *)&long long v11 = 138412546;
    long long v22 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v16 = [v15 pathExtension];
        unsigned int v17 = [v16 isEqualToString:v6];

        if (v17)
        {
          id v23 = 0;
          unsigned __int8 v18 = [(NSFileManager *)self removeItemAtURL:v15 error:&v23];
          id v19 = v23;
          if ((v18 & 1) == 0)
          {
            v20 = BCIMLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v22;
              id v29 = v15;
              __int16 v30 = 2112;
              id v31 = v19;
              _os_log_error_impl(&def_7D91C, v20, OS_LOG_TYPE_ERROR, "Error removing file %@: %@", buf, 0x16u);
            }
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v12);
  }

  return 1;
}

@end
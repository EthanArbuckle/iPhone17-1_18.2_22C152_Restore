@interface RDAttachmentFileManager
+ (id)extractSha512Sum:(id)a3;
- (BOOL)purgeFilesForAccountWithAccountID:(id)a3 error:(id *)a4;
- (BOOL)updateAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6 fileURL:(id)a7 keepSource:(BOOL)a8 error:(id *)a9;
- (RDAttachmentFileManager)initWithDocumentsURLProvider:(id)a3;
- (RDAttachmentFileManagerDocumentsURLProvider)documentsURLProvider;
- (id)URLForAccountFileDirectory:(id)a3;
- (id)URLForAttachmentDirectory:(id)a3 accountID:(id)a4;
- (id)URLForAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6;
- (id)URLForDefaultFilesDirectory;
- (id)URLForHashedAttachmentDirectory:(id)a3;
- (id)URLForHashedAttachmentFileInAccount:(id)a3 sha512Sum:(id)a4 fileExtension:(id)a5;
- (id)URLForHashedAttachmentFileInAccount:(id)a3 sha512SumWithFileExtension:(id)a4;
- (id)attachmentIDsFromAttachmentDirectoryWithAccountID:(id)a3 error:(id *)a4;
- (id)documentsURLForAccountIdentifier:(id)a3;
- (id)purgeAttachmentFilesWithAttachmentIDs:(id)a3 accountID:(id)a4 error:(id *)a5;
- (id)purgeAttachmentFilesWithSha512SumsAndExtensions:(id)a3 accountID:(id)a4 error:(id *)a5;
@end

@implementation RDAttachmentFileManager

- (RDAttachmentFileManager)initWithDocumentsURLProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RDAttachmentFileManager;
  v5 = [(RDAttachmentFileManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_documentsURLProvider, v4);
  }

  return v6;
}

- (id)URLForDefaultFilesDirectory
{
  v2 = [(RDAttachmentFileManager *)self documentsURLForAccountIdentifier:0];
  v3 = [v2 URLByAppendingPathComponent:@"Files/"];

  return v3;
}

- (id)URLForAccountFileDirectory:(id)a3
{
  id v4 = a3;
  v5 = [v4 UUIDString];
  v6 = [(RDAttachmentFileManager *)self documentsURLForAccountIdentifier:v5];

  v7 = [v6 URLByAppendingPathComponent:@"Files/"];
  objc_super v8 = [v4 UUIDString];

  v9 = [@"Account-" stringByAppendingString:v8];

  v10 = [v7 URLByAppendingPathComponent:v9 isDirectory:1];

  return v10;
}

- (id)URLForAttachmentDirectory:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  v7 = [(RDAttachmentFileManager *)self URLForAccountFileDirectory:a4];
  objc_super v8 = [v6 UUIDString];

  v9 = [@"Attachment-" stringByAppendingString:v8];

  v10 = [v7 URLByAppendingPathComponent:v9 isDirectory:1];

  return v10;
}

- (id)URLForHashedAttachmentDirectory:(id)a3
{
  v3 = [(RDAttachmentFileManager *)self URLForAccountFileDirectory:a3];
  id v4 = [v3 URLByAppendingPathComponent:@"Attachments" isDirectory:1];

  return v4;
}

- (id)URLForAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  if (v10)
  {
    v12 = [(RDAttachmentFileManager *)self URLForHashedAttachmentDirectory:a4];
    uint64_t v13 = [v11 pathExtension];

    v14 = [v10 stringByAppendingPathExtension:v13];
    v15 = [v12 URLByAppendingPathComponent:v14 isDirectory:0];

    id v11 = (id)v13;
  }
  else
  {
    v12 = [(RDAttachmentFileManager *)self URLForAttachmentDirectory:a3 accountID:a4];
    v15 = [v12 URLByAppendingPathComponent:v11 isDirectory:0];
  }

  return v15;
}

+ (id)extractSha512Sum:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathComponents];
  v5 = v4;
  if (v4
    && (unint64_t)[v4 count] >= 3
    && (objc_msgSend(v5, "objectAtIndexedSubscript:", (char *)objc_msgSend(v5, "count") - 2),
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:@"Attachments"],
        v6,
        v7))
  {
    objc_super v8 = [v3 URLByDeletingPathExtension];
    v9 = [v8 lastPathComponent];

    if ([v9 length] == (id)128)
    {
      [v9 getCharacters:v17 range:0, 128];
      uint64_t v10 = 0;
      while (1)
      {
        if ((unsigned __int16)(*(_WORD *)&v17[v10] - 48) >= 0xAu)
        {
          unsigned int v11 = *(unsigned __int16 *)&v17[v10] - 65;
          BOOL v12 = v11 > 0x25;
          uint64_t v13 = (1 << v11) & 0x3F0000003FLL;
          if (v12 || v13 == 0) {
            break;
          }
        }
        v10 += 2;
        if (v10 == 256)
        {
          id v15 = v9;
          goto LABEL_18;
        }
      }
    }
    id v15 = 0;
LABEL_18:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)updateAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6 fileURL:(id)a7 keepSource:(BOOL)a8 error:(id *)a9
{
  BOOL v46 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a5;
  v19 = +[NSFileManager defaultManager];
  v47 = v14;
  if (v16)
  {
    v20 = [(RDAttachmentFileManager *)self URLForHashedAttachmentDirectory:v15];
    uint64_t v21 = [v18 pathExtension];

    v22 = [(RDAttachmentFileManager *)self URLForHashedAttachmentFileInAccount:v15 sha512Sum:v16 fileExtension:v21];
    id v18 = (id)v21;
  }
  else
  {
    v20 = [(RDAttachmentFileManager *)self URLForAttachmentDirectory:v14 accountID:v15];
    v22 = [v20 URLByAppendingPathComponent:v18 isDirectory:0];
  }

  id v49 = 0;
  unsigned __int8 v23 = [v19 rem_createDirectoryIfNecessaryAtURL:v20 error:&v49];
  id v24 = v49;
  if ((v23 & 1) == 0)
  {
    v25 = +[REMLogStore container];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v36);
      v42 = NSStringFromSelector(a2);
      v40 = +[NSString stringWithFormat:@"%@.%@", v43, v42];
      uint64_t v37 = [v24 localizedDescription];
      *(_DWORD *)buf = 138544130;
      v51 = v40;
      __int16 v52 = 2114;
      v53 = v47;
      __int16 v54 = 2114;
      id v55 = v15;
      __int16 v56 = 2112;
      uint64_t v57 = v37;
      v38 = (void *)v37;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {attachmentID: %{public}@, accountID: %{public}@, error: %@}", buf, 0x2Au);
    }
  }
  if (([v22 isEqual:v17] & 1) == 0)
  {
    id v48 = 0;
    unsigned int v27 = [v22 checkResourceIsReachableAndReturnError:&v48];
    v28 = (char *)v48;
    if (v27)
    {
      if (v16)
      {
        BOOL v26 = 1;
LABEL_20:

        goto LABEL_21;
      }
      v33 = a9;
      if (![v19 removeItemAtURL:v22 error:a9])
      {
        BOOL v26 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v29 = +[REMLogStore container];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (objc_class *)objc_opt_class();
        v41 = NSStringFromClass(v30);
        v39 = NSStringFromSelector(a2);
        +[NSString stringWithFormat:@"%@.%@", v41, v39];
        v31 = aSelectora = v28;
        v32 = [aSelectora localizedDescription];
        *(_DWORD *)buf = 138544130;
        v51 = v31;
        __int16 v52 = 2114;
        v53 = v47;
        __int16 v54 = 2114;
        id v55 = v15;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] checkResourceIsReachableAndReturnError returned false {attachmentID: %{public}@, accountID: %{public}@, error: %@}", buf, 0x2Au);

        v28 = aSelectora;
      }

      v33 = a9;
    }
    [v17 startAccessingSecurityScopedResource];
    if (v46) {
      unsigned __int8 v34 = [v19 copyItemAtURL:v17 toURL:v22 error:v33];
    }
    else {
      unsigned __int8 v34 = [v19 moveItemAtURL:v17 toURL:v22 error:v33];
    }
    BOOL v26 = v34;
    [v17 stopAccessingSecurityScopedResource];
    goto LABEL_20;
  }
  BOOL v26 = 1;
LABEL_21:

  return v26;
}

- (BOOL)purgeFilesForAccountWithAccountID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_super v8 = +[NSFileManager defaultManager];
  v9 = [(RDAttachmentFileManager *)self URLForAccountFileDirectory:v7];
  id v26 = 0;
  unsigned int v10 = [v9 checkResourceIsReachableAndReturnError:&v26];
  id v11 = v26;
  if (v10)
  {
    id v25 = 0;
    unsigned __int8 v12 = [v8 removeItemAtURL:v9 error:&v25];
    id v13 = v25;
    id v14 = +[REMLogStore container];
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v13 code];
        id v24 = [v13 localizedDescription];
        *(_DWORD *)buf = 138544130;
        id v28 = v7;
        __int16 v29 = 2048;
        id v30 = v23;
        __int16 v31 = 2112;
        v32 = v24;
        __int16 v33 = 2114;
        unsigned __int8 v34 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error purging account file directory for {accountID: %{public}@, code: %ld, error: %@, url: %{public}@}", buf, 0x2Au);
      }
      if (!a4) {
        goto LABEL_11;
      }
LABEL_10:
      *a4 = v13;
      goto LABEL_11;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = v7;
      __int16 v29 = 2114;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Purged account file directory and its content for {accountID: %{public}@, url: %{public}@}", buf, 0x16u);
    }

    id v13 = 0;
    if (a4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v16 = +[REMLogStore container];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      v19 = NSStringFromSelector(a2);
      v20 = +[NSString stringWithFormat:@"%@.%@", v18, v19];
      uint64_t v21 = [v11 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v28 = v20;
      __int16 v29 = 2114;
      id v30 = v7;
      __int16 v31 = 2112;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] checkResourceIsReachableAndReturnError returned false {accountID: %{public}@, error: %@}", buf, 0x20u);
    }
    id v13 = v11;
    unsigned __int8 v12 = 0;
    if (a4) {
      goto LABEL_10;
    }
  }
LABEL_11:

  return v12;
}

- (id)purgeAttachmentFilesWithAttachmentIDs:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v36 = a4;
  __int16 v31 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  v32 = +[NSMutableArray array];
  __int16 v33 = +[NSFileManager defaultManager];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v13 = [(RDAttachmentFileManager *)self URLForAttachmentDirectory:v11 accountID:v36];
        id v38 = 0;
        unsigned int v14 = [v13 checkResourceIsReachableAndReturnError:&v38];
        id v15 = v38;
        if (v14)
        {
          id v37 = 0;
          unsigned int v16 = [v33 removeItemAtURL:v13 error:&v37];
          id v17 = v37;
          if (v17)
          {
            [v32 addObject:v17];
            id v18 = +[REMLogStore container];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              id v27 = [v17 code];
              __int16 v29 = [v17 localizedDescription];
              *(_DWORD *)buf = 138544386;
              v44 = v11;
              __int16 v45 = 2114;
              id v46 = v36;
              __int16 v47 = 2048;
              id v48 = v27;
              __int16 v49 = 2112;
              v50 = v29;
              __int16 v51 = 2114;
              __int16 v52 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error purging attachment directory for {attachmentID: %{public}@, accountID: %{public}@, code: %ld, error: %@, url: %{public}@}", buf, 0x34u);
            }
          }
          else
          {
            id v18 = +[REMLogStore container];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v44 = v11;
              __int16 v45 = 2114;
              id v46 = v36;
              __int16 v47 = 2114;
              id v48 = v13;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Purged attachment directory and its content for {attachmentID: %{public}@, accountID: %{public}@, url: %{public}@}", buf, 0x20u);
            }
          }

          if (v16) {
            [v31 addObject:v11];
          }
        }
        else
        {
          id v17 = +[REMLogStore container];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v19 = (objc_class *)objc_opt_class();
            id v30 = NSStringFromClass(v19);
            id v28 = NSStringFromSelector(a2);
            v20 = +[NSString stringWithFormat:@"%@.%@", v30, v28];
            uint64_t v21 = [v15 localizedDescription];
            *(_DWORD *)buf = 138544130;
            v44 = v20;
            __int16 v45 = 2114;
            id v46 = v11;
            __int16 v47 = 2114;
            id v48 = v36;
            __int16 v49 = 2112;
            v50 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] checkResourceIsReachableAndReturnError failed {attachmentID: %{public}@, accountID: %{public}@, error: %@}", buf, 0x2Au);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v8);
  }

  id v22 = [v32 count];
  if (a5
    && v22
    && (+[REMError errorFromErrors:v32],
        *a5 = (id)objc_claimAutoreleasedReturnValue(),
        ![v31 count]))
  {
    id v23 = 0;
  }
  else
  {
    id v23 = v31;
  }

  return v23;
}

- (id)purgeAttachmentFilesWithSha512SumsAndExtensions:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v24 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  id v26 = +[NSMutableArray array];
  id v28 = +[NSFileManager defaultManager];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        unsigned int v14 = [(RDAttachmentFileManager *)self URLForHashedAttachmentFileInAccount:v7 sha512SumWithFileExtension:v12];
        id v29 = 0;
        unsigned int v15 = [v28 removeItemAtURL:v14 error:&v29];
        id v16 = v29;
        if (v16)
        {
          [v26 addObject:v16];
          id v17 = +[REMLogStore container];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v22 = [v16 code];
            id v23 = [v16 localizedDescription];
            *(_DWORD *)buf = 138544386;
            uint64_t v35 = v12;
            __int16 v36 = 2114;
            id v37 = v7;
            __int16 v38 = 2048;
            id v39 = v22;
            __int16 v40 = 2112;
            long long v41 = v23;
            __int16 v42 = 2114;
            v43 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error purging hashed attachment file for {fileName: %{public}@, accountID: %{public}@, code: %ld, error: %@, url: %{public}@}", buf, 0x34u);
          }
        }
        else
        {
          id v17 = +[REMLogStore container];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            uint64_t v35 = v12;
            __int16 v36 = 2114;
            id v37 = v7;
            __int16 v38 = 2114;
            id v39 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Purged hashed attachment file for {fileName: %{public}@, accountID: %{public}@, url: %{public}@}", buf, 0x20u);
          }
        }

        if (v15) {
          [v24 addObject:v12];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v9);
  }

  id v18 = [v26 count];
  if (a5
    && v18
    && (+[REMError errorFromErrors:v26],
        *a5 = (id)objc_claimAutoreleasedReturnValue(),
        ![v24 count]))
  {
    id v19 = 0;
  }
  else
  {
    id v19 = v24;
  }

  return v19;
}

- (id)attachmentIDsFromAttachmentDirectoryWithAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSFileManager defaultManager];
  __int16 v45 = v6;
  id v8 = [(RDAttachmentFileManager *)self URLForAccountFileDirectory:v6];
  NSURLResourceKey v70 = NSURLIsDirectoryKey;
  id v9 = +[NSArray arrayWithObjects:&v70 count:1];
  id v60 = 0;
  uint64_t v10 = [v7 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v9 options:0 error:&v60];
  id v11 = v60;

  if (v10)
  {
    id v39 = v11;
    long long v41 = a4;
    __int16 v42 = v8;
    v43 = v7;
    id v51 = +[NSMutableSet set];
    uint64_t v12 = +[NSMutableArray array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    __int16 v40 = v10;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v57;
      __int16 v52 = v12;
      id v53 = v13;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v54 = 0;
          id v55 = 0;
          unsigned __int8 v19 = [v18 getResourceValue:&v55 forKey:NSURLIsDirectoryKey error:&v54];
          id v20 = v55;
          id v21 = v54;
          if (v19)
          {
            if ([v20 BOOLValue])
            {
              id v22 = [v18 lastPathComponent];
              if ([v22 hasPrefix:@"Attachment-"])
              {
                id v23 = [[v22 substringFromIndex:[@"Attachment-" length]];
                id v24 = [objc_alloc((Class)NSUUID) initWithUUIDString:v23];

                id v13 = v53;
                if (v24)
                {
                  id v25 = +[REMLogStore container];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    id v29 = (objc_class *)objc_opt_class();
                    v50 = NSStringFromClass(v29);
                    id v48 = NSStringFromSelector(a2);
                    long long v30 = +[NSString stringWithFormat:@"%@.%@", v50, v48];
                    *(_DWORD *)buf = 138543874;
                    v62 = v30;
                    __int16 v63 = 2114;
                    id v64 = v24;
                    __int16 v65 = 2114;
                    v66 = v45;
                    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}@] Found attachment directory {attachmentID: %{public}@, accountID: %{public}@}", buf, 0x20u);

                    id v13 = v53;
                  }

                  [v51 addObject:v24];
                  uint64_t v12 = v52;
                }
              }
            }
          }
          else
          {
            id v26 = +[REMLogStore container];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v27 = (objc_class *)objc_opt_class();
              __int16 v49 = NSStringFromClass(v27);
              __int16 v47 = NSStringFromSelector(a2);
              id v46 = +[NSString stringWithFormat:@"%@.%@", v49, v47];
              id v28 = [v21 localizedDescription];
              *(_DWORD *)buf = 138544130;
              v62 = v46;
              __int16 v63 = 2114;
              id v64 = v45;
              __int16 v65 = 2112;
              v66 = v18;
              __int16 v67 = 2112;
              v68 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Can't get file URL resource with {accountID: %{public}@, fileURL: %@, error: %@}", buf, 0x2Au);

              uint64_t v12 = v52;
              id v13 = v53;
            }
            [v12 addObject:v21];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v15);
    }

    if (v41 && [v12 count])
    {
      id *v41 = +[REMError errorFromErrors:v12];
    }

    id v8 = v42;
    id v7 = v43;
    id v11 = v39;
    uint64_t v10 = v40;
  }
  else
  {
    long long v31 = +[REMLogStore container];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      long long v33 = (objc_class *)objc_opt_class();
      unsigned __int8 v34 = NSStringFromClass(v33);
      uint64_t v35 = NSStringFromSelector(a2);
      __int16 v36 = +[NSString stringWithFormat:@"%@.%@", v34, v35];
      [v11 localizedDescription];
      v38 = id v37 = v11;
      *(_DWORD *)buf = 138543874;
      v62 = v36;
      __int16 v63 = 2114;
      id v64 = v45;
      __int16 v65 = 2112;
      v66 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Can't get files with {accountID: %{public}@, error: %@}", buf, 0x20u);

      uint64_t v10 = 0;
      id v11 = v37;
    }
    id v51 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v51;
}

- (id)documentsURLForAccountIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(RDAttachmentFileManager *)self documentsURLProvider];

  if (!v6) {
    NSLog(@"'%s' is unexpectedly nil", "self.documentsURLProvider");
  }
  id v7 = [(RDAttachmentFileManager *)self documentsURLProvider];

  if (v7)
  {
    id v8 = [(RDAttachmentFileManager *)self documentsURLProvider];
    id v9 = [v8 documentsURLForAccountIdentifier:v5];
  }
  else
  {
    uint64_t v10 = +[REMLogStore container];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(a2);
      id v15 = +[NSString stringWithFormat:@"%@.%@", v13, v14];
      *(_DWORD *)buf = 138543618;
      id v17 = v15;
      __int16 v18 = 2114;
      id v19 = v5;
    }
    id v9 = +[RDPaths defaultApplicationDocumentsURL];
  }

  return v9;
}

- (id)URLForHashedAttachmentFileInAccount:(id)a3 sha512Sum:(id)a4 fileExtension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a5)
  {
    id v11 = [v9 stringByAppendingPathExtension:a5];
  }
  else
  {
    id v11 = v9;
  }
  uint64_t v12 = v11;
  id v13 = [(RDAttachmentFileManager *)self URLForHashedAttachmentDirectory:v8];
  id v14 = [v13 URLByAppendingPathComponent:v12 isDirectory:0];

  return v14;
}

- (id)URLForHashedAttachmentFileInAccount:(id)a3 sha512SumWithFileExtension:(id)a4
{
  id v6 = a4;
  id v7 = [(RDAttachmentFileManager *)self URLForHashedAttachmentDirectory:a3];
  id v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:0];

  return v8;
}

- (RDAttachmentFileManagerDocumentsURLProvider)documentsURLProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentsURLProvider);

  return (RDAttachmentFileManagerDocumentsURLProvider *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
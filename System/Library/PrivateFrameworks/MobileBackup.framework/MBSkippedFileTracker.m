@interface MBSkippedFileTracker
- (BOOL)writeSkippedFilesToPlistWithError:(id *)a3;
- (MBSkippedFileTracker)initWithPlistPath:(id)a3;
- (NSDictionary)previouslySkippedFiles;
- (NSMutableDictionary)skippedFiles;
- (NSString)plistPath;
- (id)_keyForRecord:(id)a3;
- (id)skippedFilesPlistValue;
- (id)trackSkippedFile:(id)a3 syscallType:(unint64_t)a4 syscallErrno:(int)a5;
- (unint64_t)skippedFilesCount;
- (void)_loadPreviouslySkippedFiles;
- (void)setPlistPath:(id)a3;
- (void)setPreviouslySkippedFiles:(id)a3;
- (void)setSkippedFiles:(id)a3;
@end

@implementation MBSkippedFileTracker

- (MBSkippedFileTracker)initWithPlistPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBSkippedFileTracker;
  v6 = [(MBSkippedFileTracker *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plistPath, a3);
    skippedFiles = v7->_skippedFiles;
    v7->_skippedFiles = 0;

    previouslySkippedFiles = v7->_previouslySkippedFiles;
    v7->_previouslySkippedFiles = 0;
  }
  return v7;
}

- (NSMutableDictionary)skippedFiles
{
  skippedFiles = self->_skippedFiles;
  if (!skippedFiles)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    id v5 = self->_skippedFiles;
    self->_skippedFiles = v4;

    skippedFiles = self->_skippedFiles;
  }
  return skippedFiles;
}

- (unint64_t)skippedFilesCount
{
  return (unint64_t)[(NSMutableDictionary *)self->_skippedFiles count];
}

- (void)_loadPreviouslySkippedFiles
{
  v3 = [(MBSkippedFileTracker *)self plistPath];
  v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v26 = 0;
    id v5 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v26];
    id v6 = v26;
    if (!v5)
    {
      v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = (uint64_t)v3;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "dataWithContentsOfFile returned nil for path %@ %@", buf, 0x16u);
        _MBLog();
      }
      id v8 = v6;
      goto LABEL_26;
    }
    id v25 = 0;
    v7 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v25];
    id v8 = v25;

    if (v8)
    {
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = (uint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "NSPropertyListSerialization failed %@", buf, 0xCu);
LABEL_24:
        _MBLog();
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = v5;
        v20 = v3;
        v9 = objc_opt_new();
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v10 = v7;
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [[MBSkippedFileRecord alloc] initWithDictionaryRepresentation:v15];
                v17 = [(MBSkippedFileTracker *)self _keyForRecord:v16];
                if (v17) {
                  [v9 setObject:v16 forKeyedSubscript:v17];
                }
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
          }
          while (v12);
        }

        [(MBSkippedFileTracker *)self setPreviouslySkippedFiles:v9];
        v3 = v20;
        id v5 = v19;
        id v8 = 0;
        goto LABEL_25;
      }
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = v18;
        __int16 v30 = 2112;
        id v31 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Found unexpected class (%@) when reading plist %@", buf, 0x16u);
        objc_opt_class();
        goto LABEL_24;
      }
    }
LABEL_25:

LABEL_26:
  }
}

- (id)_keyForRecord:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if (!v4)
  {
    id v5 = [v3 relativePath];
    if (!v5) {
      __assert_rtn("-[MBSkippedFileTracker _keyForRecord:]", "MBSkippedFileTracker.m", 120, "record.domain || record.relativePath");
    }
  }
  id v6 = [v3 domain];
  v7 = [v3 relativePath];
  id v8 = +[NSString stringWithFormat:@"%@-%@", v6, v7];

  return v8;
}

- (id)trackSkippedFile:(id)a3 syscallType:(unint64_t)a4 syscallErrno:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = [(MBSkippedFileTracker *)self skippedFiles];
  id v10 = [v9 count];

  if (!v10) {
    [(MBSkippedFileTracker *)self _loadPreviouslySkippedFiles];
  }
  id v11 = objc_opt_new();
  id v12 = [v8 absolutePath];
  [v11 setAbsolutePath:v12];

  uint64_t v13 = [v8 domain];
  v14 = [v13 name];
  [v11 setDomain:v14];

  uint64_t v15 = [v8 relativePath];

  [v11 setRelativePath:v15];
  [v11 setSyscallType:a4];
  [v11 setSyscallErrno:v5];
  v16 = [(MBSkippedFileTracker *)self _keyForRecord:v11];
  v17 = [(MBSkippedFileTracker *)self previouslySkippedFiles];
  uint64_t v18 = [v17 objectForKeyedSubscript:v16];

  if (v18
    && ([v18 dateSkipped], v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    uint64_t v20 = [v18 dateSkipped];
  }
  else
  {
    uint64_t v20 = +[NSDate now];
  }
  long long v21 = (void *)v20;
  [v11 setDateSkipped:v20];

  long long v22 = [(MBSkippedFileTracker *)self skippedFiles];
  [v22 setObject:v11 forKeyedSubscript:v16];

  return v11;
}

- (BOOL)writeSkippedFilesToPlistWithError:(id *)a3
{
  uint64_t v5 = [(MBSkippedFileTracker *)self plistPath];
  id v6 = +[NSFileManager defaultManager];
  if ([(NSMutableDictionary *)self->_skippedFiles count])
  {
    v7 = [(MBSkippedFileTracker *)self skippedFilesPlistValue];
    id v8 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:200 options:0 error:a3];

    if (v8) {
      unsigned __int8 v9 = [v8 writeToFile:v5 options:268435457 error:a3];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = ![v6 fileExistsAtPath:v5]
      || [v6 removeItemAtPath:v5 error:a3];
  }

  return v9;
}

- (id)skippedFilesPlistValue
{
  if ([(NSMutableDictionary *)self->_skippedFiles count])
  {
    id v3 = objc_opt_new();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [(NSMutableDictionary *)self->_skippedFiles allValues];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          unsigned __int8 v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) dictionaryRepresentation];
          [v3 addObject:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (void)setPlistPath:(id)a3
{
}

- (void)setSkippedFiles:(id)a3
{
}

- (NSDictionary)previouslySkippedFiles
{
  return self->_previouslySkippedFiles;
}

- (void)setPreviouslySkippedFiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySkippedFiles, 0);
  objc_storeStrong((id *)&self->_skippedFiles, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

@end
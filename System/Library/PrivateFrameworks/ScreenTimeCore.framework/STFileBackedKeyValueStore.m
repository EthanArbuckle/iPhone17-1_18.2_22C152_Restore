@interface STFileBackedKeyValueStore
+ (void)_createDirectoryLoggingErrorsAtURL:(id)a3 withFilesystemPrimitives:(id)a4;
- (NSString)fileExtension;
- (NSURL)directory;
- (STFileBackedKeyValueStore)initWithDirectory:(id)a3 fileExtension:(id)a4 filesystemPrimitives:(id)a5;
- (STFilesystemPrimitives)filesystemPrimitives;
- (id)_buildFileURL:(id)a3;
- (id)purge;
- (id)readValueForKey:(id)a3;
- (void)enumerateKeysAndValuesUsingBlock:(id)a3;
- (void)persistValue:(id)a3 forKey:(id)a4;
- (void)removeValueForKey:(id)a3;
@end

@implementation STFileBackedKeyValueStore

- (STFileBackedKeyValueStore)initWithDirectory:(id)a3 fileExtension:(id)a4 filesystemPrimitives:(id)a5
{
  v8 = (STFilesystemPrimitives *)a5;
  v19.receiver = self;
  v19.super_class = (Class)STFileBackedKeyValueStore;
  id v9 = a4;
  id v10 = a3;
  v11 = [(STFileBackedKeyValueStore *)&v19 init];
  v12 = (NSURL *)objc_msgSend(v10, "copy", v19.receiver, v19.super_class);
  directory = v11->_directory;
  v11->_directory = v12;

  v14 = (NSString *)[v9 copy];
  fileExtension = v11->_fileExtension;
  v11->_fileExtension = v14;

  filesystemPrimitives = v11->_filesystemPrimitives;
  v11->_filesystemPrimitives = v8;
  v17 = v8;

  +[STFileBackedKeyValueStore _createDirectoryLoggingErrorsAtURL:v10 withFilesystemPrimitives:v17];
  return v11;
}

- (id)purge
{
  v3 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
  v4 = [(STFileBackedKeyValueStore *)self directory];
  id v13 = 0;
  unsigned __int8 v5 = [v3 removeFileURL:v4 error:&v13];
  id v6 = v13;

  if (v5)
  {
    v7 = [(STFileBackedKeyValueStore *)self directory];
    v8 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
    +[STFileBackedKeyValueStore _createDirectoryLoggingErrorsAtURL:v7 withFilesystemPrimitives:v8];

    uint64_t v9 = +[STResult success];
  }
  else
  {
    id v10 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100260130(self, (uint64_t)v6, v10);
    }

    uint64_t v9 = +[STResult failure:v6];
  }
  v11 = (void *)v9;

  return v11;
}

- (void)persistValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v7 = [(STFileBackedKeyValueStore *)self _buildFileURL:a4];
  v8 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
  id v12 = 0;
  unsigned __int8 v9 = [v8 writeData:v6 toFileURL:v7 error:&v12];

  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    v11 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002601E0();
    }
  }
}

- (void)removeValueForKey:(id)a3
{
  v4 = [(STFileBackedKeyValueStore *)self _buildFileURL:a3];
  unsigned __int8 v5 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
  id v9 = 0;
  unsigned __int8 v6 = [v5 removeFileURL:v4 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    v8 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100260248();
    }
  }
}

- (id)readValueForKey:(id)a3
{
  v4 = [(STFileBackedKeyValueStore *)self _buildFileURL:a3];
  unsigned __int8 v5 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
  id v19 = 0;
  unsigned __int8 v6 = [v5 fileSizeOfDataAtURL:v4 error:&v19];
  id v7 = v19;

  if (!v6)
  {
    v11 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002602B0();
    }
    goto LABEL_11;
  }
  if ((uint64_t)[v6 longLongValue] >= 20971521)
  {
    v8 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100260390((uint64_t)v4, v8);
    }

    id v9 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
    id v18 = 0;
    unsigned __int8 v10 = [v9 removeFileURL:v4 error:&v18];
    v11 = v18;

    if ((v10 & 1) == 0)
    {
      id v12 = +[STLog fileBackedKeyValueStore];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100260318((uint64_t)v4, v12);
      }
    }
LABEL_11:
    id v13 = 0;
LABEL_12:

    id v14 = v7;
    goto LABEL_13;
  }
  v16 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
  id v17 = v7;
  id v13 = [v16 readDataFromFileURL:v4 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    v11 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100260408();
    }
    id v7 = v14;
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(STFileBackedKeyValueStore *)self directory];
  unsigned __int8 v6 = [(STFileBackedKeyValueStore *)self filesystemPrimitives];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003FFA0;
  v9[3] = &unk_1002FC900;
  id v10 = v5;
  v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateRegularFilesInDirectoryAtURL:v8 withBlock:v9];
}

- (id)_buildFileURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(STFileBackedKeyValueStore *)self directory];
  unsigned __int8 v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  id v7 = [(STFileBackedKeyValueStore *)self fileExtension];
  id v8 = [v6 URLByAppendingPathExtension:v7];

  return v8;
}

+ (void)_createDirectoryLoggingErrorsAtURL:(id)a3 withFilesystemPrimitives:(id)a4
{
  id v5 = a3;
  id v9 = 0;
  unsigned __int8 v6 = [a4 createDirectoryAtURL:v5 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    id v8 = +[STLog fileBackedKeyValueStore];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002604EC();
    }
  }
}

- (NSURL)directory
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)fileExtension
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (STFilesystemPrimitives)filesystemPrimitives
{
  return (STFilesystemPrimitives *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesystemPrimitives, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
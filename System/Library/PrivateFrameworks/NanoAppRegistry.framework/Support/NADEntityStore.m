@interface NADEntityStore
- (NADEntityStore)initWithDirectory:(id)a3 serializer:(id)a4 identifierBlock:(id)a5;
- (NSURL)directory;
- (id)allEntities;
- (id)directoryForEntity:(id)a3;
- (void)_createDirectoryIfNeeded;
- (void)addEntity:(id)a3;
- (void)clearStore;
- (void)removeEntity:(id)a3;
@end

@implementation NADEntityStore

- (NADEntityStore)initWithDirectory:(id)a3 serializer:(id)a4 identifierBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NADEntityStore;
  v12 = [(NADEntityStore *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_directory, a3);
    id v14 = [v11 copy];
    id identifierBlock = v13->_identifierBlock;
    v13->_id identifierBlock = v14;

    objc_storeStrong((id *)&v13->_serializer, a4);
    v16 = (NSFileManager *)objc_alloc_init((Class)NSFileManager);
    fileManager = v13->_fileManager;
    v13->_fileManager = v16;

    [(NADEntityStore *)v13 _createDirectoryIfNeeded];
  }

  return v13;
}

- (id)allEntities
{
  v3 = +[NSMutableArray array];
  fileManager = self->_fileManager;
  v5 = [(NADEntityStore *)self directory];
  NSURLResourceKey v25 = NSURLIsDirectoryKey;
  v6 = +[NSArray arrayWithObjects:&v25 count:1];
  v7 = [(NSFileManager *)fileManager contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v19 = 0;
        unsigned int v14 = [v13 getResourceValue:&v19 forKey:NSURLIsDirectoryKey error:0];
        id v15 = v19;
        v16 = v15;
        if (v14 && [v15 BOOLValue])
        {
          v17 = [(NADAppSerializer *)self->_serializer objectAtDirectory:v13];
          if (v17) {
            [v3 addObject:v17];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v3;
}

- (void)addEntity:(id)a3
{
  id v4 = a3;
  v5 = [(NADEntityStore *)self directoryForEntity:v4];
  fileManager = self->_fileManager;
  uint64_t v7 = [v5 path];
  id v14 = 0;
  [(NSFileManager *)fileManager createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v8 = v14;

  serializer = self->_serializer;
  id v13 = v8;
  LOBYTE(v7) = [(NADAppSerializer *)serializer persistObject:v4 toDirectory:v5 error:&v13];
  id v10 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = nar_workspace_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (*((void (**)(void))self->_identifierBlock + 2))();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error writing entity: %@ - %@", buf, 0x16u);
    }
  }
}

- (void)removeEntity:(id)a3
{
  id v4 = [(NADEntityStore *)self directoryForEntity:a3];
  fileManager = self->_fileManager;
  id v9 = 0;
  unsigned __int8 v6 = [(NSFileManager *)fileManager removeItemAtURL:v4 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    id v8 = nar_workspace_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000FE04((uint64_t)v4, (uint64_t)v7, v8);
    }
  }
}

- (void)clearStore
{
  fileManager = self->_fileManager;
  id v4 = [(NADEntityStore *)self directory];
  id v10 = 0;
  unsigned __int8 v5 = [(NSFileManager *)fileManager removeItemAtURL:v4 error:&v10];
  id v6 = v10;

  id v7 = nar_workspace_log();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting store directory", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10000FE8C((uint64_t)v6, v8);
  }

  [(NADEntityStore *)self _createDirectoryIfNeeded];
}

- (void)_createDirectoryIfNeeded
{
  fileManager = self->_fileManager;
  id v4 = [(NADEntityStore *)self directory];
  unsigned __int8 v5 = [v4 path];
  id v12 = 0;
  unsigned __int8 v6 = [(NSFileManager *)fileManager createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v7 = v12;

  id v8 = nar_workspace_log();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(NADEntityStore *)self directory];
      uint64_t v11 = [v10 path];
      *(_DWORD *)buf = 138412290;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating directory at location %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10000FF04((uint64_t)v7, v9);
  }
}

- (id)directoryForEntity:(id)a3
{
  id v4 = (*((void (**)(void))self->_identifierBlock + 2))();
  unsigned __int8 v5 = [(NADEntityStore *)self directory];
  unsigned __int8 v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (NSURL)directory
{
  return self->_directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);

  objc_storeStrong(&self->_identifierBlock, 0);
}

@end
@interface PTParameterRecordsPersistenceManager
- (NSString)path;
- (PTParameterRecordsPersistenceManager)init;
- (id)createParameterRecordsFromArchiveDictionary;
- (void)_writeToDiskWithParameterRecords:(id)a3;
- (void)setPath:(id)a3;
- (void)writeToDisk:(id)a3;
@end

@implementation PTParameterRecordsPersistenceManager

- (PTParameterRecordsPersistenceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PTParameterRecordsPersistenceManager;
  v2 = [(PTParameterRecordsPersistenceManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecordsPersistenceManager", 0);
    parameterRecordsArchiveQueue = v2->_parameterRecordsArchiveQueue;
    v2->_parameterRecordsArchiveQueue = (OS_dispatch_queue *)v3;

    v5 = sub_100006008();
    [(PTParameterRecordsPersistenceManager *)v2 setPath:v5];
  }
  return v2;
}

- (id)createParameterRecordsFromArchiveDictionary
{
  v2 = [(PTParameterRecordsPersistenceManager *)self path];
  id v15 = 0;
  dispatch_queue_t v3 = +[NSData dataWithContentsOfFile:v2 options:0 error:&v15];
  id v4 = v15;

  if (v4)
  {
    v5 = PTLogObjectForTopic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unexpected error: %@", buf, 0xCu);
    }
  }
  id v6 = objc_alloc((Class)NSSet);
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v16[3] = objc_opt_class();
  objc_super v7 = +[NSArray arrayWithObjects:v16 count:4];
  id v8 = [v6 initWithArray:v7];

  id v14 = v4;
  id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v3 error:&v14];
  id v10 = v14;

  if (!v9)
  {
    v11 = PTLogObjectForTopic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted proxy definition: %@", buf, 0xCu);
    }

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v12 = [[PTParameterRecords alloc] initWithDictionary:v9];

  return v12;
}

- (void)_writeToDiskWithParameterRecords:(id)a3
{
  id v4 = a3;
  parameterRecordsArchiveQueue = self->_parameterRecordsArchiveQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000063C8;
  v7[3] = &unk_1000188E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(parameterRecordsArchiveQueue, v7);
}

- (void)writeToDisk:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000065F8;
  v4[3] = &unk_1000188E0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_parameterRecordsArchiveQueue, 0);

  objc_storeStrong((id *)&self->_writeTimer, 0);
}

@end
@interface SUBCloudDescriptorManager
+ (id)sharedCloudDescriptorManager;
- (NSMutableDictionary)cloudDescriptorFiles;
- (OS_dispatch_queue)queue;
- (SUBCloudDescriptorManager)init;
- (id)getCloudDescriptorPath;
- (id)getCloudDescriptors;
- (void)removeCloudDescriptor:(id)a3;
- (void)saveCloudDescriptor:(id)a3;
- (void)setCloudDescriptorFiles:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SUBCloudDescriptorManager

+ (id)sharedCloudDescriptorManager
{
  if (qword_100033D10 != -1) {
    dispatch_once(&qword_100033D10, &stru_10002D460);
  }
  v2 = (void *)qword_100033D08;
  return v2;
}

- (SUBCloudDescriptorManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUBCloudDescriptorManager;
  v2 = [(SUBCloudDescriptorManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SUBCloudDescriptorManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)getCloudDescriptorPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndexedSubscript:0];

  dispatch_queue_t v4 = [v3 stringByAppendingPathComponent:@"SoftwareUpdate/docsFromCloudDevice"];

  return v4;
}

- (void)saveCloudDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [(SUBCloudDescriptorManager *)self getCloudDescriptorPath];
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011C2C;
  v9[3] = &unk_10002D120;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(queue, v9);
}

- (id)getCloudDescriptors
{
  v2 = [(SUBCloudDescriptorManager *)self getCloudDescriptorPath];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v2];

  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    v23 = v2;
    id v7 = +[NSURL URLWithString:v2];
    id v8 = +[NSArray array];
    id v28 = 0;
    v9 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v8 options:0 error:&v28];
    id v22 = v28;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (!v11) {
      goto LABEL_14;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v16 = +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v15, v22);
        if (v16)
        {
          v17 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v16 error:0];
          v18 = [v17 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
          [v17 finishDecoding];
          [v3 addObject:v18];
        }
        else
        {
          v19 = (void *)softwareupdatebridge_log;
          if (!os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          v17 = v19;
          v18 = [v15 absoluteString];
          *(_DWORD *)buf = 138412290;
          v30 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Docs found, but failed to deserialize at %@", buf, 0xCu);
        }

LABEL_12:
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (!v12)
      {
LABEL_14:

        id v20 = v3;
        v2 = v23;
        goto LABEL_16;
      }
    }
  }
  id v20 = 0;
LABEL_16:

  return v20;
}

- (void)removeCloudDescriptor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SUBCloudDescriptorManager *)self getCloudDescriptorPath];
  v6 = [v4 productVersion];

  id v7 = +[NSString stringWithFormat:@"%@/%@", v5, v6];

  id v8 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing descriptor at: %@", buf, 0xCu);
  }
  v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:v7];

  if (v10)
  {
    id v11 = +[NSFileManager defaultManager];
    id v14 = 0;
    [v11 removeItemAtPath:v7 error:&v14];
    id v12 = v14;

    if (v12)
    {
      uint64_t v13 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v7;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to remove: %@ - %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v12 = 0;
  }
}

- (NSMutableDictionary)cloudDescriptorFiles
{
  return self->_cloudDescriptorFiles;
}

- (void)setCloudDescriptorFiles:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudDescriptorFiles, 0);
}

@end
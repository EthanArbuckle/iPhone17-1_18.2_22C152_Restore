@interface KTAccountStateHolder
- (BOOL)persistAccountChanges:(id)a3;
- (KTAccountStateHolder)initWithFileStorage:(id)a3;
- (NSURL)url;
- (id)loadAccountMetadata;
- (void)clearAccountMetadata;
- (void)setUrl:(id)a3;
@end

@implementation KTAccountStateHolder

- (KTAccountStateHolder)initWithFileStorage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
LABEL_4:
    v11.receiver = self;
    v11.super_class = (Class)KTAccountStateHolder;
    v7 = [(KTAccountStateHolder *)&v11 init];
    v8 = v7;
    if (v7) {
      [(KTAccountStateHolder *)v7 setUrl:v4];
    }
    goto LABEL_11;
  }
  id v12 = 0;
  v5 = +[TransparencyFileSupport transparencyFilesPath:&v12];
  id v6 = v12;
  if (v5)
  {
    id v4 = [v5 URLByAppendingPathComponent:@"AccountState.pblist"];

    goto LABEL_4;
  }
  if (qword_10032F3A8 != -1) {
    dispatch_once(&qword_10032F3A8, &stru_1002C9E58);
  }
  v9 = qword_10032F3B0;
  if (os_log_type_enabled((os_log_t)qword_10032F3B0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "TransparencyFileSupport transparencyFilesPath: %@", buf, 0xCu);
  }

  id v4 = 0;
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)loadAccountMetadata
{
  v2 = [(KTAccountStateHolder *)self url];
  v3 = +[NSData dataWithContentsOfURL:v2];

  if (v3)
  {
    id v8 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      if (qword_10032F3A8 != -1) {
        dispatch_once(&qword_10032F3A8, &stru_1002C9E78);
      }
      id v6 = qword_10032F3B0;
      if (os_log_type_enabled((os_log_t)qword_10032F3B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "loadAccountMetadata failed: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)persistAccountChanges:(id)a3
{
  id v4 = (void (**)(id, KTAccountState *))a3;
  id v5 = [(KTAccountStateHolder *)self loadAccountMetadata];
  if (!v5) {
    id v5 = objc_alloc_init(KTAccountState);
  }
  id v6 = v4[2](v4, v5);

  id v19 = 0;
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v19];
  id v8 = v19;
  if (!v7)
  {
    if (qword_10032F3A8 != -1) {
      dispatch_once(&qword_10032F3A8, &stru_1002C9E98);
    }
    id v12 = qword_10032F3B0;
    if (os_log_type_enabled((os_log_t)qword_10032F3B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "persistAccountChanges failed archive: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  v9 = [(KTAccountStateHolder *)self url];
  id v18 = v8;
  [v7 writeToURL:v9 options:268435457 error:&v18];
  id v10 = v18;

  if (v10)
  {
    if (qword_10032F3A8 != -1) {
      dispatch_once(&qword_10032F3A8, &stru_1002C9EB8);
    }
    objc_super v11 = qword_10032F3B0;
    if (os_log_type_enabled((os_log_t)qword_10032F3B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "persistAccountChanges failed write: %@", buf, 0xCu);
    }

LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
  if (qword_10032F3A8 != -1) {
    dispatch_once(&qword_10032F3A8, &stru_1002C9ED8);
  }
  v15 = (void *)qword_10032F3B0;
  BOOL v13 = 1;
  if (os_log_type_enabled((os_log_t)qword_10032F3B0, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = [(KTAccountStateHolder *)self url];
    *(_DWORD *)buf = 138412290;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "wrote account metadata: %@", buf, 0xCu);
  }
LABEL_16:

  return v13;
}

- (void)clearAccountMetadata
{
  if (qword_10032F3A8 != -1) {
    dispatch_once(&qword_10032F3A8, &stru_1002C9EF8);
  }
  v3 = (void *)qword_10032F3B0;
  if (os_log_type_enabled((os_log_t)qword_10032F3B0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    id v5 = [(KTAccountStateHolder *)self url];
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "deleting account metadata: %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = +[NSFileManager defaultManager];
  v7 = [(KTAccountStateHolder *)self url];
  [v6 removeItemAtURL:v7 error:0];
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
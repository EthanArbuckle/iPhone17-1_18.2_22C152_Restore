@interface TCCDAdhocSignatureCache
- (TCCDAdhocSignatureCache)init;
- (TCCDAdhocSignatureCache)initWithDirectoryPath:(id)a3 capacity:(unint64_t)a4;
- (id)cacheKeyForStaticCode:(__SecCode *)a3;
- (id)getSignatureForStaticCode:(__SecCode *)a3;
- (id)loadSignatureWithUUID:(id)a3;
- (id)logHandle;
- (id)stateDump;
- (void)addSignature:(id)a3 forStaticCode:(__SecCode *)a4;
- (void)createStateHandler;
- (void)loadKeysFromDirectory;
- (void)maintainSize;
- (void)saveKeysToDirectory;
- (void)saveSignature:(id)a3 withUUID:(id)a4;
@end

@implementation TCCDAdhocSignatureCache

- (id)logHandle
{
  if (qword_1000AC690 != -1) {
    dispatch_once(&qword_1000AC690, &stru_100096250);
  }
  v2 = (void *)qword_1000AC698;
  return v2;
}

- (TCCDAdhocSignatureCache)initWithDirectoryPath:(id)a3 capacity:(unint64_t)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)TCCDAdhocSignatureCache;
  v7 = [(TCCDAdhocSignatureCache *)&v30 init];
  if (!v7)
  {
LABEL_16:
    v19 = v7;
    goto LABEL_17;
  }
  if (v6)
  {
    v8 = (NSString *)[v6 copy];
    directoryPath = v7->_directoryPath;
    v7->_directoryPath = v8;

    uint64_t v10 = [(NSString *)v7->_directoryPath stringByAppendingPathComponent:@"keys"];
    keysPath = v7->_keysPath;
    v7->_keysPath = (NSString *)v10;

    v7->_capacity = a4;
    uint64_t v12 = +[NSFileManager defaultManager];
    fileManager = v7->_fileManager;
    v7->_fileManager = (NSFileManager *)v12;

    char v29 = 0;
    if ([(NSFileManager *)v7->_fileManager fileExistsAtPath:v7->_directoryPath isDirectory:&v29])
    {
      BOOL v14 = v29 == 0;
    }
    else
    {
      BOOL v14 = 1;
    }
    if (v14)
    {
      v15 = v7->_fileManager;
      v16 = v7->_directoryPath;
      id v28 = 0;
      unsigned __int8 v17 = [(NSFileManager *)v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v28];
      id v20 = v28;
      if ((v17 & 1) == 0)
      {
        v18 = [(TCCDAdhocSignatureCache *)v7 logHandle];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100043EBC();
        }
      }
    }
    else
    {
      [(TCCDAdhocSignatureCache *)v7 loadKeysFromDirectory];
      id v20 = 0;
    }
    if (!v7->_keys)
    {
      v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      keys = v7->_keys;
      v7->_keys = v21;
    }
    v23 = (NSCache *)objc_alloc_init((Class)NSCache);
    signatures = v7->_signatures;
    v7->_signatures = v23;

    [(NSCache *)v7->_signatures setName:@"AdhocSignatureCache"];
    [(NSCache *)v7->_signatures setTotalCostLimit:v7->_capacity];
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.tcc.AdhocSignatureCache", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v25;

    [(TCCDAdhocSignatureCache *)v7 createStateHandler];
    goto LABEL_16;
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (TCCDAdhocSignatureCache)init
{
  return 0;
}

- (id)stateDump
{
  v3 = +[NSMutableDictionary dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = self->_keys;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", v9, (void)v18);
        id v11 = [v10 mutableCopy];
        [v3 setObject:v11 forKeyedSubscript:v9];

        uint64_t v12 = [v3 objectForKeyedSubscript:v9];
        v13 = [v12 objectForKeyedSubscript:@"UUID"];

        BOOL v14 = [v13 UUIDString];
        v15 = [v3 objectForKeyedSubscript:v9];
        [v15 setObject:v14 forKeyedSubscript:@"UUID"];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v16 = [v3 copy];
  return v16;
}

- (void)createStateHandler
{
  v2 = dispatch_get_global_queue(0, 0);
  os_state_add_handler();
}

- (void)loadKeysFromDirectory
{
  keysPath = self->_keysPath;
  id v16 = 0;
  v4 = +[NSData dataWithContentsOfFile:keysPath options:0 error:&v16];
  id v5 = v16;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004403C();
    }
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    id v15 = 0;
    uint64_t v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v4 error:&v15];
    id v6 = v15;
    if (v6)
    {
      p_super = [(TCCDAdhocSignatureCache *)self logHandle];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_100043FD4();
      }
    }
    else
    {
      BOOL v14 = (NSMutableDictionary *)[v12 mutableCopy];
      p_super = &self->_keys->super.super;
      self->_keys = v14;
    }
  }
}

- (void)saveKeysToDirectory
{
  keys = self->_keys;
  id v11 = 0;
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:keys requiringSecureCoding:1 error:&v11];
  id v5 = v11;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004410C();
    }
LABEL_7:

    goto LABEL_8;
  }
  keysPath = self->_keysPath;
  id v10 = 0;
  unsigned __int8 v9 = [v4 writeToFile:keysPath options:1 error:&v10];
  id v6 = v10;
  if ((v9 & 1) == 0)
  {
    uint64_t v7 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000440A4();
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (id)loadSignatureWithUUID:(id)a3
{
  directoryPath = self->_directoryPath;
  id v5 = [a3 UUIDString];
  id v6 = [(NSString *)directoryPath stringByAppendingPathComponent:v5];

  id v11 = 0;
  uint64_t v7 = +[NSData dataWithContentsOfFile:v6 options:0 error:&v11];
  id v8 = v11;
  if (v8)
  {
    unsigned __int8 v9 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044174();
    }
  }
  return v7;
}

- (void)saveSignature:(id)a3 withUUID:(id)a4
{
  directoryPath = self->_directoryPath;
  id v7 = a3;
  uint64_t v8 = [a4 UUIDString];
  unsigned __int8 v9 = [(NSString *)directoryPath stringByAppendingPathComponent:v8];

  id v12 = 0;
  LOBYTE(v8) = [v7 writeToFile:v9 options:1 error:&v12];

  id v10 = v12;
  if ((v8 & 1) == 0)
  {
    id v11 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000441DC();
    }
  }
}

- (id)cacheKeyForStaticCode:(__SecCode *)a3
{
  CFURLRef path = 0;
  memset(&v38, 0, 512);
  OSStatus v4 = SecCodeCopyPath(a3, 0, &path);
  if (v4 || !path)
  {
    unsigned __int8 v9 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044564(v4, v9);
    }

    id v7 = 0;
    uint64_t v8 = 0;
    id v10 = 0;
    id v11 = 0;
    id v12 = 0;
    CFURLRef v5 = 0;
    goto LABEL_18;
  }
  CFURLRef v5 = path;
  if (statfs((const char *)[(__CFURL *)v5 fileSystemRepresentation], &v38))
  {
    id v6 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000444C8(v5, v6);
    }

    id v7 = 0;
    uint64_t v8 = 0;
LABEL_15:
    id v10 = 0;
    goto LABEL_16;
  }
  id v7 = +[NSString stringWithUTF8String:v38.f_fstypename];
  uint64_t v8 = +[NSString stringWithUTF8String:v38.f_mntonname];
  *(void *)&long long v43 = 0;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  HIDWORD(v36) = 0;
  uint64_t v37 = 0;
  LODWORD(v36) = 5;
  *(void *)((char *)&v36 + 4) = 0x8006000080000000;
  int v13 = getattrlist(v38.f_mntonname, &v36, &v39, 0x48uLL, 0);
  if (v13)
  {
    int v14 = v13;
    if (qword_1000AC690 != -1) {
      dispatch_once(&qword_1000AC690, &stru_100096250);
    }
    id v15 = (void *)qword_1000AC698;
    if (os_log_type_enabled((os_log_t)qword_1000AC698, OS_LOG_TYPE_ERROR)) {
      sub_100044434((uint64_t)v38.f_mntonname, v15, v14);
    }
    goto LABEL_15;
  }
  if ((BYTE10(v39) & 4) != 0)
  {
    id v19 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:(char *)&v42 + 8];
  }
  else
  {
    if (qword_1000AC690 != -1) {
      dispatch_once(&qword_1000AC690, &stru_100096250);
    }
    if (os_log_type_enabled((os_log_t)qword_1000AC698, OS_LOG_TYPE_DEBUG)) {
      sub_1000443CC();
    }
    id v19 = 0;
  }
  if ((BYTE10(v39) & 2) != 0)
  {
    int v20 = BYTE8(v41) & 1;
  }
  else
  {
    if (qword_1000AC690 != -1) {
      dispatch_once(&qword_1000AC690, &stru_100096250);
    }
    if (os_log_type_enabled((os_log_t)qword_1000AC698, OS_LOG_TYPE_DEBUG)) {
      sub_100044364();
    }
    int v20 = 0;
  }
  id v10 = v19;
  CFURLRef v5 = v5;
  long long v21 = (const char *)[(__CFURL *)v5 fileSystemRepresentation];
  long long v70 = 0u;
  long long v69 = 0u;
  long long v68 = 0u;
  long long v67 = 0u;
  long long v66 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  long long v62 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  long long v59 = 0u;
  long long v58 = 0u;
  long long v57 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  uint64_t v37 = 0x1400000000;
  long long v36 = 0x8000080000000005;
  int v22 = getattrlist(v21, &v36, &v39, 0x43CuLL, 0x20u);
  if (!v22)
  {
    if ((BYTE5(v39) & 8) != 0) {
      double v25 = (double)*((uint64_t *)&v40 + 1);
    }
    else {
      double v25 = 0.0;
    }
    char v26 = BYTE4(v40);
    if ((BYTE4(v40) & 4) != 0)
    {
      id v27 = +[NSString stringWithUTF8String:(char *)&v41 + SDWORD2(v41) + 8];
      char v26 = BYTE4(v40);
    }
    else
    {
      id v27 = 0;
    }
    if ((v26 & 0x10) != 0) {
      unint64_t v28 = v42;
    }
    else {
      unint64_t v28 = 0;
    }
    id v12 = v27;
    char v29 = +[NSDate dateWithTimeIntervalSince1970:v25];
    id v11 = v29;
    if (v20) {
      BOOL v30 = v28 >= 2;
    }
    else {
      BOOL v30 = 0;
    }
    int v31 = !v30;
    if (v31 != 1 || v12)
    {
      if (v31) {
        unint64_t v33 = 0;
      }
      else {
        unint64_t v33 = v28;
      }
      [v29 timeIntervalSince1970];
      id v16 = +[NSString stringWithFormat:@"%@:%@:%@:%lld:%ld", v8, v12, v10, v33, (uint64_t)v34];
      goto LABEL_19;
    }
    v32 = [(TCCDAdhocSignatureCache *)self logHandle];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100044244(v5, v32);
    }

    goto LABEL_17;
  }
  int v23 = v22;
  if (qword_1000AC690 != -1) {
    dispatch_once(&qword_1000AC690, &stru_100096250);
  }
  v24 = (void *)qword_1000AC698;
  if (os_log_type_enabled((os_log_t)qword_1000AC698, OS_LOG_TYPE_ERROR)) {
    sub_1000442D0((uint64_t)v21, v24, v23);
  }
LABEL_16:
  id v11 = 0;
LABEL_17:
  id v12 = 0;
LABEL_18:
  id v16 = 0;
LABEL_19:
  id v17 = v16;

  return v17;
}

- (void)maintainSize
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000431B4;
  block[3] = &unk_100094E78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)getSignatureForStaticCode:(__SecCode *)a3
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10000F904;
  id v16 = sub_10000F894;
  id v17 = 0;
  OSStatus v4 = [(TCCDAdhocSignatureCache *)self cacheKeyForStaticCode:a3];
  CFURLRef v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000437A8;
    block[3] = &unk_100094F90;
    block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addSignature:(id)a3 forStaticCode:(__SecCode *)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v7 = [(TCCDAdhocSignatureCache *)self cacheKeyForStaticCode:a4];
    uint64_t v8 = v7;
    if (v7)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100043B80;
      block[3] = &unk_100094FB8;
      block[4] = self;
      id v11 = v7;
      id v12 = v6;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_keysPath, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
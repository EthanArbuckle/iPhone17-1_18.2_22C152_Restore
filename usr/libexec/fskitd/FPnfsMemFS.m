@interface FPnfsMemFS
- (FPnfsMemFS)initWithRootPath:(id)a3;
- (FPnfsMemNode)rootNode;
- (id)findNode:(id)a3;
- (id)findNode:(id)a3 nascentOk:(BOOL)a4;
- (id)fullPathForRelativePath:(id)a3;
- (id)mkMountPath:(id)a3 mountID:(unsigned int)a4;
- (unint64_t)nextFileHandle;
- (void)LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)addNode:(id)a3 withLock:(BOOL)a4;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)getRootFileHandleWithError:(id)a3;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)performExclusiveMemFS:(id)a3;
- (void)performSharedMemFS:(id)a3;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)rmMountPath:(id)a3;
- (void)rmNode:(id)a3;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
@end

@implementation FPnfsMemFS

- (FPnfsMemFS)initWithRootPath:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPnfsMemFS;
  v6 = [(FPnfsMemFS *)&v14 init];
  v7 = v6;
  if (!v6)
  {
LABEL_5:
    v8 = v7;
    goto LABEL_7;
  }
  v8 = 0;
  if (!pthread_rwlock_init(&v6->opLock, 0))
  {
    objc_storeStrong((id *)&v7->rootPath, a3);
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fhMap = v7->fhMap;
    v7->fhMap = v9;

    if (!v7->fhMap
      || (atomic_store(1uLL, &v7->filehandle),
          v11 = [[FPnfsMemNode alloc] initWithFS:v7 name:&stru_10005A670 parent:0], rootNode = v7->_rootNode, v7->_rootNode = v11, rootNode, !v7->_rootNode))
    {
      v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_7:

  return v8;
}

- (void)performExclusiveMemFS:(id)a3
{
  p_opLock = &self->opLock;
  v4 = (void (**)(void))a3;
  pthread_rwlock_wrlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (void)performSharedMemFS:(id)a3
{
  p_opLock = &self->opLock;
  v4 = (void (**)(void))a3;
  pthread_rwlock_rdlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (id)fullPathForRelativePath:(id)a3
{
  return +[NSString stringWithFormat:@"%@/%@", self->rootPath, a3];
}

- (unint64_t)nextFileHandle
{
  return atomic_fetch_add((atomic_ullong *volatile)&self->filehandle, 1uLL) + 1;
}

- (void)addNode:(id)a3 withLock:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    fhMap = self->fhMap;
    v9 = [v6 fh];
    [(NSMutableDictionary *)fhMap setObject:v7 forKey:v9];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001A480;
    v13[3] = &unk_100059518;
    v13[4] = self;
    id v14 = v6;
    [(FPnfsMemFS *)self performExclusiveMemFS:v13];
  }
  if (dword_100060728)
  {
    v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v7 fh];
      unsigned int v12 = [v7 nascent];
      *(_DWORD *)buf = 138412802;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 1024;
      unsigned int v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding node %@ with filehandle %@ nascent %d", buf, 0x1Cu);
    }
  }
}

- (id)findNode:(id)a3 nascentOk:(BOOL)a4
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10001A738;
  __int16 v19 = sub_10001A748;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A750;
  v11[3] = &unk_100059540;
  id v14 = &v15;
  unsigned int v12 = self;
  id v5 = a3;
  id v13 = v5;
  [(FPnfsMemFS *)v12 performSharedMemFS:v11];
  id v6 = (void *)v16[5];
  if (!v6)
  {
    if (!dword_100060728) {
      goto LABEL_13;
    }
    v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not find node for fh %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if ([v6 nascent] && !a4)
  {
    if (dword_100060728)
    {
      v7 = livefs_std_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found nascent node for fh %@", buf, 0xCu);
      }
    }
    v8 = v16[5];
    v16[5] = 0;
LABEL_12:
  }
LABEL_13:
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)findNode:(id)a3
{
  return [(FPnfsMemFS *)self findNode:a3 nascentOk:0];
}

- (void)rmNode:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001A83C;
  v4[3] = &unk_100059518;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(FPnfsMemFS *)v5 performExclusiveMemFS:v4];
}

- (id)mkMountPath:(id)a3 mountID:(unsigned int)a4
{
  BOOL v4 = (NSString *)a3;
  id v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    rootPath = self->rootPath;
    *(_DWORD *)buf = 138412802;
    v59 = v4;
    __int16 v60 = 1024;
    unsigned int v61 = a4;
    __int16 v62 = 2112;
    *(void *)v63 = rootPath;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "mkMountPath: path = %@ id %u rootPath = %@", buf, 0x1Cu);
  }

  if ([(NSString *)v4 isAbsolutePath])
  {
    p_rootPath = (uint64_t *)&self->rootPath;
    if (![(NSString *)v4 hasPrefix:self->rootPath])
    {
      v28 = livefs_std_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10003EBA8((uint64_t)v4, p_rootPath, v28);
      }

      v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
      goto LABEL_55;
    }
    if ([(NSString *)v4 isEqualToString:*p_rootPath])
    {
      v7 = 0;
      goto LABEL_55;
    }
    -[NSString substringFromIndex:](v4, "substringFromIndex:", (char *)[(id)*p_rootPath length] + 1);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      BOOL v4 = 0;
      goto LABEL_55;
    }
    v40 = livefs_std_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v7;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "mkMountPath: Relative mount path is %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = v4;
  }
  v8 = [(NSString *)v7 pathComponents];
  unsigned int v9 = [v8 count];
  v10 = [(FPnfsMemFS *)self rootNode];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v11)
  {
    id v12 = v11;
    int v13 = 0;
    id v14 = 0;
    uint64_t v15 = *(void *)v54;
    unsigned int v16 = 1 - v9;
    v43 = v7;
    unsigned int v42 = 1 - v9;
    while (2)
    {
      uint64_t v17 = 0;
      int v44 = v13;
      int v18 = v16 + v13;
      __int16 v19 = v10;
      id v20 = v14;
      do
      {
        if (*(void *)v54 != v15) {
          objc_enumerationMutation(obj);
        }
        v21 = *(NSString **)(*((void *)&v53 + 1) + 8 * (void)v17);
        int v22 = v18 + v17;
        id v52 = v20;
        if (v18 + v17) {
          uint64_t v23 = 0;
        }
        else {
          uint64_t v23 = a4;
        }
        int v24 = [v19 mkDirPlaceholder:v21 fhBuffer:&v52 wellKnownMount:v23];
        id v14 = v52;

        v25 = livefs_std_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v59 = v21;
          __int16 v60 = 1024;
          unsigned int v61 = v24;
          __int16 v62 = 1024;
          *(_DWORD *)v63 = v44 + v17 + 1;
          *(_WORD *)&v63[4] = 1024;
          *(_DWORD *)&v63[6] = v22 == 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "mkMountPath: Making placeholder %@ returned %d i %d isLast %d", buf, 0x1Eu);
        }

        if (v24 != 17 && v24 != 0) {
          goto LABEL_33;
        }
        uint64_t v27 = [(FPnfsMemFS *)self findNode:v14 nascentOk:1];
        if (!v27)
        {
          int v24 = 5;
LABEL_33:

          BOOL v4 = v43;
          v10 = v19;
          goto LABEL_50;
        }
        v10 = (void *)v27;
        if (!v22)
        {
          v29 = [(id)qword_100060780 lookup:a4];
          if (v29) {
            [v29 setFileno:[v10 fileno]];
          }

          id v14 = 0;
          v10 = 0;
          v7 = v43;
          goto LABEL_37;
        }

        uint64_t v17 = (char *)v17 + 1;
        __int16 v19 = v10;
        id v20 = v14;
      }
      while (v12 != v17);
      id v12 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
      v7 = v43;
      int v13 = v44 + v17;
      unsigned int v16 = v42;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_37:

  BOOL v4 = self->rootPath;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = obj;
  id v31 = [v30 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v49;
LABEL_39:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v49 != v33) {
        objc_enumerationMutation(v30);
      }
      v35 = [(NSString *)v4 stringByAppendingPathComponent:*(void *)(*((void *)&v48 + 1) + 8 * v34)];

      v36 = livefs_std_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v35;
        _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "mkMountPath: About to mkdir(%@, 0755)", buf, 0xCu);
      }

      BOOL v4 = v35;
      if (mkdir([(NSString *)v4 UTF8String], 0x1EDu))
      {
        if (*__error() != 17) {
          break;
        }
      }
      if (v32 == (id)++v34)
      {
        id v32 = [v30 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v32) {
          goto LABEL_39;
        }
        goto LABEL_48;
      }
    }
    int v24 = *__error();

    if (!v24) {
      goto LABEL_51;
    }
LABEL_50:
    v37 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v24 userInfo:0];
  }
  else
  {
LABEL_48:

LABEL_51:
    v37 = 0;
  }
  v38 = livefs_std_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    sub_10003EB30((uint64_t)v37, v38);
  }

  v7 = v37;
LABEL_55:

  return v7;
}

- (void)rmMountPath:(id)a3
{
  id v4 = a3;
  if (dword_100060728)
  {
    id v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "rmMountPath: %@", buf, 0xCu);
    }
  }
  if (![v4 isAbsolutePath]) {
    goto LABEL_9;
  }
  if ([v4 hasPrefix:self->rootPath]
    && ([v4 isEqualToString:self->rootPath] & 1) == 0)
  {
    uint64_t v6 = [v4 substringFromIndex:([self->rootPath length] + 1)];

    id v4 = (id)v6;
LABEL_9:
    [v4 pathComponents];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001B078;
    v8[3] = &unk_100059518;
    v8[4] = self;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v9;
    [(FPnfsMemFS *)self performExclusiveMemFS:v8];
  }
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7 = a3;
  v8 = (void (**)(id, void))a6;
  if (dword_100060728)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Close %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8[2](v8, 0);
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  if (dword_100060728)
  {
    id v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Create called dir: %@ name:%@", (uint8_t *)&v13, 0x16u);
    }
  }
  (*((void (**)(id, uint64_t, void, void, void, void))v11 + 2))(v11, 30, 0, 0, 0, 0);
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, void *))a5;
  if (dword_100060728)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Getattr called for %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v10 = [(FPnfsMemFS *)self findNode:v7];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 getattr];
    if (v12) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 28;
    }
    v8[2](v8, v13, v12);
  }
  else
  {
    v8[2](v8, 70, 0);
  }
}

- (void)getRootFileHandleWithError:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (dword_100060728)
  {
    id v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(FPnfsMemFS *)self rootNode];
      id v7 = [v6 fh];
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GetRootFileHandle %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8 = [(FPnfsMemFS *)self rootNode];
  id v9 = [v8 fh];
  v4[2](v4, v9, 0);
}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  if (dword_100060728)
  {
    uint64_t v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Lookup called dir: %@ name: %@", buf, 0x16u);
    }
  }
  int v14 = [(FPnfsMemFS *)self findNode:v10];
  if (v14)
  {
    id v15 = [v11 string];
    id v16 = [v14 lookupNode:v15];

    if (v16)
    {
      uint64_t v17 = [v16 getattr];
      int v18 = [v16 fh];
      (*((void (**)(id, void, uint64_t, void *, void *, void, void, void, void, void))v12 + 2))(v12, 0, 0xFFFFFFFFLL, v18, v17, 0, 0, 0, 0, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, uint64_t, void, void, void, void, void, void, void))v12 + 2))(v12, 2, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, uint64_t, void, void, void, void, void, void, void))v12 + 2))(v12, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (dword_100060728)
  {
    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Mkdir called dir: %@ name: %@", buf, 0x16u);
    }
  }
  id v16 = [(FPnfsMemFS *)self findNode:v11];
  if (v16)
  {
    id v23 = v13;
    uint64_t v17 = [v12 string];
    id v24 = 0;
    id v18 = [v16 mkDir:v17 fhBuffer:&v24];
    id v19 = v24;

    id v20 = [v16 getattr];
    __int16 v21 = 0;
    id v22 = 0;
    if (!v18)
    {
      __int16 v21 = [(FPnfsMemFS *)self findNode:v19];
      id v22 = [v21 getattr];
    }
    (*((void (**)(id, id, void *, id, void *, void, void))v14 + 2))(v14, v18, v20, v19, v22, 0, 0);

    id v13 = v23;
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void, void, void))v14 + 2))(v14, 70, 0, 0, 0, 0, 0);
  }
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a8;
  if (dword_100060728 >= 2)
  {
    id v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MakeSymLink called dir: %@ name: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  (*((void (**)(id, uint64_t, void, void, void, void))v12 + 2))(v12, 30, 0, 0, 0, 0);
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a7;
  if (dword_100060728 >= 2)
  {
    id v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MakeLink called dir: %@ name: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  (*((void (**)(id, uint64_t, void, void, void))v11 + 2))(v11, 30, 0, 0, 0);
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a9;
  if (dword_100060728 >= 2)
  {
    int v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MakeClone called dir: %@ name: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  (*((void (**)(id, uint64_t, void, void, void, void))v12 + 2))(v12, 30, 0, 0, 0, 0);
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7 = a3;
  v8 = (void (**)(id, void))a6;
  if (dword_100060728 >= 2)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Open %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8[2](v8, 0);
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a5;
  int v13 = 0;
  if (dword_100060728)
  {
    v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pathconf called on %@", buf, 0xCu);
    }
  }
  uint64_t v11 = 0x40000002710;
  LOBYTE(v13) = 11;
  int v12 = 64;
  id v9 = +[NSData dataWithBytes:&v11 length:16];
  if (v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 28;
  }
  v7[2](v7, v10, v9);
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a7;
  if (dword_100060728 >= 2)
  {
    uint64_t v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Read %@", (uint8_t *)&v11, 0xCu);
    }
  }
  v9[2](v9, 45, 0);
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a7;
  if (dword_100060728 >= 2)
  {
    uint64_t v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Read %@", (uint8_t *)&v11, 0xCu);
    }
  }
  v9[2](v9, 45, 0);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  if (dword_100060728)
  {
    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = 138412290;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Readdir called on %@", (uint8_t *)&v18, 0xCu);
    }
  }
  __int16 v16 = [(FPnfsMemFS *)self findNode:v13];
  if (!v16) {
    (*((void (**)(id, uint64_t, void, void, void))v14 + 2))(v14, 70, 0, 0, 0);
  }
  unsigned int v18 = 0;
  id v17 = [v16 readDirAtCookie:a5 withVerifier:a6 forBytes:a4 andError:&v18];
  (*((void (**)(id, void, id, id, void *))v14 + 2))(v14, v18, [v17 length], [v16 verf], v17);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a3;
  __int16 v16 = livefs_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10003EC34(v16);
  }

  id v17 = [(FPnfsMemFS *)self findNode:v15];

  if (!v17) {
    (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 70, 0, 0);
  }
  unsigned int v21 = 0;
  unsigned int v18 = [v17 readDirAtCookie:a5 withVerifier:a6 forBytes:[v13 length] andError:&v21];
  if (v18)
  {
    id v19 = [v13 mutableBytes];
    id v20 = v18;
    memmove(v19, [v20 bytes], (size_t)[v20 length]);
    [v13 setLength:[v20 length]];
  }
  [v18 length], objc_msgSend(v17, "verf"));
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v13 = a3;
  id v14 = a9;
  if (dword_100060728 >= 2)
  {
    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = 138412290;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ReadDirAndAttrs on %@", (uint8_t *)&v18, 0xCu);
    }
  }
  __int16 v16 = [(FPnfsMemFS *)self findNode:v13];
  if (!v16) {
    (*((void (**)(id, uint64_t, void, void, void))v14 + 2))(v14, 70, 0, 0, 0);
  }
  unsigned int v18 = 0;
  id v17 = [v16 readDirAttrAtCookie:a6 withVerifier:a7 forBytes:a4 andError:&v18];
  (*((void (**)(id, void, id, id, void *))v14 + 2))(v14, v18, [v17 length], [v16 verf], v17);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a9;
  __int16 v16 = livefs_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10003EC78((uint64_t)v13, v16);
  }

  id v17 = [(FPnfsMemFS *)self findNode:v13];
  if (!v17) {
    (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, 70, 0, 0);
  }
  unsigned int v21 = 0;
  unsigned int v18 = [v17 readDirAttrAtCookie:a6 withVerifier:a7 forBytes:[v14 length] andError:&v21];
  if (v18)
  {
    id v19 = [v14 mutableBytes];
    id v20 = v18;
    memmove(v19, [v20 bytes], (size_t)[v20 length]);
    [v14 setLength:[v20 length]];
  }
  (*((void (**)(id, void, id, id))v15 + 2))(v15, v21, [v18 length], [v17 verf]);
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (dword_100060728 >= 2)
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ReadLink %@", (uint8_t *)&v9, 0xCu);
    }
  }
  (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 45, 0, 0);
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (dword_100060728)
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reclaim %@", (uint8_t *)&v9, 0xCu);
    }
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a8;
  if (dword_100060728 >= 2)
  {
    id v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remove dir: %@ name:%@", (uint8_t *)&v14, 0x16u);
    }
  }
  (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 30, 0, 0);
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  if (dword_100060728)
  {
    __int16 v16 = livefs_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rmdir dir: %@ name:%@", (uint8_t *)&v21, 0x16u);
    }
  }
  id v17 = [(FPnfsMemFS *)self findNode:v13];
  if (!v17) {
    (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, 70, 0, 0);
  }
  unsigned int v18 = [v14 string];
  id v19 = [v17 rmDir:v18];

  if (v19)
  {
    (*((void (**)(id, id, void, void))v15 + 2))(v15, v19, 0, 0);
  }
  else
  {
    id v20 = [v17 getattr];
    (*((void (**)(id, void, void *, void))v15 + 2))(v15, 0, v20, 0);
  }
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a11;
  if (dword_100060728 >= 2)
  {
    id v24 = livefs_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v41 = v17;
      __int16 v42 = 2112;
      id v43 = v18;
      __int16 v44 = 2112;
      id v45 = v20;
      __int16 v46 = 2112;
      id v47 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rename from dir: %@ from name: %@ to dir: %@ to name: %@", buf, 0x2Au);
    }
  }
  if ([v17 isEqualToString:v20])
  {
    v25 = [(FPnfsMemFS *)self findNode:v17];
    if (v25)
    {
      id v26 = [v18 string];
      uint64_t v27 = [v25 lookupNode:v26];

      if (v27)
      {
        v39 = (void *)v27;
        id v28 = [v21 string];
        uint64_t v29 = [v25 lookupNode:v28];

        v38 = (void *)v29;
        if (v29
          && ([v21 string],
              id v30 = objc_claimAutoreleasedReturnValue(),
              id v31 = [v25 rmDir:v30],
              v30,
              v31))
        {
          (*((void (**)(id, id, void, void, void))v23 + 2))(v23, v31, 0, 0, 0);
        }
        else
        {
          id v37 = v19;
          id v32 = [v18 string];
          uint64_t v33 = [v21 string];
          id v34 = [v39 renameFrom:v32 toName:v33];

          if (v34)
          {
            (*((void (**)(id, id, void, void, void))v23 + 2))(v23, v34, 0, 0, 0);
          }
          else
          {
            v35 = [v25 getattr];
            v36 = [v25 getattr];
            (*((void (**)(id, void, void *, void *, void))v23 + 2))(v23, 0, v35, v36, 0);
          }
          id v19 = v37;
        }
      }
      else
      {
        (*((void (**)(id, uint64_t, void, void, void))v23 + 2))(v23, 2, 0, 0, 0);
      }
    }
    else
    {
      (*((void (**)(id, uint64_t, void, void, void))v23 + 2))(v23, 70, 0, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v23 + 2))(v23, 18, 0, 0, 0);
  }
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  if (dword_100060728 >= 2)
  {
    int v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SetAttr %@", (uint8_t *)&v10, 0xCu);
    }
  }
  (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 30, 0, 0);
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a5;
  if (dword_100060728)
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v11[0]) = 138412290;
      *(void *)((char *)v11 + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Statfs called on %@", (uint8_t *)v11, 0xCu);
    }
  }
  v11[0] = vdupq_n_s64(0xF4240uLL);
  v11[1] = xmmword_100048710;
  uint64_t v12 = 10000;
  int v9 = +[NSData dataWithBytes:v11 length:40];
  if (v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 28;
  }
  v7[2](v7, v10, v9);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a3;
  id v9 = a7;
  if (dword_100060728 >= 2)
  {
    uint64_t v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Write %@", (uint8_t *)&v11, 0xCu);
    }
  }
  (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 30, 0, 0);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a3;
  id v9 = a7;
  if (dword_100060728 >= 2)
  {
    uint64_t v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Write %@", (uint8_t *)&v11, 0xCu);
    }
  }
  (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 30, 0, 0);
}

- (void)LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a7;
  if (dword_100060728 >= 2)
  {
    uint64_t v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Write %@", (uint8_t *)&v11, 0xCu);
    }
  }
  v9[2](v9, 30, 0);
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7 = (void (**)(id, uint64_t, void))a6;
  id v8 = [a4 string];
  if (([v8 isEqualToString:@"_B_has_perm_enforcement"] & 1) != 0
    || [v8 isEqualToString:@"_B_has_access_check"])
  {
    __s = 0;
  }
  else
  {
    if ([v8 isEqualToString:@"_S_f_type"])
    {
      p_s = "lifs";
      uint64_t v10 = 5;
      goto LABEL_5;
    }
    if ([v8 isEqualToString:@"_S_f_location"])
    {
      __s = 0;
      pid_t v13 = getpid();
      asprintf(&__s, "fskitd@%d", v13);
      uint64_t v11 = +[NSData dataWithBytesNoCopy:__s length:strlen(__s) + 1 freeWhenDone:1];
      goto LABEL_6;
    }
    if ([v8 isEqualToString:@"_S_f_vol_name"])
    {
      p_s = "LiveFiles";
      uint64_t v10 = 10;
      goto LABEL_5;
    }
    if ([v8 isEqualToString:@"_N_caps_format"])
    {
      uint64_t v14 = 4195072;
    }
    else
    {
      if (![v8 isEqualToString:@"_N_caps_interfaces"])
      {
        v7[2](v7, 45, 0);
        goto LABEL_7;
      }
      uint64_t v14 = 8;
    }
    __s = (char *)v14;
  }
  p_s = (const char *)&__s;
  uint64_t v10 = 8;
LABEL_5:
  uint64_t v11 = +[NSData dataWithBytes:p_s length:v10];
LABEL_6:
  id v12 = (void *)v11;
  v7[2](v7, 0, v11);

LABEL_7:
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (FPnfsMemNode)rootNode
{
  return (FPnfsMemNode *)objc_getProperty(self, a2, 232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->fhMap, 0);

  objc_storeStrong((id *)&self->rootPath, 0);
}

@end
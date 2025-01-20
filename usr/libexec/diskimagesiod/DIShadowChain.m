@interface DIShadowChain
+ (BOOL)supportsSecureCoding;
- (BOOL)addShadowNodes:(id)a3 error:(id *)a4;
- (BOOL)addShadowURLs:(id)a3 error:(id *)a4;
- (BOOL)hasBaseImageCache;
- (BOOL)isEmpty;
- (BOOL)shouldValidate;
- (BOOL)verifyNodes:(id)a3 error:(id *)a4;
- (DIShadowChain)init;
- (DIShadowChain)initWithCoder:(id)a3;
- (NSArray)mountPoints;
- (NSArray)nonCacheNodes;
- (NSArray)shadowStats;
- (NSMutableArray)nodes;
- (NSURL)activeShadowURL;
- (id)description;
- (id)statWithError:(id *)a3;
- (int64_t)topDiskImageNumBlocks;
- (void)encodeWithCoder:(id)a3;
- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4;
- (void)setShouldValidate:(BOOL)a3;
@end

@implementation DIShadowChain

- (DIShadowChain)init
{
  v8.receiver = self;
  v8.super_class = (Class)DIShadowChain;
  v2 = [(DIShadowChain *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    uint64_t v5 = +[NSArray array];
    shadowStats = v2->_shadowStats;
    v2->_shadowStats = (NSArray *)v5;

    v2->_shouldValidate = 1;
  }
  return v2;
}

- (BOOL)addShadowURLs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        v13 = [DIShadowNode alloc];
        v14 = -[DIShadowNode initWithURL:isCache:](v13, "initWithURL:isCache:", v12, 0, (void)v17);
        [v7 addObject:v14];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  BOOL v15 = [(DIShadowChain *)self addShadowNodes:v7 error:a4];
  return v15;
}

- (BOOL)verifyNodes:(id)a3 error:(id *)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    BOOL v15 = 1;
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)v20;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      v11 = [v10 URL];
      unsigned __int8 v12 = [v11 isFileURL];

      if ((v12 & 1) == 0)
      {
        v16 = +[NSString stringWithFormat:@"Shadow path %@ is not a valid file", v10];
        unsigned __int8 v17 = +[DIError failWithPOSIXCode:22 verboseInfo:v16 error:a4];
LABEL_14:
        BOOL v15 = v17;

        goto LABEL_15;
      }
      v13 = [(DIShadowChain *)self nodes];
      unsigned int v14 = [v13 containsObject:v10];

      if (v14)
      {
        v16 = +[NSString stringWithFormat:@"Duplicate shadow values for: %@", v10];
        unsigned __int8 v17 = +[DIError failWithPOSIXCode:22 verboseInfo:v16 error:a4];
        goto LABEL_14;
      }
    }
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    BOOL v15 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_15:

  return v15;
}

- (BOOL)addShadowNodes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(DIShadowChain *)self verifyNodes:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [(DIShadowChain *)self nodes];
    [v8 addObjectsFromArray:v6];
  }
  return v7;
}

- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4
{
  BOOL v7 = [(DIShadowChain *)self nodes];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C9AB0;
  v8[3] = &unk_1001A95E0;
  BOOL v9 = a3;
  BOOL v10 = a4;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (id)statWithError:(id *)a3
{
  shadowStats = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(DIShadowChain *)self nodes];
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(v5);
      }
      BOOL v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
      BOOL v10 = [v9 fileBackend];
      BOOL v11 = v10 == 0;

      if (v11) {
        break;
      }
      unsigned __int8 v12 = [v9 fileBackend];
      v13 = v12;
      if (v12)
      {
        [v12 backend];
      }
      else
      {
        uint64_t v20 = 0;
        long long v21 = 0;
      }
      sub_100141990((uint64_t)&v20, &v22);
      uint64_t v14 = sub_1001234C0((uint64_t)&v22);
      if (v23) {
        sub_100010A48(v23);
      }
      if (v21) {
        sub_100010A48(v21);
      }

      if ((v14 & 0x80000000) != 0)
      {
        +[DIError failWithEnumValue:150 verboseInfo:@"Unexpected backend type for shadow file" error:a3];
        goto LABEL_22;
      }
      BOOL v15 = [[DIStatFS alloc] initWithFileDescriptor:v14 error:a3];
      v16 = v15;
      if (!v15)
      {
        +[DIError failWithEnumValue:150 verboseInfo:@"Could not stat shadow file" error:a3];
        goto LABEL_22;
      }
      [(DIStatFS *)v15 logWithHeader:@"Shadow underlying FS"];
      [shadowStats addObject:v16];

      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    +[DIError failWithEnumValue:150 verboseInfo:@"Bakcend not initialized for file" error:a3];
LABEL_22:

    unsigned __int8 v17 = 0;
    goto LABEL_23;
  }
LABEL_18:

  unsigned __int8 v17 = shadowStats;
  shadowStats = self->_shadowStats;
  self->_shadowStats = v17;
LABEL_23:

  return v17;
}

- (NSArray)mountPoints
{
  uint64_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(DIShadowChain *)self shadowStats];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) mountedOnURL];
        [v3 addObject:v8];
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  v2 = [(DIShadowChain *)self nodes];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (NSURL)activeShadowURL
{
  if ([(DIShadowChain *)self isEmpty]
    || ([(DIShadowChain *)self nodes],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 lastObject],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isCache],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [(DIShadowChain *)self nodes];
    uint64_t v8 = [v7 lastObject];
    uint64_t v6 = [v8 URL];
  }

  return (NSURL *)v6;
}

- (BOOL)hasBaseImageCache
{
  if ([(DIShadowChain *)self isEmpty]) {
    return 0;
  }
  v4 = [(DIShadowChain *)self nodes];
  unsigned __int8 v5 = [v4 firstObject];
  unsigned __int8 v3 = [v5 isCache];

  return v3;
}

- (NSArray)nonCacheNodes
{
  unsigned __int8 v3 = +[NSPredicate predicateWithBlock:&stru_1001A9620];
  v4 = [(DIShadowChain *)self nodes];
  unsigned __int8 v5 = [v4 filteredArrayUsingPredicate:v3];

  return (NSArray *)v5;
}

- (int64_t)topDiskImageNumBlocks
{
  if (![(DIShadowChain *)self isEmpty])
  {
    uint64_t v6 = [(DIShadowChain *)self nodes];
    uint64_t v7 = [v6 lastObject];

    uint64_t v8 = [v7 fileBackend];
    BOOL v9 = v8;
    if (v8)
    {
      [v8 backend];
      uint64_t v10 = *(void *)buf;
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(void *)buf = 0;
    *(void *)BOOL v15 = 0;

    int v12 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 176))(v10);
    dup(v12);
    diskimage_uio::diskimage_open_params::create();
  }
  int v3 = *__error();
  if (sub_1000D29A0())
  {
    v4 = sub_1000D2920();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 38;
    *(_WORD *)BOOL v15 = 2080;
    *(void *)&v15[2] = "-[DIShadowChain topDiskImageNumBlocks]";
    unsigned __int8 v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf(__stderrp, "%s\n", v5);
      free(v5);
    }
  }
  else
  {
    long long v11 = sub_1000D2920();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 38;
      *(_WORD *)BOOL v15 = 2080;
      *(void *)&v15[2] = "-[DIShadowChain topDiskImageNumBlocks]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%.*s: numBlocks queried for an empty shadowChain.", buf, 0x12u);
    }
  }
  *__error() = v3;
  return -22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIShadowChain;
  unsigned __int8 v5 = [(DIShadowChain *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"nodes"];
    nodes = v5->_nodes;
    v5->_nodes = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_class();
    long long v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"shadowStats"];
    shadowStats = v5->_shadowStats;
    v5->_shadowStats = (NSArray *)v12;

    v5->_shouldValidate = [v4 decodeBoolForKey:@"shouldValidate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DIShadowChain *)self nodes];
  [v6 encodeObject:v4 forKey:@"nodes"];

  unsigned __int8 v5 = [(DIShadowChain *)self shadowStats];
  [v6 encodeObject:v5 forKey:@"shadowStats"];

  [v6 encodeBool:-[DIShadowChain shouldValidate](self, "shouldValidate") forKey:@"shouldValidate"];
}

- (id)description
{
  v2 = [(DIShadowChain *)self nodes];
  int v3 = +[NSString stringWithFormat:@"ShadowChain: %@", v2];

  return v3;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (NSArray)shadowStats
{
  return self->_shadowStats;
}

- (BOOL)shouldValidate
{
  return self->_shouldValidate;
}

- (void)setShouldValidate:(BOOL)a3
{
  self->_shouldValidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowStats, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
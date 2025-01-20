@interface DiskImageGraph
+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5;
+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4;
+ (BOOL)failWithNoPstackError:(id *)a3;
+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5;
+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7;
+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5;
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)createPstackDictWithNode:(id)a3;
+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4;
- (BOOL)checkStackValidityWithError:(id *)a3;
- (BOOL)cloneToURL:(id)a3 error:(id *)a4;
- (BOOL)imported;
- (BOOL)loadImportedNodesWithError:(id *)a3;
- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)savePstackWithError:(id *)a3;
- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4;
- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4;
- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6;
- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7;
- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4;
- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5;
- (DiskImageGraphNode)activeNode;
- (NSMutableArray)imagesDictsArray;
- (NSMutableDictionary)nodes;
- (NSMutableDictionary)pstackDB;
- (NSURL)pstackURL;
- (id)baseNode;
- (id)getImageWithTag:(id)a3 error:(id *)a4;
- (id)getImageWithUUID:(id)a3 error:(id *)a4;
- (void)setActiveNode:(id)a3;
- (void)setImagesDictsArray:(id)a3;
- (void)setImported:(BOOL)a3;
- (void)setNodes:(id)a3;
- (void)setPstackDB:(id)a3;
- (void)setPstackURL:(id)a3;
@end

@implementation DiskImageGraph

+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5
{
  v7 = +[NSFileHandle fileHandleForReadingFromURL:a3 error:0];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 readDataUpToLength:0x100000 error:a5];
    if (v9)
    {
      v10 = +[NSPropertyListSerialization propertyListWithData:v9 options:2 format:0 error:a5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *a4 = v10;
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = +[DiskImageGraph failWithNoPstackError:a5];
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = +[DiskImageGraph failWithNoPstackError:a5];
  }

  return v11;
}

+ (BOOL)failWithNoPstackError:(id *)a3
{
  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:@"Not a pstack." forKeyedSubscript:@"DIErrorVerboseInfo"];
  v5 = +[NSError errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:167 userInfo:v4];
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

+ (id)createPstackDictWithNode:(id)a3
{
  id v3 = a3;
  v4 = [v3 toDictionary];
  id v5 = [v4 mutableCopy];
  [v3 setPstackDict:v5];

  v6 = [v3 UUID];
  v7 = [v6 UUIDString];
  v8 = [v3 pstackDict];

  v9 = +[NSMutableArray arrayWithObject:v8];
  v10 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1.0", @"PstackVersion", v7, @"ActiveNode", v9, @"Images", 0];

  return v10;
}

- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)DiskImageGraph;
  v15 = [(DiskImageGraph *)&v36 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v15->_pstackURL, a5);
  uint64_t v17 = +[NSUUID UUID];
  if (v17)
  {
    v18 = (void *)v17;
    LOBYTE(v35) = 0;
    v19 = [[PluginDiskImageGraphNode alloc] initWithPluginName:v11 pluginParams:v12 tag:v14 UUID:v17 parentNode:0 metadata:0 isCache:v35];
    activeNode = v16->_activeNode;
    v16->_activeNode = &v19->super;
    v21 = v19;

    uint64_t v22 = +[DiskImageGraph createPstackDictWithNode:v21];
    pstackDB = v16->_pstackDB;
    v16->_pstackDB = (NSMutableDictionary *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nodes = v16->_nodes;
    v16->_nodes = v24;

    v26 = [(DiskImageGraph *)v16 nodes];
    v27 = [(DiskImageGraphNode *)v21 UUID];
    v28 = [v27 UUIDString];
    [v26 setObject:v21 forKeyedSubscript:v28];

LABEL_4:
    v29 = v16;
    goto LABEL_12;
  }
  int v30 = *__error();
  if (sub_1000D29A0())
  {
    v31 = sub_1000D2920();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v38 = 73;
    __int16 v39 = 2080;
    v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
    v32 = (char *)_os_log_send_and_compose_impl();

    if (v32)
    {
      fprintf(__stderrp, "%s\n", v32);
      free(v32);
    }
  }
  else
  {
    v33 = sub_1000D2920();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v38 = 73;
      __int16 v39 = 2080;
      v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%.*s: Failed to get UUID info of provided image.", buf, 0x12u);
    }
  }
  v29 = 0;
  *__error() = v30;
LABEL_12:

  return v29;
}

- (NSMutableArray)imagesDictsArray
{
  v2 = [(DiskImageGraph *)self pstackDB];
  id v3 = [v2 objectForKeyedSubscript:@"Images"];

  return (NSMutableArray *)v3;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  BOOL v6 = 0;
  if ([v5 validateAndPopObjectForKey:@"PstackVersion" className:objc_opt_class() isOptional:0 error:a4])
  {
    if ([v5 validateAndPopObjectForKey:@"ImportPstack" className:objc_opt_class() isOptional:1 error:a4])
    {
      BOOL v6 = 0;
      if ([v5 validateAndPopObjectForKey:@"ActiveNode" className:objc_opt_class() isOptional:0 error:a4])
      {
        BOOL v6 = 0;
        if ([v5 validateAndPopObjectForKey:@"Images" className:objc_opt_class() isOptional:0 error:a4])
        {
          if ([v5 count])
          {
            v7 = +[NSString stringWithFormat:@"Validation failed, input contains unexpected data."];
            BOOL v6 = +[DIError failWithPOSIXCode:22 verboseInfo:v7 error:a4];
          }
          else
          {
            BOOL v6 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)DiskImageGraph;
  id v12 = [(DiskImageGraph *)&v26 init];
  if (v12)
  {
    if (!+[DiskImageGraph validateWithDictionary:v10 error:a6])goto LABEL_10; {
    v12->_imported = a5;
    }
    objc_storeStrong((id *)&v12->_pstackURL, a4);
    uint64_t v13 = +[NSMutableDictionary dictionaryWithDictionary:v10];
    pstackDB = v12->_pstackDB;
    v12->_pstackDB = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nodes = v12->_nodes;
    v12->_nodes = v15;

    uint64_t v17 = [(NSMutableDictionary *)v12->_pstackDB objectForKeyedSubscript:@"Images"];
    unsigned int v18 = +[DiskImageGraph populateNodesDictsWithArray:v17 pstackURL:v11 nodesDict:v12->_nodes isTopLevelPstack:1 error:a6];

    if (!v18 || ![(DiskImageGraph *)v12 loadImportedNodesWithError:a6]) {
      goto LABEL_10;
    }
    v19 = [(DiskImageGraph *)v12 nodes];
    v20 = [(NSMutableDictionary *)v12->_pstackDB objectForKeyedSubscript:@"ActiveNode"];
    uint64_t v21 = [v19 objectForKey:v20];
    activeNode = v12->_activeNode;
    v12->_activeNode = (DiskImageGraphNode *)v21;

    if (!v21)
    {
      v23 = +[DIError nilWithPOSIXCode:22 description:@"Bad pstack format, node with active UUID not found." error:a6];
      goto LABEL_9;
    }
    if (!+[DiskImageGraph createNodesConnectivityWithNodesDict:v12->_nodes error:a6]|| ![(DiskImageGraph *)v12 checkStackValidityWithError:a6])
    {
LABEL_10:
      v24 = 0;
      goto LABEL_11;
    }
  }
  v23 = v12;
LABEL_9:
  v24 = v23;
LABEL_11:

  return v24;
}

- (BOOL)loadImportedNodesWithError:(id *)a3
{
  id v5 = [(DiskImageGraph *)self pstackDB];
  BOOL v6 = [v5 objectForKeyedSubscript:@"ImportPstack"];

  if (!v6) {
    goto LABEL_9;
  }
  if (![(DiskImageGraph *)self imported])
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      CFStringRef v7 = @"Multiple imports are not allowed.";
      goto LABEL_6;
    }
    v8 = [v6 firstObject];
    v9 = [(DiskImageGraph *)self pstackURL];
    id v10 = [v9 URLByDeletingLastPathComponent];
    id v11 = +[NSURL fileURLWithPath:v8 relativeToURL:v10];

    a3 = [[DiskImageGraph alloc] initWithPstackURL:v11 imported:1 error:a3];
    if (!a3)
    {

      goto LABEL_10;
    }
    id v12 = [(DiskImageGraph *)self nodes];
    uint64_t v13 = [a3 nodes];
    [v12 addEntriesFromDictionary:v13];

LABEL_9:
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }
  CFStringRef v7 = @"nested imports are not allowed.";
LABEL_6:
  LOBYTE(a3) = +[DIError failWithPOSIXCode:22 description:v7 error:a3];
LABEL_10:

  return (char)a3;
}

- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4
{
  return [(DiskImageGraph *)self initWithPstackURL:a3 imported:0 error:a4];
}

- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v13 = 0;
  unsigned int v9 = +[DiskImageGraph loadPlistDictFromURL:v8 dict:&v13 error:a5];
  id v10 = v13;
  if (v9)
  {
    self = [(DiskImageGraph *)self initWithData:v10 pstackURL:v8 imported:v6 error:a5];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100134420;
  v32 = sub_100134430;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100134420;
  objc_super v26 = sub_100134430;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = +[NSFileManager defaultManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100134438;
  v17[3] = &unk_1001B5130;
  v20 = &v28;
  id v10 = v7;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  uint64_t v21 = &v22;
  [v8 enumerateKeysAndObjectsUsingBlock:v17];
  uint64_t v12 = v29[5];
  if (v12)
  {
    id v13 = (void *)v23[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001345A4;
    v15[3] = &unk_1001B5158;
    id v16 = v11;
    [v13 enumerateObjectsUsingBlock:v15];
    if (a5) {
      *a5 = (id) v29[5];
    }
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12 == 0;
}

- (BOOL)cloneToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DiskImageGraph *)self pstackURL];
  id v8 = [v7 lastPathComponent];
  unsigned int v9 = [v6 URLByAppendingPathComponent:v8];

  id v10 = [(DiskImageGraph *)self pstackDB];
  id v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

  uint64_t v12 = [(DiskImageGraph *)self pstackDB];
  id v13 = [v12 objectForKeyedSubscript:@"Images"];

  v37 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
  [v11 setObject:forKeyedSubscript:];
  id v14 = [(DiskImageGraph *)self pstackDB];
  v15 = [v14 objectForKeyedSubscript:@"ImportPstack"];

  if (v15)
  {
    CFStringRef v16 = @"Cannot clone a pstack with an import.";
LABEL_16:
    uint64_t v30 = 22;
LABEL_17:
    BOOL v29 = +[DIError failWithPOSIXCode:v30 description:v16 error:a4];
    goto LABEL_18;
  }
  if (([v6 isFileURL] & 1) == 0)
  {
    CFStringRef v16 = @"Destination folder URL must be of 'file' scheme.";
    goto LABEL_16;
  }
  if (![v6 hasDirectoryPath]
    || ([v6 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    CFStringRef v16 = @"Destination folder URL must represent an existing folder.";
    uint64_t v30 = 20;
    goto LABEL_17;
  }
  v32 = v13;
  id v33 = v11;
  v34 = a4;
  uint64_t v35 = v9;
  id v36 = v6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v13;
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v23 = [v22 mutableCopy];
        uint64_t v24 = [v22 objectForKeyedSubscript:@"FilePath"];
        v25 = [v24 componentsSeparatedByString:@"/"];
        objc_super v26 = [v25 lastObject];
        [v23 setObject:v26 forKeyedSubscript:@"FilePath"];

        [v37 addObject:v23];
      }
      id v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v19);
  }

  id v27 = [(DiskImageGraph *)self nodes];
  id v6 = v36;
  unsigned int v28 = +[DiskImageGraph copyDictNodesToFolder:v36 dict:v27 error:v34];

  if (v28)
  {
    id v11 = v33;
    unsigned int v9 = v35;
    BOOL v29 = +[DiskImageGraph saveToPlistWithDictionary:v33 URL:v35 error:v34];
  }
  else
  {
    BOOL v29 = 0;
    unsigned int v9 = v35;
    id v11 = v33;
  }
  id v13 = v32;
LABEL_18:

  return v29;
}

- (void)setActiveNode:(id)a3
{
  objc_storeStrong((id *)&self->_activeNode, a3);
  id v5 = a3;
  id v7 = [v5 UUID];
  id v6 = [v7 UUIDString];
  [(NSMutableDictionary *)self->_pstackDB setObject:v6 forKeyedSubscript:@"ActiveNode"];
}

+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = sub_100134420;
  id v27 = sub_100134430;
  id v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100134B44;
  v18[3] = &unk_1001B5180;
  BOOL v22 = a6;
  id v14 = v12;
  id v19 = v14;
  uint64_t v21 = &v23;
  id v15 = v13;
  id v20 = v15;
  [v11 enumerateObjectsUsingBlock:v18];
  CFStringRef v16 = (void *)v24[5];
  if (a7 && v16) {
    *a7 = v16;
  }

  _Block_object_dispose(&v23, 8);
  return v16 == 0;
}

+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100134420;
  id v15 = sub_100134430;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100134D68;
  v8[3] = &unk_1001B51A8;
  id v5 = a3;
  id v9 = v5;
  id v10 = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)v12[5];
  if (a4 && v6) {
    *a4 = v6;
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

- (BOOL)checkStackValidityWithError:(id *)a3
{
  id v5 = [(DiskImageGraph *)self activeNode];
  unint64_t v6 = -1;
  while (v5)
  {
    id v7 = [v5 parent];

    id v8 = [(DiskImageGraph *)self nodes];
    id v9 = [v8 count];

    ++v6;
    id v5 = v7;
    if ((unint64_t)v9 <= v6)
    {
      BOOL v10 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Invalid pstack, Active stack contains a loop." error:a3];

      return v10;
    }
  }
  return 1;
}

- (BOOL)savePstackWithError:(id *)a3
{
  id v5 = [(DiskImageGraph *)self pstackDB];
  unint64_t v6 = [(DiskImageGraph *)self pstackURL];
  LOBYTE(a3) = +[DiskImageGraph saveToPlistWithDictionary:v5 URL:v6 error:a3];

  return (char)a3;
}

+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:100 options:0 error:a5];
  id v9 = v8;
  if (v8) {
    unsigned __int8 v10 = [v8 writeToURL:v7 options:1 error:a5];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DiskImageGraph *)self nodes];
  id v8 = [v6 UUIDString];

  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [(DiskImageGraph *)self setActiveNode:v9];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot find image with provided UUID." error:a4];
  }

  return v10;
}

- (id)getImageWithTag:(id)a3 error:(id *)a4
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100134420;
  v16[4] = sub_100134430;
  id v6 = a3;
  id v17 = v6;
  id v7 = [(DiskImageGraph *)self nodes];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001352C4;
  v15[3] = &unk_1001B51D0;
  void v15[4] = v16;
  id v8 = [v7 keysOfEntriesPassingTest:v15];

  if ([v8 count])
  {
    if ([v8 count] == (id)1)
    {
      id v9 = [(DiskImageGraph *)self nodes];
      BOOL v10 = [v8 anyObject];
      uint64_t v11 = [v9 objectForKey:v10];

      goto LABEL_7;
    }
    CFStringRef v12 = @"More than one image in the stack has the provided tag, please specify UUID instead.";
    uint64_t v13 = 22;
  }
  else
  {
    CFStringRef v12 = @"Cannot find image with provided tag.";
    uint64_t v13 = 2;
  }
  uint64_t v11 = +[DIError nilWithPOSIXCode:v13 verboseInfo:v12 error:a4];
LABEL_7:

  _Block_object_dispose(v16, 8);

  return v11;
}

- (id)getImageWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DiskImageGraph *)self nodes];
  id v8 = [v6 UUIDString];

  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = +[DIError nilWithPOSIXCode:2 verboseInfo:@"Cannot find image with provided uuid." error:a4];
  }
  uint64_t v11 = v10;

  return v11;
}

- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4
{
  id v5 = [(DiskImageGraph *)self getImageWithTag:a3 error:a4];
  if (v5) {
    [(DiskImageGraph *)self setActiveNode:v5];
  }

  return v5 != 0;
}

- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(DiskImageGraph *)self nodes];
  id v10 = [v8 UUIDString];

  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (v11) {
    unsigned __int8 v12 = [(DiskImageGraph *)self removeWithNode:v11 recursive:v6 error:a5];
  }
  else {
    unsigned __int8 v12 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot find image with provided UUID." error:a5];
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = [(DiskImageGraph *)self getImageWithTag:a3 error:a5];
  if (v8) {
    BOOL v9 = [(DiskImageGraph *)self removeWithNode:v8 recursive:v6 error:a5];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [v8 parent];

  if (v9)
  {
    id v10 = [v8 getDescendants];
    if (![v10 count] || v6)
    {
      uint64_t v14 = [(DiskImageGraph *)self activeNode];
      if ((id)v14 == v8)
      {
      }
      else
      {
        id v15 = (void *)v14;
        id v16 = [(DiskImageGraph *)self activeNode];
        unsigned int v17 = [v10 containsObject:v16];

        if (!v17)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v18 = [v8 children];
          id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                [(DiskImageGraph *)self removeWithNode:*(void *)(*((void *)&v29 + 1) + 8 * i) recursive:v6 error:0];
              }
              id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
            }
            while (v20);
          }

          [v8 deleteImage];
          uint64_t v23 = [(DiskImageGraph *)self imagesDictsArray];
          uint64_t v24 = [v8 pstackDict];
          [v23 removeObject:v24];

          uint64_t v25 = [(DiskImageGraph *)self nodes];
          objc_super v26 = [v8 UUID];
          id v27 = [v26 UUIDString];
          [v25 removeObjectForKey:v27];

          BOOL v13 = 1;
          goto LABEL_19;
        }
      }
      CFStringRef v11 = @"The requested operation will delete the active node, please set another one first.";
      uint64_t v12 = 22;
    }
    else
    {
      CFStringRef v11 = @"The requested operation will delete all children of the provided node. use recursive removal to surpress this error.";
      uint64_t v12 = 1;
    }
    BOOL v13 = +[DIError failWithPOSIXCode:v12 verboseInfo:v11 error:a5];
LABEL_19:

    goto LABEL_20;
  }
  BOOL v13 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot delete base image node." error:a5];
LABEL_20:

  return v13;
}

+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isFileURL])
  {
    id v7 = [v5 URLByStandardizingPath];
    id v8 = [v7 path];

    BOOL v9 = [v6 URLByStandardizingPath];
    id v10 = [v9 path];

    if ([v8 hasPrefix:v10])
    {
      CFStringRef v11 = [v8 substringFromIndex:([v10 length] + 1)];
      id v12 = +[NSURL fileURLWithPath:v11 relativeToURL:v6];
    }
    else
    {
      id v12 = [v5 absoluteURL];
    }
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

- (id)baseNode
{
  v2 = [(DiskImageGraph *)self activeNode];
  id v3 = [v2 parent];

  if (v3)
  {
    do
    {
      v4 = [v2 parent];

      id v5 = [v4 parent];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }

  return v4;
}

- (NSURL)pstackURL
{
  return self->_pstackURL;
}

- (void)setPstackURL:(id)a3
{
}

- (NSMutableDictionary)pstackDB
{
  return self->_pstackDB;
}

- (void)setPstackDB:(id)a3
{
}

- (void)setImagesDictsArray:(id)a3
{
}

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (DiskImageGraphNode)activeNode
{
  return self->_activeNode;
}

- (BOOL)imported
{
  return self->_imported;
}

- (void)setImported:(BOOL)a3
{
  self->_imported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeNode, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_imagesDictsArray, 0);
  objc_storeStrong((id *)&self->_pstackDB, 0);

  objc_storeStrong((id *)&self->_pstackURL, 0);
}

@end
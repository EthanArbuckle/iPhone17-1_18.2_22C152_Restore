@interface PKHost
+ (id)defaultHost;
- (NSDictionary)hostInfoPlist;
- (NSMapTable)discoveryMap;
- (NSMutableDictionary)activeOneShots;
- (NSMutableDictionary)activePlugIns;
- (OS_dispatch_queue)hostQueue;
- (PKDaemonClient)daemon;
- (PKExternalProviders)external;
- (PKHost)init;
- (PKHost)initWithDaemon:(id)a3 externalProviders:(id)a4;
- (id)activatePlugIn:(id)a3;
- (id)activePlugInForIdentifier:(id)a3;
- (id)continuouslyDiscoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5;
- (id)findPlugInByUUID:(id)a3 withError:(id *)a4;
- (id)rewriteDiscoveryAttributes:(id)a3 flags:(unint64_t)a4;
- (void)_findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5;
- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 extensions:(id)a6;
- (void)cancelPlugInDiscovery:(id)a3;
- (void)deactivatePlugIn:(id)a3;
- (void)discoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5;
- (void)findPlugInByPathURL:(id)a3 reply:(id)a4;
- (void)findPlugInByUUID:(id)a3 reply:(id)a4;
- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 environment:(id)a5 languages:(id)a6 persona:(id)a7 sandbox:(id)a8 ready:(id)a9;
- (void)setActiveOneShots:(id)a3;
- (void)setActivePlugIns:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDiscoveryMap:(id)a3;
- (void)setElection:(int64_t)a3 forPlugIn:(id)a4;
- (void)setExtensionState:(id)a3 forPlugIn:(id)a4;
- (void)setHostQueue:(id)a3;
@end

@implementation PKHost

+ (id)defaultHost
{
  if (qword_1EB2BE110 != -1) {
    dispatch_once(&qword_1EB2BE110, &unk_1F0C15430);
  }
  v2 = (void *)qword_1EB2BE108;
  return v2;
}

- (id)findPlugInByUUID:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1B38B78AC;
  v20 = sub_1B38B7874;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1B38B78AC;
  v14 = sub_1B38B7874;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B38B1240;
  v9[3] = &unk_1E6059210;
  v9[4] = &v10;
  v9[5] = &v16;
  [(PKHost *)self _findPlugInByUUID:v6 synchronously:1 reply:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (void)_findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(PKHost *)self daemon];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B38B220C;
  v12[3] = &unk_1E60591E8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 findPlugInByUUID:v9 synchronously:v5 reply:v12];
}

- (PKHost)init
{
  v3 = [[PKDaemonClient alloc] initWithServiceName:0];
  v4 = objc_opt_new();
  BOOL v5 = [(PKHost *)self initWithDaemon:v3 externalProviders:v4];

  return v5;
}

- (PKHost)initWithDaemon:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKHost;
  id v8 = [(PKHost *)&v15 init];
  if (v8)
  {
    id v9 = +[PKCapabilities frameworkQueueAttr];
    dispatch_queue_t v10 = dispatch_queue_create("host", v9);
    [(PKHost *)v8 setHostQueue:v10];

    id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:100];
    [(PKHost *)v8 setActivePlugIns:v11];

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PKHost *)v8 setActiveOneShots:v12];

    id v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    [(PKHost *)v8 setDiscoveryMap:v13];

    [(PKHost *)v8 setDaemon:v6];
    objc_storeStrong((id *)&v8->_external, a4);
  }

  return v8;
}

- (id)continuouslyDiscoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  dispatch_queue_t v10 = [[PKDiscoveryDriver alloc] initWithAttributes:v9 flags:a4 host:self report:v8];

  [(PKDiscoveryDriver *)v10 performWithPreviousResults:0 forceNotify:1];
  return v10;
}

- (NSMapTable)discoveryMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)discoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = [MEMORY[0x1E4F29128] UUID];
  id v11 = _os_activity_create(&dword_1B38B0000, "discovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38B496C;
  block[3] = &unk_1E6059288;
  id v16 = v8;
  v17 = self;
  id v19 = v9;
  unint64_t v20 = a4;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  os_activity_apply(v11, block);
}

- (OS_dispatch_queue)hostQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (PKDaemonClient)daemon
{
  return (PKDaemonClient *)objc_getProperty(self, a2, 48, 1);
}

- (id)rewriteDiscoveryAttributes:(id)a3 flags:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"NSExtensionPointName"];

  if (v5)
  {
    id v6 = v4;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v25 = v4;
  id v7 = v4;
  unint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    dispatch_queue_t v10 = @"com.apple.version";
    id v11 = @"NSExtensionIdentifier";
    do
    {
      uint64_t v12 = 0;
      if (v8 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v8;
      }
      uint64_t v26 = v13;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        id v18 = *(__CFString **)(*((void *)&v27 + 1) + 8 * v12);
        if ([(__CFString *)v18 isEqualToString:@"com.apple.identifier"])
        {
          id v14 = [v7 objectForKeyedSubscript:v18];
          objc_super v15 = v6;
          id v16 = v14;
          v17 = v11;
LABEL_11:
          [v15 setObject:v16 forKeyedSubscript:v17];
          goto LABEL_12;
        }
        if ([(__CFString *)v18 isEqualToString:v10])
        {
          id v14 = [v7 objectForKeyedSubscript:v18];
          objc_super v15 = v6;
          id v16 = v14;
          v17 = @"NSExtensionVersion";
          goto LABEL_11;
        }
        uint64_t v19 = v9;
        unint64_t v20 = v11;
        id v21 = v10;
        int v22 = [(__CFString *)v18 isEqualToString:@"com.apple.protocol"];
        id v14 = [v7 objectForKeyedSubscript:v18];
        if (v22) {
          v23 = @"NSExtensionPointName";
        }
        else {
          v23 = v18;
        }
        [v6 setObject:v14 forKeyedSubscript:v23];
        dispatch_queue_t v10 = v21;
        id v11 = v20;
        uint64_t v9 = v19;
        uint64_t v13 = v26;
LABEL_12:

        ++v12;
      }
      while (v13 != v12);
      unint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  id v4 = v25;
LABEL_23:

  return v6;
}

- (PKExternalProviders)external
{
  return (PKExternalProviders *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHostQueue:(id)a3
{
}

- (void)setDiscoveryMap:(id)a3
{
}

- (void)setDaemon:(id)a3
{
}

- (void)setActivePlugIns:(id)a3
{
}

- (void)setActiveOneShots:(id)a3
{
}

- (void)findPlugInByUUID:(id)a3 reply:(id)a4
{
}

- (void)findPlugInByPathURL:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKHost *)self daemon];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B38C0600;
  v10[3] = &unk_1E60591E8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 findPlugInByPathURL:v7 reply:v10];
}

- (void)cancelPlugInDiscovery:(id)a3
{
}

- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 extensions:(id)a6
{
  BOOL v6 = a4;
  id v9 = a6;
  id v10 = a3;
  id v11 = [(PKHost *)self daemon];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B38C0AF0;
  v13[3] = &unk_1E60592B0;
  id v14 = v9;
  id v12 = v9;
  [v11 accessPlugIns:v10 synchronously:v6 flags:0 reply:v13];
}

- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 environment:(id)a5 languages:(id)a6 persona:(id)a7 sandbox:(id)a8 ready:(id)a9
{
  BOOL v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  int v22 = [(PKHost *)self daemon];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B38C0CB8;
  v24[3] = &unk_1E60592D8;
  v24[4] = self;
  id v25 = v16;
  id v23 = v16;
  [v22 readyPlugIns:v21 synchronously:v13 flags:0 environment:v20 languages:v19 persona:v18 sandbox:v17 reply:v24];
}

- (void)setElection:(int64_t)a3 forPlugIn:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_opt_new();
  unint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"election"];

  id v9 = [v6 bootInstance];
  [v7 setObject:v9 forKeyedSubscript:@"bootuuid"];

  id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "annotationTimestamp"));
  [v7 setObject:v10 forKeyedSubscript:@"timestamp"];

  id v11 = [(PKHost *)self daemon];
  id v12 = [v6 uuid];

  v14[0] = v12;
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v11 setPluginAnnotations:v13 annotations:v7 reply:&unk_1F0C15590];
}

- (void)setExtensionState:(id)a3 forPlugIn:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v8 = a4;
  id v9 = objc_opt_new();
  [v9 setObject:v7 forKeyedSubscript:@"extension"];
  id v10 = [v8 bootInstance];
  [v9 setObject:v10 forKeyedSubscript:@"bootuuid"];

  id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "annotationTimestamp"));
  [v9 setObject:v11 forKeyedSubscript:@"timestamp"];

  id v12 = [(PKHost *)self daemon];
  BOOL v13 = [v8 uuid];

  v15[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v12 setPluginAnnotations:v14 annotations:v9 reply:&unk_1F0C155B0];
}

- (id)activePlugInForIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"activePlugInForIdentifier: nil not allowed"];
  }
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_1B38B78AC;
  id v16 = sub_1B38B7874;
  id v17 = 0;
  BOOL v5 = [(PKHost *)self hostQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38C12A8;
  block[3] = &unk_1E60591C0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)activatePlugIn:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1B38B78AC;
  id v18 = sub_1B38B7874;
  id v19 = 0;
  id v6 = [(PKHost *)self hostQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B38C148C;
  v10[3] = &unk_1E6059320;
  v10[4] = self;
  id v11 = v5;
  uint64_t v12 = &v14;
  SEL v13 = a2;
  id v7 = v5;
  dispatch_sync(v6, v10);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (void)deactivatePlugIn:(id)a3
{
  id v5 = a3;
  id v6 = [(PKHost *)self hostQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38C1934;
  block[3] = &unk_1E6059348;
  id v9 = v5;
  id v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_sync(v6, block);
}

- (NSDictionary)hostInfoPlist
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38C1CEC;
  block[3] = &unk_1E6058CF0;
  void block[4] = self;
  if (qword_1E9CD2B50 != -1) {
    dispatch_once(&qword_1E9CD2B50, block);
  }
  return self->_hostInfoPlist;
}

- (NSMutableDictionary)activePlugIns
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)activeOneShots
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_hostQueue, 0);
  objc_storeStrong((id *)&self->_discoveryMap, 0);
  objc_storeStrong((id *)&self->_activeOneShots, 0);
  objc_storeStrong((id *)&self->_activePlugIns, 0);
  objc_storeStrong((id *)&self->_hostInfoPlist, 0);
}

@end
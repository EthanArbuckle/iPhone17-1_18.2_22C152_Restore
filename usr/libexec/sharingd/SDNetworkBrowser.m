@interface SDNetworkBrowser
- (NSDictionary)options;
- (NSNumber)isEntitled;
- (NSString)bundleID;
- (NSString)kind;
- (NSString)objectKey;
- (OS_xpc_object)boostMessage;
- (OS_xpc_object)connection;
- (SDNetworkBrowser)initWithKind:(id)a3 rootNode:(__SFNode *)a4;
- (SDNetworkBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (__SFNode)copyRootNode;
- (id)childrenForNode:(__SFNode *)a3;
- (id)sidebarChildren;
- (int)addNode:(__SFNode *)a3;
- (int)closeNode:(__SFNode *)a3;
- (int)openNode:(__SFNode *)rootNode forProtocol:(id)a4 flags:(unint64_t)a5;
- (int)removeNode:(__SFNode *)a3;
- (int64_t)mode;
- (void)dealloc;
- (void)invalidate;
- (void)nodeBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6;
- (void)setBoostMessage:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setIsEntitled:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setObjectKey:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SDNetworkBrowser

- (SDNetworkBrowser)initWithKind:(id)a3 rootNode:(__SFNode *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SDNetworkBrowser;
  v8 = [(SDNetworkBrowser *)&v15 init];
  v9 = v8;
  if (v8)
  {
    isEntitled = v8->_isEntitled;
    v8->_isEntitled = 0;

    v9->_mode = 0;
    objc_storeStrong((id *)&v9->_kind, a3);
    connection = v9->_connection;
    v9->_connection = 0;

    v9->_rootNode = (__SFNode *)CFRetain(a4);
    v9->_nodeBrowsers = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v12 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v12;
  }
  return v9;
}

- (void)dealloc
{
  [(SDNetworkBrowser *)self invalidate];
  rootNode = self->_rootNode;
  if (rootNode) {
    CFRelease(rootNode);
  }
  nodeBrowsers = self->_nodeBrowsers;
  if (nodeBrowsers) {
    CFRelease(nodeBrowsers);
  }
  v5.receiver = self;
  v5.super_class = (Class)SDNetworkBrowser;
  [(SDNetworkBrowser *)&v5 dealloc];
}

- (void)nodeBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  p_delegate = &self->_delegate;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkBrowser:self nodesChangedForParent:a4 protocol:v10 error:v6];
}

- (int)openNode:(__SFNode *)rootNode forProtocol:(id)a4 flags:(unint64_t)a5
{
  id v8 = a4;
  if (!rootNode) {
    rootNode = self->_rootNode;
  }
  uint64_t v9 = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  if (v9)
  {
    id v10 = (SDNodeBrowser *)v9;
  }
  else
  {
    if (!SFNodeIsContainer())
    {
      id v10 = 0;
      int v12 = -1;
      goto LABEL_8;
    }
    id v10 = [[SDNodeBrowser alloc] initWithNode:rootNode protocol:v8 flags:a5 kind:self->_kind];
    CFDictionarySetValue(self->_nodeBrowsers, rootNode, v10);
    v11 = [(SDNetworkBrowser *)self helperConnection];
    [(SDNodeBrowser *)v10 setHelperConnection:v11];

    [(SDNodeBrowser *)v10 setBundleID:self->_bundleID];
    [(SDNodeBrowser *)v10 setConnection:self->_connection];
    [(SDNodeBrowser *)v10 setDelegate:self];
    [(SDNodeBrowser *)v10 setMode:self->_mode];
    [(SDNodeBrowser *)v10 setOptions:self->_options];
    [(SDNodeBrowser *)v10 start];
  }
  int v12 = 0;
LABEL_8:

  return v12;
}

- (__SFNode)copyRootNode
{
  result = self->_rootNode;
  if (result) {
    return (__SFNode *)CFRetain(result);
  }
  return result;
}

- (id)childrenForNode:(__SFNode *)a3
{
  rootNode = a3;
  if (!a3) {
    rootNode = self->_rootNode;
  }
  v4 = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 nodes];
  }
  else
  {
    uint64_t v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)sidebarChildren
{
  v2 = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v3 = v2;
  if (v2)
  {
    v4 = [v2 sidebarNodes];
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
  CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setMode:a3];
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
  id v5 = a3;
  CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setOptions:v5];
}

- (NSDictionary)options
{
  return self->_options;
}

- (int)addNode:(__SFNode *)a3
{
  id v4 = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v5 = v4;
  if (v4) {
    int v6 = [v4 addNode:a3];
  }
  else {
    int v6 = -1;
  }

  return v6;
}

- (int)removeNode:(__SFNode *)a3
{
  id v4 = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v5 = v4;
  if (v4) {
    int v6 = [v4 removeNode:a3];
  }
  else {
    int v6 = -1;
  }

  return v6;
}

- (int)closeNode:(__SFNode *)a3
{
  rootNode = a3;
  if (!a3) {
    rootNode = self->_rootNode;
  }
  id v5 = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  int v6 = v5;
  if (v5)
  {
    [v5 stop];
    [v6 setDelegate:0];
    CFDictionaryRemoveValue(self->_nodeBrowsers, rootNode);
  }

  return 0;
}

- (void)invalidate
{
  v3 = [(__CFDictionary *)self->_nodeBrowsers allValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setDelegate:0];
        [v8 stop];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  CFDictionaryRemoveAllValues(self->_nodeBrowsers);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helperConnection);

  return (SDXPCHelperConnection *)WeakRetained;
}

- (void)setHelperConnection:(id)a3
{
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)objectKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setObjectKey:(id)a3
{
}

- (OS_xpc_object)boostMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBoostMessage:(id)a3
{
}

- (SDNetworkBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDNetworkBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSNumber)isEntitled
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIsEntitled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEntitled, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_objectKey, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end
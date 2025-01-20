@interface CSIndexAgent
+ (id)indexAgent;
+ (id)indexAgent:(BOOL)a3 serviceName:(id)a4;
+ (id)indexDelegateAgent:(id)a3;
- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3;
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)lostClientConnection:(id)a3 error:(id)a4;
- (MDIndexer)indexer;
- (NSMutableDictionary)indexConnections;
- (id)indexConnection:(id)a3;
- (void)setIndexConnections:(id)a3;
- (void)setIndexer:(id)a3;
@end

@implementation CSIndexAgent

- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [[CSIndexClientConnection alloc] initWithConfiguration:v4 indexer:self->_indexer];
  v6 = [(CSIndexClientConnection *)v5 configuration];
  v7 = [v6 bundleID];
  if (v7)
  {

LABEL_4:
    v10 = [v4 connection];
    v11 = +[CSIndexClientConnectionKey keyWithConnection:v10];

    [(NSMutableDictionary *)self->_indexConnections setObject:v5 forKeyedSubscript:v11];
    BOOL v12 = 1;
    goto LABEL_5;
  }
  v8 = [(CSIndexClientConnection *)v5 configuration];
  int v9 = [v8 internal];

  if (v9) {
    goto LABEL_4;
  }
  v14 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CSIndexAgent addClientConnectionIfAllowedForConfiguration:](v4);
  }

  BOOL v12 = 0;
LABEL_5:

  return v12;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  id v4 = a3;
  v5 = [[SDConnectionConfiguration alloc] initWithConnection:v4 isPrivate:0];

  LOBYTE(self) = [(CSIndexAgent *)self addClientConnectionIfAllowedForConfiguration:v5];
  return (char)self;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v8 = a4;
  int v9 = (_xpc_connection_s *)a5;
  v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CSIndexAgent handleCommand:info:connection:]((uint64_t)a3, v9, v10);
  }

  v11 = [(CSIndexAgent *)self indexConnection:v9];
  BOOL v12 = v11;
  if (v11)
  {
    v13 = [v11 service];
    char v14 = [v13 handleCommand:a3 info:v8];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)indexConnection:(id)a3
{
  id v4 = +[CSIndexClientConnectionKey keyWithConnection:a3];
  v5 = [(NSMutableDictionary *)self->_indexConnections objectForKeyedSubscript:v4];

  return v5;
}

+ (id)indexAgent:(BOOL)a3 serviceName:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__CSIndexAgent_indexAgent_serviceName___block_invoke;
  v10[3] = &unk_264506700;
  BOOL v12 = a3;
  id v11 = v5;
  uint64_t v6 = indexAgent_serviceName__onceToken;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&indexAgent_serviceName__onceToken, v10);
  }
  id v8 = (id)sIndexAgent;

  return v8;
}

void __39__CSIndexAgent_indexAgent_serviceName___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = [CSIndexAgent alloc];
  if (*(void *)(a1 + 32)) {
    id v4 = *(__CFString **)(a1 + 32);
  }
  else {
    id v4 = @"com.apple.spotlight.IndexAgent";
  }
  if (v2) {
    uint64_t v5 = [(CSXPCConnection *)v3 initWithServiceName:v4];
  }
  else {
    uint64_t v5 = [(CSXPCConnection *)v3 initMachServiceListenerWithName:v4];
  }
  uint64_t v6 = (void *)sIndexAgent;
  sIndexAgent = v5;

  id v7 = (id)objc_opt_new();
  [(id)sIndexAgent setIndexConnections:v7];
}

+ (id)indexAgent
{
  return (id)sIndexAgent;
}

+ (id)indexDelegateAgent:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__CSIndexAgent_indexDelegateAgent___block_invoke;
  block[3] = &unk_2645063F8;
  id v9 = v3;
  uint64_t v4 = indexDelegateAgent__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&indexDelegateAgent__onceToken, block);
  }
  id v6 = (id)sIndexDelegateAgent;

  return v6;
}

void __35__CSIndexAgent_indexDelegateAgent___block_invoke(uint64_t a1)
{
  int v2 = [CSIndexAgent alloc];
  if (*(void *)(a1 + 32)) {
    id v3 = *(__CFString **)(a1 + 32);
  }
  else {
    id v3 = @"com.apple.spotlight.IndexDelegateAgent";
  }
  uint64_t v4 = [(CSXPCConnection *)v2 initMachServiceListenerWithName:v3];
  id v5 = (void *)sIndexDelegateAgent;
  sIndexDelegateAgent = v4;

  [(id)sIndexDelegateAgent setNonLaunching:1];
  id v6 = (id)objc_opt_new();
  [(id)sIndexDelegateAgent setIndexConnections:v6];
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  id v5 = +[CSIndexClientConnectionKey keyWithConnection:](CSIndexClientConnectionKey, "keyWithConnection:", a3, a4);
  [(NSMutableDictionary *)self->_indexConnections setObject:0 forKeyedSubscript:v5];

  return 0;
}

- (MDIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
}

- (NSMutableDictionary)indexConnections
{
  return self->_indexConnections;
}

- (void)setIndexConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexConnections, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
}

- (void)addClientConnectionIfAllowedForConfiguration:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 connection];
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Could not resolve bundle id for %@", v4, v5, v6, v7, 2u);
}

- (void)handleCommand:(uint64_t)a1 info:(xpc_connection_t)connection connection:(NSObject *)a3 .cold.1(uint64_t a1, xpc_connection_t connection, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  pid_t pid = xpc_connection_get_pid(connection);
  _os_log_debug_impl(&dword_21F1CE000, a3, OS_LOG_TYPE_DEBUG, "request %s from pid: %d", (uint8_t *)&v4, 0x12u);
}

@end
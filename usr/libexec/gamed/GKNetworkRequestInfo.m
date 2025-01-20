@interface GKNetworkRequestInfo
- (GKNetworkRequestInfo)init;
- (NSMutableDictionary)currentTasks;
- (NSMutableDictionary)pendingRequests;
- (id)description;
- (void)setCurrentTasks:(id)a3;
- (void)setPendingRequests:(id)a3;
@end

@implementation GKNetworkRequestInfo

- (GKNetworkRequestInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKNetworkRequestInfo;
  v2 = [(GKNetworkRequestInfo *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentTasks = v2->_currentTasks;
    v2->_currentTasks = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;
  }
  return v2;
}

- (id)description
{
  v3 = [(GKNetworkRequestInfo *)self currentTasks];
  v4 = [(GKNetworkRequestInfo *)self pendingRequests];
  v5 = +[NSString stringWithFormat:@"The current tasks are: %@ the pending tasks are:%@", v3, v4];

  return v5;
}

- (NSMutableDictionary)currentTasks
{
  return self->_currentTasks;
}

- (void)setCurrentTasks:(id)a3
{
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_currentTasks, 0);
}

@end
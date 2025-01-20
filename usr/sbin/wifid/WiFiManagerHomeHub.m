@interface WiFiManagerHomeHub
- (OS_dispatch_queue)queue;
- (WiFiManagerHomeHub)initWithManager:(__WiFiManager *)a3 queue:(id)a4 callback:(void *)a5;
- (__WiFiManager)manager;
- (unint64_t)numberOfActiveEndpoints;
- (void)decrementActiveEndpointCount;
- (void)incrementActiveEndpointCount;
- (void)setManager:(__WiFiManager *)a3;
- (void)setQueue:(id)a3;
- (void)setStateUpdatedCallback:(void *)a3;
- (void)stateUpdatedCallback;
@end

@implementation WiFiManagerHomeHub

- (WiFiManagerHomeHub)initWithManager:(__WiFiManager *)a3 queue:(id)a4 callback:(void *)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WiFiManagerHomeHub;
  v10 = [(WiFiManagerHomeHub *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_manager = a3;
    objc_storeStrong((id *)&v10->_queue, a4);
    v11->_stateUpdatedCallback = a5;
    v11->_numberOfActiveEndpoints = 0;
  }

  return v11;
}

- (void)incrementActiveEndpointCount
{
  ++self->_numberOfActiveEndpoints;
  if ((id)[(WiFiManagerHomeHub *)self numberOfActiveEndpoints] == (id)1)
  {
    v4 = [(WiFiManagerHomeHub *)self stateUpdatedCallback];
    v3 = [(WiFiManagerHomeHub *)self manager];
    v4(v3);
  }
}

- (void)decrementActiveEndpointCount
{
  --self->_numberOfActiveEndpoints;
  if (![(WiFiManagerHomeHub *)self numberOfActiveEndpoints])
  {
    v4 = [(WiFiManagerHomeHub *)self stateUpdatedCallback];
    v3 = [(WiFiManagerHomeHub *)self manager];
    v4(v3);
  }
}

- (unint64_t)numberOfActiveEndpoints
{
  return self->_numberOfActiveEndpoints;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (void)stateUpdatedCallback
{
  return self->_stateUpdatedCallback;
}

- (void)setStateUpdatedCallback:(void *)a3
{
  self->_stateUpdatedCallback = a3;
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
}

@end
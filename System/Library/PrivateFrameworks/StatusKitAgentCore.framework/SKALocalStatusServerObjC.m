@interface SKALocalStatusServerObjC
- (SKALocalStatusServer)server;
- (SKALocalStatusServerObjC)initWithIDSDeviceProvider:(id)a3;
- (void)setServer:(id)a3;
- (void)shutdown;
@end

@implementation SKALocalStatusServerObjC

- (SKALocalStatusServerObjC)initWithIDSDeviceProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKALocalStatusServerObjC;
  v5 = [(SKALocalStatusServerObjC *)&v9 init];
  if (v5)
  {
    v6 = [[SKALocalStatusServer alloc] initWithIdsDeviceProvider:v4];
    server = v5->_server;
    v5->_server = v6;
  }
  return v5;
}

- (void)shutdown
{
  [(SKALocalStatusServer *)self->_server objcShutdown];
  server = self->_server;
  self->_server = 0;
}

- (SKALocalStatusServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
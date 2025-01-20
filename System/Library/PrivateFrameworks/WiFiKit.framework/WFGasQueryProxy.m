@interface WFGasQueryProxy
- (__WiFiDeviceClient)device;
- (id)handler;
- (void)_processGasResults:(id)a3 error:(int)a4;
- (void)gasQueryForRecords:(id)a3 request:(id)a4 handler:(id)a5;
- (void)setDevice:(__WiFiDeviceClient *)a3;
- (void)setHandler:(id)a3;
@end

@implementation WFGasQueryProxy

- (void)gasQueryForRecords:(id)a3 request:(id)a4 handler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v11 count];
  if (v8 && v10)
  {
    [(WFGasQueryProxy *)self setHandler:v9];

    WiFiDeviceClientGasStartAsync();
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)_processGasResults:(id)a3 error:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(WFGasQueryProxy *)self handler];
  v7[2](v7, v6, v4);
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  self->_device = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
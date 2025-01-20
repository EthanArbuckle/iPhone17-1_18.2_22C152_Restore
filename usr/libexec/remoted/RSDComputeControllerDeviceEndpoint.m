@interface RSDComputeControllerDeviceEndpoint
- (OS_os_transaction)endpoint_tx;
- (RSDComputeControllerDeviceEndpoint)initWithAddress:(const char *)a3;
- (char)address;
- (void)dealloc;
- (void)setAddress:(char *)a3;
- (void)setEndpoint_tx:(id)a3;
@end

@implementation RSDComputeControllerDeviceEndpoint

- (RSDComputeControllerDeviceEndpoint)initWithAddress:(const char *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RSDComputeControllerDeviceEndpoint;
  v4 = [(RSDComputeControllerDeviceEndpoint *)&v10 init];
  if (v4)
  {
    if (_dispatch_is_multithreaded())
    {
      v5 = strdup(a3);
      if (!v5)
      {
        do
        {
          __os_temporary_resource_shortage();
          v6 = strdup(a3);
        }
        while (!v6);
        v5 = v6;
      }
    }
    else
    {
      v5 = strdup(a3);
      if (!v5) {
        sub_10003872C(a3, &v11, v12);
      }
    }
    [(RSDComputeControllerDeviceEndpoint *)v4 setAddress:v5];
    v7 = (void *)os_transaction_create();
    [(RSDComputeControllerDeviceEndpoint *)v4 setEndpoint_tx:v7];

    v8 = v4;
  }

  return v4;
}

- (void)dealloc
{
  free([(RSDComputeControllerDeviceEndpoint *)self address]);
  [(RSDComputeControllerDeviceEndpoint *)self setAddress:0];
  v3.receiver = self;
  v3.super_class = (Class)RSDComputeControllerDeviceEndpoint;
  [(RSDComputeControllerDeviceEndpoint *)&v3 dealloc];
}

- (char)address
{
  return self->_address;
}

- (void)setAddress:(char *)a3
{
  self->_address = a3;
}

- (OS_os_transaction)endpoint_tx
{
  return self->_endpoint_tx;
}

- (void)setEndpoint_tx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
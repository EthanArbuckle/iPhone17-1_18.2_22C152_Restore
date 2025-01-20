@interface SSXPCData
- (OS_xpc_object)xpcData;
- (SSXPCData)initWithXPCData:(id)a3;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation SSXPCData

- (SSXPCData)initWithXPCData:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SSXPCData;
    v4 = [(SSXPCData *)&v6 init];
    if (v4) {
      v4->_xpcData = (OS_xpc_object *)xpc_retain(a3);
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"xpcData must be non-nil"];
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  xpcData = self->_xpcData;
  if (xpcData) {
    xpc_release(xpcData);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSXPCData;
  [(SSXPCData *)&v4 dealloc];
}

- (const)bytes
{
  return xpc_data_get_bytes_ptr(self->_xpcData);
}

- (unint64_t)length
{
  return xpc_data_get_length(self->_xpcData);
}

- (OS_xpc_object)xpcData
{
  return self->_xpcData;
}

@end
@interface CLATVAirplayDevice
- (CLATVAirplayDevice)initWithTimestamp:(uint64_t)a3 RSSI:(int)a4 uuid:(void *)a5 ipv4:(unsigned int)a6 channel:(int)a7;
- (NSUUID)uuid;
- (double)timestamp;
- (id).cxx_construct;
- (id)cppObject;
- (int)RSSI;
- (int)channel;
- (unsigned)ipv4;
- (void)dealloc;
@end

@implementation CLATVAirplayDevice

- (CLATVAirplayDevice)initWithTimestamp:(uint64_t)a3 RSSI:(int)a4 uuid:(void *)a5 ipv4:(unsigned int)a6 channel:(int)a7
{
  v15.receiver = a1;
  v15.super_class = (Class)CLATVAirplayDevice;
  v12 = [(CLATVAirplayDevice *)&v15 init];
  v13 = v12;
  if (v12)
  {
    *(double *)&v12->_anon_18[4] = a2;
    v12->_RSSI = a4;
    v12->_uuid = (NSUUID *)a5;
    v13->_ipv4 = a6;
    v13->_channel = a7;
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLATVAirplayDevice;
  [(CLATVAirplayDevice *)&v3 dealloc];
}

- (double)timestamp
{
  return *(double *)(a1 + 24);
}

- (int)RSSI
{
  return self->_RSSI;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)ipv4
{
  return self->_ipv4;
}

- (int)channel
{
  return self->_channel;
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

- (id)cppObject
{
  v4 = (char *)[(((NSString *)[((NSUUID *)[a1 uuid]) UUIDString]) UTF8String]);
  size_t v5 = strlen(v4);
  uint64_t v6 = sub_1002383B4((uint64_t)&v14, (unsigned __int8 *)v4, (unsigned __int8 *)&v4[v5]);
  uint64_t v8 = v7;
  [a1 timestamp];
  uint64_t v10 = v9;
  unsigned int v11 = [a1 RSSI];
  unsigned int v12 = [a1 ipv4];
  id result = [a1 channel];
  *(void *)a2 = v10;
  *(_DWORD *)(a2 + 8) = v11;
  *(void *)(a2 + 12) = v6;
  *(void *)(a2 + 20) = v8;
  *(_DWORD *)(a2 + 28) = v12;
  *(_DWORD *)(a2 + 32) = result;
  return result;
}

@end
@interface CoreTelephonyMockObject
- (CoreTelephonyMockObject)initWithCellularEid:(id)a3 cellularImei:(id)a4;
- (NSString)cellularEid;
- (NSString)cellularImei;
- (id)retrieveDeviceIdentifier:(int64_t)a3;
- (void)setCellularEid:(id)a3;
- (void)setCellularImei:(id)a3;
@end

@implementation CoreTelephonyMockObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularImei, 0);

  objc_storeStrong((id *)&self->_cellularEid, 0);
}

- (void)setCellularImei:(id)a3
{
}

- (NSString)cellularImei
{
  return self->_cellularImei;
}

- (void)setCellularEid:(id)a3
{
}

- (NSString)cellularEid
{
  return self->_cellularEid;
}

- (id)retrieveDeviceIdentifier:(int64_t)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 8;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (CoreTelephonyMockObject)initWithCellularEid:(id)a3 cellularImei:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CoreTelephonyMockObject;
  v9 = [(CoreTelephonyMockObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cellularEid, a3);
    objc_storeStrong((id *)&v10->_cellularImei, a4);
  }

  return v10;
}

@end
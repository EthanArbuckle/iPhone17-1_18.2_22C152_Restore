@interface MBCKEnableCameraRollGraceRequest
+ (id)requestWithDevice:(id)a3 domainHMAC:(id)a4;
+ (id)requestWithDevice:(id)a3 manifest:(id)a4;
- (MBCKDevice)device;
- (MBCKEnableCameraRollGraceRequest)initWithDevice:(id)a3 domainHMAC:(id)a4;
- (MBCKEnableCameraRollGraceRequest)initWithDevice:(id)a3 manifest:(id)a4;
- (NSString)domainHMAC;
- (id)_getRecordIDString;
- (id)recordRepresentation;
- (id)recordType;
- (unint64_t)recordZone;
- (void)setDevice:(id)a3;
- (void)setDomainHMAC:(id)a3;
@end

@implementation MBCKEnableCameraRollGraceRequest

+ (id)requestWithDevice:(id)a3 manifest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBCKEnableCameraRollGraceRequest alloc] initWithDevice:v6 manifest:v5];

  return v7;
}

+ (id)requestWithDevice:(id)a3 domainHMAC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBCKEnableCameraRollGraceRequest alloc] initWithDevice:v6 domainHMAC:v5];

  return v7;
}

- (MBCKEnableCameraRollGraceRequest)initWithDevice:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  v7 = [a4 domainHmac];
  v8 = [(MBCKEnableCameraRollGraceRequest *)self initWithDevice:v6 domainHMAC:v7];

  return v8;
}

- (MBCKEnableCameraRollGraceRequest)initWithDevice:(id)a3 domainHMAC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBCKEnableCameraRollGraceRequest;
  v8 = [(MBCKModel *)&v13 initWithRecord:0 cache:0];
  v9 = v8;
  if (v8)
  {
    [(MBCKEnableCameraRollGraceRequest *)v8 setDevice:v6];
    [(MBCKEnableCameraRollGraceRequest *)v9 setDomainHMAC:v7];
    uint64_t v10 = MBRandomUUID();
    uuid = v9->_uuid;
    v9->_uuid = (NSString *)v10;
  }
  return v9;
}

- (id)_getRecordIDString
{
  return self->_uuid;
}

- (id)recordType
{
  return @"EnableCameraRollGraceRequest";
}

- (unint64_t)recordZone
{
  return 2;
}

- (id)recordRepresentation
{
  v12.receiver = self;
  v12.super_class = (Class)MBCKEnableCameraRollGraceRequest;
  v3 = [(MBCKModel *)&v12 recordRepresentation];
  v4 = [v3 objectForKeyedSubscript:@"device"];

  if (!v4)
  {
    id v5 = objc_alloc((Class)CKReference);
    id v6 = [(MBCKEnableCameraRollGraceRequest *)self device];
    id v7 = [v6 recordID];
    id v8 = [v5 initWithRecordID:v7 action:0];
    [v3 setObject:v8 forKeyedSubscript:@"device"];
  }
  v9 = [v3 objectForKeyedSubscript:@"domainHMAC"];

  if (!v9)
  {
    uint64_t v10 = [(MBCKEnableCameraRollGraceRequest *)self domainHMAC];
    [v3 setObject:v10 forKeyedSubscript:@"domainHMAC"];
  }
  return v3;
}

- (MBCKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)domainHMAC
{
  return self->_domainHMAC;
}

- (void)setDomainHMAC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainHMAC, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
@interface UARPiCloudZone
- (CKRecordZoneID)zoneID;
- (CKServerChangeToken)changeToken;
- (NSString)containerID;
- (UARPiCloudZone)initWithZoneID:(id)a3 containerID:(id)a4;
- (void)setChangeToken:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation UARPiCloudZone

- (UARPiCloudZone)initWithZoneID:(id)a3 containerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UARPiCloudZone;
  v8 = [(UARPiCloudZone *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v9;

    uint64_t v11 = [v7 copy];
    containerID = v8->_containerID;
    v8->_containerID = (NSString *)v11;
  }
  return v8;
}

- (void)setChangeToken:(id)a3
{
  v4 = (CKServerChangeToken *)a3;
  if (v4)
  {
    id v13 = 0;
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
    id v6 = v13;
    id v7 = NSString;
    containerID = self->_containerID;
    uint64_t v9 = [(CKRecordZoneID *)self->_zoneID zoneName];
    v10 = [v7 stringWithFormat:@"%@_%@", containerID, v9];

    saveEntryForKey(v5, v10);
  }
  else
  {
    v5 = 0;
    id v6 = 0;
  }
  changeToken = self->_changeToken;
  self->_changeToken = v4;
  v12 = v4;
}

- (CKServerChangeToken)changeToken
{
  v3 = NSString;
  containerID = self->_containerID;
  v5 = [(CKRecordZoneID *)self->_zoneID zoneName];
  id v6 = [v3 stringWithFormat:@"%@_%@", containerID, v5];

  if (self->_changeToken)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = getEntryForKey(v6);
    if (v7)
    {
      id v13 = 0;
      uint64_t v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v13];
      id v8 = v13;
      changeToken = self->_changeToken;
      self->_changeToken = v9;

      goto LABEL_6;
    }
  }
  id v8 = 0;
LABEL_6:
  uint64_t v11 = self->_changeToken;

  return v11;
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
}

@end
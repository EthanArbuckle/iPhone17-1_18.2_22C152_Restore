@interface RPLReplicatorDevice
- (NSDate)initialDiscoveryDate;
- (NSString)name;
- (NSUUID)deviceID;
- (NSUUID)relationshipID;
- (RPLReplicatorDevice)initWithDeviceID:(id)a3 relationshipID:(id)a4 name:(id)a5 deviceType:(unint64_t)a6 initialDiscoveryDate:(id)a7;
- (id)description;
- (unint64_t)deviceType;
@end

@implementation RPLReplicatorDevice

- (RPLReplicatorDevice)initWithDeviceID:(id)a3 relationshipID:(id)a4 name:(id)a5 deviceType:(unint64_t)a6 initialDiscoveryDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RPLReplicatorDevice;
  v16 = [(RPLReplicatorDevice *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    deviceID = v16->_deviceID;
    v16->_deviceID = (NSUUID *)v17;

    uint64_t v19 = [v13 copy];
    relationshipID = v16->_relationshipID;
    v16->_relationshipID = (NSUUID *)v19;

    uint64_t v21 = [v14 copy];
    name = v16->_name;
    v16->_name = (NSString *)v21;

    v16->_deviceType = a6;
    objc_storeStrong((id *)&v16->_initialDiscoveryDate, a7);
  }

  return v16;
}

- (id)description
{
  unint64_t deviceType = self->_deviceType;
  if (deviceType > 5) {
    v3 = 0;
  }
  else {
    v3 = off_265493A08[deviceType];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"id: %@; relationshipID: %@; name: %@; deviceType: %@; initialDiscoveryDate: %@",
               self->_deviceID,
               self->_relationshipID,
               self->_name,
               v3,
               self->_initialDiscoveryDate);
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSUUID)relationshipID
{
  return self->_relationshipID;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)initialDiscoveryDate
{
  return self->_initialDiscoveryDate;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_relationshipID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
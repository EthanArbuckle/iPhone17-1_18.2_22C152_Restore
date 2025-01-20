@interface ISOPeripheral
- (BOOL)createGATTServer:(id)a3 serviceUUID:(id)a4 readerIdentCharacteristic:(id)a5;
- (BOOL)getL2CAPEnable;
- (id)getIncomingDataCharacteristicUUID;
- (id)getL2CAPCharacteristicUUID;
- (id)getStateCharacteristicUUID;
@end

@implementation ISOPeripheral

- (BOOL)createGATTServer:(id)a3 serviceUUID:(id)a4 readerIdentCharacteristic:(id)a5
{
  id v9 = a3;
  if (!self->_iso18Service)
  {
    uint64_t v11 = +[CBUUID UUIDWithData:a4];
    v14 = (void *)v11;
    if (v11)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISOPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 60, self, @"LE: Creating GATT, UUID=%@", v12, v13, v11);
      v15 = (CBMutableService *)[objc_alloc((Class)CBMutableService) initWithType:v14 primary:1];
      iso18Service = self->_iso18Service;
      self->_iso18Service = v15;

      if (self->_iso18Service)
      {
        uint64_t v17 = +[NSMutableArray array];
        if (v17)
        {
          v18 = (void *)v17;
          id v19 = objc_alloc((Class)CBMutableCharacteristic);
          v20 = +[CBUUID UUIDWithString:@"00000001-A123-48CE-896B-4C76973373E6"];
          id v21 = [v19 initWithType:v20 properties:20 value:0 permissions:2];

          [v18 addObject:v21];
          id v22 = objc_alloc((Class)CBMutableCharacteristic);
          v23 = +[CBUUID UUIDWithString:@"00000002-A123-48CE-896B-4C76973373E6"];
          id v24 = [v22 initWithType:v23 properties:4 value:0 permissions:2];

          [v18 addObject:v24];
          id v25 = objc_alloc((Class)CBMutableCharacteristic);
          v26 = +[CBUUID UUIDWithString:@"00000003-A123-48CE-896B-4C76973373E6"];
          id v27 = [v25 initWithType:v26 properties:16 value:0 permissions:2];

          [v18 addObject:v27];
          if (self->_l2CapEnabled)
          {
            v41[0] = [(ISO18013_3_Peripheral *)self l2CapPSM];
            v41[1] = [(ISO18013_3_Peripheral *)self l2CapPSM] >> 8;
            id v28 = [objc_alloc((Class)NSData) initWithBytes:v41 length:2];
            id v29 = objc_alloc((Class)CBMutableCharacteristic);
            v30 = +[CBUUID UUIDWithString:@"0000000A-A123-48CE-896B-4C76973373E6"];
            id v31 = [v29 initWithType:v30 properties:2 value:v28 permissions:1];

            if (v31) {
              [v18 addObject:v31];
            }
            else {
              sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 103, self, @"LE: Failed to create L2P characteristic", v32, v33, v39);
            }
          }
          else
          {
            id v31 = v27;
          }
          [(CBMutableService *)self->_iso18Service setCharacteristics:v18];
          v40.receiver = self;
          v40.super_class = (Class)ISOPeripheral;
          [(ISO18013_3_Peripheral *)&v40 setCharacteristics:v18];
          [v9 addService:self->_iso18Service];
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISOPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 113, self, @"LE: done creating GATT", v36, v37, v39);

          BOOL v10 = 1;
          goto LABEL_17;
        }
        v34 = @"LE: Failed to create characteristics";
        uint64_t v35 = 70;
      }
      else
      {
        v34 = @"LE: Failed to create service";
        uint64_t v35 = 64;
      }
    }
    else
    {
      v34 = @"LE: Invalid service UUID";
      uint64_t v35 = 57;
    }
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", v35, self, v34, v12, v13, v39);
    BOOL v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 51, self, @"LE: GATT already exists", v7, v8, v39);
  BOOL v10 = 1;
LABEL_18:

  return v10;
}

- (id)getIncomingDataCharacteristicUUID
{
  return @"00000002-A123-48CE-896B-4C76973373E6";
}

- (id)getStateCharacteristicUUID
{
  return @"00000001-A123-48CE-896B-4C76973373E6";
}

- (id)getL2CAPCharacteristicUUID
{
  return @"0000000A-A123-48CE-896B-4C76973373E6";
}

- (BOOL)getL2CAPEnable
{
  return self->_l2CapEnabled;
}

- (void).cxx_destruct
{
}

@end
@interface ReaderPeripheral
- (BOOL)createGATTServer:(id)a3 serviceUUID:(id)a4 readerIdentCharacteristic:(id)a5;
- (BOOL)getL2CAPEnable;
- (id)getIncomingDataCharacteristicUUID;
- (id)getL2CAPCharacteristicUUID;
- (id)getStateCharacteristicUUID;
- (void)invalidateAndUpdateStateSignal:(BOOL)a3;
- (void)invalidateAndUpdateStateSignal:(BOOL)a3 reason:(unint64_t)a4;
@end

@implementation ReaderPeripheral

- (BOOL)createGATTServer:(id)a3 serviceUUID:(id)a4 readerIdentCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_iso18Service)
  {
    uint64_t v11 = +[CBUUID UUIDWithData:a4];
    v14 = (void *)v11;
    if (v11)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 73, self, @"LE: Creating GATT, UUID=%@", v12, v13, v11);
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
          v20 = +[CBUUID UUIDWithString:@"00000005-A123-48CE-896B-4C76973373E6"];
          id v21 = [v19 initWithType:v20 properties:20 value:0 permissions:2];

          if (v21) {
            [v18 addObject:v21];
          }
          else {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 94, self, @"LE: Failed to create mdReaderServiceState", v22, v23, v50);
          }
          id v26 = objc_alloc((Class)CBMutableCharacteristic);
          v27 = +[CBUUID UUIDWithString:@"00000006-A123-48CE-896B-4C76973373E6"];
          id v28 = [v26 initWithType:v27 properties:4 value:0 permissions:2];

          if (v28) {
            [v18 addObject:v28];
          }
          else {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 104, self, @"LE: Failed to create mdReaderServiceClient2Server", v29, v30, v50);
          }
          id v31 = objc_alloc((Class)CBMutableCharacteristic);
          v32 = +[CBUUID UUIDWithString:@"00000007-A123-48CE-896B-4C76973373E6"];
          id v33 = [v31 initWithType:v32 properties:16 value:0 permissions:2];

          if (v33) {
            [v18 addObject:v33];
          }
          else {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 114, self, @"LE: Failed to create mdReaderServiceServer2Client", v34, v35, v50);
          }
          id v36 = objc_alloc((Class)CBMutableCharacteristic);
          v37 = +[CBUUID UUIDWithString:@"00000008-A123-48CE-896B-4C76973373E6"];
          id v38 = [v36 initWithType:v37 properties:2 value:v9 permissions:1];

          if (v38) {
            [v18 addObject:v38];
          }
          else {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 124, self, @"LE: Failed to create mdReaderServiceIdent", v39, v40, v50);
          }
          if (self->_l2CapEnabled)
          {
            v52[0] = [(ISO18013_3_Peripheral *)self l2CapPSM];
            v52[1] = [(ISO18013_3_Peripheral *)self l2CapPSM] >> 8;
            id v41 = [objc_alloc((Class)NSData) initWithBytes:v52 length:2];
            id v42 = objc_alloc((Class)CBMutableCharacteristic);
            v43 = +[CBUUID UUIDWithString:@"0000000B-A123-48CE-896B-4C76973373E6"];
            id v44 = [v42 initWithType:v43 properties:2 value:v41 permissions:1];

            if (v44) {
              [v18 addObject:v44];
            }
            else {
              sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 137, self, @"LE: Failed to create L2P characteristic", v45, v46, v50);
            }
          }
          else
          {
            id v44 = v38;
          }
          [(CBMutableService *)self->_iso18Service setCharacteristics:v18];
          v51.receiver = self;
          v51.super_class = (Class)ReaderPeripheral;
          [(ISO18013_3_Peripheral *)&v51 setCharacteristics:v18];
          [v8 addService:self->_iso18Service];
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", 147, self, @"LE: done creating GATT", v47, v48, v50);

          BOOL v10 = 1;
          goto LABEL_29;
        }
LABEL_11:
        BOOL v10 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v24 = @"LE: Failed to create service";
      uint64_t v25 = 77;
    }
    else
    {
      v24 = @"LE: Invalid service UUID";
      uint64_t v25 = 70;
    }
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ReaderPeripheral createGATTServer:serviceUUID:readerIdentCharacteristic:]", v25, self, v24, v12, v13, v50);
    goto LABEL_11;
  }
  BOOL v10 = 1;
LABEL_30:

  return v10;
}

- (id)getIncomingDataCharacteristicUUID
{
  return @"00000006-A123-48CE-896B-4C76973373E6";
}

- (id)getStateCharacteristicUUID
{
  return @"00000005-A123-48CE-896B-4C76973373E6";
}

- (id)getL2CAPCharacteristicUUID
{
  return @"0000000B-A123-48CE-896B-4C76973373E6";
}

- (BOOL)getL2CAPEnable
{
  return self->_l2CapEnabled;
}

- (void)invalidateAndUpdateStateSignal:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ReaderPeripheral;
  [(ISO18013_3_Peripheral *)&v5 invalidateAndUpdateStateSignal:a3];
  iso18Service = self->_iso18Service;
  self->_iso18Service = 0;
}

- (void)invalidateAndUpdateStateSignal:(BOOL)a3 reason:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ReaderPeripheral;
  [(ISO18013_3_Peripheral *)&v6 invalidateAndUpdateStateSignal:a3 reason:a4];
  iso18Service = self->_iso18Service;
  self->_iso18Service = 0;
}

- (void).cxx_destruct
{
}

@end
@interface UARPiCloudAccessory
- (BOOL)isEqual:(id)a3;
- (BOOL)signatureValidationNeeded;
- (CHIPAccessoryFirmwareRecord)chipFirmwareRecord;
- (NSMutableArray)availableRecords;
- (NSString)firmwareVersion;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSUUID)uuid;
- (UARPiCloudAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5;
- (UARPiCloudAccessory)initWithUUID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 firmwareVersion:(id)a6;
- (UARPiCloudAccessoryRecord)record;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAvailableRecords:(id)a3;
- (void)setChipFirmwareRecord:(id)a3;
- (void)setRecord:(id)a3;
- (void)setSignatureValidationNeeded:(BOOL)a3;
@end

@implementation UARPiCloudAccessory

- (UARPiCloudAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UARPiCloudAccessory;
  v11 = [(UARPiCloudAccessory *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F08C38] UUID];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v8 copy];
    productGroup = v11->_productGroup;
    v11->_productGroup = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    productNumber = v11->_productNumber;
    v11->_productNumber = (NSString *)v16;

    uint64_t v18 = [v10 copy];
    firmwareVersion = v11->_firmwareVersion;
    v11->_firmwareVersion = (NSString *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    availableRecords = v11->_availableRecords;
    v11->_availableRecords = v20;

    v11->_signatureValidationNeeded = 1;
  }

  return v11;
}

- (UARPiCloudAccessory)initWithUUID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)UARPiCloudAccessory;
  uint64_t v14 = [(UARPiCloudAccessory *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    productGroup = v14->_productGroup;
    v14->_productGroup = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    productNumber = v14->_productNumber;
    v14->_productNumber = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    firmwareVersion = v14->_firmwareVersion;
    v14->_firmwareVersion = (NSString *)v21;

    objc_super v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    availableRecords = v14->_availableRecords;
    v14->_availableRecords = v23;

    v14->_signatureValidationNeeded = 1;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[UARPiCloudAccessory alloc] initWithUUID:self->_uuid productGroup:self->_productGroup productNumber:self->_productNumber firmwareVersion:self->_firmwareVersion];
  [(UARPiCloudAccessory *)v4 setRecord:self->_record];
  [(UARPiCloudAccessory *)v4 setChipFirmwareRecord:self->_chipFirmwareRecord];
  [(UARPiCloudAccessory *)v4 setAvailableRecords:self->_availableRecords];
  [(UARPiCloudAccessory *)v4 setSignatureValidationNeeded:self->_signatureValidationNeeded];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPiCloudAccessory *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v7 = 1;
    }
    else
    {
      uuid = self->_uuid;
      v6 = [(UARPiCloudAccessory *)v4 uuid];
      char v7 = [(NSUUID *)uuid isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setAvailableRecords:(id)a3
{
  self->_availableRecords = (NSMutableArray *)[a3 mutableCopy];
  MEMORY[0x270F9A758]();
}

- (NSMutableArray)availableRecords
{
  return self->_availableRecords;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)signatureValidationNeeded
{
  return self->_signatureValidationNeeded;
}

- (void)setSignatureValidationNeeded:(BOOL)a3
{
  self->_signatureValidationNeeded = a3;
}

- (UARPiCloudAccessoryRecord)record
{
  return (UARPiCloudAccessoryRecord *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecord:(id)a3
{
}

- (CHIPAccessoryFirmwareRecord)chipFirmwareRecord
{
  return (CHIPAccessoryFirmwareRecord *)objc_getProperty(self, a2, 64, 1);
}

- (void)setChipFirmwareRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipFirmwareRecord, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_availableRecords, 0);
}

@end
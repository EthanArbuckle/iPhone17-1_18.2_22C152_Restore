@interface STSCHAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)auxiliaryRecords;
- (STSCHAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (STSNDEFRecord)carrierRecord;
- (id)_createCarrierConfigurationRecord;
- (id)createAlternativeCarrierRecord;
- (id)createNdefRecordBundle;
- (id)description;
- (unint64_t)powerState;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAuxiliaryRecords:(id)a3;
- (void)setCarrierRecord:(id)a3;
- (void)setPowerState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation STSCHAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_powerState forKey:@"powerState"];
  [v5 encodeObject:self->_carrierRecord forKey:@"carrierRecord"];
  [v5 encodeObject:self->_auxiliaryRecords forKey:@"auxiliaryRecords"];
}

- (STSCHAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSCHAlternativeCarrier;
  id v5 = [(STSCHAlternativeCarrier *)&v13 init];
  if (v5)
  {
    v5->_unint64_t type = (unint64_t)[v4 decodeIntegerForKey:@"type"];
    v5->_powerState = (unint64_t)[v4 decodeIntegerForKey:@"powerState"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierRecord"];
    carrierRecord = v5->_carrierRecord;
    v5->_carrierRecord = (STSNDEFRecord *)v6;

    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"auxiliaryRecords"];
    auxiliaryRecords = v5->_auxiliaryRecords;
    v5->_auxiliaryRecords = (NSArray *)v10;
  }
  return v5;
}

- (STSCHAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STSCHAlternativeCarrier;
  id v5 = [(STSCHAlternativeCarrier *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 configurationRecord];
    unsigned int v7 = [v6 isWiFiAwareConfigurationRecord];

    if (v7)
    {
      uint64_t v8 = 1;
    }
    else
    {
      v9 = [v4 configurationRecord];
      unsigned int v10 = [v9 isBluetoothLEConfigurationRecord];

      if (v10)
      {
        uint64_t v8 = 2;
      }
      else
      {
        v11 = [v4 configurationRecord];
        unsigned int v12 = [v11 isNfcConfigurationRecord];

        if (!v12)
        {
          v5->_unint64_t type = 0;
          goto LABEL_9;
        }
        uint64_t v8 = 3;
      }
    }
    v5->_unint64_t type = v8;
LABEL_9:
    objc_super v13 = [v4 alternativeRecord];
    v5->_powerState = (unint64_t)[v13 getCarrierPowerStateFromAlternativeCarrierRecord];

    uint64_t v14 = [v4 configurationRecord];
    carrierRecord = v5->_carrierRecord;
    v5->_carrierRecord = (STSNDEFRecord *)v14;

    uint64_t v16 = [v4 auxiliaryRecords];
    auxiliaryRecords = v5->_auxiliaryRecords;
    v5->_auxiliaryRecords = (NSArray *)v16;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSCHAlternativeCarrier *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v8 = 0;
    if ([(STSNDEFRecord *)self->_carrierRecord isEqual:v6[3]])
    {
      id v7 = [(NSArray *)self->_auxiliaryRecords count];
      if (v7 == [v6[4] count]
        && (![(NSArray *)self->_auxiliaryRecords count]
         || [(NSArray *)self->_auxiliaryRecords isEqualToArray:v6[4]]))
      {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"type=%lu,powerState=%lu,carrier=%@,aux=%@", self->_type, self->_powerState, self->_carrierRecord, self->_auxiliaryRecords];
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSCHAlternativeCarrier connectionHandoverAlternativeCarrierWithBundle:]", 87, @"Must override by subclass", v3, v4, v5, vars0);
  return 0;
}

- (id)createAlternativeCarrierRecord
{
  uint64_t v3 = [(STSNDEFRecord *)self->_carrierRecord identifier];
  uint64_t v6 = v3;
  if (!v3)
  {
    id v7 = @"Missing carrier data reference";
    uint64_t v8 = 99;
    goto LABEL_5;
  }
  if ((unint64_t)[v3 length] >= 0x100)
  {
    id v7 = @"Invalid carrier reference length";
    uint64_t v8 = 102;
LABEL_5:
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHAlternativeCarrier createAlternativeCarrierRecord]", v8, self, v7, v4, v5, v22);
    v9 = 0;
    goto LABEL_14;
  }
  v23 = +[NSData dataWithBytes:"ac" length:2];
  unsigned __int8 v29 = self->_powerState & 3;
  unsigned int v10 = +[NSMutableData dataWithBytes:&v29 length:1];
  unsigned __int8 v29 = [v6 length];
  [v10 appendBytes:&v29 length:1];
  [v10 appendData:v6];
  char v28 = 0;
  v11 = +[NSMutableData data];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unsigned int v12 = self->_auxiliaryRecords;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    int v15 = 0;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_super v19 = [v18 identifier];
        unsigned __int8 v29 = [v19 length];

        [v11 appendBytes:&v29 length:1];
        v20 = [v18 identifier];
        [v11 appendData:v20];

        char v28 = ++v15;
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v14);
  }

  [v10 appendBytes:&v28 length:1];
  [v10 appendData:v11];
  v9 = [[STSNDEFRecord alloc] initWithFormat:1 type:v23 identifier:0 payload:v10];

LABEL_14:

  return v9;
}

- (id)_createCarrierConfigurationRecord
{
  return self->_carrierRecord;
}

- (id)createNdefRecordBundle
{
  uint64_t v3 = [STSCHNdefRecordBundle alloc];
  uint64_t v4 = [(STSCHAlternativeCarrier *)self createAlternativeCarrierRecord];
  uint64_t v5 = [(STSCHAlternativeCarrier *)self _createCarrierConfigurationRecord];
  uint64_t v6 = [(STSCHNdefRecordBundle *)v3 initWithAlternativeRecord:v4 configurationRecord:v5 auxiliaryRecords:self->_auxiliaryRecords errorRecord:0];

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(unint64_t)a3
{
  self->_powerState = a3;
}

- (STSNDEFRecord)carrierRecord
{
  return self->_carrierRecord;
}

- (void)setCarrierRecord:(id)a3
{
}

- (NSArray)auxiliaryRecords
{
  return self->_auxiliaryRecords;
}

- (void)setAuxiliaryRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);

  objc_storeStrong((id *)&self->_carrierRecord, 0);
}

@end
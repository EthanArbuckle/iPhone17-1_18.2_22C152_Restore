@interface WPDAdvertisingData
- (BOOL)assertPower;
- (BOOL)enableEPAForAdvertisement;
- (BOOL)isEnableEPAForAdvertisement;
- (BOOL)isEqualToData:(id)a3;
- (BOOL)isRanging;
- (BOOL)isValidWithAdditionalRequest:(id)a3;
- (NSData)getData;
- (NSMutableData)internalData;
- (NSMutableSet)types;
- (WPDAdvertisingData)init;
- (id)description;
- (int64_t)advertRate;
- (void)addAdvertisingRequest:(id)a3;
- (void)setAdvertRate:(int64_t)a3;
- (void)setAssertPower:(BOOL)a3;
- (void)setEnableEPAForAdvertisement:(BOOL)a3;
- (void)setInternalData:(id)a3;
- (void)setIsRanging:(BOOL)a3;
- (void)setTypes:(id)a3;
@end

@implementation WPDAdvertisingData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalData, 0);
  objc_storeStrong((id *)&self->_types, 0);
}

- (void)addAdvertisingRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = [v4 clientType];
  unsigned __int8 v24 = v5;
  v6 = [v4 advertisingData];
  uint64_t v7 = [v4 advertisingRate];
  int v8 = [v4 enableEPAForAdvertising];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_7);
  }
  v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v26 = v5;
    __int16 v27 = 2114;
    int64_t v28 = (int64_t)v6;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 1024;
    int v32 = v8;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "Adding data of type: %ld, advData: %{public}@ advInterval: %ld EPA:%d", buf, 0x26u);
  }
  unsigned __int8 v23 = [v6 length];
  v10 = [MEMORY[0x263EFF990] dataWithCapacity:v23 + 2];
  [v10 appendBytes:&v24 length:1];
  [v10 appendBytes:&v23 length:1];
  [v10 appendData:v6];
  if (v24 < 0xFu)
  {
    v12 = (void *)MEMORY[0x263EFF8F8];
    v13 = [(WPDAdvertisingData *)self internalData];
    v11 = [v12 dataWithData:v13];

    v14 = [(WPDAdvertisingData *)self internalData];
    [v14 setData:v10];

    v15 = [(WPDAdvertisingData *)self internalData];
    [v15 appendData:v11];
  }
  else
  {
    v11 = [(WPDAdvertisingData *)self internalData];
    [v11 appendData:v10];
  }

  v16 = [(WPDAdvertisingData *)self types];
  v17 = [NSNumber numberWithUnsignedChar:v24];
  [v16 addObject:v17];

  if (v7 < [(WPDAdvertisingData *)self advertRate]) {
    [(WPDAdvertisingData *)self setAdvertRate:v7];
  }
  [(WPDAdvertisingData *)self setEnableEPAForAdvertisement:v8 | [(WPDAdvertisingData *)self enableEPAForAdvertisement]];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_124_0);
  }
  v18 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = [(WPDAdvertisingData *)self internalData];
    int64_t v21 = [(WPDAdvertisingData *)self advertRate];
    BOOL v22 = [(WPDAdvertisingData *)self isEnableEPAForAdvertisement];
    *(_DWORD *)buf = 138543874;
    unint64_t v26 = (unint64_t)v20;
    __int16 v27 = 2048;
    int64_t v28 = v21;
    __int16 v29 = 1024;
    LODWORD(v30) = v22;
    _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "Current advertisement packet: %{public}@ advertRate: %ld EPA:%d", buf, 0x1Cu);
  }
}

- (int64_t)advertRate
{
  return self->_advertRate;
}

- (NSMutableSet)types
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isValidWithAdditionalRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WPDAdvertisingData *)self internalData];
  uint64_t v6 = [v5 length];
  uint64_t v7 = [v4 advertisingData];

  unint64_t v8 = v6 + [v7 length] + 6;
  return v8 < 0x1D;
}

- (WPDAdvertisingData)init
{
  v8.receiver = self;
  v8.super_class = (Class)WPDAdvertisingData;
  v2 = [(WPDAdvertisingData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF990] dataWithCapacity:28];
    internalData = v2->_internalData;
    v2->_internalData = (NSMutableData *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    types = v2->_types;
    v2->_types = (NSMutableSet *)v5;

    v2->_advertRate = 0x4000;
    v2->_assertPower = 0;
    *(_WORD *)&v2->_enableEPAForAdvertisement = 0;
  }
  return v2;
}

- (NSData)getData
{
  uint64_t v3 = [(WPDAdvertisingData *)self internalData];
  unint64_t v4 = [v3 length];

  if (v4 >= 0x1D) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Invalid Data Length", @"Data length %ld is invalid", v4);
  }
  uint64_t v5 = [MEMORY[0x263EFF990] data];
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&advertisingHeader length:4];
  [v5 setData:v6];

  uint64_t v7 = [(WPDAdvertisingData *)self internalData];
  [v5 appendData:v7];

  uint64_t v8 = [v5 length];
  uint64_t v11 = v8;
  if (v8 < 5)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v11 = v8 - 1;
    objc_msgSend(v5, "replaceBytesInRange:withBytes:", 0, 1, &v11);
    id v9 = v5;
  }

  return (NSData *)v9;
}

- (NSMutableData)internalData
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)enableEPAForAdvertisement
{
  return self->_enableEPAForAdvertisement;
}

- (BOOL)assertPower
{
  return self->_assertPower;
}

- (void)setEnableEPAForAdvertisement:(BOOL)a3
{
  self->_enableEPAForAdvertisement = a3;
}

- (void)setAssertPower:(BOOL)a3
{
  self->_assertPower = a3;
}

- (void)setAdvertRate:(int64_t)a3
{
  self->_advertRate = a3;
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (BOOL)isEqualToData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 internalData];
  uint64_t v6 = [(WPDAdvertisingData *)self internalData];
  if (![v5 isEqualToData:v6]
    || (uint64_t v7 = [v4 advertRate], v7 != -[WPDAdvertisingData advertRate](self, "advertRate")))
  {

    goto LABEL_6;
  }
  int v8 = [v4 isRanging];
  int v9 = [(WPDAdvertisingData *)self isRanging];

  if (v8 != v9)
  {
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (BOOL)isEnableEPAForAdvertisement
{
  return self->_enableEPAForAdvertisement;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(WPDAdvertisingData *)self internalData];
  int64_t v5 = [(WPDAdvertisingData *)self advertRate];
  double v6 = (double)[(WPDAdvertisingData *)self advertRate] * 0.625;
  uint64_t v7 = "no";
  if ([(WPDAdvertisingData *)self isRanging]) {
    int v8 = "yes";
  }
  else {
    int v8 = "no";
  }
  if ([(WPDAdvertisingData *)self assertPower]) {
    uint64_t v7 = "yes";
  }
  int v9 = [v3 stringWithFormat:@"data %@ rate %ld (%.2f ms) ranging %s assert power %s EPA:%d", v4, v5, *(void *)&v6, v8, v7, -[WPDAdvertisingData isEnableEPAForAdvertisement](self, "isEnableEPAForAdvertisement")];

  return v9;
}

- (void)setTypes:(id)a3
{
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (void)setInternalData:(id)a3
{
}

@end
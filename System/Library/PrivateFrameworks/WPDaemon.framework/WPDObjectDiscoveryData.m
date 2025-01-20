@interface WPDObjectDiscoveryData
+ (id)addressFromNearbyToken:(id)a3;
+ (id)addressesFromNearbyTokens:(id)a3;
+ (id)objectDiscoveryReportFromAdvReport:(id)a3;
+ (unsigned)applyMaskToAddress:(id)a3;
- (NSMutableData)address;
- (NSMutableData)payload;
- (WPDObjectDiscoveryData)init;
- (id)description;
- (id)updateWithKey:(id)a3 Status:(unsigned __int8)a4 Reserved:(id)a5;
- (int64_t)length;
- (void)setAddress:(id)a3;
- (void)setLength:(int64_t)a3;
- (void)setPayload:(id)a3;
- (void)wipeout;
@end

@implementation WPDObjectDiscoveryData

+ (id)objectDiscoveryReportFromAdvReport:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"kDeviceTime"];
  v5 = (void *)MEMORY[0x263EFF910];
  [v4 doubleValue];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)MEMORY[0x263EFF990];
  v8 = [v3 objectForKeyedSubscript:@"kDeviceAddress"];
  v9 = [v7 dataWithData:v8];

  v73 = [v3 objectForKeyedSubscript:@"kDeviceRSSI"];
  v10 = [v3 objectForKeyedSubscript:@"kDeviceChannel"];
  v72 = [v3 objectForKeyedSubscript:@"kDeviceDataSaturated"];
  v11 = [v3 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  uint64_t v12 = [v11 length];
  uint64_t v13 = v12 - 4;
  if (v12 == 6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_17);
    }
    v14 = WiProxLog;
    v70 = v4;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.4(v14);
    }
    uint64_t v15 = 0;
LABEL_13:
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_146_0);
    }
    uint64_t v17 = v13 + ~v15;
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218752;
      uint64_t v77 = v13;
      __int16 v78 = 1024;
      int v79 = 1;
      __int16 v80 = 2048;
      uint64_t v81 = v15;
      __int16 v82 = 2048;
      uint64_t v83 = v13 + ~v15;
      _os_log_debug_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEBUG, "ObjectDiscovery length payload:%ld state:%d data:%ld optional:%ld", buf, 0x26u);
    }
    v19 = objc_msgSend(v11, "subdataWithRange:", 4, v13);
    v68 = v11;
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_149);
    }
    v20 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:]((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
    }
    id v27 = v19;
    v28 = (char *)[v27 bytes];
    v71 = [NSNumber numberWithChar:*v28];
    v29 = [MEMORY[0x263EFF8F8] data];
    if (v13 >= 1)
    {
      v30 = (void *)MEMORY[0x263EFF8F8];
      objc_msgSend(v27, "subdataWithRange:", 1, v15);
      v31 = v9;
      v33 = v32 = v6;
      uint64_t v34 = [v30 dataWithData:v33];

      v6 = v32;
      v9 = v31;
      v29 = (void *)v34;
    }
    uint64_t v35 = v15 | 1;
    v36 = (void *)MEMORY[0x263EFF990];
    v37 = objc_msgSend(v27, "subdataWithRange:", v35, v17, v68);
    v38 = [v36 dataWithData:v37];

    id v39 = v38;
    v40 = (char *)[v39 mutableBytes];
    char v41 = *v40;
    *v40 &= 0xFCu;
    v42 = v9;
    id v43 = v9;
    v44 = (unsigned char *)[v43 mutableBytes];
    unsigned char *v44 = *v44 & 0x3F | (v41 << 6);
    v74[0] = @"kSPDeviceAddress";
    v45 = [MEMORY[0x263EFF8F8] dataWithData:v43];
    v75[0] = v45;
    v75[1] = v6;
    v46 = v6;
    v74[1] = @"kSPScanDate";
    v74[2] = @"kSPrssi";
    v75[2] = v73;
    v75[3] = v29;
    v74[3] = @"kSPAdvertisementData";
    v74[4] = @"kSPStatus";
    v75[4] = v71;
    v74[5] = @"kSPOptional";
    uint64_t v47 = [MEMORY[0x263EFF8F8] dataWithData:v39];
    v48 = (void *)v47;
    v49 = &unk_26D646EF0;
    if (v10) {
      v49 = v10;
    }
    v75[5] = v47;
    v75[6] = v49;
    v74[6] = @"kSPChannel";
    v74[7] = @"kSPSaturated";
    v50 = v72;
    if (!v72) {
      v50 = (void *)MEMORY[0x263EFFA80];
    }
    v75[7] = v50;
    v51 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:8];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_156_0);
    }
    v52 = WiProxLog;
    v6 = v46;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:]((uint64_t)v51, v52, v53, v54, v55, v56, v57, v58);
    }
    v9 = v42;
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_159_0);
    }
    v59 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:]((uint64_t)v3, v59, v60, v61, v62, v63, v64, v65);
    }

    v4 = v70;
    v11 = v69;
    goto LABEL_41;
  }
  if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 0x1C)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_140_0);
    }
    v16 = WiProxLog;
    v70 = v4;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.5(v16);
    }
    uint64_t v15 = 22;
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_143);
  }
  v66 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:].cold.6(v66);
  }
  v51 = 0;
LABEL_41:

  return v51;
}

+ (unsigned)applyMaskToAddress:(id)a3
{
  id v3 = (unsigned __int8 *)[a3 mutableBytes];
  unsigned int v4 = *v3;
  *id v3 = v4 | 0xC0;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_161_1);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    +[WPDObjectDiscoveryData applyMaskToAddress:](v3, v5);
  }
  return v4 >> 6;
}

+ (id)addressFromNearbyToken:(id)a3
{
  id v3 = [MEMORY[0x263EFF990] dataWithData:a3];
  +[WPDObjectDiscoveryData applyMaskToAddress:v3];
  unsigned int v4 = [MEMORY[0x263EFF8F8] dataWithData:v3];

  return v4;
}

+ (id)addressesFromNearbyTokens:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unsigned int v4 = (void *)MEMORY[0x223CB05A0]();
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__WPDObjectDiscoveryData_addressesFromNearbyTokens___block_invoke;
    v9[3] = &unk_26469BB98;
    id v10 = v5;
    id v6 = v5;
    [v3 enumerateObjectsUsingBlock:v9];
    v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __52__WPDObjectDiscoveryData_addressesFromNearbyTokens___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[WPDObjectDiscoveryData addressFromNearbyToken:a2];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

- (WPDObjectDiscoveryData)init
{
  v8.receiver = self;
  v8.super_class = (Class)WPDObjectDiscoveryData;
  v2 = [(WPDObjectDiscoveryData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF990] dataWithLength:6];
    address = v2->_address;
    v2->_address = (NSMutableData *)v3;

    -[NSMutableData resetBytesInRange:](v2->_address, "resetBytesInRange:", 0, [(NSMutableData *)v2->_address length]);
    uint64_t v5 = [MEMORY[0x263EFF990] dataWithLength:25];
    payload = v2->_payload;
    v2->_payload = (NSMutableData *)v5;

    -[NSMutableData resetBytesInRange:](v2->_payload, "resetBytesInRange:", 0, [(NSMutableData *)v2->_payload length]);
    v2->_length = 0;
  }
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"length: %d address: %@ payload: %@ ", self->_length, self->_address, self->_payload];
}

- (void)wipeout
{
  self->_length = 0;
  -[NSMutableData resetBytesInRange:](self->_address, "resetBytesInRange:", 0, [(NSMutableData *)self->_address length]);
  payload = self->_payload;
  uint64_t v4 = [(NSMutableData *)payload length];
  -[NSMutableData resetBytesInRange:](payload, "resetBytesInRange:", 0, v4);
}

- (id)updateWithKey:(id)a3 Status:(unsigned __int8)a4 Reserved:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 length];
  uint64_t v11 = v10 - 6;
  if ((unint64_t)(v10 - 6) >= 0x17)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"bad ObjectDiscovery key of length %lu", objc_msgSend(v8, "length"));
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35[0] = v12;
    v14 = NSDictionary;
    uint64_t v15 = (void **)v35;
    v16 = &v34;
LABEL_6:
    v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    v19 = [v13 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v18];

    goto LABEL_16;
  }
  uint64_t v17 = v10;
  if (v9 && (unint64_t)[v9 length] >= 3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"bad ObjectDiscovery reserved bytes length %lu", objc_msgSend(v9, "length"));
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33 = v12;
    v14 = NSDictionary;
    uint64_t v15 = &v33;
    v16 = &v32;
    goto LABEL_6;
  }
  v20 = [(WPDObjectDiscoveryData *)self address];
  id v21 = v8;
  objc_msgSend(v20, "replaceBytesInRange:withBytes:", 0, 6, objc_msgSend(v21, "bytes"));

  uint64_t v22 = [(WPDObjectDiscoveryData *)self address];
  unsigned __int8 v23 = +[WPDObjectDiscoveryData applyMaskToAddress:v22];

  uint64_t v24 = [(WPDObjectDiscoveryData *)self payload];
  uint64_t v25 = [(WPDObjectDiscoveryData *)self payload];
  objc_msgSend(v24, "resetBytesInRange:", 0, objc_msgSend(v25, "length"));

  if (v11)
  {
    uint64_t v26 = [(WPDObjectDiscoveryData *)self payload];
    objc_msgSend(v26, "replaceBytesInRange:withBytes:", 1, v11, objc_msgSend(v21, "bytes") + 6);
  }
  id v27 = [(WPDObjectDiscoveryData *)self payload];
  v28 = (unsigned __int8 *)[v27 mutableBytes];

  unsigned __int8 *v28 = a4;
  if (v9 && [v9 length])
  {
    v29 = [(WPDObjectDiscoveryData *)self payload];
    objc_msgSend(v29, "replaceBytesInRange:withBytes:", v11, objc_msgSend(v9, "length"), objc_msgSend(v9, "bytes"));
  }
  v28[v17 - 5] = v28[v17 - 5] & 0xFC | v23;
  if (v11) {
    uint64_t v30 = v17 - 3;
  }
  else {
    uint64_t v30 = 2;
  }
  [(WPDObjectDiscoveryData *)self setLength:v30];
  v19 = 0;
LABEL_16:

  return v19;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (NSMutableData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSMutableData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)objectDiscoveryReportFromAdvReport:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)objectDiscoveryReportFromAdvReport:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "ObjectDiscovery found NearOwner payload", v1, 2u);
}

+ (void)objectDiscoveryReportFromAdvReport:(os_log_t)log .cold.5(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "ObjectDiscovery found Wild payload", v1, 2u);
}

+ (void)objectDiscoveryReportFromAdvReport:(os_log_t)log .cold.6(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "ObjectDiscovery found unexpected payload", v1, 2u);
}

+ (void)applyMaskToAddress:(unsigned char *)a1 .cold.1(unsigned char *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  BOOL v2 = (*a1 & 0xC0) != 128;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "ObjectDiscovery address is valid: %d", (uint8_t *)v3, 8u);
}

@end
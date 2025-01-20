@interface SPRProvider
+ (SPRProvider)shared;
- (id)makeConfiguratorAndReturnError:(id *)a3;
- (id)makeMonitorAndReturnError:(id *)a3;
- (id)makeORReaderAndReturnError:(id *)a3;
- (id)makePINControllerAndReturnError:(id *)a3;
- (id)makeReaderAndReturnError:(id *)a3;
- (int64_t)maxConfiguratorInstance;
- (int64_t)maxMonitorInstance;
- (int64_t)maxReaderInstance;
@end

@implementation SPRProvider

+ (SPRProvider)shared
{
  v6 = objc_msgSend_shared(SPRPrimer, a2, v2, v3, v4, v5);
  v12 = objc_msgSend_getProvider(v6, v7, v8, v9, v10, v11);

  return (SPRProvider *)v12;
}

- (id)makeConfiguratorAndReturnError:(id *)a3
{
  uint64_t v5 = [SPRConfigurator alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221254AE8;
  v17[3] = &unk_26459D048;
  v17[4] = self;
  uint64_t v10 = objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  v15 = objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);

  return v15;
}

- (id)makeMonitorAndReturnError:(id *)a3
{
  uint64_t v5 = [SPRMonitor alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221254E2C;
  v17[3] = &unk_26459D098;
  v17[4] = self;
  uint64_t v10 = objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  v15 = objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);

  return v15;
}

- (id)makeReaderAndReturnError:(id *)a3
{
  uint64_t v5 = [SPRReader alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221255158;
  v17[3] = &unk_26459D0E8;
  v17[4] = self;
  uint64_t v10 = objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  v15 = objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);

  return v15;
}

- (id)makePINControllerAndReturnError:(id *)a3
{
  uint64_t v5 = [SPRPINController alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221255484;
  v17[3] = &unk_26459D138;
  v17[4] = self;
  uint64_t v10 = objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  v15 = objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);

  return v15;
}

- (id)makeORReaderAndReturnError:(id *)a3
{
  uint64_t v5 = [ORReader alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2212557B0;
  v17[3] = &unk_26459D188;
  v17[4] = self;
  uint64_t v10 = objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  v15 = objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);

  return v15;
}

- (int64_t)maxConfiguratorInstance
{
  return self->_maxConfiguratorInstance;
}

- (int64_t)maxMonitorInstance
{
  return self->_maxMonitorInstance;
}

- (int64_t)maxReaderInstance
{
  return self->_maxReaderInstance;
}

@end
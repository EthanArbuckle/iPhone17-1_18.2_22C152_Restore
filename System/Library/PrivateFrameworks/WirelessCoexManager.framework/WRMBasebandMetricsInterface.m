@interface WRMBasebandMetricsInterface
- (WRMBasebandMetricsInterface)init;
- (void)getCellularDataMetrics:(id)a3;
- (void)getNRPhyMetrics:(id)a3;
- (void)getQSHMetrics:(id)a3;
- (void)getWiFiBWEstimationMetrics:(id)a3;
- (void)handleNotification:(id)a3 :(BOOL)a4;
- (void)processWRMCellDataMetrics:(id)a3;
- (void)processWRMNrPhyMetrics:(id)a3;
- (void)processWRMWiFiBWEstMetrics:(id)a3;
- (void)reConnect;
- (void)registerClient:(int)a3 queue:(id)a4;
- (void)unregisterClient;
@end

@implementation WRMBasebandMetricsInterface

- (void)registerClient:(int)a3 queue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = v6;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
  }
  objc_storeStrong((id *)&self->super.mQueue, v7);
  if (!v6) {

  }
  self->super.mProcessId = v4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__WRMBasebandMetricsInterface_registerClient_queue___block_invoke;
  v12[3] = &unk_26422A250;
  objc_copyWeak(&v13, &location);
  v9 = (void *)MEMORY[0x2166AEE70](v12);
  mQueue = self->super.mQueue;
  v11.receiver = self;
  v11.super_class = (Class)WRMBasebandMetricsInterface;
  [(WRMClientInterface *)&v11 registerClient:v4 queue:mQueue notificationHandler:v9];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__WRMBasebandMetricsInterface_registerClient_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNotification:v8 :a4];
  }
}

- (void)unregisterClient
{
  v2.receiver = self;
  v2.super_class = (Class)WRMBasebandMetricsInterface;
  [(WRMClientInterface *)&v2 unregisterClient];
}

- (void)getWiFiBWEstimationMetrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id wifiMetricsHandler = self->wifiMetricsHandler;
  if (wifiMetricsHandler)
  {
    self->id wifiMetricsHandler = 0;
  }
  id v6 = (void *)MEMORY[0x2166AEE70](v4);
  id v7 = self->wifiMetricsHandler;
  self->id wifiMetricsHandler = v6;

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_26422A270;
  xpc_object_t v9 = xpc_uint64_create(0x834uLL);
  v13[0] = v9;
  id v10 = v8;
  v13[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  xpc_connection_send_message(self->super.mConnection, v11);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)getNRPhyMetrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id metricsHandler = self->metricsHandler;
  if (metricsHandler)
  {
    self->id metricsHandler = 0;
  }
  id v6 = (void *)MEMORY[0x2166AEE70](v4);
  id v7 = self->metricsHandler;
  self->id metricsHandler = v6;

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_26422A270;
  xpc_object_t v9 = xpc_uint64_create(0x7D0uLL);
  v13[0] = v9;
  id v10 = v8;
  v13[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  xpc_connection_send_message(self->super.mConnection, v11);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)getCellularDataMetrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id dataMetricsHandler = self->dataMetricsHandler;
  if (dataMetricsHandler)
  {
    self->id dataMetricsHandler = 0;
  }
  id v6 = (void *)MEMORY[0x2166AEE70](v4);
  id v7 = self->dataMetricsHandler;
  self->id dataMetricsHandler = v6;

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_26422A270;
  xpc_object_t v9 = xpc_uint64_create(0x7D1uLL);
  v13[0] = v9;
  id v10 = v8;
  v13[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  xpc_connection_send_message(self->super.mConnection, v11);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)getQSHMetrics:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x2166AEE70](v4);
    if (v6)
    {
      id v7 = (void *)v6;
      xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
      if (v8)
      {
        xpc_object_t v9 = v8;
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        *(_OWORD *)keys = xmmword_26422A270;
        xpc_object_t v11 = xpc_uint64_create(0x7D2uLL);
        values[0] = v11;
        id v12 = v10;
        values[1] = v12;
        xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        mConnection = self->super.mConnection;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __45__WRMBasebandMetricsInterface_getQSHMetrics___block_invoke;
        handler[3] = &unk_26422A288;
        id v17 = v7;
        xpc_connection_send_message_with_reply(mConnection, v13, 0, handler);

        for (uint64_t i = 1; i != -1; --i)
      }
    }
  }
}

void __45__WRMBasebandMetricsInterface_getQSHMetrics___block_invoke(uint64_t a1, void *a2)
{
  v20[7] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "totalCellularBW");
  uint64_t v5 = xpc_dictionary_get_uint64(v3, "nrConfiguredBW");
  uint64_t v6 = xpc_dictionary_get_uint64(v3, "totalLayers");
  uint64_t v7 = xpc_dictionary_get_uint64(v3, "nrLayers");
  uint64_t v8 = xpc_dictionary_get_uint64(v3, "lteMaxScheduledLayers");
  uint64_t v9 = xpc_dictionary_get_uint64(v3, "nrModulation");
  uint64_t v10 = xpc_dictionary_get_uint64(v3, "totalCCs");

  v19[0] = @"totalCellularBW";
  xpc_object_t v11 = [NSNumber numberWithUnsignedInt:uint64];
  v20[0] = v11;
  v19[1] = @"nrConfiguredBW";
  id v12 = [NSNumber numberWithUnsignedInt:v5];
  v20[1] = v12;
  v19[2] = @"totalLayers";
  xpc_object_t v13 = [NSNumber numberWithUnsignedInt:v6];
  v20[2] = v13;
  v19[3] = @"nrLayers";
  v14 = [NSNumber numberWithUnsignedInt:v7];
  v20[3] = v14;
  v19[4] = @"lteMaxScheduledLayers";
  uint64_t v15 = [NSNumber numberWithUnsignedInt:v8];
  v20[4] = v15;
  v19[5] = @"nrModulation";
  v16 = [NSNumber numberWithUnsignedInt:v9];
  v20[5] = v16;
  v19[6] = @"totalCCs";
  id v17 = [NSNumber numberWithUnsignedInt:v10];
  v20[6] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WRMBasebandMetricsInterface)init
{
  v9.receiver = self;
  v9.super_class = (Class)WRMBasebandMetricsInterface;
  objc_super v2 = [(WRMClientInterface *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    id metricsHandler = v2->metricsHandler;
    v2->id metricsHandler = 0;

    id dataMetricsHandler = v3->dataMetricsHandler;
    v3->id dataMetricsHandler = 0;

    id wifiMetricsHandler = v3->wifiMetricsHandler;
    v3->id wifiMetricsHandler = 0;

    uint64_t v7 = v3;
  }

  return v3;
}

- (void)handleNotification:(id)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  xpc_object_t xdict = v6;
  if (v4)
  {
    NSLog(&cfstr_InvokingReconn.isa);
    [(WRMBasebandMetricsInterface *)self reConnect];
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kMessageId");
    uint64_t v8 = xpc_dictionary_get_value(xdict, "kMessageArgs");
    switch(uint64)
    {
      case 0x834uLL:
        [(WRMBasebandMetricsInterface *)self processWRMWiFiBWEstMetrics:v8];
        break;
      case 0x7D1uLL:
        [(WRMBasebandMetricsInterface *)self processWRMCellDataMetrics:v8];
        break;
      case 0x7D0uLL:
        [(WRMBasebandMetricsInterface *)self processWRMNrPhyMetrics:v8];
        break;
    }
  }
}

- (void)processWRMNrPhyMetrics:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WRMBasebandMetricsInterface_processWRMNrPhyMetrics___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

void __54__WRMBasebandMetricsInterface_processWRMNrPhyMetrics___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  objc_super v2 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "nrRSRP");

  double v3 = 0.0;
  double v4 = 0.0;
  if (v2) {
    double v4 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "nrRSRP");
  }
  uint64_t v5 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "nrRSRQ");

  if (v5) {
    double v3 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "nrRSRQ");
  }
  id v6 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "nrSNR");

  if (v6) {
    double v7 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "nrSNR");
  }
  else {
    double v7 = 0.0;
  }
  v13[0] = @"nrRSRP";
  id v8 = [NSNumber numberWithDouble:v4];
  v14[0] = v8;
  v13[1] = @"nrRSRQ";
  objc_super v9 = [NSNumber numberWithDouble:v3];
  v14[1] = v9;
  xpc_object_t v13[2] = @"nrSNR";
  uint64_t v10 = [NSNumber numberWithDouble:v7];
  v14[2] = v10;
  xpc_object_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 40);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }
}

- (void)processWRMCellDataMetrics:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__WRMBasebandMetricsInterface_processWRMCellDataMetrics___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

void __57__WRMBasebandMetricsInterface_processWRMCellDataMetrics___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  objc_super v2 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "cellularDataLQM");

  if (v2) {
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "cellularDataLQM");
  }
  else {
    uint64_t uint64 = 0;
  }
  double v7 = @"cellularDataLQM";
  id v4 = [NSNumber numberWithUnsignedLongLong:uint64];
  v8[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 48);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

- (void)processWRMWiFiBWEstMetrics:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__WRMBasebandMetricsInterface_processWRMWiFiBWEstMetrics___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

void __58__WRMBasebandMetricsInterface_processWRMWiFiBWEstMetrics___block_invoke(uint64_t a1)
{
  v25[7] = *MEMORY[0x263EF8340];
  objc_super v2 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "wghtRSSI");

  double v3 = 0.0;
  double v4 = 0.0;
  if (v2) {
    double v4 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "wghtRSSI");
  }
  uint64_t v5 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "wghtSNR");

  if (v5) {
    double v3 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "wghtSNR");
  }
  id v6 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "wghtPhyRate");

  double v7 = 0.0;
  double v8 = 0.0;
  if (v6) {
    double v8 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "wghtPhyRate");
  }
  objc_super v9 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "tcpRTT");

  if (v9) {
    double v7 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "tcpRTT");
  }
  uint64_t uint64 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "chType");

  if (uint64) {
    uint64_t uint64 = (void *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "chType");
  }
  xpc_object_t v11 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "isCaptive");

  if (v11) {
    BOOL v12 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "isCaptive");
  }
  else {
    BOOL v12 = 0;
  }
  xpc_object_t v13 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CCA");

  if (v13) {
    double v14 = (double)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "CCA");
  }
  else {
    double v14 = 0.0;
  }
  v24[0] = @"wghtRSSI";
  uint64_t v15 = [NSNumber numberWithDouble:v4];
  v25[0] = v15;
  v24[1] = @"wghtSNR";
  v16 = [NSNumber numberWithDouble:v3];
  v25[1] = v16;
  v24[2] = @"wghtPhyRate";
  id v17 = [NSNumber numberWithDouble:v8];
  v25[2] = v17;
  v24[3] = @"tcpRTT";
  v18 = [NSNumber numberWithDouble:v7];
  v25[3] = v18;
  v24[4] = @"chType";
  v19 = [NSNumber numberWithUnsignedLongLong:uint64];
  v25[4] = v19;
  v24[5] = @"isCaptive";
  uint64_t v20 = [NSNumber numberWithBool:v12];
  v25[5] = v20;
  v24[6] = @"CCA";
  v21 = [NSNumber numberWithDouble:v14];
  v25[6] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 56);
  if (v23) {
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v22);
  }
}

- (void)reConnect
{
  [(WRMBasebandMetricsInterface *)self unregisterClient];
  uint64_t mProcessId = self->super.mProcessId;
  mQueue = self->super.mQueue;
  [(WRMBasebandMetricsInterface *)self registerClient:mProcessId queue:mQueue];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->wifiMetricsHandler, 0);
  objc_storeStrong(&self->dataMetricsHandler, 0);
  objc_storeStrong(&self->metricsHandler, 0);
}

@end
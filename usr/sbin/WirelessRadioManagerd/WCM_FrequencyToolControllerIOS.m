@interface WCM_FrequencyToolControllerIOS
- (WCM_FrequencyToolControllerIOS)init;
- (void)dealloc;
- (void)handleFrequencyToolOperation:(id)a3;
- (void)handleFrequencyToolQuery:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handlePowerState:(BOOL)a3;
@end

@implementation WCM_FrequencyToolControllerIOS

- (WCM_FrequencyToolControllerIOS)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCM_FrequencyToolControllerIOS;
  v2 = [(WCM_FrequencyToolController *)&v7 init];
  v3 = +[WCM_PolicyManager singleton];
  uint64_t v4 = [v3 sacManager];
  v5 = *(void **)(v2 + 20);
  *(void *)(v2 + 20) = v4;

  return (WCM_FrequencyToolControllerIOS *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_FrequencyToolControllerIOS;
  [(WCM_FrequencyToolController *)&v2 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_FrequencyToolControllerIOS;
  [(WCM_FrequencyToolController *)&v3 handlePowerState:a3];
}

- (void)handleMessage:(id)a3
{
  id v5 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "kMessageId");
  +[WCM_Logging logLevel:2, @"Frequency Tool Controller handleMessage messageId = %lld", uint64 message];
  if (uint64 == 2402)
  {
    [(WCM_FrequencyToolControllerIOS *)self handleFrequencyToolQuery:v5];
  }
  else if (uint64 == 2401)
  {
    [(WCM_FrequencyToolControllerIOS *)self handleFrequencyToolOperation:v5];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Frequency Tool Controller dropping message-id %lld", uint64 message];
  }
}

- (void)handleFrequencyToolQuery:(id)a3
{
  xpc_object_t xdict = a3;
  v37 = self;
  uint64_t v4 = *(void *)(&self->super.super.mProcessId + 1);
  id v5 = +[WCM_PolicyManager singleton];
  v6 = [v5 activeCoexFeatures];
  unsigned int v7 = [v6 containsObject:@"SacPolicySupport"];

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v7) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    BOOL v10 = 0;
    goto LABEL_21;
  }
  v11 = xpc_dictionary_get_value(xdict, "kMessageArgs");
  v12 = v11;
  if (!v11)
  {
    BOOL v10 = 1;
LABEL_11:
    v32 = v12;
    xpc_object_t v33 = v8;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v15 = objc_alloc_init((Class)NSMutableArray);
    xpc_object_t value = xpc_array_create(0, 0);
    xpc_object_t v16 = xpc_array_create(0, 0);
    uint64_t v17 = 0;
    v35 = v16;
    do
    {
      uint64_t v38 = v17;
      uint64_t v18 = dword_100207534[v17];
      [*(id *)(&v37->super.super.mProcessId + 1) frequencyToolGetJasperResult:v14 generalSacResult:v15 client:v18];
      if ([v14 count])
      {
        uint64_t v19 = 0;
        unsigned int v20 = 1;
        do
        {
          v21 = [v14 objectAtIndex:v19];
          id v22 = [v21 centerFreq];
          uint64_t v23 = (unint64_t)[v21 bw] >> 1;
          xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v24, "KWCMFrequencyToolResponse_Client", v18);
          xpc_dictionary_set_uint64(v24, "KWCMFrequencyToolResponse_Frequency", (uint64_t)v22);
          xpc_dictionary_set_uint64(v24, "KWCMFrequencyToolResponse_Bandwidth", v23);
          xpc_array_append_value(value, v24);

          uint64_t v19 = v20;
          BOOL v25 = (unint64_t)[v14 count] > v20++;
        }
        while (v25);
      }
      if ([v15 count])
      {
        uint64_t v26 = 0;
        unsigned int v27 = 1;
        do
        {
          v28 = [v15 objectAtIndex:v26];
          id v29 = [v28 centerFreq];
          uint64_t v30 = (unint64_t)[v28 bw] >> 1;
          xpc_object_t v31 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v31, "KWCMFrequencyToolResponse_Client", v18);
          xpc_dictionary_set_uint64(v31, "KWCMFrequencyToolResponse_Frequency", (uint64_t)v29);
          xpc_dictionary_set_uint64(v31, "KWCMFrequencyToolResponse_Bandwidth", v30);
          xpc_array_append_value(v35, v31);

          uint64_t v26 = v27;
          BOOL v25 = (unint64_t)[v15 count] > v27++;
        }
        while (v25);
      }
      uint64_t v17 = v38 + 1;
    }
    while (v38 != 2);
    xpc_object_t v8 = v33;
    xpc_dictionary_set_value(v33, "kWCMFrequencyToolResponse_ListOfFrequencies_Jasper", value);
    xpc_dictionary_set_value(v33, "kWCMFrequencyToolResponse_ListOfFrequencies_NonJasper", v35);

    v12 = v32;
    goto LABEL_20;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v11, "KWCMFrequencyToolOperation");
  BOOL v10 = uint64 != 6;
  if (uint64 == 1) {
    goto LABEL_11;
  }
LABEL_20:

LABEL_21:
  xpc_dictionary_set_BOOL(v8, "KWCMFrequencyToolResponse_Status", v10);
  [(WCM_Controller *)v37 sendMessage:2403 withArgs:v8];
}

- (void)handleFrequencyToolOperation:(id)a3
{
  xpc_object_t xdict = a3;
  if (*(void *)(&self->super.super.mProcessId + 1)
    && (+[WCM_PolicyManager singleton],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 activeCoexFeatures],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 containsObject:@"SacPolicySupport"],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    unsigned int v7 = xpc_dictionary_get_value(xdict, "kMessageArgs");
    xpc_object_t v8 = v7;
    if (v7)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v7, "KWCMFrequencyToolOperation");
      uint64_t v10 = xpc_dictionary_get_uint64(v8, "kWCMFrequencyToolClient");
      uint64_t v11 = xpc_dictionary_get_uint64(v8, "kWCMFrequencyToolFrequency");
      uint64_t v12 = 2 * xpc_dictionary_get_uint64(v8, "kWCMFrequencyToolBandwidth");
      uint64_t v13 = xpc_dictionary_get_uint64(v8, "kWCMFrequencyToolPriority");
      +[WCM_Logging logLevel:2, @"Received from Frequency Tool Operation (%llu), Client = (%llu), Frequency = (%llu), Bandwidth = (%llu), Priority = (%llu) ", uint64, v10, v11, v12, v13 message];
      switch(uint64)
      {
        case 0uLL:
          [*(id *)(&self->super.super.mProcessId + 1) frequencyToolClearFreq:v10];
          break;
        case 2uLL:
          if (v13 < 3) {
            uint64_t v14 = (v13 + 1);
          }
          else {
            uint64_t v14 = 3;
          }
          [*(id *)(&self->super.super.mProcessId + 1) frequencyToolAddClientFreq:v10 centerFreq:v11 bandwidth:v12 celluarCarrierType:v14];
          break;
        case 3uLL:
          [*(id *)(&self->super.super.mProcessId + 1) frequencyToolRemoveFreq:v10 centerFreq:v11 bandwidth:v12];
          break;
        case 4uLL:
          id v15 = *(void **)(&self->super.super.mProcessId + 1);
          uint64_t v16 = 1;
          goto LABEL_17;
        case 5uLL:
          id v15 = *(void **)(&self->super.super.mProcessId + 1);
          uint64_t v16 = 0;
LABEL_17:
          [v15 setBlockReporting:v16];
          break;
        default:
          break;
      }
    }
  }
  else
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "KWCMFrequencyToolResponse_Status", 0);
    [(WCM_Controller *)self sendMessage:2403 withArgs:v8];
  }
}

- (void).cxx_destruct
{
}

@end
@interface RTCReportingAVCLegacySupport
- (RTCReportingAVCLegacySupport)init;
- (id)awdAdaptor;
- (void)dealloc;
- (void)invokeAWDAdaptorForPayload:(id)a3 category:(unsigned __int16)a4 type:(unsigned __int16)a5;
- (void)sendPowerLogEventForClient:(id)a3 serviceName:(id)a4 payload:(id)a5 category:(unsigned __int16)a6 type:(unsigned __int16)a7 eventNumber:(unint64_t)a8;
@end

@implementation RTCReportingAVCLegacySupport

- (RTCReportingAVCLegacySupport)init
{
  v7.receiver = self;
  v7.super_class = (Class)RTCReportingAVCLegacySupport;
  v2 = [(RTCReportingAVCLegacySupport *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(9, 0);
    v2->_dispatchQ = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.rtcreporting.avclegacysupport", v3, global_queue);
    v2->_logger = (OS_os_log *)os_log_create("com.apple.rtcreporting", "AVCLegacySupport");
    os_log_t v5 = os_log_create("com.apple.rtcreporting", "AVCLegacySupport");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __createAWDAdaptorInstance_block_invoke;
    block[3] = &unk_1E576F360;
    block[4] = v5;
    if (createAWDAdaptorInstance_onceToken != -1) {
      dispatch_once(&createAWDAdaptorInstance_onceToken, block);
    }
    v2->_awdAdaptor = objc_alloc_init((Class)createAWDAdaptorInstance_awdAdaptorClass);
  }
  return v2;
}

- (void)dealloc
{
  self->_dispatchQ = 0;
  self->_awdAdaptor = 0;
  v3.receiver = self;
  v3.super_class = (Class)RTCReportingAVCLegacySupport;
  [(RTCReportingAVCLegacySupport *)&v3 dealloc];
}

- (void)invokeAWDAdaptorForPayload:(id)a3 category:(unsigned __int16)a4 type:(unsigned __int16)a5
{
  SEL v9 = NSSelectorFromString(&cfstr_Sendmessagewit.isa);
  if (objc_opt_respondsToSelector())
  {
    id v10 = a3;
    dispatchQ = self->_dispatchQ;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke;
    v12[3] = &unk_1E576F3D8;
    unsigned __int16 v13 = a4;
    unsigned __int16 v14 = a5;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = v9;
    dispatch_async(dispatchQ, v12);
  }
}

void __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  __int16 v5 = *(_WORD *)(a1 + 56);
  __int16 v4 = *(_WORD *)(a1 + 58);
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA18], "invocationWithMethodSignature:", objc_msgSend(*(id *)(v2 + 24), "methodSignatureForSelector:", *(void *)(a1 + 48)));
  [v3 setSelector:*(void *)(a1 + 48)];
  [v3 setTarget:*(void *)(*(void *)(a1 + 40) + 24)];
  [v3 setArgument:&v5 atIndex:2];
  [v3 setArgument:&v4 atIndex:3];
  [v3 setArgument:&v6 atIndex:4];
  [v3 invoke];
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 40) + 16), OS_LOG_TYPE_DEBUG)) {
    __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke_cold_1();
  }
}

- (void)sendPowerLogEventForClient:(id)a3 serviceName:(id)a4 payload:(id)a5 category:(unsigned __int16)a6 type:(unsigned __int16)a7 eventNumber:(unint64_t)a8
{
  if (MEMORY[0x1E4F92890])
  {
    uint64_t v10 = a6;
    if ([a3 isEqualToString:@"AVCVideoConference"])
    {
      if ([a4 isEqualToString:@"FaceTime"]) {
        v15 = &unk_1EE455110;
      }
      else {
        v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else if ([a3 isEqualToString:@"multiwayconference"] {
           && (([a4 isEqualToString:@"session"] & 1) != 0
    }
            || [a4 isEqualToString:@"twoway"]))
    {
      v15 = &unk_1EE455128;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    int v16 = objc_msgSend(v15, "containsObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", v10));
    if (v10 && v16)
    {
      if ([a5 count])
      {
        id v17 = a5;
        dispatchQ = self->_dispatchQ;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke;
        v19[3] = &unk_1E576F3D8;
        v19[4] = a5;
        v19[5] = self;
        __int16 v20 = v10;
        unsigned __int16 v21 = a7;
        v19[6] = a8;
        dispatch_async(dispatchQ, v19);
      }
    }
  }
}

void __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ParametersPayload"];
  if (!v2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2)
    {
      objc_super v3 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_2(v3);
      }
      uint64_t v2 = MEMORY[0x1E4F1CC08];
    }
  }
  __int16 v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v2];
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", *(unsigned __int16 *)(a1 + 56)), @"method");
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", *(unsigned __int16 *)(a1 + 58)), @"respCode");
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", *(void *)(a1 + 48)), @"event");
  PLLogRegisteredEvent();
  __int16 v5 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_1((unsigned __int16 *)(a1 + 56), (uint64_t *)(a1 + 48), v5);
  }
}

- (id)awdAdaptor
{
  return self->_awdAdaptor;
}

void __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_193646000, v0, OS_LOG_TYPE_DEBUG, "dispatched message %hu/%hu to AWDAdaptor", v1, 0xEu);
}

void __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_1(unsigned __int16 *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 136315650;
  id v6 = "-[RTCReportingAVCLegacySupport sendPowerLogEventForClient:serviceName:payload:category:type:eventNumber:]_block_invoke";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_193646000, log, OS_LOG_TYPE_DEBUG, "%s: sendMessage %hu:%llu", (uint8_t *)&v5, 0x1Cu);
}

void __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[RTCReportingAVCLegacySupport sendPowerLogEventForClient:serviceName:payload:category:type:eventNumber:]_block_invoke";
  _os_log_debug_impl(&dword_193646000, log, OS_LOG_TYPE_DEBUG, "%s: payload data is empty", (uint8_t *)&v1, 0xCu);
}

@end
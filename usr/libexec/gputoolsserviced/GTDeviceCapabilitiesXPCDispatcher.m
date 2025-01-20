@interface GTDeviceCapabilitiesXPCDispatcher
- (GTDeviceCapabilitiesXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)daemonDeviceCapabilities:(id)a3 replyConnection:(id)a4;
- (void)deviceCompatibilityCapabilitiesWithHeapDescriptors_:(id)a3 replyConnection:(id)a4;
- (void)gpuToolsVersionQuery:(id)a3 replyConnection:(id)a4;
- (void)inferiorEnvironment_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTDeviceCapabilitiesXPCDispatcher

- (GTDeviceCapabilitiesXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v11.receiver = self;
  v11.super_class = (Class)GTDeviceCapabilitiesXPCDispatcher;
  v9 = [(GTXPCDispatcher *)&v11 initWithProtocolMethods:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)daemonDeviceCapabilities:(id)a3 replyConnection:(id)a4
{
  service = self->_service;
  id v6 = a4;
  id v7 = a3;
  id v9 = [(GTDeviceCapabilities *)service daemonDeviceCapabilities];
  v8 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_nsobject(v8, "returnValue", (uint64_t)v9);
  [v6 sendMessage:v8];
}

- (void)gpuToolsVersionQuery:(id)a3 replyConnection:(id)a4
{
  service = self->_service;
  id v6 = a4;
  id v7 = a3;
  id v9 = [(GTDeviceCapabilities *)service gpuToolsVersionQuery];
  v8 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_nsobject(v8, "returnValue", (uint64_t)v9);
  [v6 sendMessage:v8];
}

- (void)inferiorEnvironment_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "launchDictionary");
  v8 = [(GTDeviceCapabilities *)self->_service inferiorEnvironment:nsdictionary_any];
  id v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_nsobject(v9, "environment", (uint64_t)v8);
  [v6 sendMessage:v9];
}

- (void)deviceCompatibilityCapabilitiesWithHeapDescriptors_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "heapDescriptors");
  v8 = [(GTDeviceCapabilities *)self->_service deviceCompatibilityCapabilitiesWithHeapDescriptors:nsdictionary_any];
  id v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v8);
  [v6 sendMessage:v9];
}

- (void).cxx_destruct
{
}

@end
@interface SEMAdminXPCClient
- (SEMAdminXPCClient)init;
- (void)beginEvaluation:(id)a3 completion:(id)a4;
- (void)endEvaluation:(id)a3;
- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4;
@end

@implementation SEMAdminXPCClient

- (SEMAdminXPCClient)init
{
  return (SEMAdminXPCClient *)MEMORY[0x270F9A6D0](self, sel_initWithServiceProtocol_machServiceName_clientId_interruptionCode_invalidationCode_, &unk_2709EB6B0, @"com.apple.siri.inference.EntityMatcher.admin");
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_25C7E1888;
  v9[3] = &unk_2654DE008;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_serviceRequest_completion_usingBlock_(self, v8, 0, (uint64_t)a4, v9);
}

- (void)endEvaluation:(id)a3
{
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_25C7E1924;
  v4[3] = &unk_2654DE048;
  BOOL v5 = a3;
  objc_msgSend_serviceRequest_completion_usingBlock_(self, a2, 0, (uint64_t)a4, v4);
}

@end
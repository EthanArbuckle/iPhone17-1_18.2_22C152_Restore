@interface SKGProcessorConnection
- (SKGProcessorConnection)init;
- (id)initForImporter;
- (void)checkProcessingReportForBundleIdentifier:(id)a3 flags:(unint64_t)a4 timeout:(unint64_t)a5 completion:(id)a6;
- (void)collectDiagnostics:(id)a3 completion:(id)a4;
- (void)eventsJournalsStatsWithCompletion:(id)a3;
- (void)getGenerationProgressReportFor:(id)a3 completion:(id)a4;
- (void)processRecord:(id)a3 referenceIdentifier:(id)a4 protectionClass:(id)a5 processorFlags:(unint64_t)a6 completionHandler:(id)a7;
- (void)setTurboMode:(BOOL)a3;
- (void)updateCheckedInClientWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SKGProcessorConnection

- (SKGProcessorConnection)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKGProcessorConnection;
  return [(CSXPCConnection *)&v3 initWithMachServiceName:@"com.apple.spotlightknowledged"];
}

void __86__SKGProcessorConnection_updateCheckedInClientWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = csimport_xpc_dictionary_decode_status_with_error(a2);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:-1 userInfo:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateCheckedInClientWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "processCheckedInBundleID");
  id v9 = v7;
  v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "bundleIdentifier", v10);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__SKGProcessorConnection_updateCheckedInClientWithBundleIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_265520FB8;
  id v13 = v6;
  id v11 = v6;
  [(CSXPCConnection *)self sendMessageAsync:v8 completion:v12];
}

- (id)initForImporter
{
  v3.receiver = self;
  v3.super_class = (Class)SKGProcessorConnection;
  return [(CSXPCConnection *)&v3 initWithMachServiceName:@"com.apple.spotlightknowledged.importer"];
}

- (void)processRecord:(id)a3 referenceIdentifier:(id)a4 protectionClass:(id)a5 processorFlags:(unint64_t)a6 completionHandler:(id)a7
{
  char v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a3;
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "command", "processRecord");
  id v17 = objc_alloc_init(MEMORY[0x263F02A30]);
  [v17 encodeObject:v15];

  id v18 = [v17 data];
  xpc_dictionary_set_data(v16, "record", (const void *)[v18 bytes], objc_msgSend(v18, "length"));
  if (v13) {
    v19 = (__CFString *)v13;
  }
  else {
    v19 = @"Default";
  }
  xpc_dictionary_set_string(v16, "protectionClass", (const char *)[(__CFString *)v19 UTF8String]);
  if (v12) {
    xpc_dictionary_set_string(v16, "referenceIdentifier", (const char *)[v12 UTF8String]);
  }
  xpc_dictionary_set_BOOL(v16, "includeEmbeddings", (v8 & 2) != 0);
  xpc_dictionary_set_BOOL(v16, "includeKeyphrases", (v8 & 4) != 0);
  xpc_dictionary_set_BOOL(v16, "includeSuggestedEvents", (v8 & 0x10) != 0);
  xpc_dictionary_set_BOOL(v16, "includePeople", (v8 & 8) != 0);
  xpc_dictionary_set_BOOL(v16, "includeDocUnderstanding", (v8 & 0x20) != 0);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __109__SKGProcessorConnection_processRecord_referenceIdentifier_protectionClass_processorFlags_completionHandler___block_invoke;
  v21[3] = &unk_265520FB8;
  id v22 = v14;
  id v20 = v14;
  [(CSXPCConnection *)self sendMessageAsync:v16 completion:v21];
}

void __109__SKGProcessorConnection_processRecord_referenceIdentifier_protectionClass_processorFlags_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_super v3 = csimport_xpc_dictionary_decode_status_with_error(v10);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F02A48]);
    id v7 = (void *)[MEMORY[0x263F02B30] copyNSDataForKey:"attrDict" fromXPCDictionary:v10];
    char v8 = (void *)[v6 initWithData:v7];
    id v5 = [v8 decode];

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v5, 0);
    }
  }
}

- (void)setTurboMode:(BOOL)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "command", "turboMode");
  xpc_dictionary_set_BOOL(xdict, "state", a3);
  [(CSXPCConnection *)self sendMessageAsync:xdict];
}

- (void)checkProcessingReportForBundleIdentifier:(id)a3 flags:(unint64_t)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  unint64_t v11 = (a4 >> 1) & 1;
  unint64_t v12 = (a4 >> 2) & 1;
  unint64_t v13 = (a4 >> 3) & 1;
  unint64_t v14 = (a4 >> 4) & 1;
  id v15 = a3;
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "command", "progressReportForBundleID");
  xpc_dictionary_set_BOOL(v16, "includeEmbeddings", v11);
  xpc_dictionary_set_BOOL(v16, "includeKeyphrases", v12);
  xpc_dictionary_set_BOOL(v16, "includeSuggestedEvents", v13);
  xpc_dictionary_set_BOOL(v16, "includeDocUnderstanding", v14);
  id v17 = v15;
  id v18 = (const char *)[v17 UTF8String];

  xpc_dictionary_set_string(v16, "bundleIdentifier", v18);
  xpc_dictionary_set_uint64(v16, "timeout", a5);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __92__SKGProcessorConnection_checkProcessingReportForBundleIdentifier_flags_timeout_completion___block_invoke;
  v20[3] = &unk_265520FB8;
  id v21 = v10;
  id v19 = v10;
  [(CSXPCConnection *)self sendMessageAsync:v16 completion:v20];
}

void __92__SKGProcessorConnection_checkProcessingReportForBundleIdentifier_flags_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = csimport_xpc_dictionary_decode_status_with_error(v3);
  xpc_dictionary_get_uint64(v3, "foundItemsCount");

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:-1 userInfo:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getGenerationProgressReportFor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = [v6 stringByAppendingString:@"GenerationProgress"];
  xpc_dictionary_set_string(v8, "command", (const char *)[v9 UTF8String]);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__SKGProcessorConnection_getGenerationProgressReportFor_completion___block_invoke;
  v12[3] = &unk_265520FE0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(CSXPCConnection *)self sendMessageAsync:v8 completion:v12];
}

void __68__SKGProcessorConnection_getGenerationProgressReportFor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = csimport_xpc_dictionary_decode_status_with_error(v3);
  if (v4)
  {
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:-1 userInfo:0];
  }
  else
  {
    id v7 = 0;
  }
  id v5 = [*(id *)(a1 + 32) stringByAppendingString:@"Report"];
  id v6 = xpc_dictionary_get_value(v3, (const char *)[v5 UTF8String]);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)collectDiagnostics:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "diagnose");
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "path", v10);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__SKGProcessorConnection_collectDiagnostics_completion___block_invoke;
  v12[3] = &unk_265520FB8;
  id v13 = v6;
  id v11 = v6;
  [(CSXPCConnection *)self sendMessageAsync:v8 completion:v12];
}

void __56__SKGProcessorConnection_collectDiagnostics_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = csimport_xpc_dictionary_decode_status_with_error(a2);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:-1 userInfo:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eventsJournalsStatsWithCompletion:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "eventsJournalsStats");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__SKGProcessorConnection_eventsJournalsStatsWithCompletion___block_invoke;
  v7[3] = &unk_265520FB8;
  id v8 = v4;
  id v6 = v4;
  [(CSXPCConnection *)self sendMessageAsync:v5 completion:v7];
}

void __60__SKGProcessorConnection_eventsJournalsStatsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = csimport_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:-1 userInfo:0];
  }
  else
  {
    id v4 = 0;
  }
  xpc_object_t v5 = unpackXPCDictRec(v6);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
@interface MLMediaLibraryServiceInterface
+ (id)clientInterface;
+ (id)serviceInterface;
@end

@implementation MLMediaLibraryServiceInterface

void __50__MLMediaLibraryServiceInterface_serviceInterface__block_invoke()
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0935670];
  v1 = (void *)serviceInterface_interface;
  serviceInterface_interface = v0;

  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v3 = MSVPropertyListDataClasses();
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v11 = [v3 setByAddingObjectsFromArray:v4];

  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [(id)serviceInterface_interface setClasses:v10 forSelector:sel_beginTransactionForDatabaseWithContext_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)serviceInterface_interface setClasses:v7 forSelector:sel_beginTransactionForDatabaseWithContext_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_executeUpdate_withParameters_onTransaction_withCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_executeQuery_withParameters_options_onTransaction_withCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_endTransaction_shouldCommit_withCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_performDatabaseOperation_withAttributes_options_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_setOptions_withCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_performImport_fromSource_withUUID_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v2 forSelector:sel_cancelImportOperation_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)serviceInterface_interface setClasses:v8 forSelector:sel_getLanguageResourcesWithCompletion_ argumentIndex:0 ofReply:1];
  v5 = (void *)serviceInterface_interface;
  v6 = MSVPropertyListDataClasses();
  [v5 setClasses:v6 forSelector:sel_executeQuery_withParameters_options_onTransaction_withCompletionHandler_ argumentIndex:0 ofReply:1];

  [(id)serviceInterface_interface setClasses:v11 forSelector:sel_performDatabaseOperation_withAttributes_options_completionHandler_ argumentIndex:1 ofReply:0];
  [(id)serviceInterface_interface setClasses:v11 forSelector:sel_performDatabaseOperation_withAttributes_options_completionHandler_ argumentIndex:2 ofReply:0];
  [(id)serviceInterface_interface setClasses:v9 forSelector:sel_performImport_fromSource_withUUID_completionHandler_ argumentIndex:0 ofReply:0];
}

uint64_t __49__MLMediaLibraryServiceInterface_clientInterface__block_invoke()
{
  clientInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F092AD08];

  return MEMORY[0x1F41817F8]();
}

+ (id)serviceInterface
{
  if (serviceInterface_onceToken != -1) {
    dispatch_once(&serviceInterface_onceToken, &__block_literal_global_19581);
  }
  v2 = (void *)serviceInterface_interface;

  return v2;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken[0] != -1) {
    dispatch_once(clientInterface_onceToken, &__block_literal_global_159);
  }
  v2 = (void *)clientInterface_interface;

  return v2;
}

@end
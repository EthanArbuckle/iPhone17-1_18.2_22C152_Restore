@interface REMXPCSuggestedAttributesPerformerInterface
+ (id)interface;
@end

@implementation REMXPCSuggestedAttributesPerformerInterface

void __56__REMXPCSuggestedAttributesPerformerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F139A6D0];
  v1 = (void *)interface_result_4;
  interface_result_4 = v0;

  v2 = (void *)interface_result_4;
  id v3 = +[REMXPCStorageClasses remStorageClasses];
  [v2 setClasses:v3 forSelector:sel_performSwiftInvocation_withParametersData_storages_completion_ argumentIndex:2 ofReply:0];
}

+ (id)interface
{
  if (interface_onceToken_5 != -1) {
    dispatch_once(&interface_onceToken_5, &__block_literal_global_32);
  }
  v2 = (void *)interface_result_4;

  return v2;
}

@end
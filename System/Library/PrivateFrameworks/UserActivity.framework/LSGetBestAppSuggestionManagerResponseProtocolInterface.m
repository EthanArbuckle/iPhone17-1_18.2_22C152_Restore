@interface LSGetBestAppSuggestionManagerResponseProtocolInterface
@end

@implementation LSGetBestAppSuggestionManagerResponseProtocolInterface

void ___LSGetBestAppSuggestionManagerResponseProtocolInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0CC4590];
  v1 = (void *)_LSGetBestAppSuggestionManagerResponseProtocolInterface_result;
  _LSGetBestAppSuggestionManagerResponseProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_LSGetBestAppSuggestionManagerResponseProtocolInterface_result setClasses:v4 forSelector:sel_notifyBestAppsChanged_when_confidence_ argumentIndex:0 ofReply:0];
}

@end
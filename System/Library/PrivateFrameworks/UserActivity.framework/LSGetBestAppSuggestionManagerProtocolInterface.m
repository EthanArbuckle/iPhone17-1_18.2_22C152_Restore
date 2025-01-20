@interface LSGetBestAppSuggestionManagerProtocolInterface
@end

@implementation LSGetBestAppSuggestionManagerProtocolInterface

void ___LSGetBestAppSuggestionManagerProtocolInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0CC7A58];
  v1 = (void *)_LSGetBestAppSuggestionManagerProtocolInterface_result;
  _LSGetBestAppSuggestionManagerProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_LSGetBestAppSuggestionManagerProtocolInterface_result setClasses:v4 forSelector:sel_doDetermineBestAppSuggestionWithCompletionHandler_ argumentIndex:0 ofReply:1];
}

@end
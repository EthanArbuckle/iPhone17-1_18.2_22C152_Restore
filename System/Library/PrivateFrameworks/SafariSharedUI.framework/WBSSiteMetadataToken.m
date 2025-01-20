@interface WBSSiteMetadataToken
@end

@implementation WBSSiteMetadataToken

void __42___WBSSiteMetadataToken_dispatchResponse___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 141558275;
    uint64_t v5 = 1752392040;
    __int16 v6 = 2117;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Dispatching response to handler of token %{sensitive, mask.hash}@", (uint8_t *)&v4, 0x16u);
  }
}

@end
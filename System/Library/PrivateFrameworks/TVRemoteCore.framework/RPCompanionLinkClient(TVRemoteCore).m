@interface RPCompanionLinkClient(TVRemoteCore)
- (void)tvrc_setAllowedTVs;
@end

@implementation RPCompanionLinkClient(TVRemoteCore)

- (void)tvrc_setAllowedTVs
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[RPCompanionLinkClient(TVRemoteCore) tvrc_setAllowedTVs]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_2266D3000, a2, OS_LOG_TYPE_DEBUG, "%s setting allowedTVs to %@", (uint8_t *)&v2, 0x16u);
}

@end
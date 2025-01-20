@interface NSURL
@end

@implementation NSURL

uint64_t __52__NSURL_RemoteUIAdditions__rui_isSupportedNativeURL__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"prefs", @"music", @"fmf1", @"applenews", @"itms-ui", 0);
  uint64_t v1 = rui_isSupportedNativeURL_supportedSchemes;
  rui_isSupportedNativeURL_supportedSchemes = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __52__NSURL_RemoteUIAdditions__rui_isSupportedSafariURL__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"http", @"https", 0);
  uint64_t v1 = rui_isSupportedSafariURL_supportedSafariSchemes;
  rui_isSupportedSafariURL_supportedSafariSchemes = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end
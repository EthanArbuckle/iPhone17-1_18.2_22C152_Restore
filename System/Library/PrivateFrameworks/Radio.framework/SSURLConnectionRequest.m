@interface SSURLConnectionRequest
@end

@implementation SSURLConnectionRequest

void __103__SSURLConnectionRequest_RadioAdditions__newRadioRequestWithRequestContext_requestProperties_storeBag___block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter;
  newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter = (uint64_t)v0;

  [(id)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  [(id)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter setLocale:v4];
  v2 = (void *)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter;
  v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];
}

@end
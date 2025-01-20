@interface SSURLConnectionRequest(RadioAdditions)
+ (RadioURLConnectionRequest)newRadioRequestWithRequestContext:()RadioAdditions requestProperties:storeBag:;
@end

@implementation SSURLConnectionRequest(RadioAdditions)

+ (RadioURLConnectionRequest)newRadioRequestWithRequestContext:()RadioAdditions requestProperties:storeBag:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v8;
  }
  else {
    id v10 = (id)[v8 mutableCopy];
  }
  v11 = v10;
  v12 = (void *)MGCopyAnswer();
  v13 = [@"2/" stringByAppendingString:v12];

  [v11 setValue:v13 forHTTPHeaderField:@"X-Apple-Radio-Client-Version"];
  if (newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatterOnceToken != -1) {
    dispatch_once(&newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatterOnceToken, &__block_literal_global_673);
  }
  v14 = (void *)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter;
  v15 = [MEMORY[0x263EFF910] date];
  v16 = [v14 stringFromDate:v15];

  if ([v16 length]) {
    [v11 setValue:v16 forHTTPHeaderField:@"X-Apple-I-Client-Time"];
  }
  v17 = NSString;
  v18 = [MEMORY[0x263EFFA18] systemTimeZone];
  v19 = objc_msgSend(v17, "stringWithFormat:", @"%li", objc_msgSend(v18, "secondsFromGMT"));

  if ([v19 length]) {
    [v11 setValue:v19 forHTTPHeaderField:@"X-Apple-Tz"];
  }
  [v11 setShouldDecodeResponse:0];
  [v11 setMachineDataStyle:2];
  v20 = [v11 HTTPBody];
  if ([v20 length])
  {
    v21 = MSVGzipCompressData();
    if ([v21 length])
    {
      [v11 setHTTPBody:v21];
      [v11 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    }
  }
  v22 = [(SSURLConnectionRequest *)[RadioURLConnectionRequest alloc] initWithRequestProperties:v11];
  v23 = [v9 URLBagDictionary];

  [(SSURLConnectionRequest *)v22 configureWithURLBagDictionary:v23];
  [(SSURLConnectionRequest *)v22 setShouldMescalSign:1];
  if ([v7 usesLocalNetworking])
  {
    [(SSURLConnectionRequest *)v22 setRunsInProcess:1];
    v24 = [v7 SAPSession];
    [(SSURLConnectionRequest *)v22 setSAPSession:v24];

    v25 = (void *)[objc_alloc(MEMORY[0x263F7B3C8]) initWithPolicyType:1];
    [(SSURLConnectionRequest *)v22 setSAPSignaturePolicy:v25];
  }
  return v22;
}

@end
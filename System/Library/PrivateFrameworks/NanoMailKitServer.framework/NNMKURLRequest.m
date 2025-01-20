@interface NNMKURLRequest
+ (id)_buildNumber;
+ (id)_hardwareModel;
+ (id)_methodNameForType:(unint64_t)a3;
+ (id)_osName;
+ (id)_osVersion;
+ (id)_systemVersionDictionary;
+ (id)mailNotificationURL;
+ (id)serverFriendlyDescription;
+ (void)_formBodyRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 method:(id)a6 token:(id)a7 errorParser:(id)a8 completion:(id)a9;
+ (void)_getRequestWithBaseURLString:(id)a3 path:(id)a4 params:(id)a5 token:(id)a6 errorParser:(id)a7 completion:(id)a8;
+ (void)_handleRequest:(id)a3 errorParser:(id)a4 completion:(id)a5;
+ (void)_jsonBodyRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 method:(id)a6 token:(id)a7 needsBAA:(BOOL)a8 errorParser:(id)a9 completion:(id)a10;
+ (void)formPostRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7;
+ (void)getRequestWithBaseURLString:(id)a3 path:(id)a4 params:(id)a5 token:(id)a6 completion:(id)a7;
+ (void)patchRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7;
+ (void)postRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7;
+ (void)postRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 needsBAA:(BOOL)a7 completion:(id)a8;
+ (void)requestWithType:(unint64_t)a3 baseURLString:(id)a4 path:(id)a5 body:(id)a6 token:(id)a7 needsBAA:(BOOL)a8 errorParser:(id)a9 completion:(id)a10;
@end

@implementation NNMKURLRequest

+ (id)mailNotificationURL
{
  nnmk_setupLoggingSubsystems();
  if (!os_variant_has_internal_ui()
    || (v2 = (__CFString *)CFPreferencesCopyAppValue(@"NanoMailCloudNotificationStagingServer", @"com.apple.NanoMail")) == 0)
  {
    v2 = @"https://mailnotifications.apple.com";
  }
  return v2;
}

+ (void)requestWithType:(unint64_t)a3 baseURLString:(id)a4 path:(id)a5 body:(id)a6 token:(id)a7 needsBAA:(BOOL)a8 errorParser:(id)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v23 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  switch(a3)
  {
    case 0uLL:
      [a1 _getRequestWithBaseURLString:v23 path:v16 params:v17 token:v18 errorParser:v19 completion:v20];
      break;
    case 1uLL:
    case 3uLL:
    case 4uLL:
      v21 = [a1 _methodNameForType:a3];
      [a1 _jsonBodyRequestWithBaseURLString:v23 path:v16 body:v17 method:v21 token:v18 needsBAA:v10 errorParser:v19 completion:v20];

      break;
    case 2uLL:
      v22 = [a1 _methodNameForType:2];
      [a1 _formBodyRequestWithBaseURLString:v23 path:v16 body:v17 method:v22 token:v18 errorParser:v19 completion:v20];

      break;
    default:
      break;
  }
}

+ (void)postRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7
{
}

+ (void)postRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 needsBAA:(BOOL)a7 completion:(id)a8
{
}

+ (void)formPostRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7
{
}

+ (void)patchRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 token:(id)a6 completion:(id)a7
{
}

+ (void)getRequestWithBaseURLString:(id)a3 path:(id)a4 params:(id)a5 token:(id)a6 completion:(id)a7
{
}

+ (void)_getRequestWithBaseURLString:(id)a3 path:(id)a4 params:(id)a5 token:(id)a6 errorParser:(id)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = (objc_class *)MEMORY[0x263F08BA0];
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  id v20 = a3;
  v21 = (void *)[[v16 alloc] initWithString:v20];

  [v21 setPath:v19];
  if ([v14 count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __88__NNMKURLRequest__getRequestWithBaseURLString_path_params_token_errorParser_completion___block_invoke;
    v28[3] = &unk_264E99FE0;
    id v29 = v22;
    id v23 = v22;
    [v14 enumerateKeysAndObjectsUsingBlock:v28];
    [v21 setQueryItems:v23];
  }
  v24 = (void *)MEMORY[0x263F089E0];
  v25 = [v21 URL];
  v26 = [v24 requestWithURL:v25];

  if (v15)
  {
    v27 = [NSString stringWithFormat:@"Bearer %@", v15];
    [v26 addValue:v27 forHTTPHeaderField:@"Authorization"];
  }
  [v26 setHTTPMethod:@"GET"];
  [a1 _handleRequest:v26 errorParser:v18 completion:v17];
}

void __88__NNMKURLRequest__getRequestWithBaseURLString_path_params_token_errorParser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x263F08BD0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithName:v7 value:v6];

  [v4 addObject:v8];
}

+ (void)_jsonBodyRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 method:(id)a6 token:(id)a7 needsBAA:(BOOL)a8 errorParser:(id)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v34 = a9;
  id v19 = (void (**)(id, void, id))a10;
  id v20 = NSURL;
  id v21 = a6;
  v22 = [v20 URLWithString:a3];
  id v23 = v22;
  id v33 = a1;
  if (v16)
  {
    id v24 = [v22 URLByAppendingPathComponent:v16];
  }
  else
  {
    id v24 = v22;
  }
  v25 = v24;
  v26 = [MEMORY[0x263F089E0] requestWithURL:v24];
  if (v18)
  {
    v27 = [NSString stringWithFormat:@"Bearer %@", v18];
    [v26 addValue:v27 forHTTPHeaderField:@"Authorization"];
  }
  [v26 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v26 setHTTPMethod:v21];

  if (v10)
  {
    v28 = +[NNMKURLRequest serverFriendlyDescription];
    [v26 addValue:v28 forHTTPHeaderField:@"X-MMe-Client-Info"];
  }
  if (v17) {
    id v29 = v17;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA78];
  }
  id v40 = 0;
  v30 = [MEMORY[0x263F08900] dataWithJSONObject:v29 options:0 error:&v40];
  id v31 = v40;
  [v26 setHTTPBody:v30];
  if (v31)
  {
    v19[2](v19, 0, v31);
    v32 = v34;
  }
  else if (v10)
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __107__NNMKURLRequest__jsonBodyRequestWithBaseURLString_path_body_method_token_needsBAA_errorParser_completion___block_invoke;
    v35[3] = &unk_264E9A008;
    v37 = v19;
    id v36 = v26;
    v32 = v34;
    id v39 = v33;
    id v38 = v34;
    +[NNMKBAAManager appleAuthHeaderFrom:v30 completion:v35];
  }
  else
  {
    v32 = v34;
    [v33 _handleRequest:v26 errorParser:v34 completion:v19];
  }
}

uint64_t __107__NNMKURLRequest__jsonBodyRequestWithBaseURLString_path_body_method_token_needsBAA_errorParser_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    [*(id *)(a1 + 32) addValue:a2 forHTTPHeaderField:@"X-Apple-Authentication"];
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    return [v6 _handleRequest:v8 errorParser:v7 completion:v9];
  }
}

+ (void)_formBodyRequestWithBaseURLString:(id)a3 path:(id)a4 body:(id)a5 method:(id)a6 token:(id)a7 errorParser:(id)a8 completion:(id)a9
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = NSURL;
  id v32 = a9;
  id v18 = a8;
  id v19 = a5;
  id v20 = [v17 URLWithString:a3];
  id v21 = v20;
  id v34 = v14;
  if (v14)
  {
    id v22 = [v20 URLByAppendingPathComponent:v14];
  }
  else
  {
    id v22 = v20;
  }
  id v23 = v22;
  id v24 = [MEMORY[0x263F089E0] requestWithURL:v22];
  if (v16)
  {
    v25 = [NSString stringWithFormat:@"Bearer %@", v16];
    [v24 addValue:v25 forHTTPHeaderField:@"Authorization"];
  }
  [v24 setHTTPMethod:v15];
  v26 = objc_opt_new();
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __98__NNMKURLRequest__formBodyRequestWithBaseURLString_path_body_method_token_errorParser_completion___block_invoke;
  v35[3] = &unk_264E9A030;
  id v36 = v26;
  id v27 = v26;
  [v19 enumerateKeysAndObjectsUsingBlock:v35];

  v28 = [v27 dataUsingEncoding:1];
  [v24 setHTTPBody:v28];
  [v24 addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  id v29 = v15;
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "length"));
  id v31 = [v30 stringValue];
  [v24 setValue:v31 forHTTPHeaderField:@"Content-Length"];

  [a1 _handleRequest:v24 errorParser:v18 completion:v32];
}

void __98__NNMKURLRequest__formBodyRequestWithBaseURLString_path_body_method_token_errorParser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  if ([v5 length]) {
    uint64_t v7 = @"&%@=%@";
  }
  else {
    uint64_t v7 = @"%@=%@";
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", v7, v8, v6);
}

+ (void)_handleRequest:(id)a3 errorParser:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [MEMORY[0x263F08BF8] sharedSession];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke;
  v15[3] = &unk_264E9A058;
  id v16 = v7;
  id v17 = v9;
  id v18 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  id v14 = [v10 dataTaskWithRequest:v13 completionHandler:v15];

  [v14 resume];
}

void __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v39[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 statusCode];
    if (v9)
    {
LABEL_3:
      id v11 = NSString;
      id v12 = [*(id *)(a1 + 32) URL];
      id v13 = [v12 absoluteString];
      id v14 = [v9 localizedDescription];
      id v15 = [v11 stringWithFormat:@"%@: %@", v13, v14];

      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = (void *)MEMORY[0x263F087E8];
      id v18 = [v9 domain];
      uint64_t v19 = [v9 code];
      uint64_t v38 = *MEMORY[0x263F08320];
      v39[0] = v15;
      id v20 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
      id v21 = [v17 errorWithDomain:v18 code:v19 userInfo:v20];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v21);

      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v10 = -1;
    if (v9) {
      goto LABEL_3;
    }
  }
  if (!v7 || v10 < 200 || v10 > 299)
  {
    if ([v7 length])
    {
      uint64_t v36 = 0;
      id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v36];
      uint64_t v24 = *(void *)(a1 + 48);
      if (v24)
      {
        if (v9)
        {
          uint64_t v25 = (*(void (**)(uint64_t, id))(v24 + 16))(v24, v9);
          if (v25)
          {
            v26 = (void *)v25;
            id v27 = NSString;
            v28 = [*(id *)(a1 + 32) URL];
            id v29 = [v28 absoluteString];
            v30 = [v27 stringWithFormat:@"%@: %@", v29, v26];

            id v31 = [MEMORY[0x263F087E8] httpErrorWithCode:v10 message:v30];

            uint64_t v32 = *(void *)(a1 + 40);
            if (v31)
            {
              (*(void (**)(void, id, void *))(v32 + 16))(*(void *)(a1 + 40), v9, v31);
LABEL_22:

              goto LABEL_25;
            }
LABEL_21:
            id v33 = (void *)MEMORY[0x263F087E8];
            id v31 = [*(id *)(a1 + 32) URL];
            id v34 = [v31 absoluteString];
            v35 = [v33 httpErrorWithCode:v10 message:v34];
            (*(void (**)(uint64_t, id, void *))(v32 + 16))(v32, v9, v35);

            goto LABEL_22;
          }
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v32 = *(void *)(a1 + 40);
    goto LABEL_21;
  }
  if ([v7 length])
  {
    id v37 = 0;
    id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v37];
    id v22 = v37;
    if (v22)
    {
      id v23 = (void *)__logCategories;
      if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR)) {
        __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke_cold_1(v23, v22);
      }
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x263EFFA78];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_25:
}

+ (id)_methodNameForType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"GET";
  }
  else {
    return off_264E9A098[a3 - 1];
  }
}

+ (id)serverFriendlyDescription
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NNMKURLRequest_serverFriendlyDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serverFriendlyDescription_onceToken != -1) {
    dispatch_once(&serverFriendlyDescription_onceToken, block);
  }
  v2 = (void *)serverFriendlyDescription__serverFriendlyDescription;
  return v2;
}

void __43__NNMKURLRequest_serverFriendlyDescription__block_invoke()
{
  id v20 = +[NNMKURLRequest _hardwareModel];
  v0 = NSString;
  v1 = +[NNMKURLRequest _osName];
  v2 = +[NNMKURLRequest _osVersion];
  v3 = +[NNMKURLRequest _buildNumber];
  v4 = [v0 stringWithFormat:@"%@;%@;%@", v1, v2, v3];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 infoDictionary];
  uint64_t v7 = *MEMORY[0x263EFFB70];
  id v8 = [v6 objectForKey:*MEMORY[0x263EFFB70]];

  id v9 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v10 = [v9 infoDictionary];
  id v11 = [v10 objectForKey:v7];

  id v12 = NSString;
  id v13 = [v5 bundleIdentifier];
  uint64_t v14 = [v9 bundleIdentifier];
  id v15 = (void *)v14;
  uint64_t v16 = @"1.0";
  if (v11) {
    uint64_t v16 = v11;
  }
  id v17 = [v12 stringWithFormat:@"%@/%@ (%@/%@)", v13, v8, v14, v16];

  uint64_t v18 = [NSString stringWithFormat:@"<%@> <%@> <%@>", v20, v4, v17];
  uint64_t v19 = (void *)serverFriendlyDescription__serverFriendlyDescription;
  serverFriendlyDescription__serverFriendlyDescription = v18;
}

+ (id)_systemVersionDictionary
{
  if (_systemVersionDictionary_onceToken != -1) {
    dispatch_once(&_systemVersionDictionary_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_systemVersionDictionary_platformDictionary;
  return v2;
}

uint64_t __42__NNMKURLRequest__systemVersionDictionary__block_invoke()
{
  _systemVersionDictionary_platformDictionary = _CFCopySystemVersionDictionary();
  return MEMORY[0x270F9A758]();
}

+ (id)_osName
{
  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2) {
    v2 = @"Unknown";
  }
  v4 = v2;

  return v4;
}

+ (id)_osVersion
{
  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2) {
    v2 = @"Unknown";
  }
  v4 = v2;

  return v4;
}

+ (id)_buildNumber
{
  v2 = [a1 _systemVersionDictionary];
  v3 = [v2 objectForKey:*MEMORY[0x263EFFAB0]];

  return v3;
}

+ (id)_hardwareModel
{
  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2) {
    v2 = @"Unknown";
  }
  v4 = v2;

  return v4;
}

void __56__NNMKURLRequest__handleRequest_errorParser_completion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "Unable to parse JSON response: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end
@interface NSError(WebKitExtras)
+ (id)_webkit_errorWithDomain:()WebKitExtras code:URL:;
+ (uint64_t)_webKitErrorWithCode:()WebKitExtras failingURL:;
+ (uint64_t)_webKitErrorWithDomain:()WebKitExtras code:URL:;
+ (uint64_t)_webkit_addErrorsWithCodesAndDescriptions:()WebKitExtras inDomain:;
+ (void)_registerWebKitErrors;
- (uint64_t)_initWithPluginErrorCode:()WebKitExtras contentURL:pluginPageURL:pluginName:MIMEType:;
@end

@implementation NSError(WebKitExtras)

+ (void)_registerWebKitErrors
{
  if (_registerWebKitErrors_flag != -1) {
    dispatch_once(&_registerWebKitErrors_flag, &__block_literal_global_3);
  }
}

+ (id)_webkit_errorWithDomain:()WebKitExtras code:URL:
{
  v5 = objc_msgSend([a1 alloc], "_webkit_initWithDomain:code:URL:", a3, a4, a5);
  return v5;
}

+ (uint64_t)_webKitErrorWithDomain:()WebKitExtras code:URL:
{
  [a1 _registerWebKitErrors];
  return objc_msgSend(a1, "_webkit_errorWithDomain:code:URL:", a3, a4, a5);
}

+ (uint64_t)_webKitErrorWithCode:()WebKitExtras failingURL:
{
  v6 = WebKitErrorDomain;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "_webkit_URLWithUserTypedString:", a4);
  return [a1 _webKitErrorWithDomain:v6 code:a3 URL:v7];
}

- (uint64_t)_initWithPluginErrorCode:()WebKitExtras contentURL:pluginPageURL:pluginName:MIMEType:
{
  [(id)objc_opt_class() _registerWebKitErrors];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = (void *)[(id)descriptions objectForKey:WebKitErrorDomain];
  uint64_t v15 = objc_msgSend(v14, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", a3));
  if (v15) {
    [v13 setObject:v15 forKey:*MEMORY[0x1E4F28568]];
  }
  if (a4)
  {
    [v13 setObject:a4 forKey:@"NSErrorFailingURLKey"];
    uint64_t v16 = objc_msgSend(a4, "_web_userVisibleString");
    [v13 setObject:v16 forKey:*MEMORY[0x1E4F289C0]];
  }
  if (a5) {
    objc_msgSend(v13, "setObject:forKey:", objc_msgSend(a5, "_web_userVisibleString"), @"WebKitErrorPlugInPageURLStringKey");
  }
  if (a6) {
    [v13 setObject:a6 forKey:@"WebKitErrorPlugInNameKey"];
  }
  if (a7) {
    [v13 setObject:a7 forKey:@"WebKitErrorMIMETypeKey"];
  }
  if ([v13 count]) {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v13];
  }
  else {
    v17 = 0;
  }

  uint64_t v18 = [a1 initWithDomain:WebKitErrorDomain code:(int)a3 userInfo:v17];
  return v18;
}

+ (uint64_t)_webkit_addErrorsWithCodesAndDescriptions:()WebKitExtras inDomain:
{
  id v6 = (id)descriptions;
  if (!descriptions)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    descriptions = (uint64_t)v6;
  }
  return [v6 setObject:a3 forKey:a4];
}

@end
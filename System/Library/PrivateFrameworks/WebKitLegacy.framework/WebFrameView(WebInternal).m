@interface WebFrameView(WebInternal)
+ (uint64_t)_viewTypesAllowImageTypeOmission:()WebInternal;
@end

@implementation WebFrameView(WebInternal)

+ (uint64_t)_viewTypesAllowImageTypeOmission:()WebInternal
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *a1 = v2;
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(+[WebHTMLView supportedNonImageMIMETypes](WebHTMLView, "supportedNonImageMIMETypes"), "objectEnumerator");
  for (uint64_t i = [v4 nextObject]; ; uint64_t i = objc_msgSend(v4, "nextObject"))
  {
    uint64_t v6 = i;
    if (!i) {
      break;
    }
    if (![v2 objectForKey:i]) {
      [v2 setObject:v3 forKey:v6];
    }
  }
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(+[WebHTMLView supportedMediaMIMETypes](WebHTMLView, "supportedMediaMIMETypes"), "objectEnumerator");
  for (uint64_t j = [v8 nextObject]; ; uint64_t j = objc_msgSend(v8, "nextObject"))
  {
    uint64_t v10 = j;
    if (!j) {
      break;
    }
    if (![v2 objectForKey:j]) {
      [v2 setObject:v7 forKey:v10];
    }
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitOmitPDFSupport");
  if ((result & 1) == 0)
  {
    +[WebView _getPDFViewClass];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend((id)-[objc_class supportedMIMETypes](+[WebView _getPDFViewClass](WebView, "_getPDFViewClass"), "supportedMIMETypes"), "objectEnumerator");
    for (uint64_t result = [v13 nextObject]; ; uint64_t result = objc_msgSend(v13, "nextObject"))
    {
      uint64_t v14 = result;
      if (!result) {
        break;
      }
      if (![v2 objectForKey:result]) {
        [v2 setObject:v12 forKey:v14];
      }
    }
  }
  return result;
}

@end
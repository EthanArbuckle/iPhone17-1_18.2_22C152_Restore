@interface NSURL(WebNSURLExtras)
+ (uint64_t)_web_URLWithDataAsString:()WebNSURLExtras;
+ (uint64_t)_web_URLWithDataAsString:()WebNSURLExtras relativeToURL:;
+ (uint64_t)_web_URLWithUserTypedString:()WebNSURLExtras;
+ (uint64_t)_webkit_URLWithUserTypedString:()WebNSURLExtras;
- (BOOL)_web_isEmpty;
- (id)_web_hostString;
- (id)_web_originalDataAsString;
- (uint64_t)_web_URLByRemovingUserInfo;
- (uint64_t)_web_URLCString;
- (uint64_t)_web_schemeData;
- (uint64_t)_web_userVisibleString;
- (uint64_t)_webkit_URLByRemovingFragment;
- (uint64_t)_webkit_URLFromURLOrSchemelessFileURL;
- (uint64_t)_webkit_canonicalize;
- (uint64_t)_webkit_canonicalize_with_wtf;
- (uint64_t)_webkit_isFileURL;
- (uint64_t)_webkit_isJavaScriptURL;
- (uint64_t)_webkit_scriptIfJavaScriptURL;
- (uint64_t)_webkit_suggestedFilenameWithMIMEType:()WebNSURLExtras;
- (void)_web_hostData;
@end

@implementation NSURL(WebNSURLExtras)

+ (uint64_t)_web_URLWithUserTypedString:()WebNSURLExtras
{
  return MEMORY[0x1F40EB840](a3);
}

+ (uint64_t)_webkit_URLWithUserTypedString:()WebNSURLExtras
{
  return MEMORY[0x1F40EB6A8](a3, 0);
}

+ (uint64_t)_web_URLWithDataAsString:()WebNSURLExtras
{
  return objc_msgSend(a1, "_web_URLWithDataAsString:relativeToURL:", a3, 0);
}

+ (uint64_t)_web_URLWithDataAsString:()WebNSURLExtras relativeToURL:
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "_webkit_stringByTrimmingWhitespace"), "dataUsingEncoding:", 5);
  return MEMORY[0x1F40EAF40](v5, a4);
}

- (id)_web_originalDataAsString
{
  id v2 = [NSString alloc];
  v4 = (const void *)objc_msgSend(v2, "initWithData:encoding:", WTF::originalURLData(a1, v3), 5);
  uint64_t v5 = (void *)CFMakeCollectable(v4);
  return v5;
}

- (uint64_t)_web_userVisibleString
{
  return MEMORY[0x1F40EB4D8]();
}

- (BOOL)_web_isEmpty
{
  if (CFURLGetBaseURL(a1)) {
    return objc_msgSend((id)WTF::originalURLData(a1, v2), "length") == 0;
  }
  else {
    return CFURLGetBytes(a1, 0, 0) == 0;
  }
}

- (uint64_t)_web_URLCString
{
  id v2 = (void *)[MEMORY[0x1E4F1CA58] data];
  objc_msgSend(v2, "appendData:", WTF::originalURLData(a1, v3));
  [v2 appendBytes:&unk_1E149DE00 length:1];
  return [v2 bytes];
}

- (uint64_t)_webkit_canonicalize
{
  return MEMORY[0x1F4170ED0]();
}

- (uint64_t)_webkit_canonicalize_with_wtf
{
  MEMORY[0x1E4E441F0](&v5, a1);
  if (v6) {
    uint64_t v2 = WTF::URL::operator NSURL *();
  }
  else {
    uint64_t v2 = 0;
  }
  v3 = v5;
  uint64_t v5 = 0;
  if (!v3) {
    return v2;
  }
  if (*(_DWORD *)v3 != 2)
  {
    *(_DWORD *)v3 -= 2;
    return v2;
  }
  WTF::StringImpl::destroy(v3, v1);
  return v2;
}

- (uint64_t)_webkit_URLByRemovingFragment
{
  return MEMORY[0x1F40EB950](a1, 12);
}

- (uint64_t)_web_URLByRemovingUserInfo
{
  return MEMORY[0x1F40EB660]();
}

- (uint64_t)_webkit_isJavaScriptURL
{
  v1 = objc_msgSend(a1, "_web_originalDataAsString");
  return objc_msgSend(v1, "_webkit_isJavaScriptURL");
}

- (uint64_t)_webkit_scriptIfJavaScriptURL
{
  v1 = (void *)[a1 absoluteString];
  return objc_msgSend(v1, "_webkit_scriptIfJavaScriptURL");
}

- (uint64_t)_webkit_isFileURL
{
  v1 = objc_msgSend(a1, "_web_originalDataAsString");
  return objc_msgSend(v1, "_webkit_isFileURL");
}

- (uint64_t)_web_schemeData
{
  return WTF::dataForURLComponentType(a1, (NSURL *)1, a3);
}

- (void)_web_hostData
{
  v4 = (void *)WTF::dataForURLComponentType(a1, (NSURL *)8, a3);
  if (objc_msgSend(v4, "_web_isCaseInsensitiveEqualToCString:", "localhost")
    && (objc_msgSend((id)-[WTF _web_schemeData](a1, "_web_schemeData"), "_web_isCaseInsensitiveEqualToCString:", "file") & 1) != 0)
  {
    return 0;
  }
  return v4;
}

- (id)_web_hostString
{
  v1 = (void *)CFMakeCollectable((CFTypeRef)objc_msgSend([NSString alloc], "initWithData:encoding:", objc_msgSend(a1, "_web_hostData"), 4));
  return v1;
}

- (uint64_t)_webkit_suggestedFilenameWithMIMEType:()WebNSURLExtras
{
  MEMORY[0x1E4E442D0](&v8, a3);
  uint64_t v5 = suggestedFilenameWithMIMEType(a1, (const WTF::String *)&v8);
  char v6 = v8;
  v8 = 0;
  if (!v6) {
    return v5;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v6, v4);
  return v5;
}

- (uint64_t)_webkit_URLFromURLOrSchemelessFileURL
{
  if ([a1 scheme]) {
    return (uint64_t)a1;
  }
  v3 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v4 = objc_msgSend(@"file:", "stringByAppendingString:", objc_msgSend(a1, "absoluteString"));
  return [v3 URLWithString:v4];
}

@end
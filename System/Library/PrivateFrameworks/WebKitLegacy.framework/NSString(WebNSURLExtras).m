@interface NSString(WebNSURLExtras)
- (BOOL)_webkit_isFileURL;
- (BOOL)_webkit_looksLikeAbsoluteURL;
- (CFTypeRef)_webkit_rangeOfURLScheme;
- (__CFString)_webkit_stringByReplacingValidPercentEscapes;
- (uint64_t)_web_decodeHostName;
- (uint64_t)_web_encodeHostName;
- (uint64_t)_web_isUserVisibleURL;
- (uint64_t)_webkit_isJavaScriptURL;
- (uint64_t)_webkit_rangeOfURLScheme;
- (uint64_t)_webkit_scriptIfJavaScriptURL;
@end

@implementation NSString(WebNSURLExtras)

- (uint64_t)_web_isUserVisibleURL
{
  return MEMORY[0x1F40EB428]();
}

- (uint64_t)_webkit_isJavaScriptURL
{
  return objc_msgSend(a1, "_webkit_hasCaseInsensitivePrefix:", @"javascript:");
}

- (BOOL)_webkit_isFileURL
{
  return [a1 rangeOfString:@"file:" options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (__CFString)_webkit_stringByReplacingValidPercentEscapes
{
  v1 = (PAL *)MEMORY[0x1E4E442D0](&v7, a1);
  PAL::UTF8Encoding(v1);
  PAL::decodeURLEscapeSequences();
  if (v8)
  {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    v4 = v8;
    v8 = 0;
    if (v4)
    {
      if (*(_DWORD *)v4 == 2)
      {
        WTF::StringImpl::destroy(v4, v2);
        v5 = v7;
        v7 = 0;
        if (!v5) {
          return v3;
        }
      }
      else
      {
        *(_DWORD *)v4 -= 2;
        v5 = v7;
        v7 = 0;
        if (!v5) {
          return v3;
        }
      }
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
    v3 = &stru_1F3C7DA90;
  }
  v5 = v7;
  v7 = 0;
  if (!v5) {
    return v3;
  }
LABEL_8:
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (uint64_t)_webkit_scriptIfJavaScriptURL
{
  if (!objc_msgSend(a1, "_webkit_isJavaScriptURL")) {
    return 0;
  }
  v2 = (void *)[a1 substringFromIndex:11];
  return objc_msgSend(v2, "_webkit_stringByReplacingValidPercentEscapes");
}

- (uint64_t)_web_decodeHostName
{
  uint64_t result = WTF::decodeHostName(a1, a2);
  if (!result) {
    return (uint64_t)a1;
  }
  return result;
}

- (uint64_t)_web_encodeHostName
{
  uint64_t result = WTF::encodeHostName(a1, a2);
  if (!result) {
    return (uint64_t)a1;
  }
  return result;
}

- (uint64_t)_webkit_rangeOfURLScheme
{
  uint64_t v2 = [a1 rangeOfString:@":"];
  if (v2) {
    BOOL v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v4 = v2;
  if (_MergedGlobals_21 == 1)
  {
    uint64_t v5 = qword_1EB3A9810;
  }
  else
  {
    -[NSString(WebNSURLExtras) _webkit_rangeOfURLScheme]::$_0::operator()(&v8);
    uint64_t v5 = v8;
    qword_1EB3A9810 = v8;
    _MergedGlobals_21 = 1;
  }
  uint64_t v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, v4);
  uint64_t result = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (CFTypeRef)_webkit_rangeOfURLScheme
{
  CFTypeRef result = (CFTypeRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+.-"), "invertedSet");
  *a1 = result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

- (BOOL)_webkit_looksLikeAbsoluteURL
{
  return objc_msgSend((id)objc_msgSend(a1, "_webkit_stringByTrimmingWhitespace"), "_webkit_rangeOfURLScheme") != 0x7FFFFFFFFFFFFFFFLL;
}

@end
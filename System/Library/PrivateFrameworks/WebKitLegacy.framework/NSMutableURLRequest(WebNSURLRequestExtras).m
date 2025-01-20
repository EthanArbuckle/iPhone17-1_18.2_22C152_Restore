@interface NSMutableURLRequest(WebNSURLRequestExtras)
- (uint64_t)_web_setHTTPContentType:()WebNSURLRequestExtras;
- (uint64_t)_web_setHTTPReferrer:()WebNSURLRequestExtras;
- (uint64_t)_web_setHTTPUserAgent:()WebNSURLRequestExtras;
@end

@implementation NSMutableURLRequest(WebNSURLRequestExtras)

- (uint64_t)_web_setHTTPContentType:()WebNSURLRequestExtras
{
  return [a1 setValue:a3 forHTTPHeaderField:@"Content-Type"];
}

- (uint64_t)_web_setHTTPReferrer:()WebNSURLRequestExtras
{
  uint64_t result = objc_msgSend(a3, "_webkit_isFileURL");
  if ((result & 1) == 0)
  {
    uint64_t result = [a3 length];
    if (result)
    {
      return [a1 setValue:a3 forHTTPHeaderField:@"Referer"];
    }
  }
  return result;
}

- (uint64_t)_web_setHTTPUserAgent:()WebNSURLRequestExtras
{
  return [a1 setValue:a3 forHTTPHeaderField:@"User-Agent"];
}

@end
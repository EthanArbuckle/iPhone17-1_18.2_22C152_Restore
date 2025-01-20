@interface NSDictionary(UIWebBrowserViewPrivate)
- (uint64_t)_web_messageLineNumber;
- (uint64_t)_web_messageSourceURL;
- (uint64_t)_web_messageText;
- (uint64_t)_web_messageType;
@end

@implementation NSDictionary(UIWebBrowserViewPrivate)

- (uint64_t)_web_messageText
{
  return [a1 objectForKey:@"message"];
}

- (uint64_t)_web_messageLineNumber
{
  v1 = (void *)[a1 objectForKey:@"lineNumber"];
  return [v1 intValue];
}

- (uint64_t)_web_messageSourceURL
{
  return [a1 objectForKey:@"sourceURL"];
}

- (uint64_t)_web_messageType
{
  v2 = (void *)[a1 objectForKey:@"MessageLevel"];
  if ([v2 isEqualToString:@"TipMessageLevel"])
  {
    int v3 = 2;
  }
  else if ([v2 isEqualToString:@"LogMessageLevel"])
  {
    int v3 = 4;
  }
  else if ([v2 isEqualToString:@"WarningMessageLevel"])
  {
    int v3 = 8;
  }
  else
  {
    int v3 = 16;
  }
  v4 = (void *)[a1 objectForKey:@"MessageSource"];
  if ([v4 isEqualToString:@"HTMLMessageSource"])
  {
    int v5 = 32;
  }
  else if ([v4 isEqualToString:@"XMLMessageSource"])
  {
    int v5 = 64;
  }
  else if ([v4 isEqualToString:@"JSMessageSource"])
  {
    int v5 = 128;
  }
  else if ([v4 isEqualToString:@"CSSMessageSource"])
  {
    int v5 = 256;
  }
  else
  {
    int v5 = 512;
  }
  return v5 | v3;
}

@end
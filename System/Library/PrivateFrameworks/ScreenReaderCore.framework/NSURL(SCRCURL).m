@interface NSURL(SCRCURL)
- (id)absoluteStringWithoutQueryParameters;
- (id)baseDomainURL;
@end

@implementation NSURL(SCRCURL)

- (id)absoluteStringWithoutQueryParameters
{
  v2 = [a1 absoluteString];
  v3 = [a1 query];
  if ([v3 length])
  {
    v4 = [@"?" stringByAppendingString:v3];
    id v5 = [v2 stringByReplacingOccurrencesOfString:v4 withString:&stru_26CC25790];
    v6 = [a1 host];
    if (([v5 hasSuffix:@"/"] & 1) == 0 && v6 && objc_msgSend(v5, "hasSuffix:", v6))
    {
      uint64_t v7 = [v5 stringByAppendingString:@"/"];

      id v5 = (id)v7;
    }
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

- (id)baseDomainURL
{
  id v2 = [NSString alloc];
  v3 = [a1 scheme];
  v4 = [a1 host];
  id v5 = (void *)[v2 initWithFormat:@"%@://%@/", v3, v4];

  v6 = [NSURL URLWithString:v5];

  return v6;
}

@end
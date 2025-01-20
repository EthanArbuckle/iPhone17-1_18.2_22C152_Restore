@interface NSURL(UIKitAdditions)
+ (id)URLWithDisplayIdentifier:()UIKitAdditions forSearchResultDomain:andIdentifier:;
+ (id)mapsURLWithQuery:()UIKitAdditions;
+ (id)mapsURLWithSourceAddress:()UIKitAdditions destinationAddress:;
- (BOOL)isAccountURL;
- (BOOL)isHTTPOrHTTPSURL;
- (BOOL)isJavaScriptURL;
- (BOOL)isWebcalURL;
- (id)radarWebURL;
- (id)searchResultDomain;
- (id)searchResultIdentifier;
- (uint64_t)isSpringboardHandledURL;
- (void)_domain:()UIKitAdditions subdomain:;
@end

@implementation NSURL(UIKitAdditions)

- (BOOL)isWebcalURL
{
  v2 = [a1 scheme];
  v3 = [v2 lowercaseString];

  if ([v3 isEqualToString:@"webcal"])
  {
    BOOL v4 = 1;
  }
  else if (([v3 isEqualToString:@"http"] & 1) != 0 {
         || [v3 isEqualToString:@"https"])
  }
  {
    v5 = [a1 path];
    v6 = v5;
    if (v5) {
      BOOL v4 = [v5 rangeOfString:@".ics" options:13] != 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isAccountURL
{
  v1 = [a1 scheme];
  v2 = v1;
  if (v1) {
    BOOL v3 = [v1 compare:@"account" options:1] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)mapsURLWithQuery:()UIKitAdditions
{
  BOOL v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 URLQueryAllowedCharacterSet];
  v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  if ([v6 length])
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"maps:q=%@", v6];
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)mapsURLWithSourceAddress:()UIKitAdditions destinationAddress:
{
  v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 URLQueryAllowedCharacterSet];
  v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  v10 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v11 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  int v12 = [v9 length];
  uint64_t v13 = [v11 length];
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    uint64_t v15 = [[NSString alloc] initWithFormat:@"maps:saddr=%@&daddr=%@", v9, v11];
LABEL_8:
    v16 = (void *)v15;
    v17 = [MEMORY[0x1E4F1CB10] URLWithString:v15];

    goto LABEL_9;
  }
  if (v12)
  {
    uint64_t v15 = [[NSString alloc] initWithFormat:@"maps:saddr=%@", v9, v19];
    goto LABEL_8;
  }
  if (v13)
  {
    uint64_t v15 = [[NSString alloc] initWithFormat:@"maps:daddr=%@", v11, v19];
    goto LABEL_8;
  }
  v17 = 0;
LABEL_9:

  return v17;
}

- (void)_domain:()UIKitAdditions subdomain:
{
  *a3 = 0;
  *a4 = 0;
  id v6 = [a1 host];
  id v11 = [v6 componentsSeparatedByString:@"."];

  unsigned int v7 = [v11 count];
  v8 = v11;
  if (v7)
  {
    v9 = [v11 objectAtIndex:v7 - 1];
    if ((objc_msgSend(v9, "_web_isCaseInsensitiveEqualToString:", @"au") & 1) != 0
      || (objc_msgSend(v9, "_web_isCaseInsensitiveEqualToString:", @"jp") & 1) != 0
      || objc_msgSend(v9, "_web_isCaseInsensitiveEqualToString:", @"uk"))
    {
      if (v7 < 3) {
        goto LABEL_11;
      }
      *a3 = [v11 objectAtIndex:v7 - 3];
      if (v7 == 3) {
        goto LABEL_11;
      }
      int v10 = -4;
    }
    else
    {
      if (v7 < 2) {
        goto LABEL_11;
      }
      *a3 = [v11 objectAtIndex:v7 - 2];
      if (v7 == 2) {
        goto LABEL_11;
      }
      int v10 = -3;
    }
    *a4 = [v11 objectAtIndex:v10 + v7];
LABEL_11:

    v8 = v11;
  }
}

- (id)radarWebURL
{
  v2 = [a1 scheme];
  BOOL v3 = [v2 lowercaseString];

  if (([v3 isEqualToString:@"rdar"] & 1) != 0
    || [v3 isEqualToString:@"radar"])
  {
    uint64_t v4 = [a1 resourceSpecifier];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
      unsigned int v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

      v8 = [NSString stringWithFormat:@"https://bugreport.apple.com/cgi-bin/WebObjects/RadarWeb.woa/wa/openURL?url=%@", v7];
      v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://bugreport.apple.com/"];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)URLWithDisplayIdentifier:()UIKitAdditions forSearchResultDomain:andIdentifier:
{
  v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [NSString stringWithFormat:@"search://%@/%u/%llu", a3, a4, a5];
  unsigned int v7 = [v5 URLWithString:v6];

  return v7;
}

- (id)searchResultDomain
{
  v2 = [a1 scheme];
  int v3 = [v2 isEqualToString:@"search"];

  if (v3)
  {
    uint64_t v4 = NSNumber;
    v5 = [a1 path];
    id v6 = [v5 stringByDeletingLastPathComponent];
    unsigned int v7 = [v6 lastPathComponent];
    v8 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)searchResultIdentifier
{
  v2 = [a1 scheme];
  int v3 = [v2 isEqualToString:@"search"];

  if (v3)
  {
    uint64_t v4 = [a1 path];
    id v5 = [v4 lastPathComponent];
    id v6 = (const char *)[v5 UTF8String];

    if (v6) {
      unint64_t v7 = strtoull(v6, 0, 10);
    }
    else {
      unint64_t v7 = 0;
    }
    v8 = [NSNumber numberWithUnsignedLongLong:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)isSpringboardHandledURL
{
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v5 = 0;
  uint64_t v3 = [v2 isApplicationAvailableToOpenURL:a1 includePrivateURLSchemes:0 error:&v5];

  return v3;
}

- (BOOL)isJavaScriptURL
{
  v1 = [a1 scheme];
  v2 = v1;
  if (v1) {
    BOOL v3 = [v1 caseInsensitiveCompare:@"javascript"] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isHTTPOrHTTPSURL
{
  v1 = [a1 scheme];
  v2 = v1;
  if (v1)
  {
    if ([v1 caseInsensitiveCompare:@"http"]) {
      BOOL v3 = [v2 caseInsensitiveCompare:@"https"] == 0;
    }
    else {
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

@end
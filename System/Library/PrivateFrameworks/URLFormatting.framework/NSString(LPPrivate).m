@interface NSString(LPPrivate)
- (BOOL)_lp_hasCaseInsensitivePrefix:()LPPrivate;
- (__CFString)_lp_stringByTrimmingWhitespace;
- (float)_lp_similarityToString:()LPPrivate;
- (id)_lp_highLevelDomainFromHost;
- (id)_lp_hostByStrippingTopLevelDomain;
- (id)_lp_stringByDeletingTrailingSlash;
- (id)_lp_stringByDeletingUsernameAndPassword;
- (uint64_t)_lp_stringForcingLeftToRightDirection;
@end

@implementation NSString(LPPrivate)

- (id)_lp_highLevelDomainFromHost
{
  if ([a1 length])
  {
    if (objc_msgSend(a1, "_web_looksLikeIPAddress"))
    {
      id v2 = a1;
    }
    else
    {
      v3 = [a1 componentsSeparatedByString:@"."];
      objc_msgSend(a1, "_lp_highLevelDomainFromComponents:indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:", v3, 0, 0);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (BOOL)_lp_hasCaseInsensitivePrefix:()LPPrivate
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 rangeOfString:v4 options:9] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)_lp_stringForcingLeftToRightDirection
{
  return [NSString stringWithFormat:@"⁦\u202A%@\u202C⁩", a1];
}

- (id)_lp_hostByStrippingTopLevelDomain
{
  if ([a1 length])
  {
    if (objc_msgSend(a1, "_web_looksLikeIPAddress"))
    {
      id v2 = a1;
    }
    else
    {
      v3 = [a1 componentsSeparatedByString:@"."];
      uint64_t v6 = 0;
      objc_msgSend(a1, "_lp_highLevelDomainFromComponents:indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:", v3, 0, &v6);
      id v2 = (id)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
        id v4 = objc_msgSend(v3, "subarrayWithRange:", 0, v6);
        id v2 = [v4 componentsJoinedByString:@"."];
      }
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_lp_stringByDeletingTrailingSlash
{
  if ([a1 hasSuffix:@"/"])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)_lp_stringByDeletingUsernameAndPassword
{
  id v2 = [MEMORY[0x263F08BA0] componentsWithString:a1];
  v3 = v2;
  if (v2)
  {
    [v2 setUser:0];
    [v3 setPassword:0];
    id v4 = [v3 string];
  }
  else
  {
    id v4 = a1;
  }
  BOOL v5 = v4;

  return v5;
}

- (__CFString)_lp_stringByTrimmingWhitespace
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringTrimWhitespace(v1);
  return v1;
}

- (float)_lp_similarityToString:()LPPrivate
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  unint64_t v6 = [v4 length];
  if (v5 <= v6) {
    unint64_t v5 = v6;
  }
  if (v5) {
    float v7 = (float)(v5 - damerauLevenshteinDistance((NSString *)a1, (NSString *)v4)) / (float)v5;
  }
  else {
    float v7 = 1.0;
  }

  return v7;
}

@end
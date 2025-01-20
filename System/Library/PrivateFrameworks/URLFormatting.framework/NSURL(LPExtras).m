@interface NSURL(LPExtras)
+ (id)_lp_URLWithUserTypedString:()LPExtras relativeToURL:;
- (BOOL)_lp_isHTTPFamilyURL;
- (BOOL)_lp_userVisibleStringUsesEncodedHost;
- (__CFString)_lp_userVisibleString;
- (id)_lp_highLevelDomain;
- (id)_lp_simplifiedURLStringForFuzzyMatching;
- (uint64_t)_lp_simplifiedDisplayString;
@end

@implementation NSURL(LPExtras)

- (BOOL)_lp_userVisibleStringUsesEncodedHost
{
  BOOL v3 = 0;
  id v1 = userVisibleStringForURL(a1, &v3);
  return v3;
}

- (BOOL)_lp_isHTTPFamilyURL
{
  id v1 = [a1 scheme];
  if ([v1 compare:@"http" options:3]) {
    BOOL v2 = [v1 compare:@"https" options:3] == 0;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

- (uint64_t)_lp_simplifiedDisplayString
{
  return objc_msgSend(a1, "_lp_simplifiedStringForDisplayOnly:", 1);
}

- (__CFString)_lp_userVisibleString
{
  return userVisibleStringForURL(a1, 0);
}

- (id)_lp_highLevelDomain
{
  id v1 = [a1 host];
  BOOL v2 = encodeHostName(v1);

  objc_msgSend(v2, "_lp_highLevelDomainFromHost");
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = decodeHostName(v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_lp_URLWithUserTypedString:()LPExtras relativeToURL:
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && (objc_msgSend(v5, "_lp_stringByTrimmingWhitespace"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        mapHostNames(v7, 1, 0),
        v8 = objc_claimAutoreleasedReturnValue(),
        v5,
        v7,
        v8))
  {
    id v9 = v8;
    id v10 = [v9 dataUsingEncoding:4];
    v11 = (unsigned __int8 *)[v10 bytes];
    int v12 = [v10 length];
    int v13 = v12;
    v14 = 0;
    if (v12 && v12 <= 715827882)
    {
      v15 = malloc_type_malloc(3 * v12, 0x6A602E9CuLL);
      if (v13 < 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        LODWORD(v16) = 0;
        uint64_t v17 = v13;
        v18 = v15;
        do
        {
          unsigned int v20 = *v11++;
          unsigned int v19 = v20;
          if (v20 - 127 > 0xFFFFFFA1)
          {
            v24 = v18 + 1;
            int v25 = 1;
          }
          else
          {
            if (v19 >= 0xA0) {
              char v21 = 55;
            }
            else {
              char v21 = 48;
            }
            v18[1] = v21 + (v19 >> 4);
            v19 &= 0xFu;
            if (v19 >= 0xA) {
              char v22 = 55;
            }
            else {
              char v22 = 48;
            }
            char v23 = v22 + v19;
            v24 = v18 + 3;
            v18[2] = v23;
            LOBYTE(v19) = 37;
            int v25 = 3;
          }
          uint64_t v16 = (v25 + v16);
          unsigned char *v18 = v19;
          v18 = v24;
          --v17;
        }
        while (v17);
      }
      v14 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v15 length:v16];
    }

    if (v14) {
      objc_msgSend(NSURL, "_lp_URLWithData:baseURL:", v14, v6);
    }
    else {
    v26 = [NSURL URLWithString:&stru_26C3C6F50];
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_lp_simplifiedURLStringForFuzzyMatching
{
  id v1 = objc_msgSend(a1, "_lp_URLByDeletingCommonIndexPageNames");
  BOOL v2 = objc_msgSend(v1, "_lp_URLBySortingQueryItems");
  BOOL v3 = [v2 absoluteString];
  v4 = objc_msgSend(v3, "_lp_stringByTrimmingWhitespace");
  id v5 = objc_msgSend(v4, "_lp_stringByDeletingUsernameAndPassword");
  id v6 = objc_msgSend(v5, "_lp_stringByDeletingTrailingSlash");

  v7 = objc_msgSend(v6, "_lp_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:", 2031, 0);

  return v7;
}

@end
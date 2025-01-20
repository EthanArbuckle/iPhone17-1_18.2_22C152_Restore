@interface MFExchangeConnection
- (BOOL)_isFetchResponseValid:(id)a3;
- (id)_fetchArgumentForMessageSkeletonsWithAllHeaders;
- (id)_fetchArgumentForMessageUidsAndFlags;
@end

@implementation MFExchangeConnection

- (id)_fetchArgumentForMessageUidsAndFlags
{
  return @"(UID FLAGS BODY.PEEK[HEADER.FIELDS (content-class)])";
}

- (id)_fetchArgumentForMessageSkeletonsWithAllHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)MFExchangeConnection;
  v2 = [(MFIMAPConnection *)&v9 _fetchArgumentForMessageSkeletonsWithAllHeaders];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 length];
    unint64_t v5 = v4 - 3;
    if (v4 >= 3)
    {
      v6 = [v3 substringFromIndex:v5];
      if (objc_msgSend(@"])"), "isEqualToString:", v6))
      {
        v7 = [MEMORY[0x1E4F28E78] stringWithString:v3];

        v3 = v7;
        [v7 insertString:@" content-class" atIndex:v5];
      }
    }
  }
  return v3;
}

- (BOOL)_isFetchResponseValid:(id)a3
{
  v3 = [a3 fetchResultWithType:4];
  unint64_t v4 = [v3 fetchData];

  if (!v4) {
    return 0;
  }
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithData:v4];
  objc_msgSend(v5, "mf_convertNetworkLineEndingsToUnix");
  id v6 = v5;

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F73550]) initWithHeaderData:v6 encoding:1];
  v8 = [v7 firstHeaderForKey:@"content-class"];
  objc_super v9 = v8;
  if (v8 && ([v8 isEqualToString:@"urn:content-classes:message"] & 1) == 0) {
    char v10 = [v9 isEqualToString:@"urn:content-classes:appointment"];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

@end
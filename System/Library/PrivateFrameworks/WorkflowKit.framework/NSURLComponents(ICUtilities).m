@interface NSURLComponents(ICUtilities)
- (id)queryDictionary;
- (void)addValuesFromQueryDictionary:()ICUtilities;
- (void)setQueryDictionary:()ICUtilities;
@end

@implementation NSURLComponents(ICUtilities)

- (void)addValuesFromQueryDictionary:()ICUtilities
{
  id v4 = a3;
  v5 = [a1 percentEncodedQuery];
  if ([v5 length])
  {
    v6 = [a1 percentEncodedQuery];
    v9 = [v6 stringByAppendingString:@"&"];
  }
  else
  {
    v9 = &stru_1F229A4D8;
  }

  v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "dc_queryStringWithQueryDictionary:", v4);

  v8 = [(__CFString *)v9 stringByAppendingString:v7];
  [a1 setPercentEncodedQuery:v8];
}

- (void)setQueryDictionary:()ICUtilities
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "dc_queryStringWithQueryDictionary:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setPercentEncodedQuery:v2];
}

- (id)queryDictionary
{
  v1 = [a1 URL];
  id v2 = objc_msgSend(v1, "dc_queryDictionary");

  return v2;
}

@end
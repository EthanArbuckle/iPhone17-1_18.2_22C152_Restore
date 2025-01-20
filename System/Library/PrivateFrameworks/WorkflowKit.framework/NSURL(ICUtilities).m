@interface NSURL(ICUtilities)
- (id)URLByAddingValuesFromQueryDictionary:()ICUtilities;
@end

@implementation NSURL(ICUtilities)

- (id)URLByAddingValuesFromQueryDictionary:()ICUtilities
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
    [v5 addValuesFromQueryDictionary:v4];
    id v6 = [v5 URL];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

@end
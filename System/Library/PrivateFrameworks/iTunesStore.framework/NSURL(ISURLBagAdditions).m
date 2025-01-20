@interface NSURL(ISURLBagAdditions)
- (id)sanitizedURL;
@end

@implementation NSURL(ISURLBagAdditions)

- (id)sanitizedURL
{
  v2 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v3 = +[ISURLBagCache sharedCache];
  v4 = [v3 URLBagForContext:v2];

  v5 = [v4 sanitizedURLForURL:a1];

  return v5;
}

@end
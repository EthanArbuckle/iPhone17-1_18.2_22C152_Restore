@interface NSURLRequest(StocksEasyPrinting)
- (id)HTTPBodyString;
@end

@implementation NSURLRequest(StocksEasyPrinting)

- (id)HTTPBodyString
{
  id v2 = [NSString alloc];
  v3 = [a1 HTTPBody];
  v4 = (void *)[v2 initWithData:v3 encoding:4];

  return v4;
}

@end
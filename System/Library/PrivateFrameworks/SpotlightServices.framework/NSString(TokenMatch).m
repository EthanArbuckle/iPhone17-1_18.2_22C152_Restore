@interface NSString(TokenMatch)
- (uint64_t)tokenMatch:()TokenMatch;
@end

@implementation NSString(TokenMatch)

- (uint64_t)tokenMatch:()TokenMatch
{
  id v4 = a3;
  v5 = [a1 lowercaseString];
  v6 = [v4 lowercaseString];
  int v7 = [v5 hasPrefix:v6];

  if (v7)
  {
    uint64_t v8 = [a1 length];
    if (v8 == [v4 length]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end
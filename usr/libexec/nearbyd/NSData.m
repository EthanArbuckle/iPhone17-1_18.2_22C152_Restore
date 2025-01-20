@interface NSData
- (id)_reverse;
@end

@implementation NSData

- (id)_reverse
{
  id v2 = [objc_alloc((Class)NSMutableData) initWithData:self];
  v3 = (char *)[v2 mutableBytes];
  v4 = (char *)[v2 length];
  v5 = &v4[(void)v3 - 1];
  if (v4) {
    BOOL v6 = v5 > v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = v3 + 1;
    do
    {
      char v8 = *(v7 - 1);
      *(v7 - 1) = *v5;
      *v5-- = v8;
    }
    while (v7++ < v5);
  }
  id v10 = [objc_alloc((Class)NSData) initWithData:v2];

  return v10;
}

@end
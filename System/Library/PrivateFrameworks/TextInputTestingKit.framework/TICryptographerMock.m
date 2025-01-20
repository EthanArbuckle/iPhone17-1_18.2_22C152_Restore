@interface TICryptographerMock
- (id)stringDigestForName:(id)a3;
@end

@implementation TICryptographerMock

- (id)stringDigestForName:(id)a3
{
  return (id)[a3 stringByAppendingString:@"-digest"];
}

@end
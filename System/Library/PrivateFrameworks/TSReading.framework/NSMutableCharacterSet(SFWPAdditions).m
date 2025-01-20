@interface NSMutableCharacterSet(SFWPAdditions)
- (void)initWithCharacters:()SFWPAdditions length:;
@end

@implementation NSMutableCharacterSet(SFWPAdditions)

- (void)initWithCharacters:()SFWPAdditions length:
{
  v6 = (void *)[a1 init];
  if (v6)
  {
    v7 = (void *)[[NSString alloc] initWithCharacters:a3 length:a4];
    [v6 addCharactersInString:v7];
  }
  return v6;
}

@end
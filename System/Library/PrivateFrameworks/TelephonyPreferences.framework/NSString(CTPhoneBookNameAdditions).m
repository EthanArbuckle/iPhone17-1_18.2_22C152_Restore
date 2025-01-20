@interface NSString(CTPhoneBookNameAdditions)
+ (id)tps_stringWithCTPhoneBookName:()CTPhoneBookNameAdditions;
@end

@implementation NSString(CTPhoneBookNameAdditions)

+ (id)tps_stringWithCTPhoneBookName:()CTPhoneBookNameAdditions
{
  if (a3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)[[NSString alloc] initWithUTF8String:off_1E6EB2550[a3]];
  }
  return v4;
}

@end
@interface NSString(ImportSanity)
- (__CFString)sanitizedString;
@end

@implementation NSString(ImportSanity)

- (__CFString)sanitizedString
{
  SanitizedString = (__CFString *)ML3CreateSanitizedString(a1);

  return SanitizedString;
}

@end
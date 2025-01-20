@interface TIShortcutConversionCandidate
+ (int)type;
- (BOOL)isForShortcutConversion;
@end

@implementation TIShortcutConversionCandidate

+ (int)type
{
  return 6;
}

- (BOOL)isForShortcutConversion
{
  return 1;
}

@end
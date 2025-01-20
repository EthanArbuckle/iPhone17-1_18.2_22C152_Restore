@interface NSMutableArray(FCAdditions_NSString)
- (void)fc_safelyAddStringIfNonNilAndNotZeroLength:()FCAdditions_NSString;
@end

@implementation NSMutableArray(FCAdditions_NSString)

- (void)fc_safelyAddStringIfNonNilAndNotZeroLength:()FCAdditions_NSString
{
  id v4 = a3;
  if ([v4 length]) {
    [a1 addObject:v4];
  }
}

@end
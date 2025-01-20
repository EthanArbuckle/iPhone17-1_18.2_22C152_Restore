@interface NSMutableArray(OSASanitizerCondensor)
- (void)addPart:()OSASanitizerCondensor;
@end

@implementation NSMutableArray(OSASanitizerCondensor)

- (void)addPart:()OSASanitizerCondensor
{
  id v6 = a3;
  if (![a1 count]
    || ![v6 isEqualToString:@"*"]
    || ([a1 lastObject],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:@"*"],
        v4,
        (v5 & 1) == 0))
  {
    [a1 addObject:v6];
  }
}

@end
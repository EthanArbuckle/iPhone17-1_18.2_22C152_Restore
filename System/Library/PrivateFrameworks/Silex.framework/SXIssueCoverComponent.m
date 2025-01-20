@interface SXIssueCoverComponent
+ (id)typeString;
- (BOOL)videoPlaybackEnabledWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXIssueCoverComponent

+ (id)typeString
{
  return @"issue_cover";
}

- (BOOL)videoPlaybackEnabledWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 2) {
    return [a3 BOOLValue];
  }
  else {
    return 1;
  }
}

@end
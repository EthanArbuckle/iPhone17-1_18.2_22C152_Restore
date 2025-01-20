@interface SASProximityFinishedAction
+ (unint64_t)actionID;
- (BOOL)hasResponse;
@end

@implementation SASProximityFinishedAction

+ (unint64_t)actionID
{
  return 8;
}

- (BOOL)hasResponse
{
  return 1;
}

@end
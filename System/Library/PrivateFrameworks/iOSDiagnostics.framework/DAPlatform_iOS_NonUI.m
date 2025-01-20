@interface DAPlatform_iOS_NonUI
+ (id)sharedInstance;
- (BOOL)didSetProxyServerInformation;
- (BOOL)isCheckerBoardActive;
@end

@implementation DAPlatform_iOS_NonUI

+ (id)sharedInstance
{
  if (qword_1000228E8 != -1) {
    dispatch_once(&qword_1000228E8, &stru_100018928);
  }
  v2 = (void *)qword_1000228E0;

  return v2;
}

- (BOOL)isCheckerBoardActive
{
  return 0;
}

- (BOOL)didSetProxyServerInformation
{
  return 0;
}

@end
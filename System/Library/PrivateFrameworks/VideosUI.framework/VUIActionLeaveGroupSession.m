@interface VUIActionLeaveGroupSession
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
@end

@implementation VUIActionLeaveGroupSession

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  v4 = +[VUIInterfaceFactory sharedInstance];
  v5 = [v4 groupActivitiesManager];
  [v5 leaveSession];

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    v6 = v7;
  }
}

@end
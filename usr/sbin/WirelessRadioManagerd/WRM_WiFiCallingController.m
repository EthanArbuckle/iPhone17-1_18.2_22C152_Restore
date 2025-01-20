@interface WRM_WiFiCallingController
- (WRM_WiFiCallingController)init;
- (id)description;
- (void)dealloc;
@end

@implementation WRM_WiFiCallingController

- (WRM_WiFiCallingController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_WiFiCallingController;
  return [(WRM_AVConferenceController *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_WiFiCallingController;
  [(WRM_AVConferenceController *)&v2 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"WiFi Calling iRAT Manager Controller"];
}

@end
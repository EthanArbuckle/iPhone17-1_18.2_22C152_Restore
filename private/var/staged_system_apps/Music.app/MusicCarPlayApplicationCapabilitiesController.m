@interface MusicCarPlayApplicationCapabilitiesController
+ (MusicCarPlayApplicationCapabilitiesController)sharedController;
- (BOOL)allowsRadioContent;
- (int64_t)userSubscriptionState;
- (unint64_t)subscriptionCapabilities;
- (void)setAllowsRadioContent:(BOOL)a3;
- (void)setSubscriptionCapabilities:(unint64_t)a3;
- (void)setUserSubscriptionState:(int64_t)a3;
@end

@implementation MusicCarPlayApplicationCapabilitiesController

+ (MusicCarPlayApplicationCapabilitiesController)sharedController
{
  if (qword_1010D6F40 != -1) {
    dispatch_once(&qword_1010D6F40, &stru_100FC3D30);
  }
  v2 = (void *)qword_1010D6F38;

  return (MusicCarPlayApplicationCapabilitiesController *)v2;
}

- (void)setAllowsRadioContent:(BOOL)a3
{
  if (self->_allowsRadioContent != a3)
  {
    self->_allowsRadioContent = a3;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"MusicCarPlayApplicationCapabilitiesControllerAllowsRadioContentDidChangeNotification" object:self];
  }
}

- (void)setSubscriptionCapabilities:(unint64_t)a3
{
  if (self->_subscriptionCapabilities != a3)
  {
    self->_subscriptionCapabilities = a3;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"MusicCarPlayApplicationCapabilitiesControllerSubscriptionCapabilitiesDidChangeNotification" object:self];
  }
}

- (void)setUserSubscriptionState:(int64_t)a3
{
  if (self->_userSubscriptionState != a3)
  {
    self->_userSubscriptionState = a3;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"MusicCarPlayApplicationCapabilitiesControllerUserSubscriptionStateDidChangeNotification" object:self];
  }
}

- (BOOL)allowsRadioContent
{
  return self->_allowsRadioContent;
}

- (unint64_t)subscriptionCapabilities
{
  return self->_subscriptionCapabilities;
}

- (int64_t)userSubscriptionState
{
  return self->_userSubscriptionState;
}

@end
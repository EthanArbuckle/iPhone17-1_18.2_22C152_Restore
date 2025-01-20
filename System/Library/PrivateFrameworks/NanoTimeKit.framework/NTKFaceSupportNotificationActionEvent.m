@interface NTKFaceSupportNotificationActionEvent
- (NSDictionary)ntkfs_analyticsJSONRepresentation;
- (NSString)bundleIdentifier;
- (NSString)ntkfs_analyticsEventName;
- (NTKFaceSupportNotificationActionEvent)initWithBundleIdentifier:(id)a3 action:(int64_t)a4 delayFromPresentation:(double)a5;
- (double)delayFromPresentation;
- (int64_t)action;
@end

@implementation NTKFaceSupportNotificationActionEvent

- (NTKFaceSupportNotificationActionEvent)initWithBundleIdentifier:(id)a3 action:(int64_t)a4 delayFromPresentation:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 length];
  if (a5 <= 0.0 || (unint64_t)(a4 - 4) < 0xFFFFFFFFFFFFFFFDLL || v9 == 0)
  {
    v12 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKFaceSupportNotificationActionEvent;
    v13 = [(NTKFaceSupportNotificationActionEvent *)&v18 init];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v8 copy];
      bundleIdentifier = v14->_bundleIdentifier;
      v14->_bundleIdentifier = (NSString *)v15;

      v14->_action = a4;
      v14->_delayFromPresentation = a5;
    }
    self = v14;
    v12 = self;
  }

  return v12;
}

- (NSString)ntkfs_analyticsEventName
{
  return (NSString *)@"com.apple.nanotimekit.facesupport.notification_action";
}

- (NSDictionary)ntkfs_analyticsJSONRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(NTKFaceSupportNotificationActionEvent *)self bundleIdentifier];
  int64_t v4 = [(NTKFaceSupportNotificationActionEvent *)self action];
  [(NTKFaceSupportNotificationActionEvent *)self delayFromPresentation];
  double v6 = v5;
  v12[0] = v3;
  v11[0] = @"bundle_identifier";
  v11[1] = @"action_invoked";
  v7 = [NSNumber numberWithInteger:v4];
  v12[1] = v7;
  v11[2] = @"delay_from_presentation";
  id v8 = [NSNumber numberWithDouble:v6];
  v12[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return (NSDictionary *)v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)action
{
  return self->_action;
}

- (double)delayFromPresentation
{
  return self->_delayFromPresentation;
}

- (void).cxx_destruct
{
}

@end
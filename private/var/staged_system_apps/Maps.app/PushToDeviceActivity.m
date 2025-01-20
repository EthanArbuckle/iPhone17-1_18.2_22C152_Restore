@interface PushToDeviceActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PushToDeviceActivity)initWithDevice:(id)a3 place:(id)a4;
- (id)activityTitle;
- (id)activityType;
- (id)icon;
- (void)performActivity;
@end

@implementation PushToDeviceActivity

- (PushToDeviceActivity)initWithDevice:(id)a3 place:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PushToDeviceActivity;
  v9 = [(PushToDeviceActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_data, a4);
  }

  return v10;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  v2 = [(MapsPushDevice *)self->_device uniqueID];
  v3 = +[NSString stringWithFormat:@"com.apple.Maps.Push.%@", v2];

  return v3;
}

- (id)activityTitle
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Send to %@" value:@"localized string not found" table:0];
  v5 = [(MapsPushDevice *)self->_device name];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3 = +[MapsPushManager defaultManager];
  [v3 pushItem:self->_data toDevice:self->_device];
}

- (id)icon
{
  id v3 = +[UIApplication sharedMapsDelegate];
  id v4 = [v3 appKitBundleClass];

  v5 = [(MapsPushDevice *)self->_device model];
  v6 = [v4 iconNameForDeviceModel:v5];

  id v7 = +[UIImage systemImageNamed:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
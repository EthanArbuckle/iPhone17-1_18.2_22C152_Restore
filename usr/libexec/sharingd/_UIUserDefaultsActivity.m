@interface _UIUserDefaultsActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSArray)availableActivities;
- (_UIActivityUserDefaults)userDefaults;
- (_UIUserDefaultsActivity)initWithUserDefaults:(id)a3 activityCategory:(int64_t)a4;
- (id)_actionImage;
- (id)_activityImage;
- (id)activityTitle;
- (id)activityType;
- (int64_t)activityCategory;
- (void)setAvailableActivities:(id)a3;
@end

@implementation _UIUserDefaultsActivity

- (_UIUserDefaultsActivity)initWithUserDefaults:(id)a3 activityCategory:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIUserDefaultsActivity;
  v8 = [(_UIUserDefaultsActivity *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDefaults, a3);
    v9->_activityCategory = a4;
    v10 = v9;
  }

  return v9;
}

- (id)activityType
{
  return UIActivityTypeUserDefaults;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityTitle
{
  int64_t v2 = [(_UIUserDefaultsActivity *)self activityCategory];
  v3 = sub_100233570();
  v4 = v3;
  if (v2 == 1) {
    CFStringRef v5 = @"More";
  }
  else {
    CFStringRef v5 = @"Manage";
  }
  v6 = [v3 localizedStringForKey:v5 value:v5 table:@"Localizable"];

  return v6;
}

- (id)_activityImage
{
  if (qword_100980358 != -1) {
    dispatch_once(&qword_100980358, &stru_1008D00A8);
  }
  int64_t v2 = (void *)qword_100980350;

  return v2;
}

- (id)_actionImage
{
  v3 = objc_opt_class();
  v4 = sub_100233570();
  CFStringRef v5 = +[UIImage imageNamed:@"UIActivityUserDefaults" inBundle:v4];
  v6 = [(_UIUserDefaultsActivity *)self contentSizeCategory];
  id v7 = [v3 _actionImageForActionRepresentationImage:v5 contentSizeCategory:v6];

  return v7;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_UIActivityUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (NSArray)availableActivities
{
  return self->_availableActivities;
}

- (void)setAvailableActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActivities, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
@interface RCDuplicateActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation RCDuplicateActivity

- (id)activityType
{
  return @"RCActivityTypeDuplicate";
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DUPLICATE_MENU_ITEM" value:&stru_100228BC8 table:0];

  return v3;
}

- (id)_systemImageName
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v2 duplicateActivitySystemImageName];

  return v3;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return [a3 count] == (id)1;
}

- (void)performActivity
{
  v3 = [(RCUIActivity *)self recordingUUIDs];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    v5 = +[RCRecordingsModelInteractor sharedRecordingsModelInteractor];
    v6 = [(RCUIActivity *)self recordingUUIDs];
    v7 = [v6 firstObject];
    id v8 = [v5 duplicateRecordingWithUUID:v7];
  }

  [(RCDuplicateActivity *)self activityDidFinish:v4 == (id)1];
}

@end
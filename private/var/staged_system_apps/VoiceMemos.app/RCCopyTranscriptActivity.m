@interface RCCopyTranscriptActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)shouldShowTranscriptionActivity;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation RCCopyTranscriptActivity

- (id)activityType
{
  return @"RCActivityTypeCopyTranscript";
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"COPY_TRANSCRIPT" value:&stru_100228BC8 table:0];

  return v3;
}

- (id)_systemImageName
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 copyTranscriptImageName];

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
  id v3 = [(RCUIActivity *)self recordingUUIDs];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    v5 = +[UIApplication sharedApplication];
    v6 = [v5 delegate];

    v7 = [v6 defaultSceneDelegate];
    v8 = [v7 mainViewController];

    v9 = [(RCUIActivity *)self recordingUUIDs];
    v10 = [v9 firstObject];
    [v8 copyTranscript:v10];
  }

  [(RCCopyTranscriptActivity *)self activityDidFinish:1];
}

- (BOOL)shouldShowTranscriptionActivity
{
  id v3 = [(RCUIActivity *)self recordingUUIDs];
  id v4 = [v3 count];

  if (v4 != (id)1) {
    return 0;
  }
  v5 = +[RCRecordingsModelInteractor sharedRecordingsModelInteractor];
  v6 = [(RCUIActivity *)self recordingUUIDs];
  v7 = [v6 firstObject];
  v8 = [v5 recordingForUUID:v7];

  LOBYTE(v6) = [v8 hasBeenTranscribed];
  return (char)v6;
}

@end
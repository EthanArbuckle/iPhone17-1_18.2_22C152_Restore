@interface SiriTTSTrainingAgentUtils
+ (id)mapTaskStatusToTaskEventString:(int64_t)a3;
+ (int)getAssetQualityVersionFromAsset:(id)a3;
+ (void)postTaskStatusNotification:(int64_t)a3;
@end

@implementation SiriTTSTrainingAgentUtils

+ (id)mapTaskStatusToTaskEventString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)*(&off_1000189D8 + a3 - 1);
  }
  return v4;
}

+ (void)postTaskStatusNotification:(int64_t)a3
{
  id v3 = +[SiriTTSTrainingAgentUtils mapTaskStatusToTaskEventString:a3];
  notify_post((const char *)[v3 UTF8String]);
}

+ (int)getAssetQualityVersionFromAsset:(id)a3
{
  id v3 = a3;
  v16[0] = v3;
  v16[1] = @"Info.plist";
  id v4 = +[NSArray arrayWithObjects:v16 count:2];
  v5 = +[NSString pathWithComponents:v4];

  unsigned __int8 v15 = 0;
  v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:v5 isDirectory:&v15];
  int v8 = v15;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v11 = +[NSDictionary dictionaryWithContentsOfFile:v5];
    v12 = [v11 objectForKey:@"MobileAssetProperties"];
    v13 = [v12 valueForKey:@"AssetQualityVersion"];
    int v10 = [v13 intValue];
  }
  else
  {
    int v10 = -1;
  }

  return v10;
}

@end
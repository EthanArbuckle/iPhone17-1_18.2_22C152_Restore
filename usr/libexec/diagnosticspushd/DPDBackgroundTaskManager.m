@interface DPDBackgroundTaskManager
+ (id)sharedInstance;
- (DPDBackgroundTaskManager)init;
@end

@implementation DPDBackgroundTaskManager

+ (id)sharedInstance
{
  if (qword_100020A78 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100021168;

  return v2;
}

- (DPDBackgroundTaskManager)init
{
  return (DPDBackgroundTaskManager *)sub_10000DC0C();
}

- (void).cxx_destruct
{
}

@end
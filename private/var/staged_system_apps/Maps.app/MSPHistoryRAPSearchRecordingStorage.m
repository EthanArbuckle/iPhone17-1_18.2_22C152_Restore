@interface MSPHistoryRAPSearchRecordingStorage
+ (Class)recordingClass;
@end

@implementation MSPHistoryRAPSearchRecordingStorage

+ (Class)recordingClass
{
  return (Class)objc_opt_class();
}

@end
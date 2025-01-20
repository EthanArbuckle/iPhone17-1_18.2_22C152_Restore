@interface MSPHistoryRAPDirectionsRecordingStorage
+ (Class)recordingClass;
@end

@implementation MSPHistoryRAPDirectionsRecordingStorage

+ (Class)recordingClass
{
  return (Class)objc_opt_class();
}

@end
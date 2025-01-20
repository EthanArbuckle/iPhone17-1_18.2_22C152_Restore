@interface RAPStorageHistoryContainer
+ (id)directionsRecordingStorage;
+ (id)searchRecordingStorage;
@end

@implementation RAPStorageHistoryContainer

+ (id)directionsRecordingStorage
{
  if (qword_1016110B8 != -1) {
    dispatch_once(&qword_1016110B8, &stru_101322BF0);
  }
  v2 = (void *)qword_1016110B0;

  return v2;
}

+ (id)searchRecordingStorage
{
  if (qword_1016110C8 != -1) {
    dispatch_once(&qword_1016110C8, &stru_101322C10);
  }
  v2 = (void *)qword_1016110C0;

  return v2;
}

@end
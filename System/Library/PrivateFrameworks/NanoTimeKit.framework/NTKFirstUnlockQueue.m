@interface NTKFirstUnlockQueue
+ (id)photosFacesCuratorQueue;
@end

@implementation NTKFirstUnlockQueue

+ (id)photosFacesCuratorQueue
{
  if (qword_100072348 != -1) {
    dispatch_once(&qword_100072348, &stru_100061038);
  }
  v2 = (void *)qword_100072350;

  return v2;
}

@end
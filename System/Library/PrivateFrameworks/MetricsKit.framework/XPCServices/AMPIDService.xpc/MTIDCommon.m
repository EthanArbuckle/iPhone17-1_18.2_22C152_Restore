@interface MTIDCommon
+ (id)idOptions;
@end

@implementation MTIDCommon

+ (id)idOptions
{
  if (qword_100028508 != -1) {
    dispatch_once(&qword_100028508, &stru_100020B40);
  }
  v2 = (void *)qword_100028500;

  return v2;
}

@end
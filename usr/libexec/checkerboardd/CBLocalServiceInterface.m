@interface CBLocalServiceInterface
+ (id)clientInterface;
+ (id)serverInterface;
@end

@implementation CBLocalServiceInterface

+ (id)clientInterface
{
  if (qword_100016E70 != -1) {
    dispatch_once(&qword_100016E70, &stru_100010570);
  }
  v2 = (void *)qword_100016E78;

  return v2;
}

+ (id)serverInterface
{
  if (qword_100016E80 != -1) {
    dispatch_once(&qword_100016E80, &stru_100010590);
  }
  v2 = (void *)qword_100016E88;

  return v2;
}

@end
@interface NSDateFormatter
+ (id)ISO8601Formatter;
@end

@implementation NSDateFormatter

+ (id)ISO8601Formatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100144430;
  block[3] = &unk_100411038;
  block[4] = a1;
  if (qword_100482520 != -1) {
    dispatch_once(&qword_100482520, block);
  }
  v2 = (void *)qword_100482518;
  return v2;
}

@end
@interface NSObject
- (void)_bkaxIgnoreNextNotification:(unsigned int)a3;
@end

@implementation NSObject

- (void)_bkaxIgnoreNextNotification:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B84EC;
  v3[3] = &unk_100A44F88;
  v3[4] = self;
  unsigned int v4 = a3;
  sub_1000B8460(v3);
}

@end
@interface UNMutableNotificationCategory
- (void)addPrivateOptions:(unint64_t)a3;
@end

@implementation UNMutableNotificationCategory

- (void)addPrivateOptions:(unint64_t)a3
{
  unint64_t v4 = (unint64_t)[(UNMutableNotificationCategory *)self options] | a3;

  [(UNMutableNotificationCategory *)self setOptions:v4];
}

@end
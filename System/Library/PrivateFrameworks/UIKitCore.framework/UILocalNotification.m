@interface UILocalNotification
+ (UILocalNotification)alloc;
+ (UILocalNotification)allocWithZone:(_NSZone *)a3;
- (BOOL)isTriggeredByDate;
- (BOOL)isTriggeredByRegion;
- (BOOL)isValid;
- (UILocalNotification)init;
- (UILocalNotification)initWithCoder:(NSCoder *)coder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nextFireDateAfterDate:(id)a3 localTimeZone:(id)a4;
- (id)nextFireDateForLastFireDate:(id)a3;
- (int64_t)compareFireDates:(id)a3;
@end

@implementation UILocalNotification

+ (UILocalNotification)alloc
{
  if ((id)objc_opt_class() == a1)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___UILocalNotification;
    return (UILocalNotification *)objc_msgSendSuper2(&v4, sel_alloc);
  }
  else
  {
    return (UILocalNotification *)[UIConcreteLocalNotification alloc];
  }
}

+ (UILocalNotification)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___UILocalNotification;
    return (UILocalNotification *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
  else
  {
    return (UILocalNotification *)+[UILocalNotification allocWithZone:a3];
  }
}

- (UILocalNotification)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UILocalNotification.m" lineNumber:944 description:@"UILocalNotification cannot be subclassed"];
  }
  v7.receiver = self;
  v7.super_class = (Class)UILocalNotification;
  return [(UILocalNotification *)&v7 init];
}

- (UILocalNotification)initWithCoder:(NSCoder *)coder
{
  v3 = coder;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"UILocalNotification cannot be subclassed" userInfo:0];
  objc_exception_throw(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)nextFireDateForLastFireDate:(id)a3
{
  return 0;
}

- (id)nextFireDateAfterDate:(id)a3 localTimeZone:(id)a4
{
  return 0;
}

- (BOOL)isValid
{
  return 0;
}

- (int64_t)compareFireDates:(id)a3
{
  return 0;
}

- (BOOL)isTriggeredByDate
{
  return 0;
}

- (BOOL)isTriggeredByRegion
{
  return 0;
}

@end
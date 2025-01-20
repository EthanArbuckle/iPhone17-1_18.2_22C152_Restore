@interface ULEvent
- (NSString)name;
- (ULEvent)init;
@end

@implementation ULEvent

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (ULEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)ULEvent;
  return [(ULEvent *)&v3 init];
}

@end
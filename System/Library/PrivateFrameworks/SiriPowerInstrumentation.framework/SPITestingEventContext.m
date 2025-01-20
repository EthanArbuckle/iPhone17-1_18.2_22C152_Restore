@interface SPITestingEventContext
+ (id)context;
- (void)setContextForUsage:(id)a3;
@end

@implementation SPITestingEventContext

+ (id)context
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SPITestingEventContext;
  v2 = objc_msgSendSuper2(&v4, sel_context);

  return v2;
}

- (void)setContextForUsage:(id)a3
{
}

@end
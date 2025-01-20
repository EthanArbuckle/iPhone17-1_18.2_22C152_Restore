@interface SPIOrchPommesRequestStartedEventContext
+ (id)context;
- (void)setContextForUsage:(id)a3;
@end

@implementation SPIOrchPommesRequestStartedEventContext

+ (id)context
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SPIOrchPommesRequestStartedEventContext;
  v2 = objc_msgSendSuper2(&v4, sel_context);

  return v2;
}

- (void)setContextForUsage:(id)a3
{
}

@end
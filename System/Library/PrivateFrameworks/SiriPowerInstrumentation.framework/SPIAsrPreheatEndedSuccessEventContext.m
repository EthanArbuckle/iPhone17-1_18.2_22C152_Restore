@interface SPIAsrPreheatEndedSuccessEventContext
+ (id)context;
- (void)setContextForUsage:(id)a3;
@end

@implementation SPIAsrPreheatEndedSuccessEventContext

+ (id)context
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SPIAsrPreheatEndedSuccessEventContext;
  v2 = objc_msgSendSuper2(&v4, sel_context);

  return v2;
}

- (void)setContextForUsage:(id)a3
{
}

@end
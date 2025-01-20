@interface SPISiriUUFRShownEventContext
+ (id)context;
- (void)setContextForUsage:(id)a3;
@end

@implementation SPISiriUUFRShownEventContext

+ (id)context
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SPISiriUUFRShownEventContext;
  v2 = objc_msgSendSuper2(&v4, sel_context);

  return v2;
}

- (void)setContextForUsage:(id)a3
{
}

@end
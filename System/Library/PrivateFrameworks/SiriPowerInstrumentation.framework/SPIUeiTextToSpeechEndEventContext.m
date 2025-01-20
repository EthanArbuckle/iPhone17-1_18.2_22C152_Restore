@interface SPIUeiTextToSpeechEndEventContext
+ (id)context;
- (void)setContextForUsage:(id)a3;
@end

@implementation SPIUeiTextToSpeechEndEventContext

+ (id)context
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SPIUeiTextToSpeechEndEventContext;
  v2 = objc_msgSendSuper2(&v4, sel_context);

  return v2;
}

- (void)setContextForUsage:(id)a3
{
}

@end
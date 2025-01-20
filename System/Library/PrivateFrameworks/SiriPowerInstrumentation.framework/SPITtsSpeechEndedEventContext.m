@interface SPITtsSpeechEndedEventContext
+ (id)context;
- (void)setContextForUsage:(id)a3;
@end

@implementation SPITtsSpeechEndedEventContext

+ (id)context
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SPITtsSpeechEndedEventContext;
  v2 = objc_msgSendSuper2(&v4, sel_context);

  return v2;
}

- (void)setContextForUsage:(id)a3
{
}

@end
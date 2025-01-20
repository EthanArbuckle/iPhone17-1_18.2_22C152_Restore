@interface REBookReaderModuleFactory
+ (void)prewarm;
- (REBookReaderModuleFactory)init;
@end

@implementation REBookReaderModuleFactory

+ (void)prewarm
{
}

- (REBookReaderModuleFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(REBookReaderModuleFactory *)&v3 init];
}

@end
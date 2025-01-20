@interface SUOptionsBase
- (SUOptionsBase)init;
@end

@implementation SUOptionsBase

- (SUOptionsBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUOptionsBase;
  return [(SUOptionsBase *)&v3 init];
}

@end
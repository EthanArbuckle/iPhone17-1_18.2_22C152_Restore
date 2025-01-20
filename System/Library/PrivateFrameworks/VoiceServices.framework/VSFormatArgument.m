@interface VSFormatArgument
- (void)dealloc;
@end

@implementation VSFormatArgument

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSFormatArgument;
  [(VSFormatArgument *)&v3 dealloc];
}

@end
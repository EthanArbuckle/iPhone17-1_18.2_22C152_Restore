@interface UIKeyCommand
- (void)music_handleKeyCommand:(void *)a3;
@end

@implementation UIKeyCommand

- (void)music_handleKeyCommand:(void *)a3
{
  id v4 = a3;
  id v7 = a1;
  v5 = UIKeyCommand.handler.getter();
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    v5((uint64_t)v4);
    sub_1000109BC(v6);
  }
}

@end
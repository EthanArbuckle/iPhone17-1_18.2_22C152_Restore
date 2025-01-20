@interface CLTTool
- (CLTTool)init;
- (int)main;
- (void)handleSignal:(int)a3;
@end

@implementation CLTTool

- (CLTTool)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLTTool;
  v2 = [(CLTTool *)&v4 init];
  if (v2) {
    objc_storeStrong((id *)&s_sharedTool, v2);
  }
  return v2;
}

- (int)main
{
  for (unsigned int i = 1; i != 31; ++i)
  {
    if (i > 0xC || ((1 << i) & 0x1D70) == 0) {
      signal(i, (void (__cdecl *)(int))signal_handler);
    }
  }
  return 0;
}

- (void)handleSignal:(int)a3
{
}

@end
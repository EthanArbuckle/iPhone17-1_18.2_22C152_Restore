@interface SXAdIgnorableViewFactory
- (id)createView;
@end

@implementation SXAdIgnorableViewFactory

- (id)createView
{
  id v2 = objc_alloc(MEMORY[0x263F1CB60]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v3;
}

@end
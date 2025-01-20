@interface PXGOffscreenEffect
- (id)kernel;
- (id)shader;
@end

@implementation PXGOffscreenEffect

- (id)kernel
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGOffscreenEffect.m", 19, @"Method %s is a responsibility of subclass %@", "-[PXGOffscreenEffect kernel]", v6 object file lineNumber description];

  abort();
}

- (id)shader
{
  return 0;
}

@end
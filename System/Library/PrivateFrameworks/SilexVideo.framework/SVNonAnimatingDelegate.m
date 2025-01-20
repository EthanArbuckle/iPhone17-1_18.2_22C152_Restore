@interface SVNonAnimatingDelegate
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation SVNonAnimatingDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

@end
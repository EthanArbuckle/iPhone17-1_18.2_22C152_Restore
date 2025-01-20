@interface SYBundle
@end

@implementation SYBundle

void ___SYBundle_block_invoke()
{
  if (!_SYBundle___bundle)
  {
    _SYBundle___bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    MEMORY[0x1F41817F8]();
  }
}

@end
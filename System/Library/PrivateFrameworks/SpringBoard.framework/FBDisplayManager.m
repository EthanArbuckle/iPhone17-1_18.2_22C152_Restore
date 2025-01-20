@interface FBDisplayManager
@end

@implementation FBDisplayManager

void __59__FBDisplayManager_SpringBoard__sb_secureMainConfiguration__block_invoke()
{
  id v2 = [MEMORY[0x1E4F62420] mainConfiguration];
  uint64_t v0 = [v2 copyForSecureRendering];
  v1 = (void *)sb_secureMainConfiguration___configuration;
  sb_secureMainConfiguration___configuration = v0;
}

@end
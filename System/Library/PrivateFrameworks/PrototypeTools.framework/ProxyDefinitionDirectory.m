@interface ProxyDefinitionDirectory
@end

@implementation ProxyDefinitionDirectory

void ___ProxyDefinitionDirectory_block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v0 = PTPrototypeDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"ProxyDefinitions"];
  v2 = (void *)_ProxyDefinitionDirectory___path;
  _ProxyDefinitionDirectory___path = v1;

  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = _ProxyDefinitionDirectory___path;
  uint64_t v6 = *MEMORY[0x1E4F28320];
  v7[0] = @"mobile";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v5 error:0];

  PTDisableFileProtection((void *)_ProxyDefinitionDirectory___path);
}

@end
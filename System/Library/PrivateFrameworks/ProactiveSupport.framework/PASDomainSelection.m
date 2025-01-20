@interface PASDomainSelection
@end

@implementation PASDomainSelection

void __34___PASDomainSelection_description__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1A62450A0]();
  v1 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v3 = (void *)description__pasExprOnceResult;
  description__pasExprOnceResult = v2;
}

@end
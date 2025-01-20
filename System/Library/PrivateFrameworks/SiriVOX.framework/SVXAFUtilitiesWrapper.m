@interface SVXAFUtilitiesWrapper
- (id)af_RequiredAssetsForFullUOD:(id)a3;
@end

@implementation SVXAFUtilitiesWrapper

- (id)af_RequiredAssetsForFullUOD:(id)a3
{
  return (id)MEMORY[0x270F0EF18](a3, a2);
}

@end
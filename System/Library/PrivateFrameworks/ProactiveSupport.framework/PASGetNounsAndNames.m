@interface PASGetNounsAndNames
@end

@implementation PASGetNounsAndNames

void ___PASGetNounsAndNames_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    v7 = (void *)MEMORY[0x1A62450A0]();
    v8 = *(void **)(a1 + 40);
    v9 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a3, a4);
    [v8 addObject:v9];
  }
}

void ___PASGetNounsAndNames_block_invoke()
{
  v0 = (void *)MEMORY[0x1A62450A0]();
  v1 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Noun", @"Number", @"PlaceName", @"PersonalName", @"OrganizationalName", 0);
  v3 = (void *)_PASGetNounsAndNames__pasExprOnceResult;
  _PASGetNounsAndNames__pasExprOnceResult = v2;
}

@end
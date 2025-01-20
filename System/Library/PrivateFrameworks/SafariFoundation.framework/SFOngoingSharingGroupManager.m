@interface SFOngoingSharingGroupManager
+ (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3;
@end

@implementation SFOngoingSharingGroupManager

+ (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F66260]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__SFOngoingSharingGroupManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke;
  v7[3] = &unk_2643915B0;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 fetchSharingGroupsThatIncludeFamilyMembers:v7];
}

uint64_t __75__SFOngoingSharingGroupManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end
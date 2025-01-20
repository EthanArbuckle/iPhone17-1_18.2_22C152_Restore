@interface UILegibilitySettings
@end

@implementation UILegibilitySettings

void __76___UILegibilitySettings_SpringBoard__descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) primaryColor];
  id v4 = (id)[v2 appendObject:v3 withName:@"primaryColor"];

  v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) secondaryColor];
  id v7 = (id)[v5 appendObject:v6 withName:@"secondaryColor"];

  v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) shadowColor];
  id v10 = (id)[v8 appendObject:v9 withName:@"shadowColor"];

  v11 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) contentColor];
  id v12 = (id)[v11 appendObject:v13 withName:@"contentColor"];
}

@end
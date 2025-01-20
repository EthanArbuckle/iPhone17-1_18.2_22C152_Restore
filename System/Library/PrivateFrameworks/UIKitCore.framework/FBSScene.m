@interface FBSScene
@end

@implementation FBSScene

id __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (([v3 isUISubclass] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6], a1[4], @"FBSScene+UIApp.m", 60, @"clientSettings is of an unexpected class : %@", v3 object file lineNumber description];
  }
  v4 = (*(void (**)(void))(a1[5] + 16))();

  return v4;
}

void __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke_2(void *a1, void *a2)
{
  id v4 = a2;
  if (([v4 isUISubclass] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6], a1[4], @"FBSScene+UIApp.m", 49, @"clientSettings is of an unexpected class : %@", v4 object file lineNumber description];
  }
  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUIClientSettingsWithBlock:*(void *)(a1 + 40)];
}

uint64_t __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUIClientSettingsWithTransitionBlock:*(void *)(a1 + 40)];
}

@end
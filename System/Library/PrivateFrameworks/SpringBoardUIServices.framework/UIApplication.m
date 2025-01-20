@interface UIApplication
@end

@implementation UIApplication

void __120__UIApplication_SBSUIInCallAdditions__SBSUI_requestInCallSceneSessionDestruction_withReason_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    if (v5) {
      [v5 error];
    }
    else {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBSUIInCallErrorDomain" code:-1001 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end
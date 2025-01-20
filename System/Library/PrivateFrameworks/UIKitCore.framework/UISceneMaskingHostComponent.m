@interface UISceneMaskingHostComponent
@end

@implementation UISceneMaskingHostComponent

void __53___UISceneMaskingHostComponent__handleMaskingAction___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    v3 = [MEMORY[0x1E4F4F678] responseForError:v4];
    [*(id *)(a1 + 32) sendResponse:v3];
  }
}

@end
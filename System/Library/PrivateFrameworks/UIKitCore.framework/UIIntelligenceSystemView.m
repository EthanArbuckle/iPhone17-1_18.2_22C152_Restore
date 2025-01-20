@interface UIIntelligenceSystemView
@end

@implementation UIIntelligenceSystemView

uint64_t __72___UIIntelligenceSystemView_transitionerForConnectingHostingController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActions:*(void *)(a1 + 32)];
}

uint64_t __46___UIIntelligenceSystemView_willMoveToWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

@end
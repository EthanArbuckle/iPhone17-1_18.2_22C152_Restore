@interface UIVectorTextLayout
@end

@implementation UIVectorTextLayout

uint64_t __47___UIVectorTextLayout_enumerateRunsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38___UIVectorTextLayout__layoutIfNeeded__block_invoke(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v12.origin.x = a4;
  v12.origin.y = a5;
  v12.size.width = a6;
  v12.size.height = a7;
  if (!CGRectIsEmpty(v12))
  {
    v13.origin.x = a4;
    v13.origin.y = a5;
    v13.size.width = a6;
    v13.size.height = a7;
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v13);
  }
}

@end
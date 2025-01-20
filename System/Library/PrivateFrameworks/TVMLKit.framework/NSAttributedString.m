@interface NSAttributedString
@end

@implementation NSAttributedString

void __64__NSAttributedString_TVMLKitAdditions__tv_currentParagraphStyle__block_invoke(uint64_t a1, void *a2)
{
}

void __64__NSAttributedString_TVMLKitAdditions__tv_currentParagraphStyle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3 != a2)
  {
    *(void *)(v2 + 40) = 0;
  }
}

void __68__NSAttributedString_TVMLKitAdditions__boundingRectWithWidth_lines___block_invoke(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned char *a9)
{
  v13.size.height = a5;
  v13.size.width = a4;
  v13.origin.y = a3;
  v13.origin.x = a2;
  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  CGRect v12 = CGRectUnion(*(CGRect *)(*(void *)(a1[5] + 8) + 32), v13);
  unint64_t v11 = a1[6];
  *(CGRect *)(*(void *)(a1[5] + 8) + 32) = v12;
  if (v11)
  {
    if (*(void *)(*(void *)(a1[4] + 8) + 24) >= v11) {
      *a9 = 1;
    }
  }
}

@end
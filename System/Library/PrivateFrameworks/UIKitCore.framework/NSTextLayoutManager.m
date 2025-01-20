@interface NSTextLayoutManager
@end

@implementation NSTextLayoutManager

uint64_t __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = CGRectGetMaxY(*(CGRect *)&a2);
  return 1;
}

BOOL __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke(uint64_t a1, void *a2)
{
  [a2 layoutFragmentFrame];
  double Width = CGRectGetWidth(v8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v4 + 32) < Width) {
    *(double *)(v4 + 32) = Width;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v6 = *(void *)(v5 + 24) + 1;
  *(void *)(v5 + 24) = v6;
  return v6 < 0x64;
}

@end
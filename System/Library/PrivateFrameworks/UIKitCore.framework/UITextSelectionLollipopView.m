@interface UITextSelectionLollipopView
@end

@implementation UITextSelectionLollipopView

void __44___UITextSelectionLollipopView__visualStyle__block_invoke()
{
  uint64_t v0 = +[_UITextSelectionLollipopVisualStyle inferredVisualStyle];
  v1 = (void *)qword_1EB25C810;
  qword_1EB25C810 = v0;
}

uint64_t __47___UITextSelectionLollipopView__layoutStemView__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) isVertical];
  uint64_t v4 = 4;
  if (v3) {
    uint64_t v4 = 8;
  }
  uint64_t v5 = 10;
  if (v3) {
    uint64_t v5 = 3;
  }
  uint64_t v6 = 1;
  if (v3) {
    uint64_t v6 = 2;
  }
  uint64_t v7 = 5;
  if (v3) {
    uint64_t v7 = 12;
  }
  BOOL v8 = v4 == a2;
  uint64_t v9 = 15;
  if (v8) {
    uint64_t v9 = v5;
  }
  if (v6 == a2) {
    return v7;
  }
  else {
    return v9;
  }
}

@end
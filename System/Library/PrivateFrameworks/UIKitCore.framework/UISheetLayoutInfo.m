@interface UISheetLayoutInfo
@end

@implementation UISheetLayoutInfo

BOOL __36___UISheetLayoutInfo__activeDetents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  id v5 = a3;
  [a2 _value];
  double v7 = v6;
  [v5 _value];
  double v9 = v8;

  if (v4) {
    return v7 < v9;
  }
  else {
    return v7 > v9;
  }
}

double __36___UISheetLayoutInfo__activeDetents__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 600) objectAtIndexedSubscript:a2];
  [v2 _value];
  double v4 = v3;

  return v4;
}

void __36___UISheetLayoutInfo__activeDetents__block_invoke()
{
  uint64_t v0 = +[UISheetPresentationControllerDetent largeDetent];
  v1 = (void *)qword_1EB25FFC0;
  qword_1EB25FFC0 = v0;
}

void __36___UISheetLayoutInfo__preferredSize__block_invoke()
{
  id v0 = [off_1E52D39B8 defaultFontForTextStyle:@"UICTFontTextStyleBody"];
  qword_1EB25FFB0 = __UIViewReadableWidthForFont(v0);
}

@end
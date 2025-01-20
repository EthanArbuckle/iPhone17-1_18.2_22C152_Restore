@interface CHSWidgetDescriptor
@end

@implementation CHSWidgetDescriptor

id __60__CHSWidgetDescriptor_SpringBoardHome__mostInterestingColor__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 resolvedColorWithTraitCollection:v4];
  v6 = [*(id *)(a1 + 40) resolvedColorWithTraitCollection:v4];

  objc_msgSend(v6, "sbh_colorfulness");
  double v8 = v7;
  objc_msgSend(v5, "sbh_colorfulness");
  if (v8 <= v9) {
    v10 = v5;
  }
  else {
    v10 = v6;
  }
  id v11 = v10;
  if (!v11)
  {
    if (v6)
    {
      id v12 = v6;
    }
    else
    {
      id v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    id v11 = v12;
  }

  return v11;
}

@end
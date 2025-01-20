@interface UIStatusBarCellularNetworkTypeView
@end

@implementation UIStatusBarCellularNetworkTypeView

uint64_t __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) widthConstraint];
  [v3 setConstant:v2];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2;
  v5[3] = &unk_1E52D9F70;
  v5[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v5 animations:0.5];
}

void __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) superview];
  [v1 layoutSubviews];
}

void __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 440) setHidden:0];
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
    double v2 = [*(id *)(a1 + 40) substringFromIndex:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 440) setText:v2];

    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      id v7 = [v3 attributesAtIndex:*(void *)(a1 + 64) effectiveRange:0];
      v4 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2040];
      [*(id *)(*(void *)(a1 + 32) + 440) setFont:v4];

      v5 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2048];
      [*(id *)(*(void *)(a1 + 32) + 440) setTextColor:v5];
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 56), "fontForStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "fontStyle"));
      [*(id *)(*(void *)(a1 + 32) + 440) setFont:v6];

      id v7 = [*(id *)(a1 + 56) textColor];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "setTextColor:");
    }
  }
}

void __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3;
  v5[3] = &unk_1E52E5B08;
  double v2 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9;
  v4[3] = &unk_1E52E0000;
  uint64_t v3 = *(void *)(a1 + 64);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v3;
  +[UIView animateWithDuration:v5 animations:v4 completion:0.5];
}

void __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 408))
  {
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(v1 + 424), "setAttributedText:");
      uint64_t v3 = [*(id *)(a1 + 40) attributesAtIndex:0 effectiveRange:0];
      uint64_t v4 = *(void *)off_1E52D2040;
      v5 = [v3 objectForKeyedSubscript:*(void *)off_1E52D2040];
      uint64_t v6 = *(void *)off_1E52D2048;
      id v7 = [v3 objectForKeyedSubscript:*(void *)off_1E52D2048];
    }
    else
    {
      [*(id *)(v1 + 424) setText:*(void *)(a1 + 48)];
      [*(id *)(*(void *)(a1 + 32) + 424) applyStyleAttributes:*(void *)(a1 + 56)];
      v5 = objc_msgSend(*(id *)(a1 + 56), "fontForStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "fontStyle"));
      id v7 = [*(id *)(a1 + 56) textColor];
      uint64_t v4 = *(void *)off_1E52D2040;
      uint64_t v6 = *(void *)off_1E52D2048;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    char v9 = [*(id *)(*(void *)(a1 + 32) + 432) text];
    v13[0] = *(void *)off_1E52D20C8;
    v13[1] = v4;
    v14[0] = &unk_1ED3F2858;
    v14[1] = v5;
    v13[2] = v6;
    v14[2] = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v11 = (void *)[v8 initWithString:v9 attributes:v10];
    [*(id *)(*(void *)(a1 + 32) + 432) _setAttributedText:v11];

    double v12 = 1.0;
    if (!*(unsigned char *)(a1 + 64)) {
      double v12 = 0.0;
    }
    [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:v12];
  }
}

uint64_t __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 408))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 432) setHidden:1];
    [*(id *)(*(void *)(v2 + 32) + 440) setHidden:1];
    result = [*(id *)(*(void *)(v2 + 32) + 424) setAlpha:1.0];
    *(void *)(*(void *)(v2 + 32) + 416) = *(void *)(v2 + 40);
    *(unsigned char *)(*(void *)(v2 + 32) + 408) = 0;
  }
  return result;
}

@end
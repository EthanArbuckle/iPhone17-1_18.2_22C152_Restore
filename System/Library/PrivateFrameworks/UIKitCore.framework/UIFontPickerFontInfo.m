@interface UIFontPickerFontInfo
@end

@implementation UIFontPickerFontInfo

uint64_t __45___UIFontPickerFontInfo__sortedFacesByWeight__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)off_1E52D6B98;
  v7 = [v4 objectForKey:*(void *)off_1E52D6B98];
  v8 = [v5 objectForKey:v6];
  uint64_t v9 = *(void *)off_1E52D6C08;
  v10 = [v7 objectForKeyedSubscript:*(void *)off_1E52D6C08];
  v11 = [v8 objectForKeyedSubscript:v9];
  uint64_t v12 = [v10 compare:v11];
  if (!v12)
  {
    uint64_t v13 = *(void *)off_1E52D6BB0;
    v14 = [v7 objectForKeyedSubscript:*(void *)off_1E52D6BB0];
    v15 = [v8 objectForKeyedSubscript:v13];
    uint64_t v12 = [v14 compare:v15];
    if (!v12)
    {
      v18 = [v4 postscriptName];
      v16 = [v5 postscriptName];
      uint64_t v12 = [v18 localizedStandardCompare:v16];
    }
  }

  return v12;
}

void __45___UIFontPickerFontInfo__sortedFacesByWeight__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [[_UIFontPickerFontInfo alloc] initWithFontDescriptor:v4 isSystemFont:*(unsigned __int8 *)(*(void *)(a1 + 40) + 152)];

  [v3 addObject:v5];
}

uint64_t __45___UIFontPickerFontInfo__createPreviewImage___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  [*(id *)(a1 + 32) ascender];
  double v4 = v2 + v3;
  [*(id *)(a1 + 40) ascender];
  double v6 = v4 - v5;
  double v7 = v6 + *(double *)(a1 + 80);
  if (v7 > *(double *)(a1 + 96))
  {
    v8 = *(void **)(*(void *)(a1 + 48) + 96);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES %@", v7, @"(?s).*\\p{Arabic}.*"];
      v10 = NSNumber;
      v11 = [*(id *)(a1 + 48) preferredShortPreviewString];
      uint64_t v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v9, "evaluateWithObject:", v11));
      uint64_t v13 = *(void *)(a1 + 48);
      v14 = *(void **)(v13 + 96);
      *(void *)(v13 + 96) = v12;

      v8 = *(void **)(*(void *)(a1 + 48) + 96);
    }
    if (objc_msgSend(v8, "BOOLValue", v7)) {
      double v6 = (*(double *)(a1 + 96) - *(double *)(a1 + 80)) * 0.5;
    }
  }
  v15 = *(void **)(a1 + 56);
  double v16 = (*(double *)(a1 + 88) - *(double *)(a1 + 72)) * 0.5;
  return objc_msgSend(v15, "drawInRect:", v16, v6);
}

void __50___UIFontPickerFontInfo_matchesClientFontContext___block_invoke(uint64_t a1, uint64_t (**a2)(void, void), void *a3)
{
  uint64_t v12 = a3;
  double v5 = *(void **)(a1 + 32);
  double v6 = a2;
  double v7 = [v5 familyName];
  LOBYTE(a2) = ((uint64_t (**)(void, void *))a2)[2](v6, v7);

  if ((a2 & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v8 = [*(id *)(a1 + 32) fontName];
  if (!v8)
  {

    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  v10 = [*(id *)(a1 + 32) fontName];
  char v11 = v12[2](v12, v10);

  if ((v11 & 1) == 0) {
LABEL_6:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_8:
}

@end
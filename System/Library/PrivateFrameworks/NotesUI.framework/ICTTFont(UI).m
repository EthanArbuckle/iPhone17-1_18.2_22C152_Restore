@interface ICTTFont(UI)
+ (id)convertFont:()UI toBold:toItalic:;
+ (void)font:()UI isBold:isItalic:;
- (id)nativeFontForStyle:()UI contentSizeCategory:isForPrint:;
- (uint64_t)nativeFontForStyle:()UI;
@end

@implementation ICTTFont(UI)

+ (id)convertFont:()UI toBold:toItalic:
{
  id v7 = a3;
  v8 = [v7 fontDescriptor];
  char v9 = [v8 symbolicTraits];
  if (a4) {
    int v10 = 2;
  }
  else {
    int v10 = 0;
  }
  if (((v9 & 2) == 0) == a4 || ((((v9 & 1) == 0) ^ a5) & 1) == 0)
  {
    int v11 = v10 | a5;
    v12 = [v7 fontDescriptor];
    v13 = [v7 fontDescriptor];
    v14 = objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", v11 | objc_msgSend(v13, "symbolicTraits"));

    v15 = (void *)MEMORY[0x1E4FB08E0];
    [v7 pointSize];
    uint64_t v16 = objc_msgSend(v15, "fontWithDescriptor:size:", v14);

    id v7 = (id)v16;
  }

  return v7;
}

+ (void)font:()UI isBold:isItalic:
{
  id v7 = [a3 fontDescriptor];
  *a4 = ([v7 symbolicTraits] & 2) != 0;
  *a5 = [v7 symbolicTraits] & 1;
}

- (uint64_t)nativeFontForStyle:()UI
{
  return [a1 nativeFontForStyle:a3 contentSizeCategory:0 isForPrint:0];
}

- (id)nativeFontForStyle:()UI contentSizeCategory:isForPrint:
{
  id v8 = a4;
  char v9 = [a1 nativeFont];
  [a1 pointSize];
  if (!v9)
  {
    double v11 = v10;
    v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForStyle:contentSizeCategory:isForPrint:", a3, v8, a5);
    v13 = v12;
    if (v11 <= 0.0 || a5 != 0)
    {
      [v12 pointSize];
      double v11 = v15;
    }
    uint64_t v16 = [a1 fontName];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [a1 fontName];
      char v19 = [v18 hasPrefix:@"."];

      if ((v19 & 1) == 0)
      {
        v20 = (void *)MEMORY[0x1E4FB08E0];
        v21 = [a1 fontName];
        v22 = [v20 fontWithName:v21 size:v11];

        if (v22) {
          goto LABEL_27;
        }
      }
    }
    if (a3 == 4) {
      uint64_t v23 = 4;
    }
    else {
      uint64_t v23 = 3;
    }
    v24 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForStyle:contentSizeCategory:isForPrint:", v23, v8, a5);
    v22 = v24;
    if (v11 > 0.0)
    {
      v25 = [v24 fontWithSize:v11];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;

        v22 = v27;
      }
    }
    char v28 = [a1 fontHints];
    unsigned int v29 = [a1 fontHints];
    char v30 = v29;
    v31 = [MEMORY[0x1E4F834B8] convertFont:v22 toBold:v28 & 1 toItalic:(v29 >> 1) & 1];
    BOOL v32 = v31 != 0;
    if ((v28 & 1) == 0) {
      BOOL v32 = 1;
    }
    if (!v32) {
      v31 = 0;
    }
    if (!v32 && (v30 & 2) != 0)
    {
      v31 = [MEMORY[0x1E4F834B8] convertFont:v22 toBold:1 toItalic:0];
      if (v31) {
        goto LABEL_26;
      }
      v31 = [MEMORY[0x1E4F834B8] convertFont:v22 toBold:0 toItalic:1];
    }
    if (!v31)
    {
LABEL_27:
      char v9 = objc_msgSend(v22, "ic_fontWithSingleLineA");

      [a1 setNativeFont:v9];
      goto LABEL_28;
    }
LABEL_26:
    id v33 = v31;

    v22 = v33;
    goto LABEL_27;
  }
LABEL_28:

  return v9;
}

@end
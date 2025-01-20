@interface UIFont
- (CTFontRef)_fontAdjustedForTypesettingLanguage:(CTFontRef)a1;
- (CTFontRef)_fontAdjustedForTypesettingLanguageAwareLineHeightRatio:(const __CTFont *)a1;
@end

@implementation UIFont

- (CTFontRef)_fontAdjustedForTypesettingLanguage:(CTFontRef)a1
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [(__CTFont *)a1 fontDescriptor];
    v5 = [v4 fontAttributes];
    uint64_t v6 = *MEMORY[0x1E4F24480];
    v7 = [v5 objectForKey:*MEMORY[0x1E4F24480]];

    if ([v3 length])
    {
      if (!v7 || ([v3 isEqualToString:v7] & 1) == 0)
      {
        v8 = [(__CTFont *)a1 fontDescriptor];
        uint64_t v16 = v6;
        v17[0] = v3;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        v10 = [v8 fontDescriptorByAddingAttributes:v9];

        if (!v10) {
          goto LABEL_11;
        }
LABEL_9:
        [(__CTFont *)a1 pointSize];
        a1 = CTFontCreateWithFontDescriptor(v10, v14, 0);
LABEL_12:

        goto LABEL_13;
      }
    }
    else if (v7)
    {
      v11 = [(__CTFont *)a1 fontDescriptor];
      v12 = [v11 fontAttributes];
      v13 = (void *)[v12 mutableCopy];

      [v13 removeObjectForKey:v6];
      v10 = (const __CTFontDescriptor *)[objc_alloc((Class)off_1E52D39C0) initWithFontAttributes:v13];

      if (v10) {
        goto LABEL_9;
      }
LABEL_11:
      a1 = 0;
      goto LABEL_12;
    }
    v10 = 0;
    goto LABEL_11;
  }
LABEL_13:

  return a1;
}

- (CTFontRef)_fontAdjustedForTypesettingLanguageAwareLineHeightRatio:(const __CTFont *)a1
{
  CTFontRef v2 = a1;
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [(__CTFont *)a1 fontDescriptor];
    uint64_t v5 = *MEMORY[0x1E4F24580];
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F24580]];

    if (a2 == -1.0)
    {
      if (v6)
      {
        id v12 = objc_alloc((Class)off_1E52D39C0);
        v13 = [(__CTFont *)v2 fontDescriptor];
        CGFloat v14 = [v13 fontAttributes];
        v15 = (const __CTFontDescriptor *)[v12 initWithFontAttributes:v14];

        if (v15)
        {
LABEL_18:
          [(__CTFont *)v2 pointSize];
          CTFontRef v2 = CTFontCreateWithFontDescriptor(v15, v19, 0);
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        v15 = 0;
      }
LABEL_20:
      CTFontRef v2 = 0;
      goto LABEL_21;
    }
    v7 = [NSNumber numberWithDouble:a2];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 != v9)
    {
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
      }
      else
      {
        char v16 = [v8 isEqual:v9];

        if (v16) {
          goto LABEL_15;
        }
      }
      v17 = [(__CTFont *)v2 fontDescriptor];
      uint64_t v21 = v5;
      v22[0] = v10;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v15 = [v17 fontDescriptorByAddingAttributes:v18];

LABEL_17:
      if (v15) {
        goto LABEL_18;
      }
      goto LABEL_20;
    }

LABEL_15:
    v15 = 0;
    goto LABEL_17;
  }
LABEL_22:
  return v2;
}

@end
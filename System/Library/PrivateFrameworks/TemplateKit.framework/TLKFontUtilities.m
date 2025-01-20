@interface TLKFontUtilities
+ (BOOL)formattedTextItemIsColoredImage:(id)a3;
+ (id)attributedStringForFormattedText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 font:(id)a7 isButton:(BOOL)a8 scale:(double)a9 isDark:(BOOL)a10;
+ (id)attributedStringForRichText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 coloredRanges:(id)a7 nonColoredRanges:(id)a8 rangesForNonTemplateImageAttachments:(id)a9 rangesForTemplateImageAttachments:(id)a10 font:(id)a11 isButton:(BOOL)a12 scale:(double)a13 isDark:(BOOL)a14;
+ (id)attributedStringForRichText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 font:(id)a7 isButton:(BOOL)a8 scale:(double)a9 isDark:(BOOL)a10;
+ (id)boldBodyFont;
+ (id)cachedFontForKey:(id)a3 creatorBlock:(id)a4;
+ (id)cachedFontForMacTextStyle:(id)a3;
+ (id)cachedFontForTextStyle:(id)a3;
+ (id)cachedFontForTextStyle:(id)a3 isBold:(BOOL)a4 isMacStyle:(BOOL)a5;
+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 fontWeight:(double)a5;
+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 fontWeight:(double)a5 isMacStyle:(BOOL)a6;
+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5;
+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 isMacStyle:(BOOL)a6;
+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 useCustomWeight:(BOOL)a6 customFontWeight:(double)a7 isMacStyle:(BOOL)a8;
+ (id)calloutFont;
+ (id)captionFont;
+ (id)clearTextAttachmentForTextAttachment:(id)a3;
+ (id)footnoteFont;
+ (id)preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 isMacStyle:(BOOL)a5;
+ (id)preferredFontForTextStyle:(id)a3;
+ (id)preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4;
+ (id)preferredFontWithTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5;
+ (id)preferredFontWithTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 useCustomWeight:(BOOL)a6 customFontWeight:(double)a7 isMonoSpaced:(BOOL)a8 isMacStyle:(BOOL)a9;
+ (id)preferredMonospacedFontForTextStyle:(id)a3;
+ (id)shortBodyFont;
+ (id)shortFootnoteFont;
+ (id)shortSubheadBoldFont;
+ (id)shortSubheadFont;
+ (id)subheadBoldFont;
+ (id)subheadFont;
+ (id)textAttachmentForImage:(id)a3 size:(CGSize)a4 cornerRoundingStyle:(unint64_t)a5 appearance:(id)a6;
+ (id)thinFontOfSize:(double)a3 grade:(unint64_t)a4;
+ (id)updateAttributedStringUnderlineStyle:(id)a3 isUnderlineVisible:(BOOL)a4;
+ (void)cacheInlineImagesForRichText:(id)a3 inView:(id)a4 updateHandler:(id)a5;
@end

@implementation TLKFontUtilities

+ (void)cacheInlineImagesForRichText:(id)a3 inView:(id)a4 updateHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 effectiveScreenScale];
  double v11 = v10;
  v12 = +[TLKAppearance bestAppearanceForView:v8];
  uint64_t v13 = [v12 isDark];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v14 = [v7 formattedTextItems];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = [v19 tlkImage];
          v21 = [v20 cachedImageForScale:v13 isDarkStyle:v11];

          if (!v21)
          {
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __70__TLKFontUtilities_cacheInlineImagesForRichText_inView_updateHandler___block_invoke;
            v23[3] = &unk_1E5FD3468;
            id v22 = v20;
            id v24 = v22;
            double v26 = v11;
            char v27 = v13;
            id v25 = v9;
            [v22 loadImageWithScale:v13 isDarkStyle:v23 completionHandler:v11];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }
}

+ (id)attributedStringForRichText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 coloredRanges:(id)a7 nonColoredRanges:(id)a8 rangesForNonTemplateImageAttachments:(id)a9 rangesForTemplateImageAttachments:(id)a10 font:(id)a11 isButton:(BOOL)a12 scale:(double)a13 isDark:(BOOL)a14
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v63 = a4;
  id v58 = a7;
  id v57 = a8;
  id v54 = a9;
  id v55 = a10;
  id v64 = a11;
  if (v18) {
    v65 = objc_opt_new();
  }
  else {
    v65 = 0;
  }
  v19 = [v18 formattedTextItems];
  unint64_t v20 = 0x1E5FD2000uLL;
  if ([v19 count] == 1)
  {
    v21 = [v18 formattedTextItems];
    a4 = [v21 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F0959CE8];
    [v65 appendAttributedString:v19];
  }

LABEL_8:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v53 = v18;
  id obj = [v18 formattedTextItems];
  uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  id v24 = v65;
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v66 = *(void *)v68;
    uint64_t v56 = *MEMORY[0x1E4FB12A0];
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v68 != v66) {
          objc_enumerationMutation(obj);
        }
        char v27 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v28 = v27;
        }
        else {
          long long v28 = 0;
        }
        id v29 = v28;
        objc_opt_class();
        char v30 = objc_opt_isKindOfClass();
        if (v30)
        {
          a4 = [v27 string];
          if ([a4 length])
          {

LABEL_22:
            unint64_t v32 = v20;
            LOBYTE(v52) = a14;
            uint64_t v33 = [a1 attributedStringForFormattedText:v27 appearance:v63 prominence:a5 alignment:a6 font:v64 isButton:a12 scale:a13 isDark:v52];
            v34 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", objc_msgSend(v24, "length"), objc_msgSend(v33, "length"));
            char v35 = [a1 formattedTextItemIsColoredImage:v27];
            if ((v35 & 1) == 0)
            {
              if ([v27 color]) {
                v36 = v58;
              }
              else {
                v36 = v57;
              }
              [v36 addObject:v34];
            }
            if (![v33 length] || !v29) {
              goto LABEL_47;
            }
            v37 = [v33 attribute:v56 atIndex:0 effectiveRange:0];
            if (!v37) {
              goto LABEL_46;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v38 = [v37 isPlaceholder];
              int v39 = v38;
              if (v35)
              {
                if (v38)
                {
                  v40 = v55;
                  goto LABEL_36;
                }
LABEL_35:
                v40 = v54;
LABEL_36:
                id v41 = v40;
LABEL_45:
                [v41 setObject:v37 forKeyedSubscript:v34];

                unint64_t v20 = v32;
LABEL_46:

LABEL_47:
                id v24 = v65;
                if (v33)
                {
                  [v65 appendAttributedString:v33];
                }
                goto LABEL_49;
              }
            }
            else
            {
              if (v35) {
                goto LABEL_35;
              }
              int v39 = 0;
            }
            v42 = [v29 tlkImage];
            int v43 = [v42 isTemplate];
            v44 = v55;
            if (v43)
            {
              int v45 = [v29 color] ? v39 : 1;
              BOOL v46 = v45 == 0;
              v44 = v54;
              if (!v46) {
                v44 = v55;
              }
            }
            id v41 = v44;

            goto LABEL_45;
          }
        }
        long long v31 = [v29 tlkImage];

        if (v30) {
        if (v31)
        }
          goto LABEL_22;
LABEL_49:
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v25);
  }

  if ([v24 length]
    || ([v53 text], v48 = objc_claimAutoreleasedReturnValue(), v48, !v48))
  {
    id v47 = v24;
  }
  else
  {
    v49 = [v53 text];
    v50 = +[TLKFormattedText formattedTextWithString:v49];
    LOBYTE(v52) = a14;
    id v47 = [a1 attributedStringForFormattedText:v50 appearance:v63 prominence:a5 alignment:a6 font:v64 isButton:a12 scale:a13 isDark:v52];
  }
  return v47;
}

+ (id)attributedStringForFormattedText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 font:(id)a7 isButton:(BOOL)a8 scale:(double)a9 isDark:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v16;
    id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
    v21 = [v19 string];
    id v22 = (void *)[v20 initWithString:v21];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v19 = 0;
      id v22 = 0;
      goto LABEL_11;
    }
    v21 = [v16 tlkImage];
    uint64_t v23 = [v21 uiImage];
    if (!v23)
    {
      uint64_t v23 = [v21 cachedImageForScale:a10 isDarkStyle:a9];
    }
    if ([v21 isTemplate])
    {
      uint64_t v24 = +[TLKImage templateImageForImage:v23];

      uint64_t v23 = (void *)v24;
    }
    [v21 size];
    char v27 = objc_msgSend(a1, "textAttachmentForImage:size:cornerRoundingStyle:appearance:", v23, objc_msgSend(v21, "cornerRoundingStyle"), v17, v25, v26);
    long long v28 = [MEMORY[0x1E4F28E48] attributedStringWithAttachment:v27];
    id v22 = (void *)[v28 mutableCopy];

    id v19 = 0;
  }

LABEL_11:
  uint64_t v29 = [v22 length];
  int v30 = [v16 isEmphasized];
  if (v17 && v30)
  {
    if (a5 == 3) {
      uint64_t v31 = 2;
    }
    else {
      uint64_t v31 = a5 == 2;
    }
    if (a8) {
      [v17 buttonColorForProminence:v31];
    }
    else {
    unint64_t v32 = [v17 colorForProminence:v31];
    }
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v32, 0, v29);
  }
  id v33 = v18;
  v34 = v33;
  if ([v16 isBold])
  {
    char v35 = [v33 fontDescriptor];
    v36 = [v35 fontDescriptorWithSymbolicTraits:2 mask:2];

    v34 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v36 size:0.0];
  }
  objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4FB12B0], v34, 0, v29);
  if ([v16 color])
  {
    v37 = objc_msgSend(v17, "textColorForColor:", objc_msgSend(v16, "color"));
    if (v37) {
      objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4FB12B8], v37, 0, v29);
    }
  }
  if (v19 && [v19 encapsulationStyle])
  {
    int v38 = objc_opt_new();
    objc_msgSend(v38, "setStyle:", objc_msgSend(v19, "encapsulationStyle") == 2);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4F24368], v38, 0, v29);
  }
  id v39 = v22;

  return v39;
}

+ (id)attributedStringForRichText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 font:(id)a7 isButton:(BOOL)a8 scale:(double)a9 isDark:(BOOL)a10
{
  BYTE1(v11) = a10;
  LOBYTE(v11) = a8;
  return +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:", a3, a4, a5, a6, 0, 0, a9, 0, 0, a7, v11);
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5
{
  return (id)[a1 cachedFontForTextStyle:a3 isShort:a4 isBold:a5 isMacStyle:0];
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 isMacStyle:(BOOL)a6
{
  return (id)[a1 cachedFontForTextStyle:a3 isShort:a4 isBold:a5 useCustomWeight:0 customFontWeight:a6 isMacStyle:*MEMORY[0x1E4FB29C8]];
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 useCustomWeight:(BOOL)a6 customFontWeight:(double)a7 isMacStyle:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v13 = a3;
  v14 = NSString;
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
  id v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
  id v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
  id v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:a7];
  id v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
  id v20 = [v14 stringWithFormat:@"%@-%@-%@-%@-%@-%@", v13, v15, v16, v17, v18, v19];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __102__TLKFontUtilities_cachedFontForTextStyle_isShort_isBold_useCustomWeight_customFontWeight_isMacStyle___block_invoke;
  v26[3] = &unk_1E5FD33F0;
  id v27 = v13;
  id v28 = a1;
  BOOL v30 = v12;
  BOOL v31 = v11;
  BOOL v32 = a6;
  double v29 = a7;
  BOOL v33 = v8;
  id v21 = v13;
  id v22 = [a1 cachedFontForKey:v20 creatorBlock:v26];

  return v22;
}

+ (id)cachedFontForKey:(id)a3 creatorBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  if (cachedFontForKey_creatorBlock__onceToken != -1) {
    dispatch_once(&cachedFontForKey_creatorBlock__onceToken, &__block_literal_global_3);
  }
  id v7 = [(id)cachedFontForKey_creatorBlock__fontCache objectForKey:v5];
  if (!v7)
  {
    id v7 = v6[2](v6);
    [(id)cachedFontForKey_creatorBlock__fontCache setObject:v7 forKey:v5];
  }

  return v7;
}

uint64_t __102__TLKFontUtilities_cachedFontForTextStyle_isShort_isBold_useCustomWeight_customFontWeight_isMacStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) preferredFontWithTextStyle:*(void *)(a1 + 32) isShort:*(unsigned __int8 *)(a1 + 56) isBold:*(unsigned __int8 *)(a1 + 57) useCustomWeight:*(unsigned __int8 *)(a1 + 58) customFontWeight:0 isMonoSpaced:*(unsigned __int8 *)(a1 + 59) isMacStyle:*(double *)(a1 + 48)];
}

+ (id)preferredFontWithTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 useCustomWeight:(BOOL)a6 customFontWeight:(double)a7 isMonoSpaced:(BOOL)a8 isMacStyle:(BOOL)a9
{
  BOOL v9 = a6;
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    unsigned int v11 = 0x8000;
  }
  else {
    unsigned int v11 = 0;
  }
  int v12 = v11 | 2;
  if (a6) {
    int v12 = v11;
  }
  if (a5) {
    unsigned int v11 = v12;
  }
  if (a8) {
    uint64_t v13 = v11 | 0x400;
  }
  else {
    uint64_t v13 = v11;
  }
  v14 = [a1 preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:v13 isMacStyle:a9];
  if (v9)
  {
    uint64_t v23 = *MEMORY[0x1E4FB2880];
    uint64_t v21 = *MEMORY[0x1E4FB29E0];
    uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:a7];
    id v22 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v24[0] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v18 = [v14 fontDescriptorByAddingAttributes:v17];

    v14 = (void *)v18;
  }
  id v19 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v14 size:0.0];

  return v19;
}

+ (id)preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 isMacStyle:(BOOL)a5
{
  uint64_t v5 = *(void *)&a4;
  v6 = objc_msgSend(MEMORY[0x1E4FB17A0], "preferredFontDescriptorWithTextStyle:", a3, *(void *)&a4, a5);
  id v7 = [v6 fontDescriptorWithSymbolicTraits:v5];

  return v7;
}

void __50__TLKFontUtilities_cachedFontForKey_creatorBlock___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)cachedFontForKey_creatorBlock__fontCache;
  cachedFontForKey_creatorBlock__fontCache = v0;

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = (id)[v3 addObserverForName:*MEMORY[0x1E4FB27A8] object:0 queue:0 usingBlock:&__block_literal_global_18];
}

void __50__TLKFontUtilities_cachedFontForKey_creatorBlock___block_invoke_2()
{
  [(id)cachedFontForKey_creatorBlock__fontCache removeAllObjects];
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"TLKContentSizeCategoryDidChangeNotification" object:0];
}

+ (id)cachedFontForTextStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cachedFontForTextStyle:v4 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];

  return v5;
}

+ (id)cachedFontForMacTextStyle:(id)a3
{
  return (id)[a1 cachedFontForTextStyle:a3 isShort:0 isBold:0 isMacStyle:1];
}

+ (id)cachedFontForTextStyle:(id)a3 isBold:(BOOL)a4 isMacStyle:(BOOL)a5
{
  return (id)[a1 cachedFontForTextStyle:a3 isShort:0 isBold:a4 isMacStyle:a5];
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 fontWeight:(double)a5
{
  return (id)[a1 cachedFontForTextStyle:a3 isShort:a4 isBold:0 useCustomWeight:1 customFontWeight:0 isMacStyle:a5];
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 fontWeight:(double)a5 isMacStyle:(BOOL)a6
{
  return (id)[a1 cachedFontForTextStyle:a3 isShort:a4 isBold:0 useCustomWeight:1 customFontWeight:a6 isMacStyle:a5];
}

+ (id)shortSubheadBoldFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:1 isBold:1];
}

+ (id)footnoteFont
{
  uint64_t v3 = *MEMORY[0x1E4FB28F0];
  uint64_t v4 = TLKSnippetModernizationEnabled() ^ 1;
  return (id)[a1 cachedFontForTextStyle:v3 isShort:v4 isBold:0];
}

+ (id)shortFootnoteFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB28F0] isShort:1 isBold:0];
}

+ (id)shortBodyFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB28C8] isShort:1 isBold:0];
}

+ (id)boldBodyFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB28C8] isShort:0 isBold:1];
}

+ (id)subheadFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:0 isBold:0];
}

+ (id)subheadBoldFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:0 isBold:1];
}

+ (id)shortSubheadFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:1 isBold:0];
}

+ (id)captionFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB28E0] isShort:0 isBold:0];
}

+ (id)calloutFont
{
  return (id)[a1 cachedFontForTextStyle:*MEMORY[0x1E4FB28D0] isShort:0 isBold:0];
}

+ (id)thinFontOfSize:(double)a3 grade:(unint64_t)a4
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, a3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(UIFontForLanguage);
  return CopyOfSystemUIFontWithGrade;
}

+ (id)preferredFontForTextStyle:(id)a3
{
  return (id)[a1 preferredFontForTextStyle:a3 maximumContentSizeCategory:*MEMORY[0x1E4FB27F0]];
}

+ (id)preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4
{
  return (id)[MEMORY[0x1E4FB1798] _preferredFontForTextStyle:a3 maximumContentSizeCategory:a4];
}

+ (id)preferredFontWithTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5
{
  return (id)[a1 preferredFontWithTextStyle:a3 isShort:a4 isBold:a5 useCustomWeight:0 customFontWeight:0 isMonoSpaced:0 isMacStyle:*MEMORY[0x1E4FB29C8]];
}

+ (id)preferredMonospacedFontForTextStyle:(id)a3
{
  return (id)[a1 preferredFontWithTextStyle:a3 isShort:0 isBold:0 useCustomWeight:0 customFontWeight:1 isMonoSpaced:0 isMacStyle:*MEMORY[0x1E4FB29C8]];
}

+ (BOOL)formattedTextItemIsColoredImage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 tlkImage], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = v4;
    int v6 = [v4 isTemplate] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)textAttachmentForImage:(id)a3 size:(CGSize)a4 cornerRoundingStyle:(unint64_t)a5 appearance:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  if (+[TLKImage imageIsSymbol:v10]
    && (width == *MEMORY[0x1E4F1DB30] ? (BOOL v12 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v12 = 0),
        v12
     && ([MEMORY[0x1E4FB1398] textAttachmentWithImage:v10],
         (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v14 = (void *)v13;
  }
  else
  {
    v14 = objc_opt_new();
    if (!v10)
    {
      if (a5)
      {
        uint64_t v15 = [v11 colorForProminence:3];
        id v16 = +[TLKUtilities testImageWithSize:color:](TLKUtilities, "testImageWithSize:color:", v15, width, height);
        id v10 = [v16 uiImage];
      }
      else
      {
        id v10 = (id)objc_opt_new();
      }
      [v14 setIsPlaceholder:1];
    }
    id v17 = objc_opt_new();
    objc_msgSend(v17, "cornerRadiusForSize:roundingStyle:", a5, width, height);
    double v19 = v18;

    if (v19 != 0.0)
    {
      BOOL v20 = +[TLKImage isTemplateImage:v10];
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      void v24[2] = __79__TLKFontUtilities_textAttachmentForImage_size_cornerRoundingStyle_appearance___block_invoke;
      v24[3] = &unk_1E5FD3418;
      double v26 = v19;
      id v25 = v10;
      id v10 = [v21 imageWithActions:v24];
      if (v20)
      {
        uint64_t v22 = +[TLKImage templateImageForImage:v10];

        id v10 = (id)v22;
      }
    }
    [v14 setImage:v10];
    objc_msgSend(v14, "setSize:", width, height);
  }

  return v14;
}

void __79__TLKFontUtilities_textAttachmentForImage_size_cornerRoundingStyle_appearance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FB14C0];
  id v4 = a2;
  uint64_t v5 = [v4 format];
  [v5 bounds];
  int v6 = objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
  [v6 addClip];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v4 format];

  [v8 bounds];
  objc_msgSend(v7, "drawInRect:");
}

+ (id)clearTextAttachmentForTextAttachment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 size];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  BOOL v9 = [MEMORY[0x1E4FB1618] clearColor];
  id v10 = [v4 image];
  id v11 = +[TLKImage applyTintColor:v9 toImage:v10];
  BOOL v12 = objc_msgSend(a1, "textAttachmentForImage:size:cornerRoundingStyle:appearance:", v11, 0, 0, v6, v8);

  return v12;
}

+ (id)updateAttributedStringUnderlineStyle:(id)a3 isUnderlineVisible:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  uint64_t v7 = *MEMORY[0x1E4FB12E8];
  if (a4)
  {
    objc_msgSend(v5, "addAttribute:value:range:", v7, &unk_1F0965C08, 0, v6);
    if (objc_msgSend(v5, "containsAttachmentsInRange:", 0, v6))
    {
      double v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v9 = *MEMORY[0x1E4FB12A0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__TLKFontUtilities_updateAttributedStringUnderlineStyle_isUnderlineVisible___block_invoke;
      v15[3] = &unk_1E5FD3440;
      id v16 = v8;
      id v10 = v5;
      id v17 = v10;
      id v11 = v8;
      objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v6, 0, v15);
      id v12 = v10;

      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v5, "removeAttribute:range:", v7, 0, v6);
  }
  id v13 = v5;
LABEL_6:

  return v5;
}

uint64_t __76__TLKFontUtilities_updateAttributedStringUnderlineStyle_isUnderlineVisible___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t isKindOfClass = a2;
  uint64_t v8 = isKindOfClass;
  if (isKindOfClass)
  {
    uint64_t v21 = isKindOfClass;
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v8 = v21;
    if (isKindOfClass)
    {
      uint64_t v9 = a3 + 1;
      uint64_t v10 = 1 - a4;
      do
      {
        id v11 = *(void **)(a1 + 32);
        id v12 = [*(id *)(a1 + 40) string];
        char v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v9 - 2));

        --v9;
        --v10;
      }
      while ((v13 & 1) != 0);
      uint64_t v14 = v9 - v10;
      if (v9 - v10 >= (unint64_t)[*(id *)(a1 + 40) length])
      {
        uint64_t v19 = -v10;
      }
      else
      {
        uint64_t v15 = 0;
        do
        {
          id v16 = *(void **)(a1 + 32);
          id v17 = [*(id *)(a1 + 40) string];
          int v18 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v17, "characterAtIndex:", v14 + v15));

          if (!v18) {
            break;
          }
          ++v15;
        }
        while (v14 + v15 < (unint64_t)[*(id *)(a1 + 40) length]);
        uint64_t v19 = v15 - v10;
      }
      uint64_t isKindOfClass = objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB12E8], v9, v19);
      uint64_t v8 = v21;
    }
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v8);
}

uint64_t __70__TLKFontUtilities_cacheInlineImagesForRichText_inView_updateHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) cacheImage:a2 forScale:*(unsigned __int8 *)(v2 + 56) isDarkStyle:*(double *)(v2 + 48)];
    id v3 = *(uint64_t (**)(void))(*(void *)(v2 + 40) + 16);
    return v3();
  }
  return result;
}

@end
@interface WBSTemplateIconMonogramGenerator
+ (id)_excessiveLineHeightCharacterSet;
+ (id)_monogramStringForPreparedTitle:(id)a3 url:(id)a4;
+ (id)monogramStringForTitle:(id)a3 url:(id)a4;
+ (id)monogramStringForTitle:(id)a3 url:(id)a4 shouldRemoveGrammaticalArticles:(BOOL)a5;
+ (id)monogramStringForURL:(id)a3;
+ (id)monogramWithTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5;
+ (id)monogramWithTitle:(id)a3 url:(id)a4 monogramConfiguration:(id)a5;
+ (id)monogramWithTitle:(id)a3 url:(id)a4 monogramConfiguration:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6;
+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 cornerRadius:(double)a11;
+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 foregroundColor:(id)a11 cornerRadius:(double)a12;
+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 foregroundColor:(id)a11 cornerRadius:(double)a12 shouldRemoveGrammaticalArticles:(BOOL)a13;
@end

@implementation WBSTemplateIconMonogramGenerator

+ (id)monogramStringForTitle:(id)a3 url:(id)a4
{
  v4 = [a1 monogramStringForTitle:a3 url:a4 shouldRemoveGrammaticalArticles:1];
  return v4;
}

+ (id)monogramStringForTitle:(id)a3 url:(id)a4 shouldRemoveGrammaticalArticles:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5
    && +[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::onceToken != -1)
  {
    dispatch_once(&+[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::onceToken, &__block_literal_global_45);
  }
  v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v11 = [v8 stringByTrimmingCharactersInSet:v10];

  id v12 = v11;
  uint64_t v13 = [v12 length];
  v14 = v12;
  if (v13 >= 2)
  {
    v15 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    if (trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::onceToken != -1) {
      dispatch_once(&trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::onceToken, &__block_literal_global_147);
    }
    id v17 = a1;
    v14 = v12;
    if (objc_msgSend((id)trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::leftParenthesisCharacterSet, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", 0)))
    {
      uint64_t v18 = 1;
      while (1)
      {
        uint64_t v19 = [v12 characterAtIndex:v18];
        if ([(id)trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::rightParenthesisCharacterSet characterIsMember:v19])break; {
        if ([v15 characterIsMember:v19])
        }
        {
          if (++v18 == v13) {
            goto LABEL_17;
          }
        }
        else
        {
          char v20 = [v16 characterIsMember:v19];
          if (++v18 == v13) {
            char v21 = 0;
          }
          else {
            char v21 = v20;
          }
          if ((v21 & 1) == 0)
          {
LABEL_17:
            v14 = v12;
            goto LABEL_20;
          }
        }
      }
      v14 = v12;
      if (v18 != v13)
      {
        v22 = [v12 substringFromIndex:v18 + 1];

        v14 = [v22 stringByTrimmingCharactersInSet:v16];
      }
    }
LABEL_20:

    a1 = v17;
  }

  uint64_t v23 = [v14 rangeOfString:@" "];
  if (v23 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    uint64_t v25 = v23 + v24;
    v26 = [v14 substringToIndex:v23 + v24];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = (id)+[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::prefixesToIgnore;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v27);
          }
          if (objc_msgSend(v26, "safari_isCaseInsensitiveEqualToString:", *(void *)(*((void *)&v36 + 1) + 8 * i)))
          {
            v33 = [v14 substringFromIndex:v25];
            v34 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            v32 = [v33 stringByTrimmingCharactersInSet:v34];

            v31 = [a1 _monogramStringForPreparedTitle:v32 url:v9];

            goto LABEL_34;
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
  }
  v31 = [a1 _monogramStringForPreparedTitle:v14 url:v9];
  v32 = v14;
LABEL_34:

  return v31;
}

+ (id)_monogramStringForPreparedTitle:(id)a3 url:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a3, "safari_monogramString");
  if (![v7 length])
  {
    uint64_t v8 = [a1 monogramStringForURL:v6];

    v7 = (void *)v8;
  }

  return v7;
}

void __95__WBSTemplateIconMonogramGenerator_monogramStringForTitle_url_shouldRemoveGrammaticalArticles___block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = _WBSLocalizedString();
  v1 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(v0, "componentsSeparatedByString:", @",", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v6 length]) {
          [v1 addObject:v6];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  [v1 addObjectsFromArray:&unk_1F0342008];
  uint64_t v7 = [v1 allObjects];
  uint64_t v8 = (void *)+[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::prefixesToIgnore;
  +[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::prefixesToIgnore = v7;
}

+ (id)monogramStringForURL:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "safari_userVisibleHost");
  uint64_t v4 = objc_msgSend(v3, "safari_highLevelDomainFromHost");
  BOOL v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v7 = v6;

  objc_msgSend(v7, "safari_monogramString");
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  long long v9 = v8;
  if (!v8) {
    uint64_t v8 = &stru_1F031A860;
  }
  long long v10 = v8;

  return v10;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 monogramConfiguration:(id)a5
{
  BOOL v5 = [a1 monogramWithTitle:a3 url:a4 monogramConfiguration:a5 shouldRemoveGrammaticalArticles:1];
  return v5;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 monogramConfiguration:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v12 iconSize];
  double v14 = v13;
  double v16 = v15;
  [v12 fontSize];
  double v18 = v17;
  uint64_t v19 = [v12 fontWeight];
  uint64_t v20 = [v12 fontDesign];
  [v12 baselineOffset];
  double v22 = v21;
  uint64_t v23 = [v12 backgroundColor];
  uint64_t v24 = [v12 foregroundColor];
  [v12 cornerRadius];
  LOBYTE(v28) = a6;
  v26 = objc_msgSend(a1, "monogramWithTitle:url:size:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:foregroundColor:cornerRadius:shouldRemoveGrammaticalArticles:", v10, v11, v19, v20, v23, v24, v14, v16, v18, v22, v25, v28);

  return v26;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[WBSTemplateIconMonogramConfiguration configurationWithBackgroundColor:a5];
  id v11 = [a1 monogramWithTitle:v8 url:v9 monogramConfiguration:v10];

  return v11;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 cornerRadius:(double)a11
{
  double height = a5.height;
  double width = a5.width;
  id v21 = a3;
  id v22 = a4;
  id v23 = a10;
  uint64_t v24 = [MEMORY[0x1E4F428B8] whiteColor];
  double v25 = objc_msgSend(a1, "monogramWithTitle:url:size:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:foregroundColor:cornerRadius:", v21, v22, a7, a8, v23, v24, width, height, a6, a9, a11);

  return v25;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 foregroundColor:(id)a11 cornerRadius:(double)a12
{
  LOBYTE(v14) = 1;
  id v12 = objc_msgSend(a1, "monogramWithTitle:url:size:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:foregroundColor:cornerRadius:shouldRemoveGrammaticalArticles:", a3, a4, a7, a8, a10, a11, a5.width, a5.height, a6, a9, a12, v14);
  return v12;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 foregroundColor:(id)a11 cornerRadius:(double)a12 shouldRemoveGrammaticalArticles:(BOOL)a13
{
  double height = a5.height;
  double width = a5.width;
  id v23 = a3;
  id v24 = a4;
  id v25 = a10;
  id v26 = a11;
  id v27 = [a1 monogramStringForTitle:v23 url:v24 shouldRemoveGrammaticalArticles:a13];
  if ([v27 length])
  {
    if (!v25)
    {
      id v25 = [MEMORY[0x1E4F428B8] colorWithWhite:0.3 alpha:1.0];
    }
    uint64_t v28 = (void *)MEMORY[0x1E4F42A80];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke;
    v31[3] = &unk_1E5E45248;
    double v35 = width;
    double v36 = height;
    id v25 = v25;
    id v32 = v25;
    double v37 = a12;
    double v38 = a6;
    int64_t v39 = a7;
    int64_t v40 = a8;
    id v33 = v27;
    id v41 = a1;
    id v34 = v26;
    uint64_t v29 = objc_msgSend(v28, "safari_imageWithSize:actions:", v31, width, height);
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

void __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke(uint64_t a1, CGContextRef c)
{
  v40[3] = *MEMORY[0x1E4F143B8];
  CGContextSaveGState(c);
  [*(id *)(a1 + 32) setFill];
  uint64_t v4 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
  CGContextAddPath(c, v4);
  CGContextFillPath(c);
  CGPathRelease(v4);
  if ((_ZGVZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle & 1) == 0)
  {
    _ZZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle = __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke_2();
    _ZGVZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle = 1;
  }
  BOOL v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];

  id v7 = [v6 objectForKeyedSubscript:@"WBSTemplateIconMonogramGenerator_lastUsedFont"];
  double v8 = *(double *)(a1 + 80);
  [v7 size];
  if (v8 != v9 || (uint64_t v10 = *(void *)(a1 + 88), v10 != [v7 fontWeight]))
  {
    uint64_t v11 = systemFontWithSizeWeightAndDesign(*(void *)(a1 + 88), *(void *)(a1 + 96), *(double *)(a1 + 80));

    id v7 = (void *)v11;
    [v6 setObject:v11 forKeyedSubscript:@"WBSTemplateIconMonogramGenerator_lastUsedFont"];
  }
  id v12 = [v7 font];
  double v13 = *(void **)(a1 + 40);
  uint64_t v14 = [*(id *)(a1 + 104) _excessiveLineHeightCharacterSet];
  uint64_t v15 = [v13 rangeOfCharacterFromSet:v14];

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v16 = systemFontWithSizeWeightAndDesign(*(void *)(a1 + 88), *(void *)(a1 + 96), *(double *)(a1 + 80) / 1.2);
    uint64_t v17 = [v16 font];

    id v12 = (void *)v17;
  }
  CGFloat v18 = *MEMORY[0x1E4F42540];
  rect.origin.y = *(CGFloat *)MEMORY[0x1E4F42508];
  rect.size.double width = v18;
  v40[0] = v12;
  v40[1] = _ZZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle;
  rect.size.double height = *(CGFloat *)MEMORY[0x1E4F42510];
  uint64_t v19 = *(void **)(a1 + 48);
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  v40[2] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&rect.origin.y count:3];
  id v22 = (void *)[v21 mutableCopy];

  if (!v19) {
  if ((objc_opt_respondsToSelector() & 1) != 0 && [*(id *)(a1 + 40) _isSingleEmoji])
  }
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F42680]);
    [v23 setShadowBlurRadius:1.0];
    objc_msgSend(v23, "setShadowOffset:", 1.0, 1.0);
    [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F42560]];
  }
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 40) attributes:v22];
  objc_msgSend(v24, "boundingRectWithSize:options:context:", 0, 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  rect.origin.x = v25;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  [v12 ascender];
  double v33 = v32;
  [v12 capHeight];
  double v35 = v34;
  double v36 = *(double *)(a1 + 64);
  [v12 capHeight];
  double v38 = v37;
  v41.origin.x = rect.origin.x;
  v41.origin.y = v27;
  v41.size.double width = v29;
  v41.size.double height = v31;
  objc_msgSend(v24, "drawInRect:", 0.0, v35 - v33 + (v36 - v38) * 0.5, *(double *)(a1 + 56), CGRectGetHeight(v41));
  CGContextRestoreGState(c);
}

id __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke_2()
{
  v0 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  v1 = (void *)[v0 mutableCopy];

  [v1 setAlignment:1];
  return v1;
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (+[WBSTemplateIconMonogramGenerator _excessiveLineHeightCharacterSet]::onceToken != -1) {
    dispatch_once(&+[WBSTemplateIconMonogramGenerator _excessiveLineHeightCharacterSet]::onceToken, &__block_literal_global_68);
  }
  v2 = (void *)+[WBSTemplateIconMonogramGenerator _excessiveLineHeightCharacterSet]::excessiveLineHeightCharacterSet;
  return v2;
}

void __68__WBSTemplateIconMonogramGenerator__excessiveLineHeightCharacterSet__block_invoke()
{
  uint64_t v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)+[WBSTemplateIconMonogramGenerator _excessiveLineHeightCharacterSet]::excessiveLineHeightCharacterSet;
  +[WBSTemplateIconMonogramGenerator _excessiveLineHeightCharacterSet]::excessiveLineHeightCharacterSet = v0;
}

@end
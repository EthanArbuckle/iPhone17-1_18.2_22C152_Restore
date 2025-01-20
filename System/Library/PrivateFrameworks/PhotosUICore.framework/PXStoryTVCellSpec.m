@interface PXStoryTVCellSpec
- (BOOL)_isSupportedCharacterSetForFontDescriptor:(id)a3 fontSize:(double)a4 string:(id)a5 supportedCharacterAttributes:(id)a6 leading:(double)a7;
- (NSDictionary)subtitleSupportedCharactersAttributes;
- (NSDictionary)subtitleUnsupportedCharactersAttributes;
- (NSDictionary)titleSupportedCharactersAttributes;
- (NSDictionary)titleUnsupportedCharactersAttributes;
- (PXStoryTVCellSpec)initWithExtendedTraitCollection:(id)a3;
- (UIEdgeInsets)_languageAwareOutsetsForFont:(id)a3;
- (UIFont)memorySubtitleFont;
- (UIFont)memoryTitleFont;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (double)memorySubtitleLeading;
- (double)memorySubtitleTracking;
- (double)memoryTitleLeading;
- (double)memoryTitleTracking;
- (id)_setupSubtitleAttributesWithAllCharactersSupported:(BOOL)a3;
- (id)_setupSubtitleFont;
- (id)_setupTitleAttributesWithAllCharactersSupported:(BOOL)a3;
- (id)_setupTitleFont;
- (id)attributedStringForSubtitle:(id)a3;
- (id)attributedStringForTitle:(id)a3;
@end

@implementation PXStoryTVCellSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleUnsupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleSupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_titleUnsupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_titleSupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

- (NSDictionary)subtitleUnsupportedCharactersAttributes
{
  return self->_subtitleUnsupportedCharactersAttributes;
}

- (NSDictionary)subtitleSupportedCharactersAttributes
{
  return self->_subtitleSupportedCharactersAttributes;
}

- (NSDictionary)titleUnsupportedCharactersAttributes
{
  return self->_titleUnsupportedCharactersAttributes;
}

- (NSDictionary)titleSupportedCharactersAttributes
{
  return self->_titleSupportedCharactersAttributes;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIEdgeInsets)_languageAwareOutsetsForFont:(id)a3
{
  long long v7 = *(_OWORD *)off_1E5DAAF10;
  long long v8 = *((_OWORD *)off_1E5DAAF10 + 1);
  CTFontGetLanguageAwareOutsets();
  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_isSupportedCharacterSetForFontDescriptor:(id)a3 fontSize:(double)a4 string:(id)a5 supportedCharacterAttributes:(id)a6 leading:(double)a7
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v37 = *MEMORY[0x1E4FB0920];
  v13 = NSNumber;
  id v14 = a6;
  id v15 = a5;
  v16 = [v13 numberWithDouble:a4];
  v38[0] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v18 = [v12 fontDescriptorByAddingAttributes:v17];

  if (_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__onceToken != -1) {
    dispatch_once(&_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__onceToken, &__block_literal_global_166011);
  }
  v19 = (void *)_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__cachedInvertedCharacterSetByFontDescriptor;
  v20 = [v18 fontAttributes];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __116__PXStoryTVCellSpec__isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading___block_invoke_2;
  v34[3] = &unk_1E5DC1520;
  id v35 = v12;
  double v36 = a4;
  id v21 = v12;
  v22 = objc_msgSend(v19, "px_objectForKey:usingPromise:", v20, v34);

  v23 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:a4];
  [(PXStoryTVCellSpec *)self _languageAwareOutsetsForFont:v23];
  double v25 = v24;
  CFAttributedStringRef v26 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15 attributes:v14];

  v27 = CTLineCreateWithAttributedString(v26);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v27, 8uLL);
  double y = BoundsWithOptions.origin.y;
  double height = BoundsWithOptions.size.height;
  CFRelease(v27);
  uint64_t v30 = [v15 rangeOfCharacterFromSet:v22];

  BOOL v32 = v25 * 0.5 + height - y < a7 && v30 == 0x7FFFFFFFFFFFFFFFLL;
  return v32;
}

id __116__PXStoryTVCellSpec__isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fontAttributes];
  double v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FB08F8]];

  if (!v3)
  {
    double v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:*(void *)(a1 + 32) size:*(double *)(a1 + 40)];
    double v3 = CTFontCopyCharacterSet(v4);
  }
  double v5 = [v3 invertedSet];

  return v5;
}

void __116__PXStoryTVCellSpec__isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__cachedInvertedCharacterSetByFontDescriptor;
  _isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__cachedInvertedCharacterSetByFontDescriptor = (uint64_t)v0;
}

- (id)attributedStringForSubtitle:(id)a3
{
  double v4 = [a3 localizedUppercaseString];
  double v5 = [(PXStoryTVCellSpec *)self subtitleFont];
  double v6 = v5;
  if (v4)
  {
    long long v7 = [v5 fontDescriptor];
    [v6 pointSize];
    double v9 = v8;
    v10 = [(PXStoryTVCellSpec *)self subtitleSupportedCharactersAttributes];
    [(PXStoryTVCellSpec *)self memorySubtitleLeading];
    BOOL v12 = [(PXStoryTVCellSpec *)self _isSupportedCharacterSetForFontDescriptor:v7 fontSize:v4 string:v10 supportedCharacterAttributes:v9 leading:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v12) {
      [(PXStoryTVCellSpec *)self subtitleSupportedCharactersAttributes];
    }
    else {
    id v15 = [(PXStoryTVCellSpec *)self subtitleUnsupportedCharactersAttributes];
    }
    id v14 = (id)[v13 initWithString:v4 attributes:v15];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }

  return v14;
}

- (id)attributedStringForTitle:(id)a3
{
  double v4 = [a3 localizedUppercaseString];
  double v5 = [off_1E5DA7230 defaultHelper];
  double v6 = [v5 displayableTextForTitle:v4 intent:1];

  long long v7 = [(PXStoryTVCellSpec *)self titleFont];
  double v8 = v7;
  if (v6)
  {
    double v9 = [v7 fontDescriptor];
    [v8 pointSize];
    double v11 = v10;
    BOOL v12 = [(PXStoryTVCellSpec *)self titleSupportedCharactersAttributes];
    [(PXStoryTVCellSpec *)self memoryTitleLeading];
    BOOL v14 = [(PXStoryTVCellSpec *)self _isSupportedCharacterSetForFontDescriptor:v9 fontSize:v6 string:v12 supportedCharacterAttributes:v11 leading:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v14) {
      [(PXStoryTVCellSpec *)self titleSupportedCharactersAttributes];
    }
    else {
    v17 = [(PXStoryTVCellSpec *)self titleUnsupportedCharactersAttributes];
    }
    id v16 = (id)[v15 initWithString:v6 attributes:v17];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }

  return v16;
}

- (double)memorySubtitleTracking
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXStoryTVCellSpec.m" lineNumber:110 description:@"concrete subclass must implement"];

  return 0.0;
}

- (double)memorySubtitleLeading
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXStoryTVCellSpec.m" lineNumber:105 description:@"concrete subclass must implement"];

  return 0.0;
}

- (UIFont)memorySubtitleFont
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXStoryTVCellSpec.m" lineNumber:100 description:@"concrete subclass must implement"];

  return 0;
}

- (double)memoryTitleTracking
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXStoryTVCellSpec.m" lineNumber:95 description:@"concrete subclass must implement"];

  return 0.0;
}

- (double)memoryTitleLeading
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXStoryTVCellSpec.m" lineNumber:90 description:@"concrete subclass must implement"];

  return 0.0;
}

- (UIFont)memoryTitleFont
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXStoryTVCellSpec.m" lineNumber:85 description:@"concrete subclass must implement"];

  return 0;
}

- (id)_setupSubtitleAttributesWithAllCharactersSupported:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v6 = [(PXStoryTVCellSpec *)self memorySubtitleFont];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  if (v3)
  {
    long long v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    double v8 = (void *)[v7 mutableCopy];

    [(PXStoryTVCellSpec *)self memorySubtitleLeading];
    objc_msgSend(v8, "setMaximumLineHeight:");
    [v8 setLineBreakMode:4];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
    double v9 = NSNumber;
    [(PXStoryTVCellSpec *)self memorySubtitleTracking];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB0710]];
  }
  double v11 = (void *)[v5 copy];

  return v11;
}

- (id)_setupTitleAttributesWithAllCharactersSupported:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v6 = [(PXStoryTVCellSpec *)self memoryTitleFont];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  if (v3)
  {
    long long v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    double v8 = (void *)[v7 mutableCopy];

    [(PXStoryTVCellSpec *)self memoryTitleLeading];
    objc_msgSend(v8, "setMaximumLineHeight:");
    [v8 setLineBreakMode:4];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
    double v9 = NSNumber;
    [(PXStoryTVCellSpec *)self memoryTitleTracking];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB0710]];
  }
  double v11 = (void *)[v5 copy];

  return v11;
}

- (id)_setupSubtitleFont
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = *MEMORY[0x1E4FB0950];
  v13[0] = *MEMORY[0x1E4FB0A10];
  BOOL v3 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24720]];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4FB09F0];
  double v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  v13[2] = *MEMORY[0x1E4FB0998];
  uint64_t v5 = *MEMORY[0x1E4FB0928];
  v14[1] = v4;
  v14[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v6;
  long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v7];
  double v9 = (void *)MEMORY[0x1E4FB08E0];
  double v10 = [(PXStoryTVCellSpec *)self memorySubtitleFont];
  [v10 pointSize];
  double v11 = objc_msgSend(v9, "fontWithDescriptor:size:", v8);

  return v11;
}

- (id)_setupTitleFont
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = *MEMORY[0x1E4FB0950];
  v13[0] = *MEMORY[0x1E4FB0A10];
  BOOL v3 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24700]];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4FB09F0];
  double v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
  v13[2] = *MEMORY[0x1E4FB0998];
  uint64_t v5 = *MEMORY[0x1E4FB0928];
  v14[1] = v4;
  v14[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v6;
  long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v7];
  double v9 = (void *)MEMORY[0x1E4FB08E0];
  double v10 = [(PXStoryTVCellSpec *)self memoryTitleFont];
  [v10 pointSize];
  double v11 = objc_msgSend(v9, "fontWithDescriptor:size:", v8);

  return v11;
}

- (PXStoryTVCellSpec)initWithExtendedTraitCollection:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PXStoryTVCellSpec;
  BOOL v3 = [(PXFeatureSpec *)&v18 initWithExtendedTraitCollection:a3];
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(PXStoryTVCellSpec *)v3 _setupTitleFont];
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    uint64_t v7 = [(PXStoryTVCellSpec *)v4 _setupSubtitleFont];
    subtitleFont = v4->_subtitleFont;
    v4->_subtitleFont = (UIFont *)v7;

    uint64_t v9 = [(PXStoryTVCellSpec *)v4 _setupTitleAttributesWithAllCharactersSupported:1];
    titleSupportedCharactersAttributes = v4->_titleSupportedCharactersAttributes;
    v4->_titleSupportedCharactersAttributes = (NSDictionary *)v9;

    uint64_t v11 = [(PXStoryTVCellSpec *)v4 _setupTitleAttributesWithAllCharactersSupported:0];
    titleUnsupportedCharactersAttributes = v4->_titleUnsupportedCharactersAttributes;
    v4->_titleUnsupportedCharactersAttributes = (NSDictionary *)v11;

    uint64_t v13 = [(PXStoryTVCellSpec *)v4 _setupSubtitleAttributesWithAllCharactersSupported:1];
    subtitleSupportedCharactersAttributes = v4->_subtitleSupportedCharactersAttributes;
    v4->_subtitleSupportedCharactersAttributes = (NSDictionary *)v13;

    uint64_t v15 = [(PXStoryTVCellSpec *)v4 _setupSubtitleAttributesWithAllCharactersSupported:0];
    subtitleUnsupportedCharactersAttributes = v4->_subtitleUnsupportedCharactersAttributes;
    v4->_subtitleUnsupportedCharactersAttributes = (NSDictionary *)v15;
  }
  return v4;
}

@end
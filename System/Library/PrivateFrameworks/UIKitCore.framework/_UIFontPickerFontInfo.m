@interface _UIFontPickerFontInfo
+ (id)infoWithFamilyName:(id)a3;
+ (id)infoWithFontDescriptor:(__CTFontDescriptor *)a3;
+ (id)infoWithName:(id)a3;
+ (id)initWithSystemDefaultFont;
- (BOOL)_hasMultipleFacesForFamily;
- (BOOL)fontCanRenderLocalizedName;
- (BOOL)hasMultipleFaces;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFontFamilyAvailable;
- (BOOL)isSystemFont;
- (BOOL)matchesClientFontContext:(id)a3;
- (BOOL)matchesConfiguration:(id)a3;
- (BOOL)matchesFamilyForFontDescriptor:(id)a3;
- (BOOL)matchesFamilyName:(id)a3;
- (BOOL)matchesFontDescriptor:(id)a3;
- (BOOL)matchesSearchString:(id)a3;
- (BOOL)matchesTraits:(unsigned int)a3;
- (BOOL)passesLanguageFilter:(id)a3;
- (BOOL)previewImagePrefersSingleCharacter;
- (NSArray)faces;
- (NSAttributedString)attributedString;
- (NSString)familyName;
- (NSString)fontName;
- (NSString)localizedFamilyName;
- (NSString)localizedFullName;
- (NSString)localizedName;
- (NSString)postscriptName;
- (NSString)preferredShortPreviewString;
- (NSString)styleName;
- (UIFontDescriptor)fontDescriptor;
- (UIImage)previewImage;
- (_UIFontPickerFontInfo)familyInfo;
- (_UIFontPickerFontInfo)initWithFamilyName:(id)a3;
- (_UIFontPickerFontInfo)initWithFontDescriptor:(id)a3;
- (_UIFontPickerFontInfo)initWithFontDescriptor:(id)a3 isSystemFont:(BOOL)a4;
- (_UIFontPickerFontInfo)initWithSystemDefaultFont;
- (double)lineHeight;
- (id)_fontStringForTraitCollection:(id)a3;
- (id)_sortedFacesByWeight;
- (id)description;
- (id)displayNameForFont:(id)a3;
- (id)faceMatchingDescriptor:(id)a3;
- (unint64_t)hash;
- (void)_createPreviewImage:(id)a3;
- (void)_populateLocalizedNamesIfNecessary;
- (void)_updateAttributedStringIfNeeded;
- (void)_updatePreviewImageIfNeeded;
- (void)setHasMultipleFaces:(BOOL)a3;
- (void)setPreviewImagePrefersSingleCharacter:(BOOL)a3;
@end

@implementation _UIFontPickerFontInfo

+ (id)infoWithName:(id)a3
{
  id v4 = a3;
  v5 = [off_1E52D39B8 familyNames];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithFamilyName:v4];
  }
  else
  {
    [off_1E52D39B8 defaultFontSize];
    v8 = objc_msgSend(off_1E52D39B8, "fontWithName:size:", v4);
    id v9 = objc_alloc((Class)a1);
    v10 = v9;
    if (v8)
    {
      v11 = [v8 fontDescriptor];
      v7 = (void *)[v10 initWithFontDescriptor:v11];
    }
    else
    {
      v7 = (void *)[v9 initWithFamilyName:v4];
    }
  }
  return v7;
}

+ (id)infoWithFamilyName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFamilyName:v4];

  return v5;
}

- (_UIFontPickerFontInfo)initWithFamilyName:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(_UIFontPickerFontInfo *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyName, a3);
    familyName = v7->_familyName;
    uint64_t v16 = *(void *)off_1E52D6B68;
    v17[0] = familyName;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v10 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v9];
    fontDescriptor = v7->_fontDescriptor;
    v7->_fontDescriptor = (UIFontDescriptor *)v10;

    v12 = v7->_familyName;
    [off_1E52D39B8 defaultFontSize];
    v13 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
    v14 = [v13 familyName];
    v7->_isSystemFont = [(NSString *)v12 isEqualToString:v14];
  }
  return v7;
}

+ (id)initWithSystemDefaultFont
{
  v2 = (void *)[objc_alloc((Class)a1) initWithSystemDefaultFont];
  return v2;
}

- (_UIFontPickerFontInfo)initWithSystemDefaultFont
{
  v2 = [(_UIFontPickerFontInfo *)self init];
  if (v2)
  {
    uint64_t v3 = [off_1E52D39C0 defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4F244D8]];
    fontDescriptor = v2->_fontDescriptor;
    v2->_fontDescriptor = (UIFontDescriptor *)v3;

    uint64_t v5 = [(UIFontDescriptor *)v2->_fontDescriptor objectForKey:*(void *)off_1E52D6B68];
    familyName = v2->_familyName;
    v2->_familyName = (NSString *)v5;

    v2->_isSystemFont = 1;
  }
  return v2;
}

+ (id)infoWithFontDescriptor:(__CTFontDescriptor *)a3
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithFontDescriptor:a3];

  return v4;
}

- (_UIFontPickerFontInfo)initWithFontDescriptor:(id)a3
{
  id v5 = a3;
  int v6 = [(_UIFontPickerFontInfo *)self init];
  if (v6)
  {
    uint64_t v7 = [v5 objectForKey:*(void *)off_1E52D6B68];
    familyName = v6->_familyName;
    v6->_familyName = (NSString *)v7;

    uint64_t v9 = [v5 objectForKey:*(void *)off_1E52D6B60];
    styleName = v6->_styleName;
    v6->_styleName = (NSString *)v9;

    uint64_t v11 = [v5 objectForKey:*(void *)off_1E52D6B78];
    fontName = v6->_fontName;
    v6->_fontName = (NSString *)v11;

    objc_storeStrong((id *)&v6->_fontDescriptor, a3);
    v13 = v6->_familyName;
    [off_1E52D39B8 defaultFontSize];
    v14 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
    v15 = [v14 familyName];
    v6->_isSystemFont = [(NSString *)v13 isEqualToString:v15];
  }
  return v6;
}

- (_UIFontPickerFontInfo)initWithFontDescriptor:(id)a3 isSystemFont:(BOOL)a4
{
  result = [(_UIFontPickerFontInfo *)self initWithFontDescriptor:a3];
  if (result) {
    result->_isSystemFont = a4;
  }
  return result;
}

- (BOOL)isSystemFont
{
  return self->_isSystemFont;
}

- (BOOL)hasMultipleFaces
{
  return !self->_styleName && [(_UIFontPickerFontInfo *)self _hasMultipleFacesForFamily];
}

- (BOOL)_hasMultipleFacesForFamily
{
  unint64_t hasMultipleFaces = self->_hasMultipleFaces;
  if (!hasMultipleFaces)
  {
    id v4 = [off_1E52D39B8 fontNamesForFamilyName:self->_familyName];
    unint64_t v5 = [v4 count];
    unint64_t v6 = 1;
    if (v5 > 1) {
      unint64_t v6 = 2;
    }
    self->_unint64_t hasMultipleFaces = v6;

    unint64_t hasMultipleFaces = self->_hasMultipleFaces;
  }
  return hasMultipleFaces > 1;
}

- (void)setHasMultipleFaces:(BOOL)a3
{
  unint64_t v3 = 1;
  if (a3) {
    unint64_t v3 = 2;
  }
  self->_unint64_t hasMultipleFaces = v3;
}

- (id)_sortedFacesByWeight
{
  v16[1] = *MEMORY[0x1E4F143B8];
  familyName = self->_familyName;
  uint64_t v15 = *(void *)off_1E52D6B68;
  v16[0] = familyName;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  unint64_t v5 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v4];

  unint64_t v6 = [v5 matchingFontDescriptorsWithMandatoryKeys:0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = [v6 sortedArrayUsingComparator:&__block_literal_global_541];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45___UIFontPickerFontInfo__sortedFacesByWeight__block_invoke_2;
  v12[3] = &unk_1E5309320;
  id v9 = v7;
  id v13 = v9;
  v14 = self;
  [v8 enumerateObjectsUsingBlock:v12];
  id v10 = v9;

  return v10;
}

- (NSArray)faces
{
  if (self->_styleName)
  {
    v2 = 0;
  }
  else
  {
    subInfos = self->_subInfos;
    if (!subInfos)
    {
      unint64_t v5 = [(_UIFontPickerFontInfo *)self _sortedFacesByWeight];
      unint64_t v6 = self->_subInfos;
      self->_subInfos = v5;

      subInfos = self->_subInfos;
    }
    v2 = subInfos;
  }
  return v2;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (NSString)postscriptName
{
  v2 = [(_UIFontPickerFontInfo *)self fontDescriptor];
  unint64_t v3 = [v2 postscriptName];

  return (NSString *)v3;
}

- (BOOL)isFontFamilyAvailable
{
  v2 = [(_UIFontPickerFontInfo *)self familyName];
  unint64_t v3 = [off_1E52D39B8 fontNamesForFamilyName:v2];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSString)preferredShortPreviewString
{
  p_preferredShortPreviewString = &self->_preferredShortPreviewString;
  preferredShortPreviewString = self->_preferredShortPreviewString;
  if (preferredShortPreviewString)
  {
    BOOL v4 = preferredShortPreviewString;
  }
  else
  {
    unint64_t v5 = [off_1E52D39B8 fontWithDescriptor:self->_fontDescriptor size:0.0];
    unint64_t v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    BOOL v4 = (NSString *)CTFontCopySampleStringWithLanguages();
    objc_storeStrong((id *)p_preferredShortPreviewString, v4);
  }
  return v4;
}

- (UIImage)previewImage
{
  [(_UIFontPickerFontInfo *)self _updatePreviewImageIfNeeded];
  previewImage = self->_previewImage;
  return previewImage;
}

- (void)_updatePreviewImageIfNeeded
{
  unint64_t v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  id v13 = v3;
  if (!self->_previewImage) {
    goto LABEL_5;
  }
  BOOL v4 = [v3 preferredContentSizeCategory];
  if (![v4 isEqualToString:self->_previewImageContentSize]
    || ([v13 displayScale], v5 != self->_previewImageDisplayScale))
  {

LABEL_5:
    [(_UIFontPickerFontInfo *)self _createPreviewImage:v13];
    unint64_t v6 = [v13 preferredContentSizeCategory];
    previewImageContentSize = self->_previewImageContentSize;
    self->_previewImageContentSize = v6;

    [v13 displayScale];
    self->_previewImageDisplayScale = v8;
    BOOL v9 = [(_UIFontPickerFontInfo *)self previewImagePrefersSingleCharacter];
    id v10 = v13;
    self->_int previewImageUsesSingleCharacter = v9;
    goto LABEL_6;
  }
  int previewImageUsesSingleCharacter = self->_previewImageUsesSingleCharacter;
  int v12 = [(_UIFontPickerFontInfo *)self previewImagePrefersSingleCharacter];

  id v10 = v13;
  if (previewImageUsesSingleCharacter != v12) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_createPreviewImage:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  [v4 pointSize];
  double v6 = v5;
  uint64_t v7 = [(_UIFontPickerFontInfo *)self preferredShortPreviewString];

  [v4 lineHeight];
  double v9 = v8;
  id v10 = [(_UIFontPickerFontInfo *)self preferredShortPreviewString];

  BOOL v11 = [(_UIFontPickerFontInfo *)self previewImagePrefersSingleCharacter];
  [v4 lineHeight];
  double v13 = v12;
  v14 = [off_1E52D39B8 fontWithDescriptor:self->_fontDescriptor size:v6];
  if ([(_UIFontPickerFontInfo *)self previewImagePrefersSingleCharacter]
    && ([(_UIFontPickerFontInfo *)self preferredShortPreviewString],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        unint64_t v16 = [v15 length],
        v15,
        v16 >= 2))
  {
    v17 = [(_UIFontPickerFontInfo *)self preferredShortPreviewString];
    v18 = [v17 substringToIndex:1];
  }
  else
  {
    v18 = [(_UIFontPickerFontInfo *)self preferredShortPreviewString];
  }
  double v19 = 5.0;
  if (!v7) {
    double v19 = 12.0;
  }
  double v20 = 0.1;
  if (!v10) {
    double v20 = 0.25;
  }
  double v21 = floor(v9 * v20);
  if (v19 >= v21) {
    double v22 = v19;
  }
  else {
    double v22 = v21;
  }
  double v23 = v13 + v22 + v22;
  double v24 = 2.0;
  if (v11) {
    double v24 = 1.5;
  }
  double v25 = v6 * v24;
  id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v54 = *(void *)off_1E52D2040;
  v55[0] = v14;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  v28 = (void *)[v26 initWithString:v18 attributes:v27];

  [v28 size];
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  v33 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v25, v23);
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  v43 = __45___UIFontPickerFontInfo__createPreviewImage___block_invoke;
  v44 = &unk_1E5309348;
  id v45 = v4;
  id v46 = v14;
  double v49 = v22;
  uint64_t v50 = v30;
  uint64_t v51 = v32;
  double v52 = v25;
  double v53 = v23;
  v47 = self;
  id v48 = v28;
  id v34 = v28;
  id v35 = v14;
  id v36 = v4;
  v37 = [(UIGraphicsImageRenderer *)v33 imageWithActions:&v41];
  if ((CTFontDescriptorGetSymbolicTraits() & 0x2000) != 0) {
    uint64_t v38 = 1;
  }
  else {
    uint64_t v38 = 2;
  }
  objc_msgSend(v37, "imageWithRenderingMode:", v38, v41, v42, v43, v44);
  v39 = (UIImage *)objc_claimAutoreleasedReturnValue();
  previewImage = self->_previewImage;
  self->_previewImage = v39;
}

- (void)_populateLocalizedNamesIfNecessary
{
  if (!self->_localizedFamilyName)
  {
    if (self->_styleName)
    {
      unint64_t v3 = (NSString *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_fontDescriptor, (CFStringRef)*MEMORY[0x1E4F24600], 0);
      localizedStyleName = self->_localizedStyleName;
      self->_localizedStyleName = v3;

      double v5 = (NSString *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_fontDescriptor, (CFStringRef)*MEMORY[0x1E4F24508], 0);
      localizedFullName = self->_localizedFullName;
      self->_localizedFullName = v5;
    }
    uint64_t v7 = (NSString *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_fontDescriptor, (CFStringRef)*MEMORY[0x1E4F24538], 0);
    localizedFamilyName = self->_localizedFamilyName;
    self->_localizedFamilyName = v7;
  }
}

- (NSString)localizedName
{
  [(_UIFontPickerFontInfo *)self _populateLocalizedNamesIfNecessary];
  localizedStyleName = self->_localizedStyleName;
  if (!localizedStyleName) {
    localizedStyleName = self->_localizedFamilyName;
  }
  return localizedStyleName;
}

- (NSString)localizedFullName
{
  [(_UIFontPickerFontInfo *)self _populateLocalizedNamesIfNecessary];
  p_localizedFullName = &self->_localizedFullName;
  if (!self->_localizedFullName
    || ![(_UIFontPickerFontInfo *)self _hasMultipleFacesForFamily])
  {
    p_localizedFullName = &self->_localizedFamilyName;
  }
  BOOL v4 = *p_localizedFullName;
  return v4;
}

- (BOOL)fontCanRenderLocalizedName
{
  v23[1] = *MEMORY[0x1E4F143B8];
  canRenderName = self->_canRenderName;
  if (!canRenderName)
  {
    BOOL v4 = [off_1E52D39B8 fontWithDescriptor:self->_fontDescriptor size:0.0];
    double v5 = NSNumber;
    [(_UIFontPickerFontInfo *)self localizedName];
    uint64_t v22 = *MEMORY[0x1E4F243F0];
    v23[0] = v4;
    uint64_t v6 = 1;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    double v8 = (const __CTLine *)CTLineCreateWithString();
    CTLineGetGlyphRuns(v8);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          if ((void *)CTRunGetFont() != v4)
          {
            uint64_t v6 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      uint64_t v6 = 1;
    }
LABEL_12:

    objc_msgSend(v5, "numberWithBool:", v6, v17);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = self->_canRenderName;
    self->_canRenderName = v14;

    canRenderName = self->_canRenderName;
  }
  return [(NSNumber *)canRenderName BOOLValue];
}

- (NSString)localizedFamilyName
{
  [(_UIFontPickerFontInfo *)self _populateLocalizedNamesIfNecessary];
  localizedFamilyName = self->_localizedFamilyName;
  return localizedFamilyName;
}

- (id)displayNameForFont:(id)a3
{
  BOOL v4 = (const __CTFont *)a3;
  double v5 = v4;
  if (self->_styleName)
  {
    uint64_t v6 = (CFStringRef *)MEMORY[0x1E4F24608];
LABEL_3:
    uint64_t v7 = (void *)CTFontCopyLocalizedName(v4, *v6, 0);
    goto LABEL_6;
  }
  if (!self->_isSystemFont)
  {
    uint64_t v6 = (CFStringRef *)MEMORY[0x1E4F24540];
    goto LABEL_3;
  }
  double v8 = _UIKitBundle();
  uint64_t v7 = [v8 localizedStringForKey:@"FONT_PICKER_DEFAULT_FONT_NAME" value:@"Default Font" table:@"Localizable"];

LABEL_6:
  return v7;
}

- (id)_fontStringForTraitCollection:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(_UIFontPickerFontInfo *)self fontDescriptor];
  [off_1E52D39B8 defaultFontSize];
  uint64_t v6 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v5);
  if (v4)
  {
    uint64_t v7 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleHeadline"];
    uint64_t v8 = [v7 scaledFontForFont:v6 compatibleWithTraitCollection:v4];

    uint64_t v6 = (void *)v8;
  }
  [v6 lineHeight];
  self->_lineHeight = v9;
  uint64_t v10 = [(_UIFontPickerFontInfo *)self displayNameForFont:v6];
  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v15 = *(void *)off_1E52D2040;
  v16[0] = v6;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  double v13 = (void *)[v11 initWithString:v10 attributes:v12];

  return v13;
}

- (void)_updateAttributedStringIfNeeded
{
  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_attributedString
    || ([v9 preferredContentSizeCategory],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isEqualToString:self->_attributedStringContentSize],
        v3,
        (v4 & 1) == 0))
  {
    double v5 = [(_UIFontPickerFontInfo *)self _fontStringForTraitCollection:v9];
    attributedString = self->_attributedString;
    self->_attributedString = v5;

    uint64_t v7 = [v9 preferredContentSizeCategory];
    attributedStringContentSize = self->_attributedStringContentSize;
    self->_attributedStringContentSize = v7;
  }
}

- (NSAttributedString)attributedString
{
  [(_UIFontPickerFontInfo *)self _updateAttributedStringIfNeeded];
  attributedString = self->_attributedString;
  return attributedString;
}

- (BOOL)passesLanguageFilter:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!self->_isSystemFont
    && (([v4 _swiftPredicate], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7)
     || ([v5 _allowedLanguages],
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         uint64_t v9 = [v8 count],
         v8,
         v9)))
  {
    uint64_t v10 = (CFStringRef *)MEMORY[0x1E4F24500];
    if (!v7) {
      uint64_t v10 = (CFStringRef *)MEMORY[0x1E4F24588];
    }
    id v11 = (void *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)self->_fontDescriptor, *v10);
    char v6 = [v5 _matchesLanguageList:v11];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)matchesTraits:(unsigned int)a3
{
  return !a3 || ([(UIFontDescriptor *)self->_fontDescriptor symbolicTraits] & a3) != 0;
}

- (BOOL)matchesFamilyName:(id)a3
{
  id v4 = a3;
  if (v4 && ![(NSString *)self->_familyName isEqualToString:v4])
  {
    char v6 = [(UIFontDescriptor *)self->_fontDescriptor objectForKey:*(void *)off_1E52D6B68];
    char v5 = [v6 isEqualToString:v4];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)matchesClientFontContext:(id)a3
{
  id v4 = a3;
  if (getFontPickerClientFontContextClass())
  {
    char v5 = [v4 _clientFontContextEndpoint];

    BOOL v6 = 1;
    if (v5)
    {
      uint64_t v12 = 0;
      double v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 1;
      id FontPickerClientFontContextClass = getFontPickerClientFontContextClass();
      uint64_t v8 = [v4 _clientFontContextEndpoint];
      uint64_t v9 = [FontPickerClientFontContextClass sharedInstanceForEndpoint:v8];

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __50___UIFontPickerFontInfo_matchesClientFontContext___block_invoke;
      v11[3] = &unk_1E5309370;
      v11[4] = self;
      v11[5] = &v12;
      [v9 runBlockInClientFontContext:v11];
      BOOL v6 = *((unsigned char *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)matchesConfiguration:(id)a3
{
  id v4 = a3;
  if (-[_UIFontPickerFontInfo matchesTraits:](self, "matchesTraits:", [v4 filteredTraits])
    && [(_UIFontPickerFontInfo *)self passesLanguageFilter:v4])
  {
    char v5 = [v4 _filterFamilyName];
    if ([(_UIFontPickerFontInfo *)self matchesFamilyName:v5]) {
      BOOL v6 = [(_UIFontPickerFontInfo *)self matchesClientFontContext:v4];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (_UIFontPickerFontInfo)familyInfo
{
  if (self->_styleName) {
    v2 = [[_UIFontPickerFontInfo alloc] initWithFamilyName:self->_familyName];
  }
  else {
    v2 = self;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIFontPickerFontInfo *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      if ([(NSString *)self->_familyName isEqualToString:v5->_familyName])
      {
        BOOL v6 = 0;
      }
      else if (self->_familyName)
      {
        BOOL v6 = 1;
      }
      else
      {
        BOOL v6 = v5->_familyName != 0;
      }
      styleName = self->_styleName;
      if ((unint64_t)styleName | (unint64_t)v5->_styleName) {
        int v9 = !-[NSString isEqualToString:](styleName, "isEqualToString:");
      }
      else {
        LOBYTE(v9) = 0;
      }
      uint64_t v10 = [(_UIFontPickerFontInfo *)self fontDescriptor];
      if (v10)
      {
        id v11 = [(_UIFontPickerFontInfo *)v5 fontDescriptor];
        if (v11)
        {
          uint64_t v12 = [(_UIFontPickerFontInfo *)self fontDescriptor];
          double v13 = [v12 postscriptName];
          uint64_t v14 = [(_UIFontPickerFontInfo *)v5 fontDescriptor];
          char v15 = [v14 postscriptName];
          BOOL v16 = v13 == v15;
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }

      char v7 = (v6 | v9) ^ 1 | v16;
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_familyName hash];
  return [(NSString *)self->_styleName hash] ^ v3;
}

- (BOOL)matchesFamilyForFontDescriptor:(id)a3
{
  id v4 = [a3 objectForKey:*(void *)off_1E52D6B68];
  BOOL v6 = v4 && (familyName = self->_familyName) != 0 && [(NSString *)familyName isEqualToString:v4];

  return v6;
}

- (BOOL)matchesFontDescriptor:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIFontPickerFontInfo *)self fontDescriptor];
  BOOL v6 = [v5 postscriptName];
  char v7 = [v4 postscriptName];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  return (char)v4;
}

- (id)faceMatchingDescriptor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIFontPickerFontInfo *)self hasMultipleFaces]
    && [(_UIFontPickerFontInfo *)self matchesFamilyForFontDescriptor:v4])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v5 = [(_UIFontPickerFontInfo *)self faces];
    id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 matchesFontDescriptor:v4])
          {
            id v6 = v9;
            goto LABEL_14;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)matchesSearchString:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIFontPickerFontInfo *)self localizedFullName];
  if ([v5 localizedCaseInsensitiveContainsString:v4])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(_UIFontPickerFontInfo *)self styleName];
    if (v7)
    {
      uint64_t v8 = [(_UIFontPickerFontInfo *)self styleName];
      char v6 = [v8 localizedCaseInsensitiveContainsString:v4];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (id)description
{
  v2 = NSString;
  familyName = self->_familyName;
  id v4 = [(_UIFontPickerFontInfo *)self fontDescriptor];
  char v5 = [v4 postscriptName];
  char v6 = [v2 stringWithFormat:@"%@ (%@)", familyName, v5];

  return v6;
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)styleName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)fontName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)previewImagePrefersSingleCharacter
{
  return self->_previewImagePrefersSingleCharacter;
}

- (void)setPreviewImagePrefersSingleCharacter:(BOOL)a3
{
  self->_previewImagePrefersSingleCharacter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canRenderName, 0);
  objc_storeStrong((id *)&self->_subInfos, 0);
  objc_storeStrong((id *)&self->_previewImageContentSize, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_previewStringContainsArabic, 0);
  objc_storeStrong((id *)&self->_preferredShortPreviewString, 0);
  objc_storeStrong((id *)&self->_attributedStringContentSize, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedFullName, 0);
  objc_storeStrong((id *)&self->_localizedStyleName, 0);
  objc_storeStrong((id *)&self->_localizedFamilyName, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_styleName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
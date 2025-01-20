@interface WDCharacterProperties
+ (SEL)fontOverriddenSelectorForFontType:(int)a3;
+ (SEL)fontSelectorForFontType:(int)a3;
+ (SEL)setFontSelectorForFontType:(int)a3;
- (BOOL)compressHorizontalInVertical;
- (BOOL)deletionDifferentFrom:(id)a3;
- (BOOL)deletionDifferentFrom:(id)a3 mode:(int)a4;
- (BOOL)editDifferentFrom:(id)a3;
- (BOOL)editDifferentFrom:(id)a3 mode:(int)a4;
- (BOOL)embeddedObject;
- (BOOL)formattingChangedDifferentFrom:(id)a3;
- (BOOL)formattingChangedDifferentFrom:(id)a3 mode:(int)a4;
- (BOOL)horizontalInVertical;
- (BOOL)isAnythingOverridden;
- (BOOL)isAnythingOverriddenIn:(id)a3;
- (BOOL)isBaseStyleOverridden;
- (BOOL)isBoldForBiTextOverridden;
- (BOOL)isBoldOverridden;
- (BOOL)isBooleanProbablyDifferent:(unsigned __int8)a3 than:(unsigned __int8)a4;
- (BOOL)isBorderOverridden;
- (BOOL)isBracketTwoLinesInOneOverridden;
- (BOOL)isCapsOverridden;
- (BOOL)isCharPositionOfPictureBulletInBookmarkOverridden;
- (BOOL)isColorAuto;
- (BOOL)isColorAutoOverridden;
- (BOOL)isColorOverridden;
- (BOOL)isCompressHorizontalInVerticalOverridden;
- (BOOL)isDeletedOverridden;
- (BOOL)isDeletionDateOverridden;
- (BOOL)isDoubleStrikeThroughOverridden;
- (BOOL)isEditDateOverridden;
- (BOOL)isEditedOverridden;
- (BOOL)isEmbeddedObjectOverridden;
- (BOOL)isEmbossedOverridden;
- (BOOL)isEmphasisMarkOverridden;
- (BOOL)isExtendedFontOverridden;
- (BOOL)isFarEastFontOverridden;
- (BOOL)isFontHintOverridden;
- (BOOL)isFontOverridden;
- (BOOL)isFontOverriddenForFontType:(int)a3;
- (BOOL)isFontSizeForBiTextOverridden;
- (BOOL)isFontSizeOverridden;
- (BOOL)isFormattingChangedOverridden;
- (BOOL)isHiddenOverridden;
- (BOOL)isHighlight;
- (BOOL)isHighlightColorOverridden;
- (BOOL)isHighlightOverridden;
- (BOOL)isHorizontalInVerticalOverridden;
- (BOOL)isImprintOverridden;
- (BOOL)isIndexToAuthorIDOfDeletionOverridden;
- (BOOL)isIndexToAuthorIDOfEditOverridden;
- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)isItalicForBiTextOverridden;
- (BOOL)isItalicOverridden;
- (BOOL)isKerningOverridden;
- (BOOL)isLanguageForBiTextOverridden;
- (BOOL)isLanguageForDefaultTextOverridden;
- (BOOL)isLanguageForFarEastOverridden;
- (BOOL)isLigatureOverridden;
- (BOOL)isListCharacterPictureBullet;
- (BOOL)isListCharacterPictureBulletOverridden;
- (BOOL)isLowerCase;
- (BOOL)isLowerCaseOverridden;
- (BOOL)isObjectIDForOle2Overridden;
- (BOOL)isOffsetToPictureDataOverridden;
- (BOOL)isOle2Overridden;
- (BOOL)isOutline2010WidthOverridden;
- (BOOL)isOutlineColorOverridden;
- (BOOL)isOutlineOverridden;
- (BOOL)isPositionOverridden;
- (BOOL)isReflectionOverridden;
- (BOOL)isRightToLeftOverridden;
- (BOOL)isShadingOverridden;
- (BOOL)isShadow2010OpacityOverridden;
- (BOOL)isShadow2010Overridden;
- (BOOL)isShadowOverridden;
- (BOOL)isSmallCapsOverridden;
- (BOOL)isSpacingOverridden;
- (BOOL)isSpecialCharacter;
- (BOOL)isSpecialCharacterOverridden;
- (BOOL)isStrikeThroughOverridden;
- (BOOL)isSymbolCharacterOverridden;
- (BOOL)isSymbolFontOverridden;
- (BOOL)isTextScaleOverridden;
- (BOOL)isTwoLinesInOneOverridden;
- (BOOL)isUnderlineColorOverridden;
- (BOOL)isUnderlineOverridden;
- (BOOL)isUseCsFontOverridden;
- (BOOL)isVerticalAlignOverridden;
- (BOOL)ole2;
- (BOOL)twoLinesInOne;
- (WDCharacterProperties)initWithDocument:(id)a3;
- (WDDocument)document;
- (float)outline2010Width;
- (float)shadow2010Opacity;
- (id)baseStyle;
- (id)border;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deletionDate;
- (id)description;
- (id)editDate;
- (id)extendedFont;
- (id)farEastFont;
- (id)font;
- (id)fontForFontType:(int)a3;
- (id)mutableBorder;
- (id)mutableShading;
- (id)outlineColor;
- (id)reflection;
- (id)shading;
- (id)shadow2010;
- (id)symbolFont;
- (id)underlineColor;
- (int)bold;
- (int)boldForBiText;
- (int)bracketTwoLinesInOne;
- (int)caps;
- (int)charPositionOfPictureBulletInBookmark;
- (int)deleted;
- (int)doubleStrikeThrough;
- (int)edited;
- (int)embossed;
- (int)emphasisMark;
- (int)fontHint;
- (int)formattingChanged;
- (int)hidden;
- (int)highlightColor;
- (int)imprint;
- (int)italic;
- (int)italicForBiText;
- (int)languageForBiText;
- (int)languageForDefaultText;
- (int)languageForFarEast;
- (int)ligature;
- (int)objectIDForOle2;
- (int)offsetToPictureData;
- (int)outline;
- (int)resolveMode;
- (int)reverseBooleanProperty:(int)a3;
- (int)rightToLeft;
- (int)shadow;
- (int)smallCaps;
- (int)strikeThrough;
- (int)underline;
- (int)useCsFont;
- (int)verticalAlign;
- (signed)position;
- (signed)spacing;
- (unsigned)fontSize;
- (unsigned)fontSizeForBiText;
- (unsigned)indexToAuthorIDOfDeletion;
- (unsigned)indexToAuthorIDOfEdit;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (unsigned)kerning;
- (unsigned)symbolCharacter;
- (unsigned)textScale;
- (void)applyPropertiesFrom:(id)a3 ifOverriddenIn:(id)a4;
- (void)clearBaseStyle;
- (void)copyPropertiesInto:(id)a3;
- (void)negateFormattingChangesWithDefaults:(id)a3;
- (void)removeEmptyFormattingChanges:(id)a3;
- (void)setBaseStyle:(id)a3;
- (void)setBold:(int)a3;
- (void)setBoldForBiText:(int)a3;
- (void)setBracketTwoLinesInOne:(int)a3;
- (void)setCaps:(int)a3;
- (void)setCharPositionOfPictureBulletInBookmark:(int)a3;
- (void)setColor:(id)a3;
- (void)setColorAuto:(BOOL)a3;
- (void)setCompressHorizontalInVertical:(BOOL)a3;
- (void)setDeleted:(int)a3;
- (void)setDeletionDate:(id)a3;
- (void)setDoubleStrikeThrough:(int)a3;
- (void)setEditDate:(id)a3;
- (void)setEdited:(int)a3;
- (void)setEmbeddedObject:(BOOL)a3;
- (void)setEmbossed:(int)a3;
- (void)setEmphasisMark:(int)a3;
- (void)setExtendedFont:(id)a3;
- (void)setFarEastFont:(id)a3;
- (void)setFont:(id)a3;
- (void)setFont:(id)a3 forFontType:(int)a4;
- (void)setFontHint:(int)a3;
- (void)setFontSize:(unsigned __int16)a3;
- (void)setFontSizeForBiText:(unsigned __int16)a3;
- (void)setFormattingChanged:(int)a3;
- (void)setHidden:(int)a3;
- (void)setHighlight:(BOOL)a3;
- (void)setHighlightColor:(int)a3;
- (void)setHorizontalInVertical:(BOOL)a3;
- (void)setImprint:(int)a3;
- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setItalic:(int)a3;
- (void)setItalicForBiText:(int)a3;
- (void)setKerning:(unsigned __int16)a3;
- (void)setLanguageForBiText:(int)a3;
- (void)setLanguageForDefaultText:(int)a3;
- (void)setLanguageForFarEast:(int)a3;
- (void)setLigature:(int)a3;
- (void)setListCharacterPictureBullet:(BOOL)a3;
- (void)setLowerCase:(BOOL)a3;
- (void)setObjectIDForOle2:(int)a3;
- (void)setOffsetToPictureData:(int)a3;
- (void)setOle2:(BOOL)a3;
- (void)setOutline2010Width:(float)a3;
- (void)setOutline:(int)a3;
- (void)setOutlineColor:(id)a3;
- (void)setPosition:(signed __int16)a3;
- (void)setReflection:(id)a3;
- (void)setResolveMode:(int)a3;
- (void)setRightToLeft:(int)a3;
- (void)setShadow2010:(id)a3;
- (void)setShadow2010Opacity:(float)a3;
- (void)setShadow:(int)a3;
- (void)setSmallCaps:(int)a3;
- (void)setSpacing:(signed __int16)a3;
- (void)setSpecialCharacter:(BOOL)a3;
- (void)setStrikeThrough:(int)a3;
- (void)setSymbolCharacter:(unsigned __int16)a3;
- (void)setSymbolFont:(id)a3;
- (void)setTextScale:(unsigned __int16)a3;
- (void)setTwoLinesInOne:(BOOL)a3;
- (void)setUnderline:(int)a3;
- (void)setUnderlineColor:(id)a3;
- (void)setUseCsFont:(int)a3;
- (void)setVerticalAlign:(int)a3;
@end

@implementation WDCharacterProperties

- (WDCharacterProperties)initWithDocument:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDCharacterProperties;
  v5 = [(WDCharacterProperties *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    *(_WORD *)&v6->mOriginal = 1;
    v6->mResolved = 0;
    mOriginalProperties = v6->mOriginalProperties;
    v6->mOriginalProperties = 0;

    mTrackedProperties = v6->mTrackedProperties;
    v6->mTrackedProperties = 0;
  }
  return v6;
}

- (void)setResolveMode:(int)a3
{
  self->mTracked = a3 == 1;
  self->mResolved = a3 == 2;
  self->mOriginal = a3 == 0;
}

- (void)setBold:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setBold:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setBoldOverridden:1];
}

- (void)setItalic:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setItalic:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setItalicOverridden:1];
}

- (void)setOutline:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setOutline:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setOutlineOverridden:1];
}

- (void)setShadow:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setShadow:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setShadowOverridden:1];
}

- (void)setEmbossed:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setEmbossed:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setEmbossedOverridden:1];
}

- (void)setImprint:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setImprint:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setImprintOverridden:1];
}

- (void)setUnderline:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setUnderline:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setUnderlineOverridden:1];
}

- (void)setUnderlineColor:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    id v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (id v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setUnderlineColor:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setUnderlineColorOverridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    id v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    id v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (void)setStrikeThrough:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setStrikeThrough:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setStrikeThroughOverridden:1];
}

- (void)setDoubleStrikeThrough:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setDoubleStrikeThrough:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setDoubleStrikeThroughOverridden:1];
}

- (id)mutableBorder
{
  if (!self->mTracked)
  {
    if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties
        || (objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues),
            v11 = self->mOriginalProperties,
            self->mOriginalProperties = v10,
            v11,
            (mOriginalProperties = self->mOriginalProperties) != 0))
      {
        id v12 = [(WDCharacterPropertiesValues *)mOriginalProperties border];

        v7 = self->mOriginalProperties;
        if (!v12)
        {
          [(WDCharacterPropertiesValues *)v7 setBorderOverridden:1];
          v8 = self->mOriginalProperties;
          goto LABEL_13;
        }
LABEL_10:
        v13 = [(WDCharacterPropertiesValues *)v7 border];
        goto LABEL_14;
      }
    }
LABEL_11:
    v13 = 0;
    goto LABEL_14;
  }
  mTrackedProperties = self->mTrackedProperties;
  if (!mTrackedProperties)
  {
    id v4 = objc_alloc_init(WDCharacterPropertiesValues);
    v5 = self->mTrackedProperties;
    self->mTrackedProperties = v4;

    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_11;
    }
  }
  v6 = [(WDCharacterPropertiesValues *)mTrackedProperties border];

  v7 = self->mTrackedProperties;
  if (v6) {
    goto LABEL_10;
  }
  [(WDCharacterPropertiesValues *)v7 setBorderOverridden:1];
  v8 = self->mTrackedProperties;
LABEL_13:
  v13 = objc_alloc_init(WDBorder);
  [(WDCharacterPropertiesValues *)v8 setBorder:v13];
LABEL_14:
  return v13;
}

- (void)setColor:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    id v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (id v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setColor:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setColorOverridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    id v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    id v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (id)mutableShading
{
  if (!self->mTracked)
  {
    if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties
        || (objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues),
            v11 = self->mOriginalProperties,
            self->mOriginalProperties = v10,
            v11,
            (mOriginalProperties = self->mOriginalProperties) != 0))
      {
        id v12 = [(WDCharacterPropertiesValues *)mOriginalProperties shading];

        v7 = self->mOriginalProperties;
        if (!v12)
        {
          [(WDCharacterPropertiesValues *)v7 setShadingOverridden:1];
          v8 = self->mOriginalProperties;
          goto LABEL_13;
        }
LABEL_10:
        v13 = [(WDCharacterPropertiesValues *)v7 shading];
        goto LABEL_14;
      }
    }
LABEL_11:
    v13 = 0;
    goto LABEL_14;
  }
  mTrackedProperties = self->mTrackedProperties;
  if (!mTrackedProperties)
  {
    id v4 = objc_alloc_init(WDCharacterPropertiesValues);
    v5 = self->mTrackedProperties;
    self->mTrackedProperties = v4;

    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_11;
    }
  }
  v6 = [(WDCharacterPropertiesValues *)mTrackedProperties shading];

  v7 = self->mTrackedProperties;
  if (v6) {
    goto LABEL_10;
  }
  [(WDCharacterPropertiesValues *)v7 setShadingOverridden:1];
  v8 = self->mTrackedProperties;
LABEL_13:
  v13 = objc_alloc_init(WDShading);
  [(WDCharacterPropertiesValues *)v8 setShading:v13];
LABEL_14:
  return v13;
}

- (void)setHighlightColor:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setHighlightColor:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setHighlightColorOverridden:1];
}

- (void)setSmallCaps:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setSmallCaps:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setSmallCapsOverridden:1];
}

- (void)setCaps:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setCaps:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setCapsOverridden:1];
}

- (void)setHidden:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setHidden:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setHiddenOverridden:1];
}

- (void)setSpacing:(signed __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setSpacing:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setSpacingOverridden:1];
}

- (void)setPosition:(signed __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setPosition:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setPositionOverridden:1];
}

- (void)setVerticalAlign:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setVerticalAlign:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setVerticalAlignOverridden:1];
}

- (void)setFontSize:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setFontSize:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setFontSizeOverridden:1];
}

- (void)setKerning:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setKerning:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setKerningOverridden:1];
}

- (void)setFont:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      id v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (id v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        [(WDCharacterPropertiesValues *)v4 setFont:v12];
        [(WDCharacterPropertiesValues *)*p_mTrackedProperties setFontOverridden:1];
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      id v4 = mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
      objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      id v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties) {
        goto LABEL_9;
      }
    }
  }
}

- (void)setFarEastFont:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      id v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (id v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        [(WDCharacterPropertiesValues *)v4 setFarEastFont:v12];
        [(WDCharacterPropertiesValues *)*p_mTrackedProperties setFarEastFontOverridden:1];
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      id v4 = mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
      objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      id v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties) {
        goto LABEL_9;
      }
    }
  }
}

- (void)setExtendedFont:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      id v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (id v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        [(WDCharacterPropertiesValues *)v4 setExtendedFont:v12];
        [(WDCharacterPropertiesValues *)*p_mTrackedProperties setExtendedFontOverridden:1];
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      id v4 = mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
      objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      id v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties) {
        goto LABEL_9;
      }
    }
  }
}

- (void)setSymbolFont:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      id v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (id v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        [(WDCharacterPropertiesValues *)v4 setSymbolFont:v12];
        [(WDCharacterPropertiesValues *)*p_mTrackedProperties setSymbolFontOverridden:1];
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      id v4 = mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
      objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      id v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties) {
        goto LABEL_9;
      }
    }
  }
}

- (void)setLanguageForDefaultText:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setLanguageForDefaultText:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setLanguageForDefaultTextOverridden:1];
}

- (void)setLanguageForFarEast:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setLanguageForFarEast:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setLanguageForFarEastOverridden:1];
}

- (void)setLanguageForBiText:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setLanguageForBiText:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setLanguageForBiTextOverridden:1];
}

- (void)setDeleted:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setDeleted:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setDeletedOverridden:1];
}

- (void)setEdited:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setEdited:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setEditedOverridden:1];
}

- (void)setFormattingChanged:(int)a3
{
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setFormattingChanged:a3 != 0];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setFormattingChangedOverridden:1];
}

- (void)clearBaseStyle
{
  if (self->mTracked
    || self->mResolved
    && (mTrackedProperties = self->mTrackedProperties) != 0
    && [(WDCharacterPropertiesValues *)mTrackedProperties baseStyleOverridden])
  {
    uint64_t v3 = 24;
  }
  else
  {
    if (!self->mOriginal)
    {
      if (!self->mResolved) {
        return;
      }
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || ![(WDCharacterPropertiesValues *)mOriginalProperties baseStyleOverridden])
      {
        return;
      }
    }
    uint64_t v3 = 16;
  }
  [*(id *)((char *)&self->super.isa + v3) setBaseStyleOverridden:0];
  v5 = *(Class *)((char *)&self->super.isa + v3);
  [v5 setBaseStyle:0];
}

- (void)setFontSizeForBiText:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setFontSizeForBiText:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setFontSizeForBiTextOverridden:1];
}

- (void)setColorAuto:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setColorAuto:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setColorAutoOverridden:1];
}

- (BOOL)isListCharacterPictureBulletOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties listCharacterPictureBulletOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 listCharacterPictureBulletOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties listCharacterPictureBulletOverridden];
}

- (void)setSpecialCharacter:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setSpecialCharacter:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setSpecialCharacterOverridden:1];
}

- (void)setBaseStyle:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    id v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (id v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setBaseStyle:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setBaseStyleOverridden:v12 != 0];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    id v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    id v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (BOOL)isRightToLeftOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties rightToLeftOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 rightToLeftOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties rightToLeftOverridden];
}

- (BOOL)isDeletedOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties deletedOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 deletedOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties deletedOverridden];
}

- (BOOL)isBaseStyleOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties baseStyleOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 baseStyleOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties baseStyleOverridden];
}

- (BOOL)isBoldOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties boldOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 boldOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties boldOverridden];
}

- (BOOL)isItalicOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties italicOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 italicOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties italicOverridden];
}

- (BOOL)isStrikeThroughOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties strikeThroughOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 strikeThroughOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties strikeThroughOverridden];
}

- (BOOL)isDoubleStrikeThroughOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties doubleStrikeThroughOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 doubleStrikeThroughOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties doubleStrikeThroughOverridden];
}

- (BOOL)isFontSizeOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties fontSizeOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 fontSizeOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties fontSizeOverridden];
}

- (unsigned)fontSize
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties fontSizeOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 20;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 20;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 fontSizeOverridden]) {
      return 20;
    }
  }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 fontSize];
}

- (BOOL)isVerticalAlignOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties verticalAlignOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 verticalAlignOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties verticalAlignOverridden];
}

- (BOOL)isFontOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties fontOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 fontOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties fontOverridden];
}

- (BOOL)isUnderlineOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties underlineOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 underlineOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties underlineOverridden];
}

- (BOOL)isSmallCapsOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties smallCapsOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 smallCapsOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties smallCapsOverridden];
}

- (BOOL)isCapsOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties capsOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 capsOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties capsOverridden];
}

- (BOOL)isColorOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties colorOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 colorOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties colorOverridden];
}

- (BOOL)isShadingOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties shadingOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 shadingOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties shadingOverridden];
}

- (int)underline
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties underlineOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 underlineOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties underline];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isHiddenOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties hiddenOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 hiddenOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties hiddenOverridden];
}

- (int)bold
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties boldOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 boldOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties bold];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)italic
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties italicOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 italicOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties italic];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (id)baseStyle
{
  if (self->mTracked || self->mResolved)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties baseStyleOverridden])
      {
        id v4 = self->mTrackedProperties;
LABEL_11:
        v6 = [(WDCharacterPropertiesValues *)v4 baseStyle];
        goto LABEL_13;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      if ([(WDCharacterPropertiesValues *)mOriginalProperties baseStyleOverridden])
      {
        id v4 = self->mOriginalProperties;
        goto LABEL_11;
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v8 = [WeakRetained styleSheet];
  v6 = [v8 defaultCharacterStyle];

LABEL_13:
  return v6;
}

- (id)color
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties colorOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 colorOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties color];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (id)font
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties fontOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 fontOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties font];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (int)caps
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties capsOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 capsOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties caps];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)verticalAlign
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties verticalAlignOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 verticalAlignOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties verticalAlign];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setListCharacterPictureBullet:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setListCharacterPictureBullet:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setListCharacterPictureBulletOverridden:1];
}

- (void)setCharPositionOfPictureBulletInBookmark:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setCharPositionOfPictureBulletInBookmark:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setCharPositionOfPictureBulletInBookmarkOverridden:1];
}

- (BOOL)isListCharacterPictureBullet
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties listCharacterPictureBulletOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 listCharacterPictureBulletOverridden])return 0; {
  }
    }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 listCharacterPictureBullet];
}

- (BOOL)isCharPositionOfPictureBulletInBookmarkOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties charPositionOfPictureBulletInBookmarkOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 charPositionOfPictureBulletInBookmarkOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties charPositionOfPictureBulletInBookmarkOverridden];
}

- (int)charPositionOfPictureBulletInBookmark
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties charPositionOfPictureBulletInBookmarkOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 charPositionOfPictureBulletInBookmarkOverridden])return 0; {
  }
    }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 charPositionOfPictureBulletInBookmark];
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (void)negateFormattingChangesWithDefaults:(id)a3
{
  id v132 = a3;
  [(WDCharacterProperties *)self setResolveMode:2];
  if ([(WDCharacterProperties *)self isFormattingChangedOverridden]
    && [(WDCharacterProperties *)self formattingChanged])
  {
    [(WDCharacterProperties *)self setResolveMode:1];
    [v132 setResolveMode:2];
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties) {
      goto LABEL_296;
    }
    if ([(WDCharacterPropertiesValues *)mOriginalProperties baseStyleOverridden])
    {
      mTrackedProperties = self->mTrackedProperties;
      if (!mTrackedProperties
        || ![(WDCharacterPropertiesValues *)mTrackedProperties baseStyleOverridden])
      {
        if ([v132 isBaseStyleOverridden])
        {
          v6 = [v132 baseStyle];
          [(WDCharacterProperties *)self setBaseStyle:v6];
        }
      }
    }
    v7 = self->mOriginalProperties;
    if (!v7) {
      goto LABEL_296;
    }
    if ([(WDCharacterPropertiesValues *)v7 borderOverridden])
    {
      v8 = self->mTrackedProperties;
      if (!v8 || ![(WDCharacterPropertiesValues *)v8 borderOverridden])
      {
        v9 = [(WDCharacterProperties *)self mutableBorder];
        objc_super v10 = [(WDCharacterPropertiesValues *)self->mOriginalProperties border];
        int v11 = [v10 style];

        if (v11)
        {
          [v9 setNullBorder];
        }
        else if ([v132 isBorderOverridden])
        {
          id v12 = [v132 border];
          [v9 setBorder:v12];
        }
        else
        {
          [v9 setSingleBlackBorder];
        }
      }
    }
    v13 = self->mOriginalProperties;
    if (!v13) {
      goto LABEL_296;
    }
    if ([(WDCharacterPropertiesValues *)v13 shadingOverridden])
    {
      v14 = self->mTrackedProperties;
      if (!v14 || ![(WDCharacterPropertiesValues *)v14 shadingOverridden])
      {
        v15 = [(WDCharacterProperties *)self mutableShading];
        v16 = [(WDCharacterPropertiesValues *)self->mOriginalProperties shading];
        int v17 = [v16 style];

        if (v17)
        {
          [v15 setStyle:0];
          v18 = +[WDShading autoForegroundColor];
          [v15 setForeground:v18];

          v19 = +[WDShading autoBackgroundColor];
          [v15 setBackground:v19];
        }
        else if ([v132 isShadingOverridden])
        {
          v19 = [v132 shading];
          [v15 setShading:v19];
        }
        else
        {
          [v15 setStyle:1];
          v20 = +[OITSUColor blackColor];
          [v15 setForeground:v20];

          v19 = +[OITSUColor whiteColor];
          [v15 setBackground:v19];
        }
      }
    }
    v21 = self->mOriginalProperties;
    if (!v21) {
      goto LABEL_296;
    }
    if ([(WDCharacterPropertiesValues *)v21 fontOverridden])
    {
      v22 = self->mTrackedProperties;
      if (!v22 || ![(WDCharacterPropertiesValues *)v22 fontOverridden])
      {
        if ([v132 isFontOverridden])
        {
          v23 = [v132 font];
          [(WDCharacterProperties *)self setFont:v23];
        }
      }
    }
    v24 = self->mOriginalProperties;
    if (!v24) {
      goto LABEL_296;
    }
    v25 = [(WDCharacterPropertiesValues *)v24 extendedFont];
    if (v25)
    {
      v26 = self->mTrackedProperties;
      if (v26)
      {
        v27 = [(WDCharacterPropertiesValues *)v26 extendedFont];

        if (v27) {
          goto LABEL_43;
        }
      }
      else
      {
      }
      if ([v132 isExtendedFontOverridden])
      {
        v28 = [v132 extendedFont];
        [(WDCharacterProperties *)self setExtendedFont:v28];
      }
    }
LABEL_43:
    v29 = self->mOriginalProperties;
    if (!v29) {
      goto LABEL_296;
    }
    v30 = [(WDCharacterPropertiesValues *)v29 farEastFont];
    if (v30)
    {
      v31 = self->mTrackedProperties;
      if (v31)
      {
        v32 = [(WDCharacterPropertiesValues *)v31 farEastFont];

        if (v32) {
          goto LABEL_51;
        }
      }
      else
      {
      }
      if ([v132 isFarEastFontOverridden])
      {
        v33 = [v132 farEastFont];
        [(WDCharacterProperties *)self setFarEastFont:v33];
      }
    }
LABEL_51:
    v34 = self->mOriginalProperties;
    if (v34)
    {
      v35 = [(WDCharacterPropertiesValues *)v34 symbolFont];
      if (v35)
      {
        v36 = self->mTrackedProperties;
        if (!v36)
        {

          goto LABEL_57;
        }
        v37 = [(WDCharacterPropertiesValues *)v36 symbolFont];

        if (!v37)
        {
LABEL_57:
          if ([v132 isSymbolFontOverridden])
          {
            v38 = [v132 symbolFont];
            [(WDCharacterProperties *)self setSymbolFont:v38];
          }
        }
      }
      v39 = self->mOriginalProperties;
      if (v39)
      {
        if ([(WDCharacterPropertiesValues *)v39 symbolCharacterOverridden])
        {
          v40 = self->mTrackedProperties;
          if (!v40 || ![(WDCharacterPropertiesValues *)v40 symbolCharacterOverridden])
          {
            if ([v132 isSymbolCharacterOverridden]) {
              uint64_t v41 = [v132 symbolCharacter];
            }
            else {
              uint64_t v41 = 0;
            }
            [(WDCharacterProperties *)self setSymbolCharacter:v41];
          }
        }
        v42 = self->mOriginalProperties;
        if (v42)
        {
          if ([(WDCharacterPropertiesValues *)v42 boldOverridden])
          {
            v43 = self->mTrackedProperties;
            if (!v43 || ![(WDCharacterPropertiesValues *)v43 boldOverridden]) {
              [(WDCharacterProperties *)self setBold:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties bold]]];
            }
          }
          v44 = self->mOriginalProperties;
          if (v44)
          {
            if ([(WDCharacterPropertiesValues *)v44 boldForBiTextOverridden])
            {
              v45 = self->mTrackedProperties;
              if (!v45 || ![(WDCharacterPropertiesValues *)v45 boldForBiTextOverridden]) {
                [(WDCharacterProperties *)self setBoldForBiText:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties boldForBiText]]];
              }
            }
            v46 = self->mOriginalProperties;
            if (v46)
            {
              if ([(WDCharacterPropertiesValues *)v46 italicOverridden])
              {
                v47 = self->mTrackedProperties;
                if (!v47 || ![(WDCharacterPropertiesValues *)v47 italicOverridden]) {
                  [(WDCharacterProperties *)self setItalic:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties italic]]];
                }
              }
              v48 = self->mOriginalProperties;
              if (v48)
              {
                if ([(WDCharacterPropertiesValues *)v48 italicForBiTextOverridden])
                {
                  v49 = self->mTrackedProperties;
                  if (!v49
                    || ![(WDCharacterPropertiesValues *)v49 italicForBiTextOverridden])
                  {
                    [(WDCharacterProperties *)self setItalicForBiText:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties italicForBiText]]];
                  }
                }
                v50 = self->mOriginalProperties;
                if (v50)
                {
                  if ([(WDCharacterPropertiesValues *)v50 outlineOverridden])
                  {
                    v51 = self->mTrackedProperties;
                    if (!v51 || ![(WDCharacterPropertiesValues *)v51 outlineOverridden]) {
                      [(WDCharacterProperties *)self setOutline:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties outline]]];
                    }
                  }
                  v52 = self->mOriginalProperties;
                  if (v52)
                  {
                    if ([(WDCharacterPropertiesValues *)v52 outlineColorOverridden])
                    {
                      v53 = self->mTrackedProperties;
                      if (!v53 || ![(WDCharacterPropertiesValues *)v53 outlineColorOverridden])
                      {
                        if ([v132 isOutlineColorOverridden]) {
                          [v132 outlineColor];
                        }
                        else {
                        v54 = +[OITSUColor clearColor];
                        }
                        [(WDCharacterProperties *)self setOutlineColor:v54];
                      }
                    }
                    v55 = self->mOriginalProperties;
                    if (v55)
                    {
                      if ([(WDCharacterPropertiesValues *)v55 outline2010WidthOverridden])
                      {
                        v56 = self->mTrackedProperties;
                        if (!v56
                          || ![(WDCharacterPropertiesValues *)v56 outline2010WidthOverridden])
                        {
                          [(WDCharacterPropertiesValues *)self->mOriginalProperties outline2010Width];
                          if (v57 == 0.0)
                          {
                            int v58 = [v132 isOutline2010WidthOverridden];
                            LODWORD(v59) = 3.0;
                            if (v58) {
                              objc_msgSend(v132, "outline2010Width", v59);
                            }
                          }
                          else
                          {
                            double v59 = 0.0;
                          }
                          [(WDCharacterProperties *)self setOutline2010Width:v59];
                        }
                      }
                      v60 = self->mOriginalProperties;
                      if (v60)
                      {
                        if ([(WDCharacterPropertiesValues *)v60 shadowOverridden])
                        {
                          v61 = self->mTrackedProperties;
                          if (!v61 || ![(WDCharacterPropertiesValues *)v61 shadowOverridden]) {
                            [(WDCharacterProperties *)self setShadow:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties shadow]]];
                          }
                        }
                        v62 = self->mOriginalProperties;
                        if (v62)
                        {
                          if ([(WDCharacterPropertiesValues *)v62 embossedOverridden])
                          {
                            v63 = self->mTrackedProperties;
                            if (!v63 || ![(WDCharacterPropertiesValues *)v63 embossedOverridden]) {
                              [(WDCharacterProperties *)self setEmbossed:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties embossed]]];
                            }
                          }
                          v64 = self->mOriginalProperties;
                          if (v64)
                          {
                            if ([(WDCharacterPropertiesValues *)v64 imprintOverridden])
                            {
                              v65 = self->mTrackedProperties;
                              if (!v65 || ![(WDCharacterPropertiesValues *)v65 imprintOverridden]) {
                                [(WDCharacterProperties *)self setImprint:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties imprint]]];
                              }
                            }
                            v66 = self->mOriginalProperties;
                            if (v66)
                            {
                              if ([(WDCharacterPropertiesValues *)v66 underlineOverridden])
                              {
                                v67 = self->mTrackedProperties;
                                if (!v67
                                  || ![(WDCharacterPropertiesValues *)v67 underlineOverridden])
                                {
                                  if ([(WDCharacterPropertiesValues *)self->mOriginalProperties underline])
                                  {
                                    uint64_t v68 = 0;
                                  }
                                  else if ([v132 isUnderlineOverridden])
                                  {
                                    uint64_t v68 = [v132 underline];
                                  }
                                  else
                                  {
                                    uint64_t v68 = 1;
                                  }
                                  [(WDCharacterProperties *)self setUnderline:v68];
                                }
                              }
                              v69 = self->mOriginalProperties;
                              if (v69)
                              {
                                if ([(WDCharacterPropertiesValues *)v69 underlineColorOverridden])
                                {
                                  v70 = self->mTrackedProperties;
                                  if (!v70
                                    || ![(WDCharacterPropertiesValues *)v70 underlineColorOverridden])
                                  {
                                    if ([v132 isUnderlineColorOverridden]) {
                                      [v132 underlineColor];
                                    }
                                    else {
                                    v71 = +[OITSUColor clearColor];
                                    }
                                    [(WDCharacterProperties *)self setUnderlineColor:v71];
                                  }
                                }
                                v72 = self->mOriginalProperties;
                                if (v72)
                                {
                                  if ([(WDCharacterPropertiesValues *)v72 strikeThroughOverridden])
                                  {
                                    v73 = self->mTrackedProperties;
                                    if (!v73
                                      || ![(WDCharacterPropertiesValues *)v73 strikeThroughOverridden])
                                    {
                                      [(WDCharacterProperties *)self setStrikeThrough:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties strikeThrough]]];
                                    }
                                  }
                                  v74 = self->mOriginalProperties;
                                  if (v74)
                                  {
                                    if ([(WDCharacterPropertiesValues *)v74 doubleStrikeThroughOverridden])
                                    {
                                      v75 = self->mTrackedProperties;
                                      if (!v75
                                        || ![(WDCharacterPropertiesValues *)v75 doubleStrikeThroughOverridden])
                                      {
                                        [(WDCharacterProperties *)self setDoubleStrikeThrough:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties doubleStrikeThrough]]];
                                      }
                                    }
                                    v76 = self->mOriginalProperties;
                                    if (v76)
                                    {
                                      if ([(WDCharacterPropertiesValues *)v76 ligatureOverridden])
                                      {
                                        v77 = self->mTrackedProperties;
                                        if (!v77
                                          || ![(WDCharacterPropertiesValues *)v77 ligatureOverridden])
                                        {
                                          [(WDCharacterProperties *)self setLigature:0];
                                        }
                                      }
                                      v78 = self->mOriginalProperties;
                                      if (v78)
                                      {
                                        if ([(WDCharacterPropertiesValues *)v78 highlightOverridden])
                                        {
                                          v79 = self->mTrackedProperties;
                                          if (!v79
                                            || ![(WDCharacterPropertiesValues *)v79 highlightOverridden])
                                          {
                                            [(WDCharacterProperties *)self setHighlight:[(WDCharacterPropertiesValues *)self->mOriginalProperties highlight] ^ 1];
                                          }
                                        }
                                        v80 = self->mOriginalProperties;
                                        if (v80)
                                        {
                                          if ([(WDCharacterPropertiesValues *)v80 highlightColorOverridden])
                                          {
                                            v81 = self->mTrackedProperties;
                                            if (!v81
                                              || ![(WDCharacterPropertiesValues *)v81 highlightColorOverridden])
                                            {
                                              [(WDCharacterProperties *)self setHighlightColor:0];
                                            }
                                          }
                                          v82 = self->mOriginalProperties;
                                          if (v82)
                                          {
                                            if ([(WDCharacterPropertiesValues *)v82 smallCapsOverridden])
                                            {
                                              v83 = self->mTrackedProperties;
                                              if (!v83
                                                || ![(WDCharacterPropertiesValues *)v83 smallCapsOverridden])
                                              {
                                                [(WDCharacterProperties *)self setSmallCaps:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties smallCaps]]];
                                              }
                                            }
                                            v84 = self->mOriginalProperties;
                                            if (v84)
                                            {
                                              if ([(WDCharacterPropertiesValues *)v84 capsOverridden])
                                              {
                                                v85 = self->mTrackedProperties;
                                                if (!v85
                                                  || ![(WDCharacterPropertiesValues *)v85 capsOverridden])
                                                {
                                                  [(WDCharacterProperties *)self setCaps:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties caps]]];
                                                }
                                              }
                                              v86 = self->mOriginalProperties;
                                              if (v86)
                                              {
                                                if ([(WDCharacterPropertiesValues *)v86 lowerCaseOverridden])
                                                {
                                                  v87 = self->mTrackedProperties;
                                                  if (!v87
                                                    || ![(WDCharacterPropertiesValues *)v87 lowerCaseOverridden])
                                                  {
                                                    [(WDCharacterProperties *)self setLowerCase:[(WDCharacterPropertiesValues *)self->mOriginalProperties lowerCase] ^ 1];
                                                  }
                                                }
                                                v88 = self->mOriginalProperties;
                                                if (v88)
                                                {
                                                  if ([(WDCharacterPropertiesValues *)v88 hiddenOverridden])
                                                  {
                                                    v89 = self->mTrackedProperties;
                                                    if (!v89
                                                      || ![(WDCharacterPropertiesValues *)v89 hiddenOverridden])
                                                    {
                                                      [(WDCharacterProperties *)self setHidden:[(WDCharacterProperties *)self reverseBooleanProperty:[(WDCharacterPropertiesValues *)self->mOriginalProperties hidden]]];
                                                    }
                                                  }
                                                  v90 = self->mOriginalProperties;
                                                  if (v90)
                                                  {
                                                    if ([(WDCharacterPropertiesValues *)v90 spacingOverridden])
                                                    {
                                                      v91 = self->mTrackedProperties;
                                                      if (!v91
                                                        || ![(WDCharacterPropertiesValues *)v91 spacingOverridden])
                                                      {
                                                        if ([v132 isSpacingOverridden]) {
                                                          uint64_t v92 = [v132 spacing];
                                                        }
                                                        else {
                                                          uint64_t v92 = 0;
                                                        }
                                                        [(WDCharacterProperties *)self setSpacing:v92];
                                                      }
                                                    }
                                                    v93 = self->mOriginalProperties;
                                                    if (v93)
                                                    {
                                                      if ([(WDCharacterPropertiesValues *)v93 positionOverridden])
                                                      {
                                                        v94 = self->mTrackedProperties;
                                                        if (!v94
                                                          || ![(WDCharacterPropertiesValues *)v94 positionOverridden])
                                                        {
                                                          if ([v132 isPositionOverridden]) {
                                                            uint64_t v95 = [v132 position];
                                                          }
                                                          else {
                                                            uint64_t v95 = 0;
                                                          }
                                                          [(WDCharacterProperties *)self setPosition:v95];
                                                        }
                                                      }
                                                      v96 = self->mOriginalProperties;
                                                      if (v96)
                                                      {
                                                        if ([(WDCharacterPropertiesValues *)v96 kerningOverridden])
                                                        {
                                                          v97 = self->mTrackedProperties;
                                                          if (!v97
                                                            || ![(WDCharacterPropertiesValues *)v97 kerningOverridden])
                                                          {
                                                            if ([v132 isKerningOverridden]) {
                                                              uint64_t v98 = [v132 kerning];
                                                            }
                                                            else {
                                                              uint64_t v98 = 0;
                                                            }
                                                            [(WDCharacterProperties *)self setKerning:v98];
                                                          }
                                                        }
                                                        v99 = self->mOriginalProperties;
                                                        if (v99)
                                                        {
                                                          if ([(WDCharacterPropertiesValues *)v99 textScaleOverridden])
                                                          {
                                                            v100 = self->mTrackedProperties;
                                                            if (!v100
                                                              || ![(WDCharacterPropertiesValues *)v100 textScaleOverridden])
                                                            {
                                                              if ([v132 isTextScaleOverridden])uint64_t v101 = objc_msgSend(v132, "textScale"); {
                                                              else
                                                              }
                                                                uint64_t v101 = 0;
                                                              [(WDCharacterProperties *)self setTextScale:v101];
                                                            }
                                                          }
                                                          v102 = self->mOriginalProperties;
                                                          if (v102)
                                                          {
                                                            if ([(WDCharacterPropertiesValues *)v102 fontSizeOverridden])
                                                            {
                                                              v103 = self->mTrackedProperties;
                                                              if (!v103
                                                                || ![(WDCharacterPropertiesValues *)v103 fontSizeOverridden])
                                                              {
                                                                if ([v132 isFontSizeOverridden])uint64_t v104 = objc_msgSend(v132, "fontSize"); {
                                                                else
                                                                }
                                                                  uint64_t v104 = 22;
                                                                [(WDCharacterProperties *)self setFontSize:v104];
                                                              }
                                                            }
                                                            v105 = self->mOriginalProperties;
                                                            if (v105)
                                                            {
                                                              if ([(WDCharacterPropertiesValues *)v105 verticalAlignOverridden])
                                                              {
                                                                v106 = self->mTrackedProperties;
                                                                if (!v106
                                                                  || ![(WDCharacterPropertiesValues *)v106 verticalAlignOverridden])
                                                                {
                                                                  [(WDCharacterProperties *)self setVerticalAlign:0];
                                                                }
                                                              }
                                                              v107 = self->mOriginalProperties;
                                                              if (v107)
                                                              {
                                                                if ([(WDCharacterPropertiesValues *)v107 emphasisMarkOverridden])
                                                                {
                                                                  v108 = self->mTrackedProperties;
                                                                  if (!v108
                                                                    || ![(WDCharacterPropertiesValues *)v108 emphasisMarkOverridden])
                                                                  {
                                                                    [(WDCharacterProperties *)self setEmphasisMark:0];
                                                                  }
                                                                }
                                                                v109 = self->mOriginalProperties;
                                                                if (v109)
                                                                {
                                                                  if ([(WDCharacterPropertiesValues *)v109 colorOverridden])
                                                                  {
                                                                    v110 = self->mTrackedProperties;
                                                                    if (!v110
                                                                      || ![(WDCharacterPropertiesValues *)v110 colorOverridden])
                                                                    {
                                                                      if ([v132 isColorOverridden])objc_msgSend(v132, "color"); {
                                                                      else
                                                                      }
                                                                      v111 = +[OITSUColor clearColor];
                                                                      [(WDCharacterProperties *)self setColor:v111];
                                                                    }
                                                                  }
                                                                  v112 = self->mOriginalProperties;
                                                                  if (v112)
                                                                  {
                                                                    if ([(WDCharacterPropertiesValues *)v112 colorAutoOverridden])
                                                                    {
                                                                      v113 = self->mTrackedProperties;
                                                                      if (!v113
                                                                        || ![(WDCharacterPropertiesValues *)v113 colorAutoOverridden])
                                                                      {
                                                                        [(WDCharacterProperties *)self setColorAuto:[(WDCharacterPropertiesValues *)self->mOriginalProperties colorAuto] ^ 1];
                                                                      }
                                                                    }
                                                                    v114 = self->mOriginalProperties;
                                                                    if (v114)
                                                                    {
                                                                      if ([(WDCharacterPropertiesValues *)v114 languageForDefaultTextOverridden])
                                                                      {
                                                                        v115 = self->mTrackedProperties;
                                                                        if (!v115
                                                                          || ![(WDCharacterPropertiesValues *)v115 languageForDefaultTextOverridden])
                                                                        {
                                                                          if ([v132 isLanguageForDefaultTextOverridden])uint64_t v116 = objc_msgSend(v132, "languageForDefaultText"); {
                                                                          else
                                                                          }
                                                                            uint64_t v116 = 0;
                                                                          [(WDCharacterProperties *)self setLanguageForDefaultText:v116];
                                                                        }
                                                                      }
                                                                      v117 = self->mOriginalProperties;
                                                                      if (v117)
                                                                      {
                                                                        if ([(WDCharacterPropertiesValues *)v117 specialCharacterOverridden])
                                                                        {
                                                                          v118 = self->mTrackedProperties;
                                                                          if (!v118
                                                                            || ![(WDCharacterPropertiesValues *)v118 specialCharacterOverridden])
                                                                          {
                                                                            [(WDCharacterProperties *)self setSpecialCharacter:[(WDCharacterPropertiesValues *)self->mOriginalProperties specialCharacter] ^ 1];
                                                                          }
                                                                        }
                                                                        v119 = self->mOriginalProperties;
                                                                        if (v119)
                                                                        {
                                                                          if ([(WDCharacterPropertiesValues *)v119 listCharacterPictureBulletOverridden])
                                                                          {
                                                                            v120 = self->mTrackedProperties;
                                                                            if (!v120
                                                                              || ![(WDCharacterPropertiesValues *)v120 listCharacterPictureBulletOverridden])
                                                                            {
                                                                              [(WDCharacterProperties *)self setListCharacterPictureBullet:[(WDCharacterPropertiesValues *)self->mOriginalProperties listCharacterPictureBullet] ^ 1];
                                                                            }
                                                                          }
                                                                          v121 = self->mOriginalProperties;
                                                                          if (v121)
                                                                          {
                                                                            if ([(WDCharacterPropertiesValues *)v121 charPositionOfPictureBulletInBookmarkOverridden])
                                                                            {
                                                                              v122 = self->mTrackedProperties;
                                                                              if (v122) {
                                                                                [(WDCharacterPropertiesValues *)v122 charPositionOfPictureBulletInBookmarkOverridden];
                                                                              }
                                                                            }
                                                                            v123 = self->mOriginalProperties;
                                                                            if (v123)
                                                                            {
                                                                              if ([(WDCharacterPropertiesValues *)v123 languageForFarEastOverridden])
                                                                              {
                                                                                v124 = self->mTrackedProperties;
                                                                                if (!v124
                                                                                  || ![(WDCharacterPropertiesValues *)v124 languageForFarEastOverridden])
                                                                                {
                                                                                  if ([v132 isLanguageForFarEastOverridden]) {
                                                                                    uint64_t v125 = [v132 languageForFarEast];
                                                                                  }
                                                                                  else {
                                                                                    uint64_t v125 = 0;
                                                                                  }
                                                                                  [(WDCharacterProperties *)self setLanguageForFarEast:v125];
                                                                                }
                                                                              }
                                                                              v126 = self->mOriginalProperties;
                                                                              if (v126)
                                                                              {
                                                                                if ([(WDCharacterPropertiesValues *)v126 languageForBiTextOverridden])
                                                                                {
                                                                                  v127 = self->mTrackedProperties;
                                                                                  if (!v127
                                                                                    || ![(WDCharacterPropertiesValues *)v127 languageForBiTextOverridden])
                                                                                  {
                                                                                    if ([v132 isLanguageForBiTextOverridden]) {
                                                                                      uint64_t v128 = [v132 languageForBiText];
                                                                                    }
                                                                                    else {
                                                                                      uint64_t v128 = 0;
                                                                                    }
                                                                                    [(WDCharacterProperties *)self setLanguageForBiText:v128];
                                                                                  }
                                                                                }
                                                                                v129 = self->mOriginalProperties;
                                                                                if (v129)
                                                                                {
                                                                                  if ([(WDCharacterPropertiesValues *)v129 fontSizeForBiTextOverridden])
                                                                                  {
                                                                                    v130 = self->mTrackedProperties;
                                                                                    if (!v130
                                                                                      || ![(WDCharacterPropertiesValues *)v130 fontSizeForBiTextOverridden])
                                                                                    {
                                                                                      if ([v132 isFontSizeForBiTextOverridden]) {
                                                                                        uint64_t v131 = [v132 fontSizeForBiText];
                                                                                      }
                                                                                      else {
                                                                                        uint64_t v131 = 22;
                                                                                      }
                                                                                      [(WDCharacterProperties *)self setFontSizeForBiText:v131];
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_296:
    [(WDCharacterProperties *)self setResolveMode:2];
  }
}

- (BOOL)isFormattingChangedOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties formattingChangedOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 formattingChangedOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties formattingChangedOverridden];
}

- (int)formattingChanged
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties formattingChangedOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 formattingChangedOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties formattingChanged];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)doubleStrikeThrough
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties doubleStrikeThroughOverridden])
      {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 doubleStrikeThroughOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties doubleStrikeThrough];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setSymbolCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setSymbolCharacter:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setSymbolCharacterOverridden:1];
}

- (int)smallCaps
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties smallCapsOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 smallCapsOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties smallCaps];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setEditDate:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    id v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (id v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setEditDate:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setEditDateOverridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    id v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
    int v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    id v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setIndexToAuthorIDOfEdit:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setIndexToAuthorIDOfEditOverridden:1];
}

- (id)editDate
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties editDateOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 editDateOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties editDate];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (unsigned)indexToAuthorIDOfEdit
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties indexToAuthorIDOfEditOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 indexToAuthorIDOfEditOverridden]) {
      return 0;
    }
  }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 indexToAuthorIDOfEdit];
}

- (void)setDeletionDate:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    id v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (id v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setDeletionDate:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setDeletionDateOverridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    id v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    objc_super v10 = objc_alloc_init(WDCharacterPropertiesValues);
    int v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    id v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setIndexToAuthorIDOfDeletion:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setIndexToAuthorIDOfDeletionOverridden:1];
}

- (id)deletionDate
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties deletionDateOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 deletionDateOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties deletionDate];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties indexToAuthorIDOfDeletionOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 indexToAuthorIDOfDeletionOverridden]) {
      return 0;
    }
  }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 indexToAuthorIDOfDeletion];
}

- (int)deleted
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties deletedOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 deletedOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties deleted];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)hidden
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties hiddenOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 hiddenOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties hidden];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setHighlight:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setHighlightOverridden:1];
}

- (id)shading
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties shadingOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 shadingOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties shading];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (void)setRightToLeft:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setRightToLeft:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setRightToLeftOverridden:1];
}

- (int)rightToLeft
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties rightToLeftOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 rightToLeftOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties rightToLeft];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)strikeThrough
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties strikeThroughOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 strikeThroughOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties strikeThrough];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setIndexToAuthorIDOfFormattingChange:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setIndexToAuthorIDOfFormattingChangeOverridden:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[WDCharacterProperties allocWithZone:a3] init];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)&v4->mDocument, WeakRetained);

    v4->mOriginal = self->mOriginal;
    v4->mTracked = self->mTracked;
    v4->mResolved = self->mResolved;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      uint64_t v7 = [(WDCharacterPropertiesValues *)mOriginalProperties copy];
      v8 = v4->mOriginalProperties;
      v4->mOriginalProperties = (WDCharacterPropertiesValues *)v7;
    }
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      uint64_t v10 = [(WDCharacterPropertiesValues *)mTrackedProperties copy];
      int v11 = v4->mTrackedProperties;
      v4->mTrackedProperties = (WDCharacterPropertiesValues *)v10;
    }
    id v12 = v4;
  }

  return v4;
}

- (void)copyPropertiesInto:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[2];
    v15 = v4;
    if (v6)
    {
      v4[2] = 0;

      v5 = v15;
    }
    uint64_t v7 = (void *)v5[3];
    if (v7)
    {
      v15[3] = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)v15 + 4, WeakRetained);

    *((unsigned char *)v15 + 8) = self->mOriginal;
    *((unsigned char *)v15 + 9) = self->mTracked;
    *((unsigned char *)v15 + 10) = self->mResolved;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      uint64_t v10 = [(WDCharacterPropertiesValues *)mOriginalProperties copy];
      int v11 = (void *)v15[2];
      v15[2] = v10;
    }
    mTrackedProperties = self->mTrackedProperties;
    v5 = v15;
    if (mTrackedProperties)
    {
      uint64_t v13 = [(WDCharacterPropertiesValues *)mTrackedProperties copy];
      v14 = (void *)v15[3];
      v15[3] = v13;

      v5 = v15;
    }
  }
}

- (BOOL)isAnythingOverridden
{
  return (self->mOriginal || self->mResolved)
      && [(WDCharacterProperties *)self isAnythingOverriddenIn:self->mOriginalProperties]
      || (self->mTracked || self->mResolved)
      && [(WDCharacterProperties *)self isAnythingOverriddenIn:self->mTrackedProperties];
}

- (int)resolveMode
{
  if (self->mOriginal) {
    return 0;
  }
  if (self->mTracked) {
    return 1;
  }
  return 2 * self->mResolved;
}

- (void)applyPropertiesFrom:(id)a3 ifOverriddenIn:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([v6 isBorderOverridden] && objc_msgSend(v18, "isBorderOverridden"))
  {
    uint64_t v7 = [(WDCharacterProperties *)self mutableBorder];
    v8 = [v18 border];
    [v7 setBorder:v8];
  }
  if ([v6 isShadingOverridden] && objc_msgSend(v18, "isShadingOverridden"))
  {
    v9 = [(WDCharacterProperties *)self mutableShading];
    uint64_t v10 = [v18 shading];
    [v9 setShading:v10];
  }
  if ([v6 isFontOverridden] && objc_msgSend(v18, "isFontOverridden"))
  {
    int v11 = [v18 font];
    [(WDCharacterProperties *)self setFont:v11];
  }
  if ([v6 isExtendedFontOverridden]
    && [v18 isExtendedFontOverridden])
  {
    id v12 = [v18 extendedFont];
    [(WDCharacterProperties *)self setExtendedFont:v12];
  }
  if ([v6 isFarEastFontOverridden]
    && [v18 isFarEastFontOverridden])
  {
    uint64_t v13 = [v18 farEastFont];
    [(WDCharacterProperties *)self setFarEastFont:v13];
  }
  if ([v6 isSymbolFontOverridden]
    && [v18 isSymbolFontOverridden])
  {
    v14 = [v18 symbolFont];
    [(WDCharacterProperties *)self setSymbolFont:v14];
  }
  if ([v6 isSymbolCharacterOverridden]
    && [v18 isSymbolCharacterOverridden])
  {
    -[WDCharacterProperties setSymbolCharacter:](self, "setSymbolCharacter:", [v18 symbolCharacter]);
  }
  if ([v6 isBoldOverridden] && objc_msgSend(v18, "isBoldOverridden")) {
    -[WDCharacterProperties setBold:](self, "setBold:", [v18 bold]);
  }
  if ([v6 isBoldForBiTextOverridden]
    && [v18 isBoldForBiTextOverridden])
  {
    -[WDCharacterProperties setBoldForBiText:](self, "setBoldForBiText:", [v18 boldForBiText]);
  }
  if ([v6 isItalicOverridden] && objc_msgSend(v18, "isItalicOverridden")) {
    -[WDCharacterProperties setItalic:](self, "setItalic:", [v18 italic]);
  }
  if ([v6 isItalicForBiTextOverridden]
    && [v18 isItalicForBiTextOverridden])
  {
    -[WDCharacterProperties setItalicForBiText:](self, "setItalicForBiText:", [v18 italicForBiText]);
  }
  if ([v6 isOutlineOverridden] && objc_msgSend(v18, "isOutlineOverridden")) {
    -[WDCharacterProperties setOutline:](self, "setOutline:", [v18 outline]);
  }
  if ([v6 isOutlineColorOverridden]
    && [v18 isOutlineColorOverridden])
  {
    v15 = [v18 outlineColor];
    [(WDCharacterProperties *)self setOutlineColor:v15];
  }
  if ([v6 isOutline2010WidthOverridden]
    && [v18 isOutline2010WidthOverridden])
  {
    [v18 outline2010Width];
    -[WDCharacterProperties setOutline2010Width:](self, "setOutline2010Width:");
  }
  if ([v6 isEmbossedOverridden] && objc_msgSend(v18, "isEmbossedOverridden")) {
    -[WDCharacterProperties setEmbossed:](self, "setEmbossed:", [v18 embossed]);
  }
  if ([v6 isImprintOverridden] && objc_msgSend(v18, "isImprintOverridden")) {
    -[WDCharacterProperties setImprint:](self, "setImprint:", [v18 imprint]);
  }
  if ([v6 isShadowOverridden] && objc_msgSend(v18, "isShadowOverridden")) {
    -[WDCharacterProperties setShadow:](self, "setShadow:", [v18 shadow]);
  }
  if ([v6 isKerningOverridden] && objc_msgSend(v18, "isKerningOverridden")) {
    -[WDCharacterProperties setKerning:](self, "setKerning:", [v18 kerning]);
  }
  if ([v6 isTextScaleOverridden]
    && [v18 isTextScaleOverridden])
  {
    -[WDCharacterProperties setTextScale:](self, "setTextScale:", [v18 textScale]);
  }
  if ([v6 isUnderlineColorOverridden]
    && [v18 isUnderlineColorOverridden])
  {
    v16 = [v18 underlineColor];
    [(WDCharacterProperties *)self setUnderlineColor:v16];
  }
  if ([v6 isUnderlineOverridden]
    && [v18 isUnderlineOverridden])
  {
    -[WDCharacterProperties setUnderline:](self, "setUnderline:", [v18 underline]);
  }
  if ([v6 isStrikeThroughOverridden]
    && [v18 isStrikeThroughOverridden])
  {
    -[WDCharacterProperties setStrikeThrough:](self, "setStrikeThrough:", [v18 strikeThrough]);
  }
  if ([v6 isDoubleStrikeThroughOverridden]
    && [v18 isDoubleStrikeThroughOverridden])
  {
    -[WDCharacterProperties setDoubleStrikeThrough:](self, "setDoubleStrikeThrough:", [v18 doubleStrikeThrough]);
  }
  if ([v6 isLigatureOverridden] && objc_msgSend(v18, "isLigatureOverridden")) {
    -[WDCharacterProperties setLigature:](self, "setLigature:", [v18 ligature]);
  }
  if ([v6 isHighlightOverridden]
    && [v18 isHighlightOverridden])
  {
    -[WDCharacterProperties setHighlight:](self, "setHighlight:", [v18 isHighlight]);
  }
  if ([v6 isHighlightColorOverridden]
    && [v18 isHighlightColorOverridden])
  {
    -[WDCharacterProperties setHighlightColor:](self, "setHighlightColor:", [v18 highlightColor]);
  }
  if ([v6 isSmallCapsOverridden]
    && [v18 isSmallCapsOverridden])
  {
    -[WDCharacterProperties setSmallCaps:](self, "setSmallCaps:", [v18 smallCaps]);
  }
  if ([v6 isCapsOverridden] && objc_msgSend(v18, "isCapsOverridden")) {
    -[WDCharacterProperties setCaps:](self, "setCaps:", [v18 caps]);
  }
  if ([v6 isLowerCaseOverridden]
    && [v18 isLowerCaseOverridden])
  {
    -[WDCharacterProperties setLowerCase:](self, "setLowerCase:", [v18 isLowerCase]);
  }
  if ([v6 isHiddenOverridden] && objc_msgSend(v18, "isHiddenOverridden")) {
    -[WDCharacterProperties setHidden:](self, "setHidden:", [v18 hidden]);
  }
  if ([v6 isSpacingOverridden] && objc_msgSend(v18, "isSpacingOverridden")) {
    -[WDCharacterProperties setSpacing:](self, "setSpacing:", [v18 spacing]);
  }
  if ([v6 isPositionOverridden] && objc_msgSend(v18, "isPositionOverridden")) {
    -[WDCharacterProperties setPosition:](self, "setPosition:", [v18 position]);
  }
  if ([v6 isFontSizeOverridden] && objc_msgSend(v18, "isFontSizeOverridden")) {
    -[WDCharacterProperties setFontSize:](self, "setFontSize:", [v18 fontSize]);
  }
  if ([v6 isVerticalAlignOverridden]
    && [v18 isVerticalAlignOverridden])
  {
    -[WDCharacterProperties setVerticalAlign:](self, "setVerticalAlign:", [v18 verticalAlign]);
  }
  if ([v6 isEmphasisMarkOverridden]
    && [v18 isEmphasisMarkOverridden])
  {
    -[WDCharacterProperties setEmphasisMark:](self, "setEmphasisMark:", [v18 emphasisMark]);
  }
  if ([v6 isColorOverridden] && objc_msgSend(v18, "isColorOverridden"))
  {
    int v17 = [v18 color];
    [(WDCharacterProperties *)self setColor:v17];
  }
  if ([v6 isColorAutoOverridden]
    && [v18 isColorAutoOverridden])
  {
    -[WDCharacterProperties setColorAuto:](self, "setColorAuto:", [v18 isColorAuto]);
  }
  if ([v6 isLanguageForDefaultTextOverridden]
    && [v18 isLanguageForDefaultTextOverridden])
  {
    -[WDCharacterProperties setLanguageForDefaultText:](self, "setLanguageForDefaultText:", [v18 languageForDefaultText]);
  }
  if ([v6 isSpecialCharacterOverridden]
    && [v18 isSpecialCharacterOverridden])
  {
    -[WDCharacterProperties setSpecialCharacter:](self, "setSpecialCharacter:", [v18 isSpecialCharacter]);
  }
  if ([v6 isListCharacterPictureBulletOverridden]
    && [v18 isListCharacterPictureBulletOverridden])
  {
    -[WDCharacterProperties setListCharacterPictureBullet:](self, "setListCharacterPictureBullet:", [v18 isListCharacterPictureBullet]);
  }
  if ([v6 isCharPositionOfPictureBulletInBookmarkOverridden]
    && [v18 isCharPositionOfPictureBulletInBookmarkOverridden])
  {
    -[WDCharacterProperties setCharPositionOfPictureBulletInBookmark:](self, "setCharPositionOfPictureBulletInBookmark:", [v18 charPositionOfPictureBulletInBookmark]);
  }
  if ([v6 isLanguageForFarEastOverridden]
    && [v18 isLanguageForFarEastOverridden])
  {
    -[WDCharacterProperties setLanguageForFarEast:](self, "setLanguageForFarEast:", [v18 languageForFarEast]);
  }
  if ([v6 isLanguageForBiTextOverridden]
    && [v18 isLanguageForBiTextOverridden])
  {
    -[WDCharacterProperties setLanguageForBiText:](self, "setLanguageForBiText:", [v18 languageForBiText]);
  }
  if ([v6 isFontSizeForBiTextOverridden]
    && [v18 isFontSizeForBiTextOverridden])
  {
    -[WDCharacterProperties setFontSizeForBiText:](self, "setFontSizeForBiText:", [v18 fontSizeForBiText]);
  }
}

- (void)removeEmptyFormattingChanges:(id)a3
{
  id v160 = a3;
  [v160 setResolveMode:0];
  p_mOriginalProperties = (id *)&self->mOriginalProperties;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties
    && [(WDCharacterPropertiesValues *)mOriginalProperties baseStyleOverridden]
    && [v160 isBaseStyleOverridden])
  {
    id v6 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      uint64_t v7 = [*p_mOriginalProperties baseStyle];
    }
    else
    {
      uint64_t v7 = 0;
    }
    v8 = [v160 baseStyle];

    if (v6) {
    if (v7 == v8)
    }
    {
      [*p_mOriginalProperties setBaseStyleOverridden:0];
      [*p_mOriginalProperties setBaseStyle:0];
    }
  }
  [v160 setResolveMode:1];
  mTrackedProperties = self->mTrackedProperties;
  p_mTrackedProperties = (id *)&self->mTrackedProperties;
  v9 = mTrackedProperties;
  if (!mTrackedProperties) {
    goto LABEL_27;
  }
  if ([(WDCharacterPropertiesValues *)v9 baseStyleOverridden]
    && [v160 isBaseStyleOverridden])
  {
    id v12 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      uint64_t v13 = [*p_mTrackedProperties baseStyle];
    }
    else
    {
      uint64_t v13 = 0;
    }
    v14 = [v160 baseStyle];

    if (v12) {
    if (v13 == v14)
    }
    {
      [*p_mTrackedProperties setBaseStyleOverridden:0];
      [*p_mTrackedProperties setBaseStyle:0];
    }
  }
  if (!*p_mTrackedProperties)
  {
LABEL_27:
    BOOL v17 = 0;
    BOOL v18 = 0;
    BOOL v19 = 0;
    BOOL v20 = 0;
    char v21 = 1;
    goto LABEL_265;
  }
  if ([*p_mTrackedProperties baseStyleOverridden])
  {
    if (*p_mOriginalProperties && [*p_mOriginalProperties baseStyleOverridden])
    {
      id v15 = *p_mOriginalProperties;
      if (*p_mOriginalProperties)
      {
        v16 = [*p_mOriginalProperties baseStyle];
      }
      else
      {
        v16 = 0;
      }
      id v22 = *p_mTrackedProperties;
      if (*p_mTrackedProperties)
      {
        v23 = [*p_mTrackedProperties baseStyle];
      }
      else
      {
        v23 = 0;
      }
      char v21 = [v16 isEqual:v23];
      if (v22) {

      }
      if (v15) {
    }
      }
    else
    {
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 1;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties borderOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties borderOverridden]) {
      goto LABEL_53;
    }
    id v24 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v25 = [*p_mOriginalProperties border];
    }
    else
    {
      v25 = 0;
    }
    id v26 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v27 = [*p_mTrackedProperties border];
    }
    else
    {
      v27 = 0;
    }
    char v28 = [v25 isEqual:v27];
    if (v26) {

    }
    if (v24) {
    if ((v28 & 1) == 0)
    }
LABEL_53:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties shadingOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties shadingOverridden]) {
      goto LABEL_69;
    }
    id v29 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v30 = [*p_mOriginalProperties shading];
    }
    else
    {
      v30 = 0;
    }
    id v31 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v32 = [*p_mTrackedProperties shading];
    }
    else
    {
      v32 = 0;
    }
    char v33 = [v30 isEqual:v32];
    if (v31) {

    }
    if (v29) {
    if ((v33 & 1) == 0)
    }
LABEL_69:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties fontOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties fontOverridden]) {
      goto LABEL_85;
    }
    id v34 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v35 = [*p_mOriginalProperties font];
    }
    else
    {
      v35 = 0;
    }
    id v36 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v37 = [*p_mTrackedProperties font];
    }
    else
    {
      v37 = 0;
    }
    char v38 = [v35 isEqual:v37];
    if (v36) {

    }
    if (v34) {
    if ((v38 & 1) == 0)
    }
LABEL_85:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties extendedFontOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties extendedFontOverridden]) {
      goto LABEL_101;
    }
    id v39 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v40 = [*p_mOriginalProperties extendedFont];
    }
    else
    {
      v40 = 0;
    }
    id v41 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v42 = [*p_mTrackedProperties extendedFont];
    }
    else
    {
      v42 = 0;
    }
    char v43 = [v40 isEqual:v42];
    if (v41) {

    }
    if (v39) {
    if ((v43 & 1) == 0)
    }
LABEL_101:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties farEastFontOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties farEastFontOverridden]) {
      goto LABEL_117;
    }
    id v44 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v45 = [*p_mOriginalProperties farEastFont];
    }
    else
    {
      v45 = 0;
    }
    id v46 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v47 = [*p_mTrackedProperties farEastFont];
    }
    else
    {
      v47 = 0;
    }
    char v48 = [v45 isEqual:v47];
    if (v46) {

    }
    if (v44) {
    if ((v48 & 1) == 0)
    }
LABEL_117:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties symbolFontOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties symbolFontOverridden]) {
      goto LABEL_133;
    }
    id v49 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v50 = [*p_mOriginalProperties symbolFont];
    }
    else
    {
      v50 = 0;
    }
    id v51 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v52 = [*p_mTrackedProperties symbolFont];
    }
    else
    {
      v52 = 0;
    }
    char v53 = [v50 isEqual:v52];
    if (v51) {

    }
    if (v49) {
    if ((v53 & 1) == 0)
    }
LABEL_133:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties underlineColorOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties underlineColorOverridden]) {
      goto LABEL_149;
    }
    id v54 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v55 = [*p_mOriginalProperties underlineColor];
    }
    else
    {
      v55 = 0;
    }
    id v56 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      float v57 = [*p_mTrackedProperties underlineColor];
    }
    else
    {
      float v57 = 0;
    }
    char v58 = [v55 isEqual:v57];
    if (v56) {

    }
    if (v54) {
    if ((v58 & 1) == 0)
    }
LABEL_149:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties colorOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties colorOverridden]) {
      goto LABEL_165;
    }
    id v59 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v60 = [*p_mOriginalProperties color];
    }
    else
    {
      v60 = 0;
    }
    id v61 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v62 = [*p_mTrackedProperties color];
    }
    else
    {
      v62 = 0;
    }
    char v63 = [v60 isEqual:v62];
    if (v61) {

    }
    if (v59) {
    if ((v63 & 1) == 0)
    }
LABEL_165:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties shadow2010Overridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties shadow2010Overridden]) {
      goto LABEL_181;
    }
    id v64 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v65 = [*p_mOriginalProperties shadow2010];
    }
    else
    {
      v65 = 0;
    }
    id v66 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v67 = [*p_mTrackedProperties shadow2010];
    }
    else
    {
      v67 = 0;
    }
    char v68 = [v65 isEqual:v67];
    if (v66) {

    }
    if (v64) {
    if ((v68 & 1) == 0)
    }
LABEL_181:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if ([*p_mTrackedProperties reflectionOverridden])
  {
    if (!*p_mOriginalProperties || ![*p_mOriginalProperties reflectionOverridden]) {
      goto LABEL_197;
    }
    id v69 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      v70 = [*p_mOriginalProperties reflection];
    }
    else
    {
      v70 = 0;
    }
    id v71 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      v72 = [*p_mTrackedProperties reflection];
    }
    else
    {
      v72 = 0;
    }
    char v73 = [v70 isEqual:v72];
    if (v71) {

    }
    if (v69) {
    if ((v73 & 1) == 0)
    }
LABEL_197:
      char v21 = 0;
  }
  if (!*p_mTrackedProperties) {
    goto LABEL_264;
  }
  if (![*p_mTrackedProperties symbolCharacterOverridden]) {
    goto LABEL_208;
  }
  if (*p_mOriginalProperties && [*p_mOriginalProperties symbolCharacterOverridden])
  {
    if (*p_mOriginalProperties) {
      int v74 = [*p_mOriginalProperties symbolCharacter];
    }
    else {
      int v74 = 0;
    }
    id v75 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      LODWORD(v75) = [v75 symbolCharacter];
    }
    if (v74 == v75)
    {
LABEL_208:
      if (!*p_mTrackedProperties) {
        goto LABEL_264;
      }
      if (![*p_mTrackedProperties boldOverridden]) {
        goto LABEL_257;
      }
      if (*p_mOriginalProperties && [*p_mOriginalProperties boldOverridden])
      {
        if (*p_mOriginalProperties) {
          int v76 = [*p_mOriginalProperties bold];
        }
        else {
          int v76 = 0;
        }
        id v77 = *p_mTrackedProperties;
        if (*p_mTrackedProperties) {
          LODWORD(v77) = [v77 bold];
        }
        if (v76 == v77)
        {
LABEL_257:
          if (!*p_mTrackedProperties) {
            goto LABEL_264;
          }
          if (![*p_mTrackedProperties boldForBiTextOverridden]) {
            goto LABEL_620;
          }
          if (*p_mOriginalProperties && [*p_mOriginalProperties boldForBiTextOverridden])
          {
            if (*p_mOriginalProperties) {
              int v78 = [*p_mOriginalProperties boldForBiText];
            }
            else {
              int v78 = 0;
            }
            id v79 = *p_mTrackedProperties;
            if (*p_mTrackedProperties) {
              LODWORD(v79) = [v79 boldForBiText];
            }
            if (v78 == v79)
            {
LABEL_620:
              if (!*p_mTrackedProperties) {
                goto LABEL_264;
              }
              if (![*p_mTrackedProperties italicOverridden]) {
                goto LABEL_621;
              }
              if (*p_mOriginalProperties && [*p_mOriginalProperties italicOverridden])
              {
                if (*p_mOriginalProperties) {
                  int v80 = [*p_mOriginalProperties italic];
                }
                else {
                  int v80 = 0;
                }
                id v81 = *p_mTrackedProperties;
                if (*p_mTrackedProperties) {
                  LODWORD(v81) = [v81 italic];
                }
                if (v80 == v81)
                {
LABEL_621:
                  if (!*p_mTrackedProperties) {
                    goto LABEL_264;
                  }
                  if (![*p_mTrackedProperties italicForBiTextOverridden]) {
                    goto LABEL_622;
                  }
                  if (*p_mOriginalProperties
                    && [*p_mOriginalProperties italicForBiTextOverridden])
                  {
                    if (*p_mOriginalProperties) {
                      int v82 = [*p_mOriginalProperties italicForBiText];
                    }
                    else {
                      int v82 = 0;
                    }
                    id v83 = *p_mTrackedProperties;
                    if (*p_mTrackedProperties) {
                      LODWORD(v83) = [v83 italicForBiText];
                    }
                    if (v82 == v83)
                    {
LABEL_622:
                      if (!*p_mTrackedProperties) {
                        goto LABEL_264;
                      }
                      if (![*p_mTrackedProperties outlineOverridden]) {
                        goto LABEL_623;
                      }
                      if (*p_mOriginalProperties
                        && [*p_mOriginalProperties outlineOverridden])
                      {
                        if (*p_mOriginalProperties) {
                          int v84 = [*p_mOriginalProperties outline];
                        }
                        else {
                          int v84 = 0;
                        }
                        id v85 = *p_mTrackedProperties;
                        if (*p_mTrackedProperties) {
                          LODWORD(v85) = [v85 outline];
                        }
                        if (v84 == v85)
                        {
LABEL_623:
                          if (*p_mTrackedProperties)
                          {
                            if ([*p_mTrackedProperties outlineColorOverridden])
                            {
                              if (!*p_mOriginalProperties
                                || ![*p_mOriginalProperties outlineColorOverridden])
                              {
                                goto LABEL_595;
                              }
                              BOOL v18 = *p_mOriginalProperties != 0;
                              if (*p_mOriginalProperties)
                              {
                                v158 = [*p_mOriginalProperties outlineColor];
                              }
                              else
                              {
                                v158 = 0;
                              }
                              BOOL v17 = *p_mTrackedProperties != 0;
                              if (*p_mTrackedProperties)
                              {
                                v157 = [*p_mTrackedProperties outlineColor];
                              }
                              else
                              {
                                v157 = 0;
                              }
                              if (v158 != v157)
                              {
LABEL_422:
                                LOBYTE(v86) = 1;
                                if (!v17)
                                {
LABEL_587:
                                  if (!v18)
                                  {
LABEL_589:
                                    if (!v86 && (v21 & 1) != 0)
                                    {
                                      if (*p_mOriginalProperties) {
                                        [*p_mOriginalProperties setFormattingChangedOverridden:0];
                                      }
                                      if (*p_mTrackedProperties) {
                                        [*p_mTrackedProperties setFormattingChangedOverridden:0];
                                      }
                                    }
                                    goto LABEL_595;
                                  }
LABEL_588:

                                  goto LABEL_589;
                                }
LABEL_274:

                                if (!v18) {
                                  goto LABEL_589;
                                }
                                goto LABEL_588;
                              }
                            }
                            else
                            {
                              BOOL v18 = 0;
                              BOOL v17 = 0;
                            }
                            if (!*p_mTrackedProperties) {
                              goto LABEL_454;
                            }
                            if ([*p_mTrackedProperties outline2010WidthOverridden])
                            {
                              if (!*p_mOriginalProperties
                                || ![*p_mOriginalProperties outline2010WidthOverridden])
                              {
                                goto LABEL_422;
                              }
                              float v110 = 0.0;
                              float v111 = 0.0;
                              if (*p_mOriginalProperties)
                              {
                                [*p_mOriginalProperties outline2010Width];
                                float v111 = v112;
                              }
                              if (*p_mTrackedProperties)
                              {
                                [*p_mTrackedProperties outline2010Width];
                                float v110 = v113;
                              }
                              if (v111 != v110) {
                                goto LABEL_422;
                              }
                            }
                            if (!*p_mTrackedProperties) {
                              goto LABEL_454;
                            }
                            if ([*p_mTrackedProperties shadowOverridden])
                            {
                              if (!*p_mOriginalProperties
                                || ![*p_mOriginalProperties shadowOverridden])
                              {
                                goto LABEL_422;
                              }
                              if (*p_mOriginalProperties) {
                                int v114 = [*p_mOriginalProperties shadow];
                              }
                              else {
                                int v114 = 0;
                              }
                              id v123 = *p_mTrackedProperties;
                              if (*p_mTrackedProperties) {
                                LODWORD(v123) = [v123 shadow];
                              }
                              if (v114 != v123) {
                                goto LABEL_422;
                              }
                            }
                            if (*p_mTrackedProperties
                              && [*p_mTrackedProperties reflectionOverridden])
                            {
                              if (!*p_mOriginalProperties
                                || ![*p_mOriginalProperties reflectionOverridden])
                              {
                                goto LABEL_422;
                              }
                              BOOL v19 = *p_mOriginalProperties != 0;
                              if (*p_mOriginalProperties)
                              {
                                v156 = [*p_mOriginalProperties reflection];
                              }
                              else
                              {
                                v156 = 0;
                              }
                              BOOL v20 = *p_mTrackedProperties != 0;
                              if (*p_mTrackedProperties)
                              {
                                v155 = [*p_mTrackedProperties reflection];
                              }
                              else
                              {
                                v155 = 0;
                              }
                              if (v156 != v155)
                              {
LABEL_470:
                                LOBYTE(v86) = 1;
                                if (!v20) {
                                  goto LABEL_585;
                                }
                                goto LABEL_272;
                              }
                            }
                            else
                            {
LABEL_454:
                              BOOL v19 = 0;
                              BOOL v20 = 0;
                            }
LABEL_265:
                            if (!*p_mTrackedProperties)
                            {
                              LOBYTE(v86) = 0;
                              if (!v20) {
                                goto LABEL_585;
                              }
                              goto LABEL_272;
                            }
                            if ([*p_mTrackedProperties shadow2010Overridden])
                            {
                              if (!*p_mOriginalProperties
                                || ![*p_mOriginalProperties shadow2010Overridden])
                              {
                                goto LABEL_470;
                              }
                              BOOL v159 = *p_mOriginalProperties != 0;
                              if (*p_mOriginalProperties)
                              {
                                v154 = [*p_mOriginalProperties shadow2010];
                              }
                              else
                              {
                                v154 = 0;
                              }
                              id v89 = *p_mTrackedProperties;
                              BOOL v86 = *p_mTrackedProperties != 0;
                              if (*p_mTrackedProperties)
                              {
                                uint64_t v90 = [*p_mTrackedProperties shadow2010];
                              }
                              else
                              {
                                uint64_t v90 = 0;
                              }
                              v153 = (void *)v90;
                              if (v154 != (void *)v90) {
                                goto LABEL_612;
                              }
                              id v87 = *p_mTrackedProperties;
                              if (!*p_mTrackedProperties)
                              {
                                BOOL v91 = 0;
                                if (!v89) {
                                  goto LABEL_583;
                                }
                                goto LABEL_613;
                              }
                            }
                            else
                            {
                              BOOL v86 = 0;
                              id v87 = *p_mTrackedProperties;
                              if (!*p_mTrackedProperties) {
                                goto LABEL_584;
                              }
                              BOOL v159 = 0;
                            }
                            if (!objc_msgSend(v87, "kerningOverridden", v153)) {
                              goto LABEL_624;
                            }
                            if (*p_mOriginalProperties
                              && [*p_mOriginalProperties kerningOverridden])
                            {
                              if (*p_mOriginalProperties) {
                                int v88 = [*p_mOriginalProperties kerning];
                              }
                              else {
                                int v88 = 0;
                              }
                              id v92 = *p_mTrackedProperties;
                              if (*p_mTrackedProperties) {
                                LODWORD(v92) = [v92 kerning];
                              }
                              if (v88 == v92)
                              {
LABEL_624:
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties textScaleOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties textScaleOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v93 = [*p_mOriginalProperties textScale];
                                  }
                                  else {
                                    int v93 = 0;
                                  }
                                  id v94 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v94) = [v94 textScale];
                                  }
                                  if (v93 != v94) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties embossedOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties embossedOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v95 = [*p_mOriginalProperties embossed];
                                  }
                                  else {
                                    int v95 = 0;
                                  }
                                  id v96 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v96) = [v96 embossed];
                                  }
                                  if (v95 != v96) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties imprintOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties imprintOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v97 = [*p_mOriginalProperties imprint];
                                  }
                                  else {
                                    int v97 = 0;
                                  }
                                  id v98 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v98) = [v98 imprint];
                                  }
                                  if (v97 != v98) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties underlineOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties underlineOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v99 = [*p_mOriginalProperties underline];
                                  }
                                  else {
                                    int v99 = 0;
                                  }
                                  id v100 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v100) = [v100 underline];
                                  }
                                  if (v99 != v100) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties strikeThroughOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties strikeThroughOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v101 = [*p_mOriginalProperties strikeThrough];
                                  }
                                  else {
                                    int v101 = 0;
                                  }
                                  id v102 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v102) = [v102 strikeThrough];
                                  }
                                  if (v101 != v102) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties doubleStrikeThroughOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties doubleStrikeThroughOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v103 = [*p_mOriginalProperties doubleStrikeThrough];
                                  }
                                  else {
                                    int v103 = 0;
                                  }
                                  id v104 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v104) = [v104 doubleStrikeThrough];
                                  }
                                  if (v103 != v104) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties ligatureOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties ligatureOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v105 = [*p_mOriginalProperties ligature];
                                  }
                                  else {
                                    int v105 = 0;
                                  }
                                  id v106 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v106) = [v106 ligature];
                                  }
                                  if (v105 != v106) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties highlightOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties highlightOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v107 = [*p_mOriginalProperties highlight];
                                  }
                                  else {
                                    int v107 = 0;
                                  }
                                  id v108 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v108) = [v108 highlight];
                                  }
                                  if (v107 != v108) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties highlightColorOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties highlightColorOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v109 = [*p_mOriginalProperties highlightColor];
                                  }
                                  else {
                                    int v109 = 0;
                                  }
                                  id v115 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v115) = [v115 highlightColor];
                                  }
                                  if (v109 != v115) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties smallCapsOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties smallCapsOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v116 = [*p_mOriginalProperties smallCapsOverridden];
                                  }
                                  else {
                                    int v116 = 0;
                                  }
                                  id v117 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v117) = [v117 smallCapsOverridden];
                                  }
                                  if (v116 != v117) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties capsOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties capsOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v118 = [*p_mOriginalProperties capsOverridden];
                                  }
                                  else {
                                    int v118 = 0;
                                  }
                                  id v119 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v119) = [v119 capsOverridden];
                                  }
                                  if (v118 != v119) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties lowerCaseOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties lowerCaseOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v120 = [*p_mOriginalProperties lowerCase];
                                  }
                                  else {
                                    int v120 = 0;
                                  }
                                  id v121 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v121) = [v121 lowerCase];
                                  }
                                  if (v120 != v121) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties hiddenOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties hiddenOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v122 = [*p_mOriginalProperties hidden];
                                  }
                                  else {
                                    int v122 = 0;
                                  }
                                  id v124 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v124) = [v124 hidden];
                                  }
                                  if (v122 != v124) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties spacingOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties spacingOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v125 = [*p_mOriginalProperties spacing];
                                  }
                                  else {
                                    int v125 = 0;
                                  }
                                  id v126 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v126) = [v126 spacing];
                                  }
                                  if (v125 != v126) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties positionOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties positionOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v127 = [*p_mOriginalProperties position];
                                  }
                                  else {
                                    int v127 = 0;
                                  }
                                  id v128 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v128) = [v128 position];
                                  }
                                  if (v127 != v128) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties fontSizeOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties fontSizeOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v129 = [*p_mOriginalProperties fontSize];
                                  }
                                  else {
                                    int v129 = 0;
                                  }
                                  id v130 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v130) = [v130 fontSize];
                                  }
                                  if (v129 != v130) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties verticalAlignOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties verticalAlignOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v131 = [*p_mOriginalProperties verticalAlign];
                                  }
                                  else {
                                    int v131 = 0;
                                  }
                                  id v132 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v132) = [v132 verticalAlign];
                                  }
                                  if (v131 != v132) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties emphasisMarkOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties emphasisMarkOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v133 = [*p_mOriginalProperties emphasisMark];
                                  }
                                  else {
                                    int v133 = 0;
                                  }
                                  id v134 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v134) = [v134 emphasisMark];
                                  }
                                  if (v133 != v134) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties colorAutoOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties colorAutoOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v135 = [*p_mOriginalProperties colorAuto];
                                  }
                                  else {
                                    int v135 = 0;
                                  }
                                  id v136 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v136) = [v136 colorAuto];
                                  }
                                  if (v135 != v136) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties languageForDefaultTextOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties languageForDefaultTextOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v137 = [*p_mOriginalProperties languageForDefaultText];
                                  }
                                  else {
                                    int v137 = 0;
                                  }
                                  id v138 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v138) = [v138 languageForDefaultText];
                                  }
                                  if (v137 != v138) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties specialCharacterOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties specialCharacterOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v139 = [*p_mOriginalProperties specialCharacter];
                                  }
                                  else {
                                    int v139 = 0;
                                  }
                                  id v140 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v140) = [v140 specialCharacter];
                                  }
                                  if (v139 != v140) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties listCharacterPictureBulletOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties listCharacterPictureBulletOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v141 = [*p_mOriginalProperties listCharacterPictureBullet];
                                  }
                                  else {
                                    int v141 = 0;
                                  }
                                  id v142 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v142) = [v142 listCharacterPictureBullet];
                                  }
                                  if (v141 != v142) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties charPositionOfPictureBulletInBookmarkOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties charPositionOfPictureBulletInBookmarkOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v143 = [*p_mOriginalProperties charPositionOfPictureBulletInBookmark];
                                  }
                                  else {
                                    int v143 = 0;
                                  }
                                  id v144 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v144) = [v144 charPositionOfPictureBulletInBookmark];
                                  }
                                  if (v143 != v144) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties) {
                                  goto LABEL_582;
                                }
                                if ([*p_mTrackedProperties languageForFarEastOverridden])
                                {
                                  if (!*p_mOriginalProperties
                                    || ![*p_mOriginalProperties languageForFarEastOverridden])
                                  {
                                    goto LABEL_612;
                                  }
                                  if (*p_mOriginalProperties) {
                                    int v145 = [*p_mOriginalProperties languageForFarEast];
                                  }
                                  else {
                                    int v145 = 0;
                                  }
                                  id v146 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v146) = [v146 languageForFarEast];
                                  }
                                  if (v145 != v146) {
                                    goto LABEL_612;
                                  }
                                }
                                if (!*p_mTrackedProperties)
                                {
LABEL_582:
                                  BOOL v91 = 0;
                                  if (!v86) {
                                    goto LABEL_583;
                                  }
                                  goto LABEL_613;
                                }
                                if (![*p_mTrackedProperties languageForBiTextOverridden]) {
                                  goto LABEL_625;
                                }
                                if (*p_mOriginalProperties
                                  && [*p_mOriginalProperties languageForBiTextOverridden])
                                {
                                  if (*p_mOriginalProperties) {
                                    int v147 = [*p_mOriginalProperties languageForBiText];
                                  }
                                  else {
                                    int v147 = 0;
                                  }
                                  id v148 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties) {
                                    LODWORD(v148) = [v148 languageForBiText];
                                  }
                                  if (v147 == v148)
                                  {
LABEL_625:
                                    if (!*p_mTrackedProperties
                                      || ![*p_mTrackedProperties shadow2010OpacityOverridden])
                                    {
                                      BOOL v91 = 0;
                                      if (!v86) {
                                        goto LABEL_583;
                                      }
                                      goto LABEL_613;
                                    }
                                    if (*p_mOriginalProperties
                                      && [*p_mOriginalProperties shadow2010OpacityOverridden])
                                    {
                                      float v149 = 0.0;
                                      float v150 = 0.0;
                                      if (*p_mOriginalProperties)
                                      {
                                        [*p_mOriginalProperties shadow2010Opacity];
                                        float v150 = v151;
                                      }
                                      if (*p_mTrackedProperties)
                                      {
                                        [*p_mTrackedProperties shadow2010Opacity];
                                        float v149 = v152;
                                      }
                                      BOOL v91 = v150 != v149;
                                      if (!v86)
                                      {
LABEL_583:
                                        LOBYTE(v86) = v91;
                                        if (!v159) {
                                          goto LABEL_584;
                                        }
                                        goto LABEL_614;
                                      }
LABEL_613:

                                      LOBYTE(v86) = v91;
                                      if (!v159)
                                      {
LABEL_584:
                                        if (!v20) {
                                          goto LABEL_585;
                                        }
                                        goto LABEL_272;
                                      }
LABEL_614:

                                      LOBYTE(v86) = v91;
                                      if (!v20)
                                      {
LABEL_585:
                                        if (v19)
                                        {
LABEL_586:

                                          if (!v17) {
                                            goto LABEL_587;
                                          }
                                          goto LABEL_274;
                                        }
LABEL_273:
                                        if (!v17) {
                                          goto LABEL_587;
                                        }
                                        goto LABEL_274;
                                      }
LABEL_272:

                                      if (v19) {
                                        goto LABEL_586;
                                      }
                                      goto LABEL_273;
                                    }
                                  }
                                }
                              }
                            }
LABEL_612:
                            BOOL v91 = 1;
                            if (!v86) {
                              goto LABEL_583;
                            }
                            goto LABEL_613;
                          }
LABEL_264:
                          BOOL v17 = 0;
                          BOOL v18 = 0;
                          BOOL v19 = 0;
                          BOOL v20 = 0;
                          goto LABEL_265;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_595:
}

- (id)border
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties borderOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 borderOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties border];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (BOOL)isBorderOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties borderOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 borderOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties borderOverridden];
}

- (id)extendedFont
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties extendedFontOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 extendedFontOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties extendedFont];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (BOOL)isExtendedFontOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties extendedFontOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 extendedFontOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties extendedFontOverridden];
}

- (id)farEastFont
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties farEastFontOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 farEastFontOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties farEastFont];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (BOOL)isFarEastFontOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties farEastFontOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 farEastFontOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties farEastFontOverridden];
}

- (id)symbolFont
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties symbolFontOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 symbolFontOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties symbolFont];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (BOOL)isSymbolFontOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties symbolFontOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 symbolFontOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties symbolFontOverridden];
}

- (id)fontForFontType:(int)a3
{
  switch(a3)
  {
    case 0:
      v5 = [(WDCharacterProperties *)self font];
      goto LABEL_9;
    case 1:
      v5 = [(WDCharacterProperties *)self farEastFont];
      goto LABEL_9;
    case 2:
      v5 = [(WDCharacterProperties *)self extendedFont];
      goto LABEL_9;
    case 3:
      v5 = [(WDCharacterProperties *)self symbolFont];
LABEL_9:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)isFontOverriddenForFontType:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL result = [(WDCharacterProperties *)self isFontOverridden];
      break;
    case 1:
      BOOL result = [(WDCharacterProperties *)self isFarEastFontOverridden];
      break;
    case 2:
      BOOL result = [(WDCharacterProperties *)self isExtendedFontOverridden];
      break;
    case 3:
      BOOL result = [(WDCharacterProperties *)self isSymbolFontOverridden];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)setFont:(id)a3 forFontType:(int)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      [(WDCharacterProperties *)self setFont:v6];
      goto LABEL_3;
    case 1:
LABEL_3:
      [(WDCharacterProperties *)self setFarEastFont:v6];
      goto LABEL_4;
    case 2:
LABEL_4:
      [(WDCharacterProperties *)self setExtendedFont:v6];
      goto LABEL_5;
    case 3:
LABEL_5:
      [(WDCharacterProperties *)self setSymbolFont:v6];
      break;
    default:
      break;
  }
}

+ (SEL)fontSelectorForFontType:(int)a3
{
  switch(a3)
  {
    case 0:
      SEL result = sel_font;
      break;
    case 1:
      SEL result = sel_farEastFont;
      break;
    case 2:
      SEL result = sel_extendedFont;
      break;
    case 3:
      SEL result = sel_symbolFont;
      break;
    default:
      SEL result = 0;
      break;
  }
  return result;
}

+ (SEL)fontOverriddenSelectorForFontType:(int)a3
{
  switch(a3)
  {
    case 0:
      SEL result = sel_isFontOverridden;
      break;
    case 1:
      SEL result = sel_isFarEastFontOverridden;
      break;
    case 2:
      SEL result = sel_isExtendedFontOverridden;
      break;
    case 3:
      SEL result = sel_isSymbolFontOverridden;
      break;
    default:
      SEL result = 0;
      break;
  }
  return result;
}

+ (SEL)setFontSelectorForFontType:(int)a3
{
  switch(a3)
  {
    case 0:
      SEL result = sel_setFont_;
      break;
    case 1:
      SEL result = sel_setFarEastFont_;
      break;
    case 2:
      SEL result = sel_setExtendedFont_;
      break;
    case 3:
      SEL result = sel_setSymbolFont_;
      break;
    default:
      SEL result = 0;
      break;
  }
  return result;
}

- (int)fontHint
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties fontHintOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return -1;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return -1;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 fontHintOverridden]) {
      return -1;
    }
  }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 fontHint];
}

- (void)setFontHint:(int)a3
{
  if ((a3 - 4) < 0xFFFFFFFD) {
    return;
  }
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_8;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_8:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setFontHint:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setFontHintOverridden:1];
}

- (BOOL)isFontHintOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties fontHintOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 fontHintOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties fontHintOverridden];
}

- (unsigned)symbolCharacter
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties symbolCharacterOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 symbolCharacterOverridden]) {
      return 0;
    }
  }
  v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 symbolCharacter];
}

- (BOOL)isSymbolCharacterOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties symbolCharacterOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 symbolCharacterOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties symbolCharacterOverridden];
}

- (int)boldForBiText
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties boldForBiTextOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 boldForBiTextOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties boldForBiText];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setBoldForBiText:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setBoldForBiText:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setBoldForBiTextOverridden:1];
}

- (BOOL)isBoldForBiTextOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties boldForBiTextOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 boldForBiTextOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties boldForBiTextOverridden];
}

- (int)italicForBiText
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties italicForBiTextOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 italicForBiTextOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties italicForBiText];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setItalicForBiText:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setItalicForBiText:v3];
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setItalicForBiTextOverridden:1];
}

- (BOOL)isItalicForBiTextOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties italicForBiTextOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 italicForBiTextOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties italicForBiTextOverridden];
}

- (int)outline
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties outlineOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 outlineOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties outline];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isOutlineOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties outlineOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 outlineOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties outlineOverridden];
}

- (id)outlineColor
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties outlineColorOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 outlineColorOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties outlineColor];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (void)setOutlineColor:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    uint64_t v4 = mTrackedProperties;
    if (mTrackedProperties
      || (uint64_t v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          id *p_mTrackedProperties = v7,
          v8,
          (uint64_t v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setOutlineColor:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setOutlineColorOverridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    uint64_t v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    uint64_t v10 = objc_alloc_init(WDCharacterPropertiesValues);
    int v11 = *p_mTrackedProperties;
    id *p_mTrackedProperties = v10;

    uint64_t v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (BOOL)isOutlineColorOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties outlineColorOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 outlineColorOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties outlineColorOverridden];
}

- (float)outline2010Width
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties outline2010WidthOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0.0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0.0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 outline2010WidthOverridden]) {
      return 0.0;
    }
  }
  v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 outline2010Width];
  return result;
}

- (void)setOutline2010Width:(float)a3
{
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  *(float *)&double v8 = a3;
  [(WDCharacterPropertiesValues *)mTrackedProperties setOutline2010Width:v8];
  v9 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v9 setOutline2010WidthOverridden:1];
}

- (BOOL)isOutline2010WidthOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties outline2010WidthOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 outline2010WidthOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties outline2010WidthOverridden];
}

- (int)embossed
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties embossedOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 embossedOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties embossed];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isEmbossedOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties embossedOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 embossedOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties embossedOverridden];
}

- (int)imprint
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties imprintOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 imprintOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties imprint];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isImprintOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties imprintOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 imprintOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties imprintOverridden];
}

- (int)shadow
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties shadowOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 shadowOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties shadow];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isShadowOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties shadowOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 shadowOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties shadowOverridden];
}

- (float)shadow2010Opacity
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties shadow2010OpacityOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0.0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0.0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 shadow2010OpacityOverridden]) {
      return 0.0;
    }
  }
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 shadow2010Opacity];
  return result;
}

- (void)setShadow2010Opacity:(float)a3
{
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  *(float *)&double v8 = a3;
  [(WDCharacterPropertiesValues *)mTrackedProperties setShadow2010Opacity:v8];
  v9 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v9 setShadow2010OpacityOverridden:1];
}

- (BOOL)isShadow2010OpacityOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties shadow2010OpacityOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 shadow2010OpacityOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties shadow2010OpacityOverridden];
}

- (id)underlineColor
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties underlineColorOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 underlineColorOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties underlineColor];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (BOOL)isUnderlineColorOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties underlineColorOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 underlineColorOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties underlineColorOverridden];
}

- (unsigned)kerning
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties kerningOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 kerningOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 kerning];
}

- (BOOL)isKerningOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties kerningOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 kerningOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties kerningOverridden];
}

- (unsigned)textScale
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties textScaleOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 100;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 100;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 textScaleOverridden]) {
      return 100;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 textScale];
}

- (void)setTextScale:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setTextScale:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setTextScaleOverridden:1];
}

- (BOOL)isTextScaleOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties textScaleOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 textScaleOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties textScaleOverridden];
}

- (BOOL)isHighlight
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties highlightOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 highlightOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 highlight];
}

- (BOOL)isHighlightOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties highlightOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 highlightOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties highlightOverridden];
}

- (int)highlightColor
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties highlightColorOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 highlightColorOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties highlightColor];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isHighlightColorOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties highlightColorOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 highlightColorOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties highlightColorOverridden];
}

- (int)ligature
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties ligatureOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 ligatureOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties ligature];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setLigature:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setLigature:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setLigatureOverridden:1];
}

- (BOOL)isLigatureOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties ligatureOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 ligatureOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties ligatureOverridden];
}

- (BOOL)isLowerCase
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties lowerCaseOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 lowerCaseOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 lowerCase];
}

- (void)setLowerCase:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setLowerCase:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setLowerCaseOverridden:1];
}

- (BOOL)isLowerCaseOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties lowerCaseOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 lowerCaseOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties lowerCaseOverridden];
}

- (signed)spacing
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties spacingOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 spacingOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 spacing];
}

- (BOOL)isSpacingOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties spacingOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 spacingOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties spacingOverridden];
}

- (signed)position
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties positionOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 positionOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 position];
}

- (BOOL)isPositionOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties positionOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 positionOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties positionOverridden];
}

- (id)reflection
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties reflectionOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 reflectionOverridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties reflection];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (void)setReflection:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    uint64_t v4 = mTrackedProperties;
    if (mTrackedProperties
      || (uint64_t v7 = objc_alloc_init(WDCharacterPropertiesValues),
          double v8 = *p_mTrackedProperties,
          id *p_mTrackedProperties = v7,
          v8,
          (uint64_t v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setReflection:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setReflectionOverridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    uint64_t v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    uint64_t v10 = objc_alloc_init(WDCharacterPropertiesValues);
    int v11 = *p_mTrackedProperties;
    id *p_mTrackedProperties = v10;

    uint64_t v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (BOOL)isReflectionOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties reflectionOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 reflectionOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties reflectionOverridden];
}

- (id)shadow2010
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties shadow2010Overridden]) {
        goto LABEL_9;
      }
    }
  }
  if (!self->mOriginal && !self->mResolved) {
    goto LABEL_10;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (!mOriginalProperties) {
    goto LABEL_11;
  }
  p_mTrackedProperties = p_mOriginalProperties;
  if ([v5 shadow2010Overridden])
  {
LABEL_9:
    v5 = [(WDCharacterPropertiesValues *)*p_mTrackedProperties shadow2010];
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  return v5;
}

- (void)setShadow2010:(id)a3
{
  id v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    uint64_t v4 = mTrackedProperties;
    if (mTrackedProperties
      || (uint64_t v7 = objc_alloc_init(WDCharacterPropertiesValues),
          double v8 = *p_mTrackedProperties,
          id *p_mTrackedProperties = v7,
          v8,
          (uint64_t v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      [(WDCharacterPropertiesValues *)v4 setShadow2010:v12];
      [(WDCharacterPropertiesValues *)*p_mTrackedProperties setShadow2010Overridden:1];
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    uint64_t v4 = mOriginalProperties;
    if (mOriginalProperties) {
      goto LABEL_8;
    }
    uint64_t v10 = objc_alloc_init(WDCharacterPropertiesValues);
    int v11 = *p_mTrackedProperties;
    id *p_mTrackedProperties = v10;

    uint64_t v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties) {
      goto LABEL_8;
    }
  }
}

- (BOOL)isShadow2010Overridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties shadow2010Overridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 shadow2010Overridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties shadow2010Overridden];
}

- (int)emphasisMark
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties emphasisMarkOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 emphasisMarkOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 emphasisMark];
}

- (void)setEmphasisMark:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setEmphasisMark:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setEmphasisMarkOverridden:1];
}

- (BOOL)isEmphasisMarkOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties emphasisMarkOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 emphasisMarkOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties emphasisMarkOverridden];
}

- (BOOL)isColorAuto
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties colorAutoOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 colorAutoOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 colorAuto];
}

- (BOOL)isColorAutoOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties colorAutoOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 colorAutoOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties colorAutoOverridden];
}

- (int)languageForDefaultText
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties languageForDefaultTextOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 languageForDefaultTextOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 languageForDefaultText];
}

- (BOOL)isLanguageForDefaultTextOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties languageForDefaultTextOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 languageForDefaultTextOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties languageForDefaultTextOverridden];
}

- (int)useCsFont
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties useCsFontOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 useCsFontOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties useCsFont];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setUseCsFont:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      id v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setUseCsFont:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setUseCsFontOverridden:1];
}

- (BOOL)isUseCsFontOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties useCsFontOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 useCsFontOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties useCsFontOverridden];
}

- (int)edited
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties editedOverridden]) {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 editedOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties edited];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isEditedOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties editedOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 editedOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties editedOverridden];
}

- (BOOL)isIndexToAuthorIDOfDeletionOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties indexToAuthorIDOfDeletionOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 indexToAuthorIDOfDeletionOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties indexToAuthorIDOfDeletionOverridden];
}

- (BOOL)isIndexToAuthorIDOfEditOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties indexToAuthorIDOfEditOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 indexToAuthorIDOfEditOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties indexToAuthorIDOfEditOverridden];
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties indexToAuthorIDOfFormattingChangeOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 indexToAuthorIDOfFormattingChangeOverridden])return 0; {
  }
    }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 indexToAuthorIDOfFormattingChange];
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties indexToAuthorIDOfFormattingChangeOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 indexToAuthorIDOfFormattingChangeOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties indexToAuthorIDOfFormattingChangeOverridden];
}

- (BOOL)isDeletionDateOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties deletionDateOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 deletionDateOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties deletionDateOverridden];
}

- (BOOL)isEditDateOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties editDateOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (id v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 editDateOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties editDateOverridden];
}

- (BOOL)deletionDifferentFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(WDCharacterProperties *)self deletionDifferentFrom:v4 mode:0];
    int v6 = v5 | [(WDCharacterProperties *)self deletionDifferentFrom:v4 mode:1];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)editDifferentFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(WDCharacterProperties *)self editDifferentFrom:v4 mode:0];
    int v6 = v5 | [(WDCharacterProperties *)self editDifferentFrom:v4 mode:1];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)formattingChangedDifferentFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(WDCharacterProperties *)self formattingChangedDifferentFrom:v4 mode:0];
    int v6 = v5 | [(WDCharacterProperties *)self formattingChangedDifferentFrom:v4 mode:1];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)isSpecialCharacter
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties specialCharacterOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 specialCharacterOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 specialCharacter];
}

- (BOOL)isSpecialCharacterOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties specialCharacterOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 specialCharacterOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties specialCharacterOverridden];
}

- (int)languageForFarEast
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties languageForFarEastOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 1024;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 1024;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 languageForFarEastOverridden]) {
      return 1024;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 languageForFarEast];
}

- (BOOL)isLanguageForFarEastOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties languageForFarEastOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 languageForFarEastOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties languageForFarEastOverridden];
}

- (int)languageForBiText
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties languageForBiTextOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 languageForBiTextOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 languageForBiText];
}

- (BOOL)isLanguageForBiTextOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties languageForBiTextOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 languageForBiTextOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties languageForBiTextOverridden];
}

- (unsigned)fontSizeForBiText
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties fontSizeForBiTextOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 fontSizeForBiTextOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 fontSizeForBiText];
}

- (BOOL)isFontSizeForBiTextOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties fontSizeForBiTextOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 fontSizeForBiTextOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties fontSizeForBiTextOverridden];
}

- (BOOL)embeddedObject
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties embeddedObjectOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 embeddedObjectOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 embeddedObject];
}

- (void)setEmbeddedObject:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setEmbeddedObject:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setEmbeddedObjectOverridden:1];
}

- (BOOL)isEmbeddedObjectOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties embeddedObjectOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 embeddedObjectOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties embeddedObjectOverridden];
}

- (BOOL)ole2
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties ole2Overridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 ole2Overridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 ole2];
}

- (void)setOle2:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setOle2:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setOle2Overridden:1];
}

- (BOOL)isOle2Overridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties ole2Overridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 ole2Overridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties ole2Overridden];
}

- (int)objectIDForOle2
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties objectIDForOle2Overridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 objectIDForOle2Overridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 objectIDForOle2];
}

- (void)setObjectIDForOle2:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setObjectIDForOle2:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setObjectIDForOle2Overridden:1];
}

- (BOOL)isObjectIDForOle2Overridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties objectIDForOle2Overridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 objectIDForOle2Overridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties objectIDForOle2Overridden];
}

- (int)offsetToPictureData
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties offsetToPictureDataOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 offsetToPictureDataOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 offsetToPictureData];
}

- (void)setOffsetToPictureData:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setOffsetToPictureData:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setOffsetToPictureDataOverridden:1];
}

- (BOOL)isOffsetToPictureDataOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties offsetToPictureDataOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 offsetToPictureDataOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties offsetToPictureDataOverridden];
}

- (BOOL)horizontalInVertical
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties horizontalInVerticalOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 horizontalInVerticalOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 horizontalInVertical];
}

- (void)setHorizontalInVertical:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setHorizontalInVertical:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setHorizontalInVerticalOverridden:1];
}

- (BOOL)isHorizontalInVerticalOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties horizontalInVerticalOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 horizontalInVerticalOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties horizontalInVerticalOverridden];
}

- (BOOL)compressHorizontalInVertical
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties compressHorizontalInVerticalOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 compressHorizontalInVerticalOverridden])return 0; {
  }
    }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 compressHorizontalInVertical];
}

- (void)setCompressHorizontalInVertical:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setCompressHorizontalInVertical:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setCompressHorizontalInVerticalOverridden:1];
}

- (BOOL)isCompressHorizontalInVerticalOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties compressHorizontalInVerticalOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 compressHorizontalInVerticalOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties compressHorizontalInVerticalOverridden];
}

- (BOOL)twoLinesInOne
{
  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || ![(WDCharacterPropertiesValues *)mTrackedProperties twoLinesInOneOverridden])
  {
    if (!self->mOriginal && !self->mResolved) {
      return 0;
    }
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (!mOriginalProperties) {
      return 0;
    }
    p_mTrackedProperties = p_mOriginalProperties;
    if (![(WDCharacterPropertiesValues *)v5 twoLinesInOneOverridden]) {
      return 0;
    }
  }
  double v8 = *p_mTrackedProperties;
  return [(WDCharacterPropertiesValues *)v8 twoLinesInOne];
}

- (void)setTwoLinesInOne:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setTwoLinesInOne:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setTwoLinesInOneOverridden:1];
}

- (BOOL)isTwoLinesInOneOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties twoLinesInOneOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 twoLinesInOneOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties twoLinesInOneOverridden];
}

- (int)bracketTwoLinesInOne
{
  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if ([(WDCharacterPropertiesValues *)mTrackedProperties bracketTwoLinesInOneOverridden])
      {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    BOOL v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = [(WDCharacterPropertiesValues *)v5 bracketTwoLinesInOneOverridden];
      p_mTrackedProperties = p_mOriginalProperties;
      if (v5) {
LABEL_9:
      }
        LODWORD(v5) = [(WDCharacterPropertiesValues *)*p_mTrackedProperties bracketTwoLinesInOne];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setBracketTwoLinesInOne:(int)a3
{
  unsigned __int8 v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!self->mOriginal) {
      return;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      int v6 = objc_alloc_init(WDCharacterPropertiesValues);
      uint64_t v7 = *p_mTrackedProperties;
      id *p_mTrackedProperties = v6;

      mTrackedProperties = *p_mTrackedProperties;
      if (!*p_mTrackedProperties) {
        return;
      }
    }
  }
  [(WDCharacterPropertiesValues *)mTrackedProperties setBracketTwoLinesInOne:v3];
  double v8 = *p_mTrackedProperties;
  [(WDCharacterPropertiesValues *)v8 setBracketTwoLinesInOneOverridden:1];
}

- (BOOL)isBracketTwoLinesInOneOverridden
{
  if (!self->mTracked
    && (!self->mResolved
     || (mTrackedProperties = self->mTrackedProperties) == 0
     || ![(WDCharacterPropertiesValues *)mTrackedProperties bracketTwoLinesInOneOverridden]))
  {
    if (self->mOriginal
      || self->mResolved
      && (int v6 = self->mOriginalProperties) != 0
      && [(WDCharacterPropertiesValues *)v6 bracketTwoLinesInOneOverridden])
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties) {
    return 0;
  }
LABEL_9:
  return [(WDCharacterPropertiesValues *)mOriginalProperties bracketTwoLinesInOneOverridden];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDCharacterProperties;
  v2 = [(WDCharacterProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mTrackedProperties, 0);
  objc_storeStrong((id *)&self->mOriginalProperties, 0);
}

- (BOOL)isAnythingOverriddenIn:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3)
  {
    if (([v3 baseStyleOverridden] & 1) != 0
      || ([v4 borderOverridden] & 1) != 0
      || ([v4 shadingOverridden] & 1) != 0
      || ([v4 fontOverridden] & 1) != 0
      || ([v4 extendedFontOverridden] & 1) != 0
      || ([v4 farEastFontOverridden] & 1) != 0
      || ([v4 symbolCharacterOverridden] & 1) != 0
      || ([v4 symbolFontOverridden] & 1) != 0
      || ([v4 boldOverridden] & 1) != 0
      || ([v4 boldForBiTextOverridden] & 1) != 0
      || ([v4 italicOverridden] & 1) != 0
      || ([v4 italicForBiTextOverridden] & 1) != 0
      || ([v4 outlineOverridden] & 1) != 0
      || ([v4 outlineColorOverridden] & 1) != 0
      || ([v4 outline2010WidthOverridden] & 1) != 0
      || ([v4 shadowOverridden] & 1) != 0
      || ([v4 embossedOverridden] & 1) != 0
      || ([v4 imprintOverridden] & 1) != 0
      || ([v4 underlineOverridden] & 1) != 0
      || ([v4 underlineColorOverridden] & 1) != 0
      || ([v4 strikeThroughOverridden] & 1) != 0
      || ([v4 doubleStrikeThroughOverridden] & 1) != 0
      || ([v4 ligatureOverridden] & 1) != 0
      || ([v4 highlightOverridden] & 1) != 0
      || ([v4 highlightColorOverridden] & 1) != 0
      || ([v4 smallCapsOverridden] & 1) != 0
      || ([v4 capsOverridden] & 1) != 0
      || ([v4 lowerCaseOverridden] & 1) != 0
      || ([v4 hiddenOverridden] & 1) != 0
      || ([v4 spacingOverridden] & 1) != 0
      || ([v4 positionOverridden] & 1) != 0
      || ([v4 kerningOverridden] & 1) != 0
      || ([v4 textScaleOverridden] & 1) != 0
      || ([v4 fontSizeOverridden] & 1) != 0
      || ([v4 rightToLeftOverridden] & 1) != 0
      || ([v4 useCsFontOverridden] & 1) != 0
      || ([v4 verticalAlignOverridden] & 1) != 0
      || ([v4 emphasisMarkOverridden] & 1) != 0
      || ([v4 reflectionOverridden] & 1) != 0
      || ([v4 shadow2010Overridden] & 1) != 0
      || ([v4 shadow2010OpacityOverridden] & 1) != 0
      || ([v4 colorOverridden] & 1) != 0
      || ([v4 colorAutoOverridden] & 1) != 0
      || ([v4 languageForDefaultTextOverridden] & 1) != 0
      || ([v4 deletedOverridden] & 1) != 0
      || ([v4 editedOverridden] & 1) != 0
      || ([v4 formattingChangedOverridden] & 1) != 0
      || ([v4 indexToAuthorIDOfDeletionOverridden] & 1) != 0
      || ([v4 indexToAuthorIDOfEditOverridden] & 1) != 0
      || ([v4 indexToAuthorIDOfFormattingChangeOverridden] & 1) != 0
      || ([v4 deletionDateOverridden] & 1) != 0
      || ([v4 editDateOverridden] & 1) != 0
      || ([v4 specialCharacterOverridden] & 1) != 0
      || ([v4 listCharacterPictureBulletOverridden] & 1) != 0
      || ([v4 charPositionOfPictureBulletInBookmarkOverridden] & 1) != 0
      || ([v4 languageForFarEastOverridden] & 1) != 0
      || ([v4 languageForBiTextOverridden] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [v4 fontSizeForBiTextOverridden];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isBooleanProbablyDifferent:(unsigned __int8)a3 than:(unsigned __int8)a4
{
  if (a3 == 129) {
    int v4 = 1;
  }
  else {
    int v4 = a3;
  }
  if (v4 == 128) {
    int v4 = 0;
  }
  if (a4 == 129) {
    int v5 = 1;
  }
  else {
    int v5 = a4;
  }
  if (v5 == 128) {
    int v5 = 0;
  }
  return v4 != v5;
}

- (BOOL)deletionDifferentFrom:(id)a3 mode:(int)a4
{
  int v6 = (char *)a3;
  if (v6)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        unint64_t v8 = 0;
        uint64_t v10 = 0;
LABEL_22:
        LOBYTE(self) = 1;
        goto LABEL_24;
      }
      uint64_t v7 = 24;
    }
    else
    {
      uint64_t v7 = 16;
    }
    unint64_t v8 = (unint64_t)*(id *)((char *)&self->super.isa + v7);
    unint64_t v9 = (unint64_t)*(id *)&v6[v7];
    if (v8 | v9)
    {
      uint64_t v10 = (void *)v9;
      if (!v8)
      {
        LOBYTE(self) = [(WDCharacterProperties *)self isAnythingOverriddenIn:v9];
        unint64_t v8 = 0;
        goto LABEL_24;
      }
      if (v9)
      {
        int v11 = [(id)v8 deletedOverridden];
        if (v11 == [v10 deletedOverridden]
          && (![(id)v8 deletedOverridden]
           || !-[WDCharacterProperties isBooleanProbablyDifferent:than:](self, "isBooleanProbablyDifferent:than:", [(id)v8 deleted], objc_msgSend(v10, "deleted"))))
        {
          int v12 = [(id)v8 indexToAuthorIDOfDeletionOverridden];
          if (v12 == [v10 indexToAuthorIDOfDeletionOverridden])
          {
            if (![(id)v8 indexToAuthorIDOfDeletionOverridden]
              || (int v13 = [(id)v8 indexToAuthorIDOfDeletion],
                  v13 == [v10 indexToAuthorIDOfDeletion]))
            {
              int v14 = [(id)v8 deletionDateOverridden];
              if (v14 == [v10 deletionDateOverridden])
              {
                if ([(id)v8 deletionDateOverridden])
                {
                  id v15 = [(id)v8 deletionDate];
                  v16 = [v10 deletionDate];
                  LODWORD(self) = [v15 isEqualToDate:v16] ^ 1;
                }
                else
                {
                  LOBYTE(self) = 0;
                }
                goto LABEL_24;
              }
            }
          }
        }
        goto LABEL_22;
      }
      LOBYTE(self) = [(WDCharacterProperties *)self isAnythingOverriddenIn:v8];
    }
    else
    {
      LOBYTE(self) = 0;
      unint64_t v8 = 0;
    }
    uint64_t v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  LOBYTE(self) = 1;
LABEL_25:

  return (char)self;
}

- (BOOL)editDifferentFrom:(id)a3 mode:(int)a4
{
  int v6 = (char *)a3;
  if (v6)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        unint64_t v8 = 0;
        uint64_t v10 = 0;
LABEL_22:
        LOBYTE(self) = 1;
        goto LABEL_24;
      }
      uint64_t v7 = 24;
    }
    else
    {
      uint64_t v7 = 16;
    }
    unint64_t v8 = (unint64_t)*(id *)((char *)&self->super.isa + v7);
    unint64_t v9 = (unint64_t)*(id *)&v6[v7];
    if (v8 | v9)
    {
      uint64_t v10 = (void *)v9;
      if (!v8)
      {
        LOBYTE(self) = [(WDCharacterProperties *)self isAnythingOverriddenIn:v9];
        unint64_t v8 = 0;
        goto LABEL_24;
      }
      if (v9)
      {
        int v11 = [(id)v8 editedOverridden];
        if (v11 == [v10 editedOverridden]
          && (![(id)v8 editedOverridden]
           || !-[WDCharacterProperties isBooleanProbablyDifferent:than:](self, "isBooleanProbablyDifferent:than:", [(id)v8 edited], objc_msgSend(v10, "edited"))))
        {
          int v12 = [(id)v8 indexToAuthorIDOfEditOverridden];
          if (v12 == [v10 indexToAuthorIDOfEditOverridden])
          {
            if (![(id)v8 indexToAuthorIDOfEditOverridden]
              || (int v13 = [(id)v8 indexToAuthorIDOfEdit],
                  v13 == [v10 indexToAuthorIDOfEdit]))
            {
              int v14 = [(id)v8 editDateOverridden];
              if (v14 == [v10 editDateOverridden])
              {
                if ([(id)v8 editDateOverridden])
                {
                  id v15 = [(id)v8 editDate];
                  v16 = [v10 editDate];
                  LODWORD(self) = [v15 isEqualToDate:v16] ^ 1;
                }
                else
                {
                  LOBYTE(self) = 0;
                }
                goto LABEL_24;
              }
            }
          }
        }
        goto LABEL_22;
      }
      LOBYTE(self) = [(WDCharacterProperties *)self isAnythingOverriddenIn:v8];
    }
    else
    {
      LOBYTE(self) = 0;
      unint64_t v8 = 0;
    }
    uint64_t v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  LOBYTE(self) = 1;
LABEL_25:

  return (char)self;
}

- (BOOL)formattingChangedDifferentFrom:(id)a3 mode:(int)a4
{
  int v6 = (char *)a3;
  if (v6)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        unint64_t v9 = 0;
        int v11 = 0;
        goto LABEL_117;
      }
      uint64_t v7 = 24;
    }
    else
    {
      uint64_t v7 = 16;
    }
    unint64_t v9 = (unint64_t)*(id *)((char *)&self->super.isa + v7);
    unint64_t v10 = (unint64_t)*(id *)&v6[v7];
    if (v9 | v10)
    {
      int v11 = (void *)v10;
      if (!v9)
      {
        BOOL v8 = [(WDCharacterProperties *)self isAnythingOverriddenIn:v10];
        unint64_t v9 = 0;
        goto LABEL_119;
      }
      if (v10)
      {
        int v12 = [(id)v9 formattingChangedOverridden];
        if (v12 == [v11 formattingChangedOverridden]
          && (![(id)v9 formattingChangedOverridden]
           || !-[WDCharacterProperties isBooleanProbablyDifferent:than:](self, "isBooleanProbablyDifferent:than:", [(id)v9 formattingChanged], objc_msgSend(v11, "formattingChanged"))))
        {
          int v13 = [(id)v9 indexToAuthorIDOfFormattingChangeOverridden];
          if (v13 == [v11 indexToAuthorIDOfFormattingChangeOverridden])
          {
            if (![(id)v9 indexToAuthorIDOfFormattingChangeOverridden]
              || (int v14 = [(id)v9 indexToAuthorIDOfFormattingChange],
                  v14 == [v11 indexToAuthorIDOfFormattingChange]))
            {
              int v15 = [(id)v9 baseStyleOverridden];
              if (v15 == [v11 baseStyleOverridden])
              {
                if (![(id)v9 baseStyleOverridden]
                  || ([(id)v9 baseStyle],
                      v16 = objc_claimAutoreleasedReturnValue(),
                      [v11 baseStyle],
                      BOOL v17 = objc_claimAutoreleasedReturnValue(),
                      char v18 = [v16 isEqual:v17],
                      v17,
                      v16,
                      (v18 & 1) != 0))
                {
                  int v19 = [(id)v9 borderOverridden];
                  if (v19 == [v11 borderOverridden])
                  {
                    if (![(id)v9 borderOverridden]
                      || ([(id)v9 border],
                          BOOL v20 = objc_claimAutoreleasedReturnValue(),
                          [v11 border],
                          char v21 = objc_claimAutoreleasedReturnValue(),
                          char v22 = [v20 isEqual:v21],
                          v21,
                          v20,
                          (v22 & 1) != 0))
                    {
                      int v23 = [(id)v9 shadingOverridden];
                      if (v23 == [v11 shadingOverridden])
                      {
                        if (![(id)v9 shadingOverridden]
                          || ([(id)v9 shading],
                              id v24 = objc_claimAutoreleasedReturnValue(),
                              [v11 shading],
                              v25 = objc_claimAutoreleasedReturnValue(),
                              char v26 = [v24 isEqual:v25],
                              v25,
                              v24,
                              (v26 & 1) != 0))
                        {
                          int v27 = [(id)v9 fontOverridden];
                          if (v27 == [v11 fontOverridden])
                          {
                            if (![(id)v9 fontOverridden]
                              || ([(id)v9 font],
                                  char v28 = objc_claimAutoreleasedReturnValue(),
                                  [v11 font],
                                  id v29 = objc_claimAutoreleasedReturnValue(),
                                  char v30 = [v28 isEqual:v29],
                                  v29,
                                  v28,
                                  (v30 & 1) != 0))
                            {
                              int v31 = [(id)v9 extendedFontOverridden];
                              if (v31 == [v11 extendedFontOverridden])
                              {
                                if (![(id)v9 extendedFontOverridden]
                                  || ([(id)v9 extendedFont],
                                      v32 = objc_claimAutoreleasedReturnValue(),
                                      [v11 extendedFont],
                                      char v33 = objc_claimAutoreleasedReturnValue(),
                                      char v34 = [v32 isEqual:v33],
                                      v33,
                                      v32,
                                      (v34 & 1) != 0))
                                {
                                  int v35 = [(id)v9 farEastFontOverridden];
                                  if (v35 == [v11 farEastFontOverridden])
                                  {
                                    if (![(id)v9 farEastFontOverridden]
                                      || ([(id)v9 farEastFont],
                                          id v36 = objc_claimAutoreleasedReturnValue(),
                                          [v11 farEastFont],
                                          v37 = objc_claimAutoreleasedReturnValue(),
                                          char v38 = [v36 isEqual:v37],
                                          v37,
                                          v36,
                                          (v38 & 1) != 0))
                                    {
                                      int v39 = [(id)v9 symbolFontOverridden];
                                      if (v39 == [v11 symbolFontOverridden])
                                      {
                                        if (![(id)v9 symbolFontOverridden]
                                          || ([(id)v9 symbolFont],
                                              v40 = objc_claimAutoreleasedReturnValue(),
                                              [v11 symbolFont],
                                              id v41 = objc_claimAutoreleasedReturnValue(),
                                              char v42 = [v40 isEqual:v41],
                                              v41,
                                              v40,
                                              (v42 & 1) != 0))
                                        {
                                          int v43 = [(id)v9 outlineColorOverridden];
                                          if (v43 == [v11 outlineColorOverridden])
                                          {
                                            if (![(id)v9 outlineColorOverridden]
                                              || ([(id)v9 outlineColor],
                                                  id v44 = objc_claimAutoreleasedReturnValue(),
                                                  [v11 outlineColor],
                                                  v45 = objc_claimAutoreleasedReturnValue(),
                                                  char v46 = [v44 isEqual:v45],
                                                  v45,
                                                  v44,
                                                  (v46 & 1) != 0))
                                            {
                                              int v47 = [(id)v9 underlineColorOverridden];
                                              if (v47 == [v11 underlineColorOverridden])
                                              {
                                                if (![(id)v9 underlineColorOverridden]
                                                  || ([(id)v9 underlineColor],
                                                      char v48 = objc_claimAutoreleasedReturnValue(),
                                                      [v11 underlineColor],
                                                      id v49 = objc_claimAutoreleasedReturnValue(),
                                                      char v50 = [v48 isEqual:v49],
                                                      v49,
                                                      v48,
                                                      (v50 & 1) != 0))
                                                {
                                                  int v51 = [(id)v9 colorOverridden];
                                                  if (v51 == [v11 colorOverridden])
                                                  {
                                                    if (![(id)v9 colorOverridden]
                                                      || ([(id)v9 color],
                                                          v52 = objc_claimAutoreleasedReturnValue(),
                                                          [v11 color],
                                                          char v53 = objc_claimAutoreleasedReturnValue(),
                                                          char v54 = [v52 isEqual:v53],
                                                          v53,
                                                          v52,
                                                          (v54 & 1) != 0))
                                                    {
                                                      int v55 = [(id)v9 symbolCharacterOverridden];
                                                      if (v55 == [v11 symbolCharacterOverridden])
                                                      {
                                                        int v56 = [(id)v9 symbolCharacter];
                                                        if (v56 == [v11 symbolCharacter])
                                                        {
                                                          int v57 = [(id)v9 boldOverridden];
                                                          if (v57 == [v11 boldOverridden])
                                                          {
                                                            int v58 = [(id)v9 bold];
                                                            if (v58 == [v11 bold])
                                                            {
                                                              int v59 = [(id)v9 boldForBiTextOverridden];
                                                              if (v59 == [v11 boldForBiTextOverridden])
                                                              {
                                                                int v60 = [(id)v9 boldForBiText];
                                                                if (v60 == [v11 boldForBiText])
                                                                {
                                                                  int v61 = [(id)v9 italicOverridden];
                                                                  if (v61 == [v11 italicOverridden])
                                                                  {
                                                                    int v62 = [(id)v9 italic];
                                                                    if (v62 == [v11 italic])
                                                                    {
                                                                      int v63 = [(id)v9 italicForBiTextOverridden];
                                                                      if (v63 == [v11 italicForBiTextOverridden])
                                                                      {
                                                                        int v64 = [(id)v9 italicForBiText];
                                                                        if (v64 == [v11 italicForBiText])
                                                                        {
                                                                          int v65 = [(id)v9 outlineOverridden];
                                                                          if (v65 == [v11 outlineOverridden])
                                                                          {
                                                                            int v66 = [(id)v9 outline];
                                                                            if (v66 == [v11 outline])
                                                                            {
                                                                              int v67 = [(id)v9 outline2010WidthOverridden];
                                                                              if (v67 == [v11 outline2010WidthOverridden])
                                                                              {
                                                                                [(id)v9 outline2010Width];
                                                                                float v69 = v68;
                                                                                [v11 outline2010Width];
                                                                                if (v69 == v70)
                                                                                {
                                                                                  int v71 = [(id)v9 shadowOverridden];
                                                                                  if (v71 == [v11 shadowOverridden])
                                                                                  {
                                                                                    int v72 = [(id)v9 shadow];
                                                                                    if (v72 == [v11 shadow])
                                                                                    {
                                                                                      int v73 = [(id)v9 embossedOverridden];
                                                                                      if (v73 == [v11 embossedOverridden])
                                                                                      {
                                                                                        int v74 = [(id)v9 embossed];
                                                                                        if (v74 == [v11 embossed])
                                                                                        {
                                                                                          int v75 = [(id)v9 imprintOverridden];
                                                                                          if (v75 == [v11 imprintOverridden])
                                                                                          {
                                                                                            int v76 = [(id)v9 imprint];
                                                                                            if (v76 == [v11 imprint])
                                                                                            {
                                                                                              int v77 = [(id)v9 underlineOverridden];
                                                                                              if (v77 == [v11 underlineOverridden])
                                                                                              {
                                                                                                int v78 = [(id)v9 underline];
                                                                                                if (v78 == [v11 underline])
                                                                                                {
                                                                                                  int v79 = [(id)v9 strikeThroughOverridden];
                                                                                                  if (v79 == [v11 strikeThroughOverridden])
                                                                                                  {
                                                                                                    int v80 = [(id)v9 strikeThrough];
                                                                                                    if (v80 == [v11 strikeThrough])
                                                                                                    {
                                                                                                      int v81 = [(id)v9 doubleStrikeThroughOverridden];
                                                                                                      if (v81 == [v11 doubleStrikeThroughOverridden])
                                                                                                      {
                                                                                                        int v82 = [(id)v9 doubleStrikeThrough];
                                                                                                        if (v82 == [v11 doubleStrikeThrough])
                                                                                                        {
                                                                                                          int v83 = [(id)v9 ligatureOverridden];
                                                                                                          if (v83 == [v11 ligatureOverridden])
                                                                                                          {
                                                                                                            int v84 = [(id)v9 ligature];
                                                                                                            if (v84 == [v11 ligature])
                                                                                                            {
                                                                                                              int v85 = [(id)v9 highlightOverridden];
                                                                                                              if (v85 == [v11 highlightOverridden])
                                                                                                              {
                                                                                                                int v86 = [(id)v9 highlight];
                                                                                                                if (v86 == [v11 highlight])
                                                                                                                {
                                                                                                                  int v87 = [(id)v9 highlightColorOverridden];
                                                                                                                  if (v87 == [v11 highlightColorOverridden])
                                                                                                                  {
                                                                                                                    int v88 = [(id)v9 highlightColor];
                                                                                                                    if (v88 == [v11 highlightColor])
                                                                                                                    {
                                                                                                                      int v89 = [(id)v9 smallCapsOverridden];
                                                                                                                      if (v89 == [v11 smallCapsOverridden])
                                                                                                                      {
                                                                                                                        int v90 = [(id)v9 smallCaps];
                                                                                                                        if (v90 == [v11 smallCaps])
                                                                                                                        {
                                                                                                                          int v91 = [(id)v9 capsOverridden];
                                                                                                                          if (v91 == [v11 capsOverridden])
                                                                                                                          {
                                                                                                                            int v92 = [(id)v9 caps];
                                                                                                                            if (v92 == [v11 caps])
                                                                                                                            {
                                                                                                                              int v93 = [(id)v9 lowerCaseOverridden];
                                                                                                                              if (v93 == [v11 lowerCaseOverridden])
                                                                                                                              {
                                                                                                                                int v94 = [(id)v9 lowerCase];
                                                                                                                                if (v94 == [v11 lowerCase])
                                                                                                                                {
                                                                                                                                  int v95 = [(id)v9 hiddenOverridden];
                                                                                                                                  if (v95 == [v11 hiddenOverridden])
                                                                                                                                  {
                                                                                                                                    int v96 = [(id)v9 hidden];
                                                                                                                                    if (v96 == [v11 hidden])
                                                                                                                                    {
                                                                                                                                      int v97 = [(id)v9 spacingOverridden];
                                                                                                                                      if (v97 == [v11 spacingOverridden])
                                                                                                                                      {
                                                                                                                                        int v98 = [(id)v9 spacing];
                                                                                                                                        if (v98 == [v11 spacing])
                                                                                                                                        {
                                                                                                                                          int v99 = [(id)v9 positionOverridden];
                                                                                                                                          if (v99 == [v11 positionOverridden])
                                                                                                                                          {
                                                                                                                                            int v100 = [(id)v9 position];
                                                                                                                                            if (v100 == [v11 position])
                                                                                                                                            {
                                                                                                                                              int v101 = [(id)v9 kerningOverridden];
                                                                                                                                              if (v101 == [v11 kerningOverridden])
                                                                                                                                              {
                                                                                                                                                int v102 = [(id)v9 kerning];
                                                                                                                                                if (v102 == [v11 kerning])
                                                                                                                                                {
                                                                                                                                                  int v103 = [(id)v9 textScaleOverridden];
                                                                                                                                                  if (v103 == [v11 textScaleOverridden])
                                                                                                                                                  {
                                                                                                                                                    int v104 = [(id)v9 textScale];
                                                                                                                                                    if (v104 == [v11 textScale])
                                                                                                                                                    {
                                                                                                                                                      int v105 = [(id)v9 fontSizeOverridden];
                                                                                                                                                      if (v105 == [v11 fontSizeOverridden])
                                                                                                                                                      {
                                                                                                                                                        int v106 = [(id)v9 fontSize];
                                                                                                                                                        if (v106 == [v11 fontSize])
                                                                                                                                                        {
                                                                                                                                                          int v107 = [(id)v9 verticalAlignOverridden];
                                                                                                                                                          if (v107 == [v11 verticalAlignOverridden])
                                                                                                                                                          {
                                                                                                                                                            int v108 = [(id)v9 verticalAlign];
                                                                                                                                                            if (v108 == [v11 verticalAlign])
                                                                                                                                                            {
                                                                                                                                                              int v109 = [(id)v9 emphasisMarkOverridden];
                                                                                                                                                              if (v109 == [v11 emphasisMarkOverridden])
                                                                                                                                                              {
                                                                                                                                                                int v110 = [(id)v9 emphasisMark];
                                                                                                                                                                if (v110 == [v11 emphasisMark])
                                                                                                                                                                {
                                                                                                                                                                  int v111 = [(id)v9 colorAutoOverridden];
                                                                                                                                                                  if (v111 == [v11 colorAutoOverridden])
                                                                                                                                                                  {
                                                                                                                                                                    int v112 = [(id)v9 colorAuto];
                                                                                                                                                                    if (v112 == [v11 colorAuto])
                                                                                                                                                                    {
                                                                                                                                                                      int v113 = [(id)v9 languageForDefaultTextOverridden];
                                                                                                                                                                      if (v113 == [v11 languageForDefaultTextOverridden])
                                                                                                                                                                      {
                                                                                                                                                                        int v114 = [(id)v9 languageForDefaultText];
                                                                                                                                                                        if (v114 == [v11 languageForDefaultText])
                                                                                                                                                                        {
                                                                                                                                                                          int v115 = [(id)v9 specialCharacterOverridden];
                                                                                                                                                                          if (v115 == [v11 specialCharacterOverridden])
                                                                                                                                                                          {
                                                                                                                                                                            int v116 = [(id)v9 specialCharacter];
                                                                                                                                                                            if (v116 == [v11 specialCharacter])
                                                                                                                                                                            {
                                                                                                                                                                              int v117 = [(id)v9 listCharacterPictureBulletOverridden];
                                                                                                                                                                              if (v117 == [v11 listCharacterPictureBulletOverridden])
                                                                                                                                                                              {
                                                                                                                                                                                int v118 = [(id)v9 listCharacterPictureBullet];
                                                                                                                                                                                if (v118 == [v11 listCharacterPictureBullet])
                                                                                                                                                                                {
                                                                                                                                                                                  int v119 = [(id)v9 charPositionOfPictureBulletInBookmarkOverridden];
                                                                                                                                                                                  if (v119 == [v11 charPositionOfPictureBulletInBookmarkOverridden])
                                                                                                                                                                                  {
                                                                                                                                                                                    int v120 = [(id)v9 charPositionOfPictureBulletInBookmark];
                                                                                                                                                                                    if (v120 == [v11 charPositionOfPictureBulletInBookmark])
                                                                                                                                                                                    {
                                                                                                                                                                                      int v121 = [(id)v9 languageForFarEastOverridden];
                                                                                                                                                                                      if (v121 == [v11 languageForFarEastOverridden])
                                                                                                                                                                                      {
                                                                                                                                                                                        int v122 = [(id)v9 languageForFarEast];
                                                                                                                                                                                        if (v122 == [v11 languageForFarEast])
                                                                                                                                                                                        {
                                                                                                                                                                                          int v123 = [(id)v9 languageForBiTextOverridden];
                                                                                                                                                                                          if (v123 == [v11 languageForBiTextOverridden])
                                                                                                                                                                                          {
                                                                                                                                                                                            int v124 = [(id)v9 languageForBiText];
                                                                                                                                                                                            BOOL v8 = v124 != [v11 languageForBiText];
LABEL_119:

                                                                                                                                                                                            goto LABEL_120;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_117:
        BOOL v8 = 1;
        goto LABEL_119;
      }
      BOOL v8 = [(WDCharacterProperties *)self isAnythingOverriddenIn:v9];
    }
    else
    {
      BOOL v8 = 0;
      unint64_t v9 = 0;
    }
    int v11 = 0;
    goto LABEL_119;
  }
  BOOL v8 = 1;
LABEL_120:

  return v8;
}

- (int)reverseBooleanProperty:(int)a3
{
  if (a3 > 127)
  {
    if (a3 != 128)
    {
      if (a3 == 129) {
        return 128;
      }
      return 0;
    }
    return 129;
  }
  else
  {
    return !a3;
  }
}

@end
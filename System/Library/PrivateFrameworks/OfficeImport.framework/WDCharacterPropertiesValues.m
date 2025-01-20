@interface WDCharacterPropertiesValues
- (BOOL)baseStyleOverridden;
- (BOOL)boldForBiTextOverridden;
- (BOOL)boldOverridden;
- (BOOL)borderOverridden;
- (BOOL)bracketTwoLinesInOneOverridden;
- (BOOL)capsOverridden;
- (BOOL)charPositionOfPictureBulletInBookmarkOverridden;
- (BOOL)colorAuto;
- (BOOL)colorAutoOverridden;
- (BOOL)colorOverridden;
- (BOOL)compressHorizontalInVertical;
- (BOOL)compressHorizontalInVerticalOverridden;
- (BOOL)deletedOverridden;
- (BOOL)deletionDateOverridden;
- (BOOL)doubleStrikeThroughOverridden;
- (BOOL)editDateOverridden;
- (BOOL)editedOverridden;
- (BOOL)embeddedObject;
- (BOOL)embeddedObjectOverridden;
- (BOOL)embossedOverridden;
- (BOOL)emphasisMarkOverridden;
- (BOOL)extendedFontOverridden;
- (BOOL)farEastFontOverridden;
- (BOOL)fontHintOverridden;
- (BOOL)fontOverridden;
- (BOOL)fontSizeForBiTextOverridden;
- (BOOL)fontSizeOverridden;
- (BOOL)formattingChanged;
- (BOOL)formattingChangedOverridden;
- (BOOL)hiddenOverridden;
- (BOOL)highlight;
- (BOOL)highlightColorOverridden;
- (BOOL)highlightOverridden;
- (BOOL)horizontalInVertical;
- (BOOL)horizontalInVerticalOverridden;
- (BOOL)imprintOverridden;
- (BOOL)indexToAuthorIDOfDeletionOverridden;
- (BOOL)indexToAuthorIDOfEditOverridden;
- (BOOL)indexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)italicForBiTextOverridden;
- (BOOL)italicOverridden;
- (BOOL)kerningOverridden;
- (BOOL)languageForBiTextOverridden;
- (BOOL)languageForDefaultTextOverridden;
- (BOOL)languageForFarEastOverridden;
- (BOOL)ligatureOverridden;
- (BOOL)listCharacterPictureBullet;
- (BOOL)listCharacterPictureBulletOverridden;
- (BOOL)lowerCase;
- (BOOL)lowerCaseOverridden;
- (BOOL)objectIDForOle2Overridden;
- (BOOL)offsetToPictureDataOverridden;
- (BOOL)ole2;
- (BOOL)ole2Overridden;
- (BOOL)outline2010WidthOverridden;
- (BOOL)outlineColorOverridden;
- (BOOL)outlineOverridden;
- (BOOL)positionOverridden;
- (BOOL)reflectionOverridden;
- (BOOL)rightToLeftOverridden;
- (BOOL)shadingOverridden;
- (BOOL)shadow2010OpacityOverridden;
- (BOOL)shadow2010Overridden;
- (BOOL)shadowOverridden;
- (BOOL)smallCapsOverridden;
- (BOOL)spacingOverridden;
- (BOOL)specialCharacter;
- (BOOL)specialCharacterOverridden;
- (BOOL)strikeThroughOverridden;
- (BOOL)symbolCharacterOverridden;
- (BOOL)symbolFontOverridden;
- (BOOL)textScaleOverridden;
- (BOOL)twoLinesInOne;
- (BOOL)twoLinesInOneOverridden;
- (BOOL)underlineColorOverridden;
- (BOOL)underlineOverridden;
- (BOOL)useCsFontOverridden;
- (BOOL)verticalAlignOverridden;
- (NSDate)deletionDate;
- (NSDate)editDate;
- (OADReflectionEffect)reflection;
- (OADShadowEffect)shadow2010;
- (OITSUColor)color;
- (OITSUColor)outlineColor;
- (OITSUColor)underlineColor;
- (WDBorder)border;
- (WDFont)extendedFont;
- (WDFont)farEastFont;
- (WDFont)font;
- (WDFont)symbolFont;
- (WDShading)shading;
- (WDStyle)baseStyle;
- (float)outline2010Width;
- (float)shadow2010Opacity;
- (id)copyWithZone:(_NSZone *)a3;
- (int)charPositionOfPictureBulletInBookmark;
- (int)emphasisMark;
- (int)fontHint;
- (int)languageForBiText;
- (int)languageForDefaultText;
- (int)languageForFarEast;
- (int)objectIDForOle2;
- (int)offsetToPictureData;
- (signed)position;
- (signed)spacing;
- (unsigned)bold;
- (unsigned)boldForBiText;
- (unsigned)bracketTwoLinesInOne;
- (unsigned)caps;
- (unsigned)deleted;
- (unsigned)doubleStrikeThrough;
- (unsigned)edited;
- (unsigned)embossed;
- (unsigned)fontSize;
- (unsigned)fontSizeForBiText;
- (unsigned)hidden;
- (unsigned)highlightColor;
- (unsigned)imprint;
- (unsigned)indexToAuthorIDOfDeletion;
- (unsigned)indexToAuthorIDOfEdit;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (unsigned)italic;
- (unsigned)italicForBiText;
- (unsigned)kerning;
- (unsigned)ligature;
- (unsigned)outline;
- (unsigned)rightToLeft;
- (unsigned)shadow;
- (unsigned)smallCaps;
- (unsigned)strikeThrough;
- (unsigned)symbolCharacter;
- (unsigned)textScale;
- (unsigned)underline;
- (unsigned)useCsFont;
- (unsigned)verticalAlign;
- (void)setBaseStyle:(id)a3;
- (void)setBaseStyleOverridden:(BOOL)a3;
- (void)setBold:(unsigned __int8)a3;
- (void)setBoldForBiText:(unsigned __int8)a3;
- (void)setBoldForBiTextOverridden:(BOOL)a3;
- (void)setBoldOverridden:(BOOL)a3;
- (void)setBorder:(id)a3;
- (void)setBorderOverridden:(BOOL)a3;
- (void)setBracketTwoLinesInOne:(unsigned __int8)a3;
- (void)setBracketTwoLinesInOneOverridden:(BOOL)a3;
- (void)setCaps:(unsigned __int8)a3;
- (void)setCapsOverridden:(BOOL)a3;
- (void)setCharPositionOfPictureBulletInBookmark:(int)a3;
- (void)setCharPositionOfPictureBulletInBookmarkOverridden:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setColorAuto:(BOOL)a3;
- (void)setColorAutoOverridden:(BOOL)a3;
- (void)setColorOverridden:(BOOL)a3;
- (void)setCompressHorizontalInVertical:(BOOL)a3;
- (void)setCompressHorizontalInVerticalOverridden:(BOOL)a3;
- (void)setDeleted:(unsigned __int8)a3;
- (void)setDeletedOverridden:(BOOL)a3;
- (void)setDeletionDate:(id)a3;
- (void)setDeletionDateOverridden:(BOOL)a3;
- (void)setDoubleStrikeThrough:(unsigned __int8)a3;
- (void)setDoubleStrikeThroughOverridden:(BOOL)a3;
- (void)setEditDate:(id)a3;
- (void)setEditDateOverridden:(BOOL)a3;
- (void)setEdited:(unsigned __int8)a3;
- (void)setEditedOverridden:(BOOL)a3;
- (void)setEmbeddedObject:(BOOL)a3;
- (void)setEmbeddedObjectOverridden:(BOOL)a3;
- (void)setEmbossed:(unsigned __int8)a3;
- (void)setEmbossedOverridden:(BOOL)a3;
- (void)setEmphasisMark:(int)a3;
- (void)setEmphasisMarkOverridden:(BOOL)a3;
- (void)setExtendedFont:(id)a3;
- (void)setExtendedFontOverridden:(BOOL)a3;
- (void)setFarEastFont:(id)a3;
- (void)setFarEastFontOverridden:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFontHint:(int)a3;
- (void)setFontHintOverridden:(BOOL)a3;
- (void)setFontOverridden:(BOOL)a3;
- (void)setFontSize:(unsigned __int16)a3;
- (void)setFontSizeForBiText:(unsigned __int16)a3;
- (void)setFontSizeForBiTextOverridden:(BOOL)a3;
- (void)setFontSizeOverridden:(BOOL)a3;
- (void)setFormattingChanged:(BOOL)a3;
- (void)setFormattingChangedOverridden:(BOOL)a3;
- (void)setHidden:(unsigned __int8)a3;
- (void)setHiddenOverridden:(BOOL)a3;
- (void)setHighlight:(BOOL)a3;
- (void)setHighlightColor:(unsigned __int8)a3;
- (void)setHighlightColorOverridden:(BOOL)a3;
- (void)setHighlightOverridden:(BOOL)a3;
- (void)setHorizontalInVertical:(BOOL)a3;
- (void)setHorizontalInVerticalOverridden:(BOOL)a3;
- (void)setImprint:(unsigned __int8)a3;
- (void)setImprintOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfDeletionOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfEditOverridden:(BOOL)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3;
- (void)setItalic:(unsigned __int8)a3;
- (void)setItalicForBiText:(unsigned __int8)a3;
- (void)setItalicForBiTextOverridden:(BOOL)a3;
- (void)setItalicOverridden:(BOOL)a3;
- (void)setKerning:(unsigned __int16)a3;
- (void)setKerningOverridden:(BOOL)a3;
- (void)setLanguageForBiText:(int)a3;
- (void)setLanguageForBiTextOverridden:(BOOL)a3;
- (void)setLanguageForDefaultText:(int)a3;
- (void)setLanguageForDefaultTextOverridden:(BOOL)a3;
- (void)setLanguageForFarEast:(int)a3;
- (void)setLanguageForFarEastOverridden:(BOOL)a3;
- (void)setLigature:(unsigned __int8)a3;
- (void)setLigatureOverridden:(BOOL)a3;
- (void)setListCharacterPictureBullet:(BOOL)a3;
- (void)setListCharacterPictureBulletOverridden:(BOOL)a3;
- (void)setLowerCase:(BOOL)a3;
- (void)setLowerCaseOverridden:(BOOL)a3;
- (void)setObjectIDForOle2:(int)a3;
- (void)setObjectIDForOle2Overridden:(BOOL)a3;
- (void)setOffsetToPictureData:(int)a3;
- (void)setOffsetToPictureDataOverridden:(BOOL)a3;
- (void)setOle2:(BOOL)a3;
- (void)setOle2Overridden:(BOOL)a3;
- (void)setOutline2010Width:(float)a3;
- (void)setOutline2010WidthOverridden:(BOOL)a3;
- (void)setOutline:(unsigned __int8)a3;
- (void)setOutlineColor:(id)a3;
- (void)setOutlineColorOverridden:(BOOL)a3;
- (void)setOutlineOverridden:(BOOL)a3;
- (void)setPosition:(signed __int16)a3;
- (void)setPositionOverridden:(BOOL)a3;
- (void)setReflection:(id)a3;
- (void)setReflectionOverridden:(BOOL)a3;
- (void)setRightToLeft:(unsigned __int8)a3;
- (void)setRightToLeftOverridden:(BOOL)a3;
- (void)setShading:(id)a3;
- (void)setShadingOverridden:(BOOL)a3;
- (void)setShadow2010:(id)a3;
- (void)setShadow2010Opacity:(float)a3;
- (void)setShadow2010OpacityOverridden:(BOOL)a3;
- (void)setShadow2010Overridden:(BOOL)a3;
- (void)setShadow:(unsigned __int8)a3;
- (void)setShadowOverridden:(BOOL)a3;
- (void)setSmallCaps:(unsigned __int8)a3;
- (void)setSmallCapsOverridden:(BOOL)a3;
- (void)setSpacing:(signed __int16)a3;
- (void)setSpacingOverridden:(BOOL)a3;
- (void)setSpecialCharacter:(BOOL)a3;
- (void)setSpecialCharacterOverridden:(BOOL)a3;
- (void)setStrikeThrough:(unsigned __int8)a3;
- (void)setStrikeThroughOverridden:(BOOL)a3;
- (void)setSymbolCharacter:(unsigned __int16)a3;
- (void)setSymbolCharacterOverridden:(BOOL)a3;
- (void)setSymbolFont:(id)a3;
- (void)setSymbolFontOverridden:(BOOL)a3;
- (void)setTextScale:(unsigned __int16)a3;
- (void)setTextScaleOverridden:(BOOL)a3;
- (void)setTwoLinesInOne:(BOOL)a3;
- (void)setTwoLinesInOneOverridden:(BOOL)a3;
- (void)setUnderline:(unsigned __int8)a3;
- (void)setUnderlineColor:(id)a3;
- (void)setUnderlineColorOverridden:(BOOL)a3;
- (void)setUnderlineOverridden:(BOOL)a3;
- (void)setUseCsFont:(unsigned __int8)a3;
- (void)setUseCsFontOverridden:(BOOL)a3;
- (void)setVerticalAlign:(unsigned __int8)a3;
- (void)setVerticalAlignOverridden:(BOOL)a3;
@end

@implementation WDCharacterPropertiesValues

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WDCharacterPropertiesValues allocWithZone:a3] init];
  if (v4)
  {
    v5 = [(WDCharacterPropertiesValues *)self baseStyle];
    [(WDCharacterPropertiesValues *)v4 setBaseStyle:v5];

    v6 = [(WDCharacterPropertiesValues *)self border];
    [(WDCharacterPropertiesValues *)v4 setBorder:v6];

    v7 = [(WDCharacterPropertiesValues *)self shading];
    [(WDCharacterPropertiesValues *)v4 setShading:v7];

    v8 = [(WDCharacterPropertiesValues *)self font];
    [(WDCharacterPropertiesValues *)v4 setFont:v8];

    v9 = [(WDCharacterPropertiesValues *)self extendedFont];
    [(WDCharacterPropertiesValues *)v4 setExtendedFont:v9];

    v10 = [(WDCharacterPropertiesValues *)self farEastFont];
    [(WDCharacterPropertiesValues *)v4 setFarEastFont:v10];

    v11 = [(WDCharacterPropertiesValues *)self symbolFont];
    [(WDCharacterPropertiesValues *)v4 setSymbolFont:v11];

    [(WDCharacterPropertiesValues *)v4 setFontHint:[(WDCharacterPropertiesValues *)self fontHint]];
    [(WDCharacterPropertiesValues *)v4 setLanguageForFarEast:[(WDCharacterPropertiesValues *)self languageForFarEast]];
    [(WDCharacterPropertiesValues *)v4 setLanguageForBiText:[(WDCharacterPropertiesValues *)self languageForBiText]];
    [(WDCharacterPropertiesValues *)v4 setLanguageForDefaultText:[(WDCharacterPropertiesValues *)self languageForDefaultText]];
    v12 = [(WDCharacterPropertiesValues *)self color];
    [(WDCharacterPropertiesValues *)v4 setColor:v12];

    v13 = [(WDCharacterPropertiesValues *)self underlineColor];
    [(WDCharacterPropertiesValues *)v4 setUnderlineColor:v13];

    v14 = [(WDCharacterPropertiesValues *)self outlineColor];
    [(WDCharacterPropertiesValues *)v4 setOutlineColor:v14];

    v15 = [(WDCharacterPropertiesValues *)self deletionDate];
    [(WDCharacterPropertiesValues *)v4 setDeletionDate:v15];

    v16 = [(WDCharacterPropertiesValues *)self editDate];
    [(WDCharacterPropertiesValues *)v4 setEditDate:v16];

    [(WDCharacterPropertiesValues *)v4 setCharPositionOfPictureBulletInBookmark:[(WDCharacterPropertiesValues *)self charPositionOfPictureBulletInBookmark]];
    [(WDCharacterPropertiesValues *)v4 setObjectIDForOle2:[(WDCharacterPropertiesValues *)self objectIDForOle2]];
    [(WDCharacterPropertiesValues *)v4 setOffsetToPictureData:[(WDCharacterPropertiesValues *)self offsetToPictureData]];
    [(WDCharacterPropertiesValues *)v4 setSpacing:[(WDCharacterPropertiesValues *)self spacing]];
    [(WDCharacterPropertiesValues *)v4 setPosition:[(WDCharacterPropertiesValues *)self position]];
    v17 = [(WDCharacterPropertiesValues *)self reflection];
    [(WDCharacterPropertiesValues *)v4 setReflection:v17];

    v18 = [(WDCharacterPropertiesValues *)self shadow2010];
    [(WDCharacterPropertiesValues *)v4 setShadow2010:v18];

    [(WDCharacterPropertiesValues *)self shadow2010Opacity];
    -[WDCharacterPropertiesValues setShadow2010Opacity:](v4, "setShadow2010Opacity:");
    [(WDCharacterPropertiesValues *)v4 setFontSize:[(WDCharacterPropertiesValues *)self fontSize]];
    [(WDCharacterPropertiesValues *)v4 setFontSizeForBiText:[(WDCharacterPropertiesValues *)self fontSizeForBiText]];
    [(WDCharacterPropertiesValues *)v4 setKerning:[(WDCharacterPropertiesValues *)self kerning]];
    [(WDCharacterPropertiesValues *)v4 setIndexToAuthorIDOfDeletion:[(WDCharacterPropertiesValues *)self indexToAuthorIDOfDeletion]];
    [(WDCharacterPropertiesValues *)v4 setIndexToAuthorIDOfEdit:[(WDCharacterPropertiesValues *)self indexToAuthorIDOfEdit]];
    [(WDCharacterPropertiesValues *)v4 setIndexToAuthorIDOfFormattingChange:[(WDCharacterPropertiesValues *)self indexToAuthorIDOfFormattingChange]];
    [(WDCharacterPropertiesValues *)v4 setTextScale:[(WDCharacterPropertiesValues *)self textScale]];
    [(WDCharacterPropertiesValues *)v4 setUnderline:[(WDCharacterPropertiesValues *)self underline]];
    [(WDCharacterPropertiesValues *)v4 setOutline:[(WDCharacterPropertiesValues *)self outline]];
    [(WDCharacterPropertiesValues *)self outline2010Width];
    -[WDCharacterPropertiesValues setOutline2010Width:](v4, "setOutline2010Width:");
    [(WDCharacterPropertiesValues *)v4 setShadow:[(WDCharacterPropertiesValues *)self shadow]];
    [(WDCharacterPropertiesValues *)v4 setEmbossed:[(WDCharacterPropertiesValues *)self embossed]];
    [(WDCharacterPropertiesValues *)v4 setImprint:[(WDCharacterPropertiesValues *)self imprint]];
    [(WDCharacterPropertiesValues *)v4 setBold:[(WDCharacterPropertiesValues *)self bold]];
    [(WDCharacterPropertiesValues *)v4 setBoldForBiText:[(WDCharacterPropertiesValues *)self boldForBiText]];
    [(WDCharacterPropertiesValues *)v4 setItalic:[(WDCharacterPropertiesValues *)self italic]];
    [(WDCharacterPropertiesValues *)v4 setItalicForBiText:[(WDCharacterPropertiesValues *)self italicForBiText]];
    [(WDCharacterPropertiesValues *)v4 setVerticalAlign:[(WDCharacterPropertiesValues *)self verticalAlign]];
    [(WDCharacterPropertiesValues *)v4 setEmphasisMark:[(WDCharacterPropertiesValues *)self emphasisMark]];
    [(WDCharacterPropertiesValues *)v4 setDeleted:[(WDCharacterPropertiesValues *)self deleted]];
    [(WDCharacterPropertiesValues *)v4 setEdited:[(WDCharacterPropertiesValues *)self edited]];
    [(WDCharacterPropertiesValues *)v4 setFormattingChanged:[(WDCharacterPropertiesValues *)self formattingChanged]];
    [(WDCharacterPropertiesValues *)v4 setStrikeThrough:[(WDCharacterPropertiesValues *)self strikeThrough]];
    [(WDCharacterPropertiesValues *)v4 setDoubleStrikeThrough:[(WDCharacterPropertiesValues *)self doubleStrikeThrough]];
    [(WDCharacterPropertiesValues *)v4 setHighlightColor:[(WDCharacterPropertiesValues *)self highlightColor]];
    [(WDCharacterPropertiesValues *)v4 setLigature:[(WDCharacterPropertiesValues *)self ligature]];
    [(WDCharacterPropertiesValues *)v4 setSmallCaps:[(WDCharacterPropertiesValues *)self smallCaps]];
    [(WDCharacterPropertiesValues *)v4 setCaps:[(WDCharacterPropertiesValues *)self caps]];
    [(WDCharacterPropertiesValues *)v4 setHidden:[(WDCharacterPropertiesValues *)self hidden]];
    [(WDCharacterPropertiesValues *)v4 setBracketTwoLinesInOne:[(WDCharacterPropertiesValues *)self bracketTwoLinesInOne]];
    [(WDCharacterPropertiesValues *)v4 setRightToLeft:[(WDCharacterPropertiesValues *)self rightToLeft]];
    [(WDCharacterPropertiesValues *)v4 setUseCsFont:[(WDCharacterPropertiesValues *)self useCsFont]];
    [(WDCharacterPropertiesValues *)v4 setSymbolCharacter:[(WDCharacterPropertiesValues *)self symbolCharacter]];
    [(WDCharacterPropertiesValues *)v4 setBaseStyleOverridden:[(WDCharacterPropertiesValues *)self baseStyleOverridden]];
    [(WDCharacterPropertiesValues *)v4 setBorderOverridden:[(WDCharacterPropertiesValues *)self borderOverridden]];
    [(WDCharacterPropertiesValues *)v4 setShadingOverridden:[(WDCharacterPropertiesValues *)self shadingOverridden]];
    [(WDCharacterPropertiesValues *)v4 setFontOverridden:[(WDCharacterPropertiesValues *)self fontOverridden]];
    [(WDCharacterPropertiesValues *)v4 setExtendedFontOverridden:[(WDCharacterPropertiesValues *)self extendedFontOverridden]];
    [(WDCharacterPropertiesValues *)v4 setFarEastFontOverridden:[(WDCharacterPropertiesValues *)self farEastFontOverridden]];
    [(WDCharacterPropertiesValues *)v4 setSymbolCharacterOverridden:[(WDCharacterPropertiesValues *)self symbolCharacterOverridden]];
    [(WDCharacterPropertiesValues *)v4 setSymbolFontOverridden:[(WDCharacterPropertiesValues *)self symbolFontOverridden]];
    [(WDCharacterPropertiesValues *)v4 setFontHintOverridden:[(WDCharacterPropertiesValues *)self fontHintOverridden]];
    [(WDCharacterPropertiesValues *)v4 setBoldOverridden:[(WDCharacterPropertiesValues *)self boldOverridden]];
    [(WDCharacterPropertiesValues *)v4 setBoldForBiTextOverridden:[(WDCharacterPropertiesValues *)self boldForBiTextOverridden]];
    [(WDCharacterPropertiesValues *)v4 setItalicOverridden:[(WDCharacterPropertiesValues *)self italicOverridden]];
    [(WDCharacterPropertiesValues *)v4 setItalicForBiTextOverridden:[(WDCharacterPropertiesValues *)self italicForBiTextOverridden]];
    [(WDCharacterPropertiesValues *)v4 setOutlineOverridden:[(WDCharacterPropertiesValues *)self outlineOverridden]];
    [(WDCharacterPropertiesValues *)v4 setOutlineColorOverridden:[(WDCharacterPropertiesValues *)self outlineColorOverridden]];
    [(WDCharacterPropertiesValues *)v4 setOutline2010WidthOverridden:[(WDCharacterPropertiesValues *)self outline2010WidthOverridden]];
    [(WDCharacterPropertiesValues *)v4 setShadowOverridden:[(WDCharacterPropertiesValues *)self shadowOverridden]];
    [(WDCharacterPropertiesValues *)v4 setReflectionOverridden:[(WDCharacterPropertiesValues *)self reflectionOverridden]];
    [(WDCharacterPropertiesValues *)v4 setShadow2010Overridden:[(WDCharacterPropertiesValues *)self shadow2010Overridden]];
    [(WDCharacterPropertiesValues *)v4 setShadow2010OpacityOverridden:[(WDCharacterPropertiesValues *)self shadow2010OpacityOverridden]];
    [(WDCharacterPropertiesValues *)v4 setEmbossedOverridden:[(WDCharacterPropertiesValues *)self embossedOverridden]];
    [(WDCharacterPropertiesValues *)v4 setImprintOverridden:[(WDCharacterPropertiesValues *)self imprintOverridden]];
    [(WDCharacterPropertiesValues *)v4 setKerningOverridden:[(WDCharacterPropertiesValues *)self kerningOverridden]];
    [(WDCharacterPropertiesValues *)v4 setTextScaleOverridden:[(WDCharacterPropertiesValues *)self textScaleOverridden]];
    [(WDCharacterPropertiesValues *)v4 setUnderlineColorOverridden:[(WDCharacterPropertiesValues *)self underlineColorOverridden]];
    [(WDCharacterPropertiesValues *)v4 setUnderlineOverridden:[(WDCharacterPropertiesValues *)self underlineOverridden]];
    [(WDCharacterPropertiesValues *)v4 setStrikeThroughOverridden:[(WDCharacterPropertiesValues *)self strikeThroughOverridden]];
    [(WDCharacterPropertiesValues *)v4 setDoubleStrikeThroughOverridden:[(WDCharacterPropertiesValues *)self doubleStrikeThroughOverridden]];
    [(WDCharacterPropertiesValues *)v4 setHighlight:[(WDCharacterPropertiesValues *)self highlight]];
    [(WDCharacterPropertiesValues *)v4 setHighlightOverridden:[(WDCharacterPropertiesValues *)self highlightOverridden]];
    [(WDCharacterPropertiesValues *)v4 setHighlightColorOverridden:[(WDCharacterPropertiesValues *)self highlightColorOverridden]];
    [(WDCharacterPropertiesValues *)v4 setLigatureOverridden:[(WDCharacterPropertiesValues *)self ligatureOverridden]];
    [(WDCharacterPropertiesValues *)v4 setSmallCapsOverridden:[(WDCharacterPropertiesValues *)self smallCapsOverridden]];
    [(WDCharacterPropertiesValues *)v4 setCapsOverridden:[(WDCharacterPropertiesValues *)self capsOverridden]];
    [(WDCharacterPropertiesValues *)v4 setLowerCase:[(WDCharacterPropertiesValues *)self lowerCase]];
    [(WDCharacterPropertiesValues *)v4 setLowerCaseOverridden:[(WDCharacterPropertiesValues *)self lowerCaseOverridden]];
    [(WDCharacterPropertiesValues *)v4 setHiddenOverridden:[(WDCharacterPropertiesValues *)self hiddenOverridden]];
    [(WDCharacterPropertiesValues *)v4 setSpacingOverridden:[(WDCharacterPropertiesValues *)self spacingOverridden]];
    [(WDCharacterPropertiesValues *)v4 setPositionOverridden:[(WDCharacterPropertiesValues *)self positionOverridden]];
    [(WDCharacterPropertiesValues *)v4 setFontSizeOverridden:[(WDCharacterPropertiesValues *)self fontSizeOverridden]];
    [(WDCharacterPropertiesValues *)v4 setVerticalAlignOverridden:[(WDCharacterPropertiesValues *)self verticalAlignOverridden]];
    [(WDCharacterPropertiesValues *)v4 setEmphasisMarkOverridden:[(WDCharacterPropertiesValues *)self emphasisMarkOverridden]];
    [(WDCharacterPropertiesValues *)v4 setColorOverridden:[(WDCharacterPropertiesValues *)self colorOverridden]];
    [(WDCharacterPropertiesValues *)v4 setColorAuto:[(WDCharacterPropertiesValues *)self colorAuto]];
    [(WDCharacterPropertiesValues *)v4 setColorAutoOverridden:[(WDCharacterPropertiesValues *)self colorAutoOverridden]];
    [(WDCharacterPropertiesValues *)v4 setLanguageForDefaultTextOverridden:[(WDCharacterPropertiesValues *)self languageForDefaultTextOverridden]];
    [(WDCharacterPropertiesValues *)v4 setDeletedOverridden:[(WDCharacterPropertiesValues *)self deletedOverridden]];
    [(WDCharacterPropertiesValues *)v4 setEditedOverridden:[(WDCharacterPropertiesValues *)self editedOverridden]];
    [(WDCharacterPropertiesValues *)v4 setFormattingChangedOverridden:[(WDCharacterPropertiesValues *)self formattingChangedOverridden]];
    [(WDCharacterPropertiesValues *)v4 setIndexToAuthorIDOfDeletionOverridden:[(WDCharacterPropertiesValues *)self indexToAuthorIDOfDeletionOverridden]];
    [(WDCharacterPropertiesValues *)v4 setIndexToAuthorIDOfEditOverridden:[(WDCharacterPropertiesValues *)self indexToAuthorIDOfEditOverridden]];
    [(WDCharacterPropertiesValues *)v4 setIndexToAuthorIDOfFormattingChangeOverridden:[(WDCharacterPropertiesValues *)self indexToAuthorIDOfFormattingChangeOverridden]];
    [(WDCharacterPropertiesValues *)v4 setDeletionDateOverridden:[(WDCharacterPropertiesValues *)self deletionDateOverridden]];
    [(WDCharacterPropertiesValues *)v4 setEditDateOverridden:[(WDCharacterPropertiesValues *)self editDateOverridden]];
    [(WDCharacterPropertiesValues *)v4 setSpecialCharacter:[(WDCharacterPropertiesValues *)self specialCharacter]];
    [(WDCharacterPropertiesValues *)v4 setSpecialCharacterOverridden:[(WDCharacterPropertiesValues *)self specialCharacterOverridden]];
    [(WDCharacterPropertiesValues *)v4 setListCharacterPictureBullet:[(WDCharacterPropertiesValues *)self listCharacterPictureBullet]];
    [(WDCharacterPropertiesValues *)v4 setListCharacterPictureBulletOverridden:[(WDCharacterPropertiesValues *)self listCharacterPictureBulletOverridden]];
    [(WDCharacterPropertiesValues *)v4 setCharPositionOfPictureBulletInBookmarkOverridden:[(WDCharacterPropertiesValues *)self charPositionOfPictureBulletInBookmarkOverridden]];
    [(WDCharacterPropertiesValues *)v4 setLanguageForFarEastOverridden:[(WDCharacterPropertiesValues *)self languageForFarEastOverridden]];
    [(WDCharacterPropertiesValues *)v4 setLanguageForBiTextOverridden:[(WDCharacterPropertiesValues *)self languageForBiTextOverridden]];
    [(WDCharacterPropertiesValues *)v4 setFontSizeForBiTextOverridden:[(WDCharacterPropertiesValues *)self fontSizeForBiTextOverridden]];
    [(WDCharacterPropertiesValues *)v4 setEmbeddedObject:[(WDCharacterPropertiesValues *)self embeddedObject]];
    [(WDCharacterPropertiesValues *)v4 setEmbeddedObjectOverridden:[(WDCharacterPropertiesValues *)self embeddedObjectOverridden]];
    [(WDCharacterPropertiesValues *)v4 setOle2:[(WDCharacterPropertiesValues *)self ole2]];
    [(WDCharacterPropertiesValues *)v4 setOle2Overridden:[(WDCharacterPropertiesValues *)self ole2Overridden]];
    [(WDCharacterPropertiesValues *)v4 setObjectIDForOle2Overridden:[(WDCharacterPropertiesValues *)self objectIDForOle2Overridden]];
    [(WDCharacterPropertiesValues *)v4 setOffsetToPictureDataOverridden:[(WDCharacterPropertiesValues *)self offsetToPictureDataOverridden]];
    [(WDCharacterPropertiesValues *)v4 setRightToLeftOverridden:[(WDCharacterPropertiesValues *)self rightToLeftOverridden]];
    [(WDCharacterPropertiesValues *)v4 setUseCsFontOverridden:[(WDCharacterPropertiesValues *)self useCsFontOverridden]];
    [(WDCharacterPropertiesValues *)v4 setHorizontalInVertical:[(WDCharacterPropertiesValues *)self horizontalInVertical]];
    [(WDCharacterPropertiesValues *)v4 setHorizontalInVerticalOverridden:[(WDCharacterPropertiesValues *)self horizontalInVerticalOverridden]];
    [(WDCharacterPropertiesValues *)v4 setCompressHorizontalInVertical:[(WDCharacterPropertiesValues *)self compressHorizontalInVertical]];
    [(WDCharacterPropertiesValues *)v4 setCompressHorizontalInVerticalOverridden:[(WDCharacterPropertiesValues *)self compressHorizontalInVerticalOverridden]];
    [(WDCharacterPropertiesValues *)v4 setTwoLinesInOne:[(WDCharacterPropertiesValues *)self twoLinesInOne]];
    [(WDCharacterPropertiesValues *)v4 setTwoLinesInOneOverridden:[(WDCharacterPropertiesValues *)self twoLinesInOneOverridden]];
    [(WDCharacterPropertiesValues *)v4 setBracketTwoLinesInOneOverridden:[(WDCharacterPropertiesValues *)self bracketTwoLinesInOneOverridden]];
  }
  return v4;
}

- (BOOL)baseStyleOverridden
{
  return *((unsigned char *)self + 8) & 1;
}

- (void)setBaseStyleOverridden:(BOOL)a3
{
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFE | a3;
}

- (BOOL)borderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setBorderOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v3;
}

- (BOOL)shadingOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setShadingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v3;
}

- (BOOL)fontOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setFontOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xF7 | v3;
}

- (BOOL)extendedFontOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setExtendedFontOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xEF | v3;
}

- (BOOL)farEastFontOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setFarEastFontOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xDF | v3;
}

- (BOOL)symbolCharacterOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 6) & 1;
}

- (void)setSymbolCharacterOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xBF | v3;
}

- (BOOL)symbolFontOverridden
{
  return *((unsigned __int8 *)self + 8) >> 7;
}

- (void)setSymbolFontOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = v3 & 0x80 | *((unsigned char *)self + 8) & 0x7F;
}

- (BOOL)fontHintOverridden
{
  return *((unsigned char *)self + 9) & 1;
}

- (void)setFontHintOverridden:(BOOL)a3
{
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFE | a3;
}

- (BOOL)boldOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 1) & 1;
}

- (void)setBoldOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFD | v3;
}

- (BOOL)boldForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 2) & 1;
}

- (void)setBoldForBiTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xFB | v3;
}

- (BOOL)italicOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 3) & 1;
}

- (void)setItalicOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xF7 | v3;
}

- (BOOL)italicForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 4) & 1;
}

- (void)setItalicForBiTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xEF | v3;
}

- (BOOL)outlineOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 5) & 1;
}

- (void)setOutlineOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xDF | v3;
}

- (BOOL)outlineColorOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 6) & 1;
}

- (void)setOutlineColorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = *((unsigned char *)self + 9) & 0xBF | v3;
}

- (BOOL)outline2010WidthOverridden
{
  return *((unsigned __int8 *)self + 9) >> 7;
}

- (void)setOutline2010WidthOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 9) = v3 & 0x80 | *((unsigned char *)self + 9) & 0x7F;
}

- (BOOL)shadowOverridden
{
  return *((unsigned char *)self + 10) & 1;
}

- (void)setShadowOverridden:(BOOL)a3
{
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFE | a3;
}

- (BOOL)reflectionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 1) & 1;
}

- (void)setReflectionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFD | v3;
}

- (BOOL)shadow2010Overridden
{
  return (*((unsigned __int8 *)self + 10) >> 2) & 1;
}

- (void)setShadow2010Overridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xFB | v3;
}

- (BOOL)shadow2010OpacityOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 3) & 1;
}

- (void)setShadow2010OpacityOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xF7 | v3;
}

- (BOOL)embossedOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 4) & 1;
}

- (void)setEmbossedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xEF | v3;
}

- (BOOL)imprintOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 5) & 1;
}

- (void)setImprintOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xDF | v3;
}

- (BOOL)kerningOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 6) & 1;
}

- (void)setKerningOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = *((unsigned char *)self + 10) & 0xBF | v3;
}

- (BOOL)textScaleOverridden
{
  return *((unsigned __int8 *)self + 10) >> 7;
}

- (void)setTextScaleOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 10) = v3 & 0x80 | *((unsigned char *)self + 10) & 0x7F;
}

- (BOOL)underlineColorOverridden
{
  return *((unsigned char *)self + 11) & 1;
}

- (void)setUnderlineColorOverridden:(BOOL)a3
{
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFE | a3;
}

- (BOOL)underlineOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 1) & 1;
}

- (void)setUnderlineOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFD | v3;
}

- (BOOL)strikeThroughOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 2) & 1;
}

- (void)setStrikeThroughOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xFB | v3;
}

- (BOOL)doubleStrikeThroughOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 3) & 1;
}

- (void)setDoubleStrikeThroughOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xF7 | v3;
}

- (BOOL)highlight
{
  return (*((unsigned __int8 *)self + 11) >> 4) & 1;
}

- (void)setHighlight:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xEF | v3;
}

- (BOOL)highlightOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 5) & 1;
}

- (void)setHighlightOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xDF | v3;
}

- (BOOL)highlightColorOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (void)setHighlightColorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = *((unsigned char *)self + 11) & 0xBF | v3;
}

- (BOOL)ligatureOverridden
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (void)setLigatureOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 11) = v3 & 0x80 | *((unsigned char *)self + 11) & 0x7F;
}

- (BOOL)smallCapsOverridden
{
  return *((unsigned char *)self + 12) & 1;
}

- (void)setSmallCapsOverridden:(BOOL)a3
{
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFE | a3;
}

- (BOOL)capsOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 1) & 1;
}

- (void)setCapsOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFD | v3;
}

- (BOOL)lowerCase
{
  return (*((unsigned __int8 *)self + 12) >> 2) & 1;
}

- (void)setLowerCase:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xFB | v3;
}

- (BOOL)lowerCaseOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 3) & 1;
}

- (void)setLowerCaseOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xF7 | v3;
}

- (BOOL)hiddenOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 4) & 1;
}

- (void)setHiddenOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xEF | v3;
}

- (BOOL)spacingOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 5) & 1;
}

- (void)setSpacingOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xDF | v3;
}

- (BOOL)positionOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 6) & 1;
}

- (void)setPositionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = *((unsigned char *)self + 12) & 0xBF | v3;
}

- (BOOL)fontSizeOverridden
{
  return *((unsigned __int8 *)self + 12) >> 7;
}

- (void)setFontSizeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 12) = v3 & 0x80 | *((unsigned char *)self + 12) & 0x7F;
}

- (BOOL)verticalAlignOverridden
{
  return *((unsigned char *)self + 13) & 1;
}

- (void)setVerticalAlignOverridden:(BOOL)a3
{
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xFE | a3;
}

- (BOOL)emphasisMarkOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 1) & 1;
}

- (void)setEmphasisMarkOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xFD | v3;
}

- (BOOL)colorOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 2) & 1;
}

- (void)setColorOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xFB | v3;
}

- (BOOL)colorAuto
{
  return (*((unsigned __int8 *)self + 13) >> 3) & 1;
}

- (void)setColorAuto:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xF7 | v3;
}

- (BOOL)colorAutoOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 4) & 1;
}

- (void)setColorAutoOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xEF | v3;
}

- (BOOL)languageForDefaultTextOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 5) & 1;
}

- (void)setLanguageForDefaultTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xDF | v3;
}

- (BOOL)deletedOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 6) & 1;
}

- (void)setDeletedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = *((unsigned char *)self + 13) & 0xBF | v3;
}

- (BOOL)editedOverridden
{
  return *((unsigned __int8 *)self + 13) >> 7;
}

- (void)setEditedOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 13) = v3 & 0x80 | *((unsigned char *)self + 13) & 0x7F;
}

- (BOOL)formattingChangedOverridden
{
  return *((unsigned char *)self + 14) & 1;
}

- (void)setFormattingChangedOverridden:(BOOL)a3
{
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xFE | a3;
}

- (BOOL)indexToAuthorIDOfDeletionOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 1) & 1;
}

- (void)setIndexToAuthorIDOfDeletionOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xFD | v3;
}

- (BOOL)indexToAuthorIDOfEditOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 2) & 1;
}

- (void)setIndexToAuthorIDOfEditOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xFB | v3;
}

- (BOOL)indexToAuthorIDOfFormattingChangeOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 3) & 1;
}

- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xF7 | v3;
}

- (BOOL)deletionDateOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 4) & 1;
}

- (void)setDeletionDateOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xEF | v3;
}

- (BOOL)editDateOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 5) & 1;
}

- (void)setEditDateOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xDF | v3;
}

- (BOOL)specialCharacter
{
  return (*((unsigned __int8 *)self + 14) >> 6) & 1;
}

- (void)setSpecialCharacter:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = *((unsigned char *)self + 14) & 0xBF | v3;
}

- (BOOL)specialCharacterOverridden
{
  return *((unsigned __int8 *)self + 14) >> 7;
}

- (void)setSpecialCharacterOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 14) = v3 & 0x80 | *((unsigned char *)self + 14) & 0x7F;
}

- (BOOL)listCharacterPictureBullet
{
  return *((unsigned char *)self + 15) & 1;
}

- (void)setListCharacterPictureBullet:(BOOL)a3
{
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xFE | a3;
}

- (BOOL)listCharacterPictureBulletOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 1) & 1;
}

- (void)setListCharacterPictureBulletOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xFD | v3;
}

- (BOOL)charPositionOfPictureBulletInBookmarkOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 2) & 1;
}

- (void)setCharPositionOfPictureBulletInBookmarkOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xFB | v3;
}

- (BOOL)languageForFarEastOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 3) & 1;
}

- (void)setLanguageForFarEastOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xF7 | v3;
}

- (BOOL)languageForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 4) & 1;
}

- (void)setLanguageForBiTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xEF | v3;
}

- (BOOL)fontSizeForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 5) & 1;
}

- (void)setFontSizeForBiTextOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xDF | v3;
}

- (BOOL)embeddedObject
{
  return (*((unsigned __int8 *)self + 15) >> 6) & 1;
}

- (void)setEmbeddedObject:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = *((unsigned char *)self + 15) & 0xBF | v3;
}

- (BOOL)embeddedObjectOverridden
{
  return *((unsigned __int8 *)self + 15) >> 7;
}

- (void)setEmbeddedObjectOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 15) = v3 & 0x80 | *((unsigned char *)self + 15) & 0x7F;
}

- (BOOL)ole2
{
  return *((unsigned char *)self + 16) & 1;
}

- (void)setOle2:(BOOL)a3
{
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFE | a3;
}

- (BOOL)ole2Overridden
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setOle2Overridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v3;
}

- (BOOL)objectIDForOle2Overridden
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setObjectIDForOle2Overridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v3;
}

- (BOOL)offsetToPictureDataOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setOffsetToPictureDataOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xF7 | v3;
}

- (BOOL)rightToLeftOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 4) & 1;
}

- (void)setRightToLeftOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xEF | v3;
}

- (BOOL)useCsFontOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 5) & 1;
}

- (void)setUseCsFontOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xDF | v3;
}

- (BOOL)horizontalInVertical
{
  return (*((unsigned __int8 *)self + 16) >> 6) & 1;
}

- (void)setHorizontalInVertical:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xBF | v3;
}

- (BOOL)horizontalInVerticalOverridden
{
  return *((unsigned __int8 *)self + 16) >> 7;
}

- (void)setHorizontalInVerticalOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = v3 & 0x80 | *((unsigned char *)self + 16) & 0x7F;
}

- (BOOL)compressHorizontalInVertical
{
  return *((unsigned char *)self + 17) & 1;
}

- (void)setCompressHorizontalInVertical:(BOOL)a3
{
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xFE | a3;
}

- (BOOL)compressHorizontalInVerticalOverridden
{
  return (*((unsigned __int8 *)self + 17) >> 1) & 1;
}

- (void)setCompressHorizontalInVerticalOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xFD | v3;
}

- (BOOL)twoLinesInOne
{
  return (*((unsigned __int8 *)self + 17) >> 2) & 1;
}

- (void)setTwoLinesInOne:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xFB | v3;
}

- (BOOL)twoLinesInOneOverridden
{
  return (*((unsigned __int8 *)self + 17) >> 3) & 1;
}

- (void)setTwoLinesInOneOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xF7 | v3;
}

- (BOOL)bracketTwoLinesInOneOverridden
{
  return (*((unsigned __int8 *)self + 17) >> 4) & 1;
}

- (void)setBracketTwoLinesInOneOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xEF | v3;
}

- (WDStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
}

- (WDBorder)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
}

- (WDShading)shading
{
  return self->_shading;
}

- (void)setShading:(id)a3
{
}

- (WDFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (WDFont)extendedFont
{
  return self->_extendedFont;
}

- (void)setExtendedFont:(id)a3
{
}

- (WDFont)farEastFont
{
  return self->_farEastFont;
}

- (void)setFarEastFont:(id)a3
{
}

- (WDFont)symbolFont
{
  return self->_symbolFont;
}

- (void)setSymbolFont:(id)a3
{
}

- (int)fontHint
{
  return self->_fontHint;
}

- (void)setFontHint:(int)a3
{
  self->_fontHint = a3;
}

- (int)languageForFarEast
{
  return self->_languageForFarEast;
}

- (void)setLanguageForFarEast:(int)a3
{
  self->_languageForFarEast = a3;
}

- (int)languageForBiText
{
  return self->_languageForBiText;
}

- (void)setLanguageForBiText:(int)a3
{
  self->_languageForBiText = a3;
}

- (int)languageForDefaultText
{
  return self->_languageForDefaultText;
}

- (void)setLanguageForDefaultText:(int)a3
{
  self->_languageForDefaultText = a3;
}

- (OITSUColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (OITSUColor)underlineColor
{
  return self->_underlineColor;
}

- (void)setUnderlineColor:(id)a3
{
}

- (OITSUColor)outlineColor
{
  return self->_outlineColor;
}

- (void)setOutlineColor:(id)a3
{
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
}

- (NSDate)editDate
{
  return self->_editDate;
}

- (void)setEditDate:(id)a3
{
}

- (int)charPositionOfPictureBulletInBookmark
{
  return self->_charPositionOfPictureBulletInBookmark;
}

- (void)setCharPositionOfPictureBulletInBookmark:(int)a3
{
  self->_charPositionOfPictureBulletInBookmark = a3;
}

- (int)objectIDForOle2
{
  return self->_objectIDForOle2;
}

- (void)setObjectIDForOle2:(int)a3
{
  self->_objectIDForOle2 = a3;
}

- (int)offsetToPictureData
{
  return self->_offsetToPictureData;
}

- (void)setOffsetToPictureData:(int)a3
{
  self->_offsetToPictureData = a3;
}

- (signed)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(signed __int16)a3
{
  self->_spacing = a3;
}

- (signed)position
{
  return self->_position;
}

- (void)setPosition:(signed __int16)a3
{
  self->_position = a3;
}

- (OADReflectionEffect)reflection
{
  return self->_reflection;
}

- (void)setReflection:(id)a3
{
}

- (OADShadowEffect)shadow2010
{
  return self->_shadow2010;
}

- (void)setShadow2010:(id)a3
{
}

- (float)shadow2010Opacity
{
  return self->_shadow2010Opacity;
}

- (void)setShadow2010Opacity:(float)a3
{
  self->_shadow2010Opacity = a3;
}

- (unsigned)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(unsigned __int16)a3
{
  self->_fontSize = a3;
}

- (unsigned)fontSizeForBiText
{
  return self->_fontSizeForBiText;
}

- (void)setFontSizeForBiText:(unsigned __int16)a3
{
  self->_fontSizeForBiText = a3;
}

- (unsigned)kerning
{
  return self->_kerning;
}

- (void)setKerning:(unsigned __int16)a3
{
  self->_kerning = a3;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  return self->_indexToAuthorIDOfDeletion;
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfDeletion = a3;
}

- (unsigned)indexToAuthorIDOfEdit
{
  return self->_indexToAuthorIDOfEdit;
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfEdit = a3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  return self->_indexToAuthorIDOfFormattingChange;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfFormattingChange = a3;
}

- (unsigned)textScale
{
  return self->_textScale;
}

- (void)setTextScale:(unsigned __int16)a3
{
  self->_textScale = a3;
}

- (unsigned)underline
{
  return self->_underline;
}

- (void)setUnderline:(unsigned __int8)a3
{
  self->_underline = a3;
}

- (unsigned)outline
{
  return self->_outline;
}

- (void)setOutline:(unsigned __int8)a3
{
  self->_outline = a3;
}

- (float)outline2010Width
{
  return self->_outline2010Width;
}

- (void)setOutline2010Width:(float)a3
{
  self->_outline2010Width = a3;
}

- (unsigned)shadow
{
  return self->_shadow;
}

- (void)setShadow:(unsigned __int8)a3
{
  self->_shadow = a3;
}

- (unsigned)embossed
{
  return self->_embossed;
}

- (void)setEmbossed:(unsigned __int8)a3
{
  self->_embossed = a3;
}

- (unsigned)imprint
{
  return self->_imprint;
}

- (void)setImprint:(unsigned __int8)a3
{
  self->_imprint = a3;
}

- (unsigned)bold
{
  return self->_bold;
}

- (void)setBold:(unsigned __int8)a3
{
  self->_bold = a3;
}

- (unsigned)boldForBiText
{
  return self->_boldForBiText;
}

- (void)setBoldForBiText:(unsigned __int8)a3
{
  self->_boldForBiText = a3;
}

- (unsigned)italic
{
  return self->_italic;
}

- (void)setItalic:(unsigned __int8)a3
{
  self->_italic = a3;
}

- (unsigned)italicForBiText
{
  return self->_italicForBiText;
}

- (void)setItalicForBiText:(unsigned __int8)a3
{
  self->_italicForBiText = a3;
}

- (unsigned)verticalAlign
{
  return self->_verticalAlign;
}

- (void)setVerticalAlign:(unsigned __int8)a3
{
  self->_verticalAlign = a3;
}

- (int)emphasisMark
{
  return self->_emphasisMark;
}

- (void)setEmphasisMark:(int)a3
{
  self->_emphasisMark = a3;
}

- (unsigned)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(unsigned __int8)a3
{
  self->_deleted = a3;
}

- (unsigned)edited
{
  return self->_edited;
}

- (void)setEdited:(unsigned __int8)a3
{
  self->_edited = a3;
}

- (BOOL)formattingChanged
{
  return self->_formattingChanged;
}

- (void)setFormattingChanged:(BOOL)a3
{
  self->_formattingChanged = a3;
}

- (unsigned)strikeThrough
{
  return self->_strikeThrough;
}

- (void)setStrikeThrough:(unsigned __int8)a3
{
  self->_strikeThrough = a3;
}

- (unsigned)doubleStrikeThrough
{
  return self->_doubleStrikeThrough;
}

- (void)setDoubleStrikeThrough:(unsigned __int8)a3
{
  self->_doubleStrikeThrough = a3;
}

- (unsigned)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(unsigned __int8)a3
{
  self->_highlightColor = a3;
}

- (unsigned)ligature
{
  return self->_ligature;
}

- (void)setLigature:(unsigned __int8)a3
{
  self->_ligature = a3;
}

- (unsigned)smallCaps
{
  return self->_smallCaps;
}

- (void)setSmallCaps:(unsigned __int8)a3
{
  self->_smallCaps = a3;
}

- (unsigned)caps
{
  return self->_caps;
}

- (void)setCaps:(unsigned __int8)a3
{
  self->_caps = a3;
}

- (unsigned)hidden
{
  return self->_hidden;
}

- (void)setHidden:(unsigned __int8)a3
{
  self->_hidden = a3;
}

- (unsigned)bracketTwoLinesInOne
{
  return self->_bracketTwoLinesInOne;
}

- (void)setBracketTwoLinesInOne:(unsigned __int8)a3
{
  self->_bracketTwoLinesInOne = a3;
}

- (unsigned)rightToLeft
{
  return self->_rightToLeft;
}

- (void)setRightToLeft:(unsigned __int8)a3
{
  self->_rightToLeft = a3;
}

- (unsigned)useCsFont
{
  return self->_useCsFont;
}

- (void)setUseCsFont:(unsigned __int8)a3
{
  self->_useCsFont = a3;
}

- (unsigned)symbolCharacter
{
  return self->_symbolCharacter;
}

- (void)setSymbolCharacter:(unsigned __int16)a3
{
  self->_symbolCharacter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow2010, 0);
  objc_storeStrong((id *)&self->_reflection, 0);
  objc_storeStrong((id *)&self->_editDate, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_underlineColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_farEastFont, 0);
  objc_storeStrong((id *)&self->_extendedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_shading, 0);
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
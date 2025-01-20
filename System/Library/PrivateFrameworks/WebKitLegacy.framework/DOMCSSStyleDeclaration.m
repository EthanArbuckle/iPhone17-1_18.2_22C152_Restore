@interface DOMCSSStyleDeclaration
- (BOOL)isPropertyImplicit:(NSString *)propertyName;
- (DOMCSSRule)parentRule;
- (DOMCSSValue)getPropertyCSSValue:(NSString *)propertyName;
- (NSString)azimuth;
- (NSString)background;
- (NSString)backgroundAttachment;
- (NSString)backgroundColor;
- (NSString)backgroundImage;
- (NSString)backgroundPosition;
- (NSString)backgroundRepeat;
- (NSString)border;
- (NSString)borderBottom;
- (NSString)borderBottomColor;
- (NSString)borderBottomStyle;
- (NSString)borderBottomWidth;
- (NSString)borderCollapse;
- (NSString)borderColor;
- (NSString)borderLeft;
- (NSString)borderLeftColor;
- (NSString)borderLeftStyle;
- (NSString)borderLeftWidth;
- (NSString)borderRight;
- (NSString)borderRightColor;
- (NSString)borderRightStyle;
- (NSString)borderRightWidth;
- (NSString)borderSpacing;
- (NSString)borderStyle;
- (NSString)borderTop;
- (NSString)borderTopColor;
- (NSString)borderTopStyle;
- (NSString)borderTopWidth;
- (NSString)borderWidth;
- (NSString)bottom;
- (NSString)captionSide;
- (NSString)clear;
- (NSString)clip;
- (NSString)color;
- (NSString)content;
- (NSString)counterIncrement;
- (NSString)counterReset;
- (NSString)cssFloat;
- (NSString)cssText;
- (NSString)cue;
- (NSString)cueAfter;
- (NSString)cueBefore;
- (NSString)cursor;
- (NSString)direction;
- (NSString)display;
- (NSString)elevation;
- (NSString)emptyCells;
- (NSString)font;
- (NSString)fontFamily;
- (NSString)fontSize;
- (NSString)fontSizeAdjust;
- (NSString)fontStretch;
- (NSString)fontStyle;
- (NSString)fontVariant;
- (NSString)fontWeight;
- (NSString)getPropertyPriority:(NSString *)propertyName;
- (NSString)getPropertyShorthand:(NSString *)propertyName;
- (NSString)getPropertyValue:(NSString *)propertyName;
- (NSString)height;
- (NSString)item:(unsigned int)index;
- (NSString)left;
- (NSString)letterSpacing;
- (NSString)lineHeight;
- (NSString)listStyle;
- (NSString)listStyleImage;
- (NSString)listStylePosition;
- (NSString)listStyleType;
- (NSString)margin;
- (NSString)marginBottom;
- (NSString)marginLeft;
- (NSString)marginRight;
- (NSString)marginTop;
- (NSString)markerOffset;
- (NSString)marks;
- (NSString)maxHeight;
- (NSString)maxWidth;
- (NSString)minHeight;
- (NSString)minWidth;
- (NSString)orphans;
- (NSString)outline;
- (NSString)outlineColor;
- (NSString)outlineStyle;
- (NSString)outlineWidth;
- (NSString)overflow;
- (NSString)padding;
- (NSString)paddingBottom;
- (NSString)paddingLeft;
- (NSString)paddingRight;
- (NSString)paddingTop;
- (NSString)page;
- (NSString)pageBreakAfter;
- (NSString)pageBreakBefore;
- (NSString)pageBreakInside;
- (NSString)pause;
- (NSString)pauseAfter;
- (NSString)pauseBefore;
- (NSString)pitch;
- (NSString)pitchRange;
- (NSString)playDuring;
- (NSString)position;
- (NSString)quotes;
- (NSString)removeProperty:(NSString *)propertyName;
- (NSString)richness;
- (NSString)right;
- (NSString)size;
- (NSString)speak;
- (NSString)speakHeader;
- (NSString)speakNumeral;
- (NSString)speakPunctuation;
- (NSString)speechRate;
- (NSString)stress;
- (NSString)tableLayout;
- (NSString)textAlign;
- (NSString)textDecoration;
- (NSString)textIndent;
- (NSString)textShadow;
- (NSString)textTransform;
- (NSString)top;
- (NSString)unicodeBidi;
- (NSString)verticalAlign;
- (NSString)visibility;
- (NSString)voiceFamily;
- (NSString)volume;
- (NSString)whiteSpace;
- (NSString)widows;
- (NSString)width;
- (NSString)wordSpacing;
- (NSString)zIndex;
- (id)_fontSizeDelta;
- (unsigned)length;
- (void)_setFontSizeDelta:(id)a3;
- (void)dealloc;
- (void)setAzimuth:(NSString *)azimuth;
- (void)setBackground:(NSString *)background;
- (void)setBackgroundAttachment:(NSString *)backgroundAttachment;
- (void)setBackgroundColor:(NSString *)backgroundColor;
- (void)setBackgroundImage:(NSString *)backgroundImage;
- (void)setBackgroundPosition:(NSString *)backgroundPosition;
- (void)setBackgroundRepeat:(NSString *)backgroundRepeat;
- (void)setBorder:(NSString *)border;
- (void)setBorderBottom:(NSString *)borderBottom;
- (void)setBorderBottomColor:(NSString *)borderBottomColor;
- (void)setBorderBottomStyle:(NSString *)borderBottomStyle;
- (void)setBorderBottomWidth:(NSString *)borderBottomWidth;
- (void)setBorderCollapse:(NSString *)borderCollapse;
- (void)setBorderColor:(NSString *)borderColor;
- (void)setBorderLeft:(NSString *)borderLeft;
- (void)setBorderLeftColor:(NSString *)borderLeftColor;
- (void)setBorderLeftStyle:(NSString *)borderLeftStyle;
- (void)setBorderLeftWidth:(NSString *)borderLeftWidth;
- (void)setBorderRight:(NSString *)borderRight;
- (void)setBorderRightColor:(NSString *)borderRightColor;
- (void)setBorderRightStyle:(NSString *)borderRightStyle;
- (void)setBorderRightWidth:(NSString *)borderRightWidth;
- (void)setBorderSpacing:(NSString *)borderSpacing;
- (void)setBorderStyle:(NSString *)borderStyle;
- (void)setBorderTop:(NSString *)borderTop;
- (void)setBorderTopColor:(NSString *)borderTopColor;
- (void)setBorderTopStyle:(NSString *)borderTopStyle;
- (void)setBorderTopWidth:(NSString *)borderTopWidth;
- (void)setBorderWidth:(NSString *)borderWidth;
- (void)setBottom:(NSString *)bottom;
- (void)setCaptionSide:(NSString *)captionSide;
- (void)setClear:(NSString *)clear;
- (void)setClip:(NSString *)clip;
- (void)setColor:(NSString *)color;
- (void)setContent:(NSString *)content;
- (void)setCounterIncrement:(NSString *)counterIncrement;
- (void)setCounterReset:(NSString *)counterReset;
- (void)setCssFloat:(NSString *)cssFloat;
- (void)setCssText:(NSString *)cssText;
- (void)setCue:(NSString *)cue;
- (void)setCueAfter:(NSString *)cueAfter;
- (void)setCueBefore:(NSString *)cueBefore;
- (void)setCursor:(NSString *)cursor;
- (void)setDirection:(NSString *)direction;
- (void)setDisplay:(NSString *)display;
- (void)setElevation:(NSString *)elevation;
- (void)setEmptyCells:(NSString *)emptyCells;
- (void)setFont:(NSString *)font;
- (void)setFontFamily:(NSString *)fontFamily;
- (void)setFontSize:(NSString *)fontSize;
- (void)setFontSizeAdjust:(NSString *)fontSizeAdjust;
- (void)setFontStretch:(NSString *)fontStretch;
- (void)setFontStyle:(NSString *)fontStyle;
- (void)setFontVariant:(NSString *)fontVariant;
- (void)setFontWeight:(NSString *)fontWeight;
- (void)setHeight:(NSString *)height;
- (void)setLeft:(NSString *)left;
- (void)setLetterSpacing:(NSString *)letterSpacing;
- (void)setLineHeight:(NSString *)lineHeight;
- (void)setListStyle:(NSString *)listStyle;
- (void)setListStyleImage:(NSString *)listStyleImage;
- (void)setListStylePosition:(NSString *)listStylePosition;
- (void)setListStyleType:(NSString *)listStyleType;
- (void)setMargin:(NSString *)margin;
- (void)setMarginBottom:(NSString *)marginBottom;
- (void)setMarginLeft:(NSString *)marginLeft;
- (void)setMarginRight:(NSString *)marginRight;
- (void)setMarginTop:(NSString *)marginTop;
- (void)setMarkerOffset:(NSString *)markerOffset;
- (void)setMarks:(NSString *)marks;
- (void)setMaxHeight:(NSString *)maxHeight;
- (void)setMaxWidth:(NSString *)maxWidth;
- (void)setMinHeight:(NSString *)minHeight;
- (void)setMinWidth:(NSString *)minWidth;
- (void)setOrphans:(NSString *)orphans;
- (void)setOutline:(NSString *)outline;
- (void)setOutlineColor:(NSString *)outlineColor;
- (void)setOutlineStyle:(NSString *)outlineStyle;
- (void)setOutlineWidth:(NSString *)outlineWidth;
- (void)setOverflow:(NSString *)overflow;
- (void)setPadding:(NSString *)padding;
- (void)setPaddingBottom:(NSString *)paddingBottom;
- (void)setPaddingLeft:(NSString *)paddingLeft;
- (void)setPaddingRight:(NSString *)paddingRight;
- (void)setPaddingTop:(NSString *)paddingTop;
- (void)setPage:(NSString *)page;
- (void)setPageBreakAfter:(NSString *)pageBreakAfter;
- (void)setPageBreakBefore:(NSString *)pageBreakBefore;
- (void)setPageBreakInside:(NSString *)pageBreakInside;
- (void)setPause:(NSString *)pause;
- (void)setPauseAfter:(NSString *)pauseAfter;
- (void)setPauseBefore:(NSString *)pauseBefore;
- (void)setPitch:(NSString *)pitch;
- (void)setPitchRange:(NSString *)pitchRange;
- (void)setPlayDuring:(NSString *)playDuring;
- (void)setPosition:(NSString *)position;
- (void)setProperty:(NSString *)propertyName value:(NSString *)value priority:(NSString *)priority;
- (void)setQuotes:(NSString *)quotes;
- (void)setRichness:(NSString *)richness;
- (void)setRight:(NSString *)right;
- (void)setSize:(NSString *)size;
- (void)setSpeak:(NSString *)speak;
- (void)setSpeakHeader:(NSString *)speakHeader;
- (void)setSpeakNumeral:(NSString *)speakNumeral;
- (void)setSpeakPunctuation:(NSString *)speakPunctuation;
- (void)setSpeechRate:(NSString *)speechRate;
- (void)setStress:(NSString *)stress;
- (void)setTableLayout:(NSString *)tableLayout;
- (void)setTextAlign:(NSString *)textAlign;
- (void)setTextDecoration:(NSString *)textDecoration;
- (void)setTextIndent:(NSString *)textIndent;
- (void)setTextShadow:(NSString *)textShadow;
- (void)setTextTransform:(NSString *)textTransform;
- (void)setTop:(NSString *)top;
- (void)setUnicodeBidi:(NSString *)unicodeBidi;
- (void)setVerticalAlign:(NSString *)verticalAlign;
- (void)setVisibility:(NSString *)visibility;
- (void)setVoiceFamily:(NSString *)voiceFamily;
- (void)setVolume:(NSString *)volume;
- (void)setWhiteSpace:(NSString *)whiteSpace;
- (void)setWidows:(NSString *)widows;
- (void)setWidth:(NSString *)width;
- (void)setWordSpacing:(NSString *)wordSpacing;
- (void)setZIndex:(NSString *)zIndex;
@end

@implementation DOMCSSStyleDeclaration

- (NSString)azimuth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"azimuth"];
}

- (void)setAzimuth:(NSString *)azimuth
{
}

- (NSString)background
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"background"];
}

- (void)setBackground:(NSString *)background
{
}

- (NSString)backgroundAttachment
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"background-attachment"];
}

- (void)setBackgroundAttachment:(NSString *)backgroundAttachment
{
}

- (NSString)backgroundColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"background-color"];
}

- (void)setBackgroundColor:(NSString *)backgroundColor
{
}

- (NSString)backgroundImage
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"background-image"];
}

- (void)setBackgroundImage:(NSString *)backgroundImage
{
}

- (NSString)backgroundPosition
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"background-position"];
}

- (void)setBackgroundPosition:(NSString *)backgroundPosition
{
}

- (NSString)backgroundRepeat
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"background-repeat"];
}

- (void)setBackgroundRepeat:(NSString *)backgroundRepeat
{
}

- (NSString)border
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border"];
}

- (void)setBorder:(NSString *)border
{
}

- (NSString)borderCollapse
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-collapse"];
}

- (void)setBorderCollapse:(NSString *)borderCollapse
{
}

- (NSString)borderColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-color"];
}

- (void)setBorderColor:(NSString *)borderColor
{
}

- (NSString)borderSpacing
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-spacing"];
}

- (void)setBorderSpacing:(NSString *)borderSpacing
{
}

- (NSString)borderStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-style"];
}

- (void)setBorderStyle:(NSString *)borderStyle
{
}

- (NSString)borderTop
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-top"];
}

- (void)setBorderTop:(NSString *)borderTop
{
}

- (NSString)borderRight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-right"];
}

- (void)setBorderRight:(NSString *)borderRight
{
}

- (NSString)borderBottom
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-bottom"];
}

- (void)setBorderBottom:(NSString *)borderBottom
{
}

- (NSString)borderLeft
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-left"];
}

- (void)setBorderLeft:(NSString *)borderLeft
{
}

- (NSString)borderTopColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-top-color"];
}

- (void)setBorderTopColor:(NSString *)borderTopColor
{
}

- (NSString)borderRightColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-right-color"];
}

- (void)setBorderRightColor:(NSString *)borderRightColor
{
}

- (NSString)borderBottomColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-bottom-color"];
}

- (void)setBorderBottomColor:(NSString *)borderBottomColor
{
}

- (NSString)borderLeftColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-left-color"];
}

- (void)setBorderLeftColor:(NSString *)borderLeftColor
{
}

- (NSString)borderTopStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-top-style"];
}

- (void)setBorderTopStyle:(NSString *)borderTopStyle
{
}

- (NSString)borderRightStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-right-style"];
}

- (void)setBorderRightStyle:(NSString *)borderRightStyle
{
}

- (NSString)borderBottomStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-bottom-style"];
}

- (void)setBorderBottomStyle:(NSString *)borderBottomStyle
{
}

- (NSString)borderLeftStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-left-style"];
}

- (void)setBorderLeftStyle:(NSString *)borderLeftStyle
{
}

- (NSString)borderTopWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-top-width"];
}

- (void)setBorderTopWidth:(NSString *)borderTopWidth
{
}

- (NSString)borderRightWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-right-width"];
}

- (void)setBorderRightWidth:(NSString *)borderRightWidth
{
}

- (NSString)borderBottomWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-bottom-width"];
}

- (void)setBorderBottomWidth:(NSString *)borderBottomWidth
{
}

- (NSString)borderLeftWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-left-width"];
}

- (void)setBorderLeftWidth:(NSString *)borderLeftWidth
{
}

- (NSString)borderWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"border-width"];
}

- (void)setBorderWidth:(NSString *)borderWidth
{
}

- (NSString)bottom
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"bottom"];
}

- (void)setBottom:(NSString *)bottom
{
}

- (NSString)captionSide
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"caption-side"];
}

- (void)setCaptionSide:(NSString *)captionSide
{
}

- (NSString)clear
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"clear"];
}

- (void)setClear:(NSString *)clear
{
}

- (NSString)clip
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"clip"];
}

- (void)setClip:(NSString *)clip
{
}

- (NSString)color
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"color"];
}

- (void)setColor:(NSString *)color
{
}

- (NSString)content
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"content"];
}

- (void)setContent:(NSString *)content
{
}

- (NSString)counterIncrement
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"counter-increment"];
}

- (void)setCounterIncrement:(NSString *)counterIncrement
{
}

- (NSString)counterReset
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"counter-reset"];
}

- (void)setCounterReset:(NSString *)counterReset
{
}

- (NSString)cue
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"cue"];
}

- (void)setCue:(NSString *)cue
{
}

- (NSString)cueAfter
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"cue-after"];
}

- (void)setCueAfter:(NSString *)cueAfter
{
}

- (NSString)cueBefore
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"cue-before"];
}

- (void)setCueBefore:(NSString *)cueBefore
{
}

- (NSString)cursor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"cursor"];
}

- (void)setCursor:(NSString *)cursor
{
}

- (NSString)direction
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"direction"];
}

- (void)setDirection:(NSString *)direction
{
}

- (NSString)display
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"display"];
}

- (void)setDisplay:(NSString *)display
{
}

- (NSString)elevation
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"elevation"];
}

- (void)setElevation:(NSString *)elevation
{
}

- (NSString)emptyCells
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"empty-cells"];
}

- (void)setEmptyCells:(NSString *)emptyCells
{
}

- (NSString)cssFloat
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"css-float"];
}

- (void)setCssFloat:(NSString *)cssFloat
{
}

- (NSString)font
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font"];
}

- (void)setFont:(NSString *)font
{
}

- (NSString)fontFamily
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-family"];
}

- (void)setFontFamily:(NSString *)fontFamily
{
}

- (NSString)fontSize
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-size"];
}

- (void)setFontSize:(NSString *)fontSize
{
}

- (NSString)fontSizeAdjust
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-size-adjust"];
}

- (void)setFontSizeAdjust:(NSString *)fontSizeAdjust
{
}

- (id)_fontSizeDelta
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"-webkit-font-size-delta"];
}

- (void)_setFontSizeDelta:(id)a3
{
}

- (NSString)fontStretch
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-stretch"];
}

- (void)setFontStretch:(NSString *)fontStretch
{
}

- (NSString)fontStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-style"];
}

- (void)setFontStyle:(NSString *)fontStyle
{
}

- (NSString)fontVariant
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-variant"];
}

- (void)setFontVariant:(NSString *)fontVariant
{
}

- (NSString)fontWeight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"font-weight"];
}

- (void)setFontWeight:(NSString *)fontWeight
{
}

- (NSString)height
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"height"];
}

- (void)setHeight:(NSString *)height
{
}

- (NSString)left
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"left"];
}

- (void)setLeft:(NSString *)left
{
}

- (NSString)letterSpacing
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"letter-spacing"];
}

- (void)setLetterSpacing:(NSString *)letterSpacing
{
}

- (NSString)lineHeight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"line-height"];
}

- (void)setLineHeight:(NSString *)lineHeight
{
}

- (NSString)listStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"list-style"];
}

- (void)setListStyle:(NSString *)listStyle
{
}

- (NSString)listStyleImage
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"list-style-image"];
}

- (void)setListStyleImage:(NSString *)listStyleImage
{
}

- (NSString)listStylePosition
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"list-style-position"];
}

- (void)setListStylePosition:(NSString *)listStylePosition
{
}

- (NSString)listStyleType
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"list-style-type"];
}

- (void)setListStyleType:(NSString *)listStyleType
{
}

- (NSString)margin
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"margin"];
}

- (void)setMargin:(NSString *)margin
{
}

- (NSString)marginTop
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"margin-top"];
}

- (void)setMarginTop:(NSString *)marginTop
{
}

- (NSString)marginRight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"margin-right"];
}

- (void)setMarginRight:(NSString *)marginRight
{
}

- (NSString)marginBottom
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"margin-bottom"];
}

- (void)setMarginBottom:(NSString *)marginBottom
{
}

- (NSString)marginLeft
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"margin-left"];
}

- (void)setMarginLeft:(NSString *)marginLeft
{
}

- (NSString)markerOffset
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"marker-offset"];
}

- (void)setMarkerOffset:(NSString *)markerOffset
{
}

- (NSString)marks
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"marks"];
}

- (void)setMarks:(NSString *)marks
{
}

- (NSString)maxHeight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"max-height"];
}

- (void)setMaxHeight:(NSString *)maxHeight
{
}

- (NSString)maxWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"max-width"];
}

- (void)setMaxWidth:(NSString *)maxWidth
{
}

- (NSString)minHeight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"min-height"];
}

- (void)setMinHeight:(NSString *)minHeight
{
}

- (NSString)minWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"min-width"];
}

- (void)setMinWidth:(NSString *)minWidth
{
}

- (NSString)orphans
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"orphans"];
}

- (void)setOrphans:(NSString *)orphans
{
}

- (NSString)outline
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"outline"];
}

- (void)setOutline:(NSString *)outline
{
}

- (NSString)outlineColor
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"outline-color"];
}

- (void)setOutlineColor:(NSString *)outlineColor
{
}

- (NSString)outlineStyle
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"outline-style"];
}

- (void)setOutlineStyle:(NSString *)outlineStyle
{
}

- (NSString)outlineWidth
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"outline-width"];
}

- (void)setOutlineWidth:(NSString *)outlineWidth
{
}

- (NSString)overflow
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"overflow"];
}

- (void)setOverflow:(NSString *)overflow
{
}

- (NSString)padding
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"padding"];
}

- (void)setPadding:(NSString *)padding
{
}

- (NSString)paddingTop
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"padding-top"];
}

- (void)setPaddingTop:(NSString *)paddingTop
{
}

- (NSString)paddingRight
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"padding-right"];
}

- (void)setPaddingRight:(NSString *)paddingRight
{
}

- (NSString)paddingBottom
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"padding-bottom"];
}

- (void)setPaddingBottom:(NSString *)paddingBottom
{
}

- (NSString)paddingLeft
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"padding-left"];
}

- (void)setPaddingLeft:(NSString *)paddingLeft
{
}

- (NSString)page
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"page"];
}

- (void)setPage:(NSString *)page
{
}

- (NSString)pageBreakAfter
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"page-break-after"];
}

- (void)setPageBreakAfter:(NSString *)pageBreakAfter
{
}

- (NSString)pageBreakBefore
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"page-break-before"];
}

- (void)setPageBreakBefore:(NSString *)pageBreakBefore
{
}

- (NSString)pageBreakInside
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"page-break-inside"];
}

- (void)setPageBreakInside:(NSString *)pageBreakInside
{
}

- (NSString)pause
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"pause"];
}

- (void)setPause:(NSString *)pause
{
}

- (NSString)pauseAfter
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"pause-after"];
}

- (void)setPauseAfter:(NSString *)pauseAfter
{
}

- (NSString)pauseBefore
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"pause-before"];
}

- (void)setPauseBefore:(NSString *)pauseBefore
{
}

- (NSString)pitch
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"pitch"];
}

- (void)setPitch:(NSString *)pitch
{
}

- (NSString)pitchRange
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"pitch-range"];
}

- (void)setPitchRange:(NSString *)pitchRange
{
}

- (NSString)playDuring
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"play-during"];
}

- (void)setPlayDuring:(NSString *)playDuring
{
}

- (NSString)position
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"position"];
}

- (void)setPosition:(NSString *)position
{
}

- (NSString)quotes
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"quotes"];
}

- (void)setQuotes:(NSString *)quotes
{
}

- (NSString)richness
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"richness"];
}

- (void)setRichness:(NSString *)richness
{
}

- (NSString)right
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"right"];
}

- (void)setRight:(NSString *)right
{
}

- (NSString)size
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"size"];
}

- (void)setSize:(NSString *)size
{
}

- (NSString)speak
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"speak"];
}

- (void)setSpeak:(NSString *)speak
{
}

- (NSString)speakHeader
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"speak-header"];
}

- (void)setSpeakHeader:(NSString *)speakHeader
{
}

- (NSString)speakNumeral
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"speak-numeral"];
}

- (void)setSpeakNumeral:(NSString *)speakNumeral
{
}

- (NSString)speakPunctuation
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"speak-punctuation"];
}

- (void)setSpeakPunctuation:(NSString *)speakPunctuation
{
}

- (NSString)speechRate
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"speech-rate"];
}

- (void)setSpeechRate:(NSString *)speechRate
{
}

- (NSString)stress
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"stress"];
}

- (void)setStress:(NSString *)stress
{
}

- (NSString)tableLayout
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"table-layout"];
}

- (void)setTableLayout:(NSString *)tableLayout
{
}

- (NSString)textAlign
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"text-align"];
}

- (void)setTextAlign:(NSString *)textAlign
{
}

- (NSString)textDecoration
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"text-decoration"];
}

- (void)setTextDecoration:(NSString *)textDecoration
{
}

- (NSString)textIndent
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"text-indent"];
}

- (void)setTextIndent:(NSString *)textIndent
{
}

- (NSString)textShadow
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"text-shadow"];
}

- (void)setTextShadow:(NSString *)textShadow
{
}

- (NSString)textTransform
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"text-transform"];
}

- (void)setTextTransform:(NSString *)textTransform
{
}

- (NSString)top
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"top"];
}

- (void)setTop:(NSString *)top
{
}

- (NSString)unicodeBidi
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"unicode-bidi"];
}

- (void)setUnicodeBidi:(NSString *)unicodeBidi
{
}

- (NSString)verticalAlign
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"vertical-align"];
}

- (void)setVerticalAlign:(NSString *)verticalAlign
{
}

- (NSString)visibility
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"visibility"];
}

- (void)setVisibility:(NSString *)visibility
{
}

- (NSString)voiceFamily
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"voice-family"];
}

- (void)setVoiceFamily:(NSString *)voiceFamily
{
}

- (NSString)volume
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"volume"];
}

- (void)setVolume:(NSString *)volume
{
}

- (NSString)whiteSpace
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"white-space"];
}

- (void)setWhiteSpace:(NSString *)whiteSpace
{
}

- (NSString)widows
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"widows"];
}

- (void)setWidows:(NSString *)widows
{
}

- (NSString)width
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"width"];
}

- (void)setWidth:(NSString *)width
{
}

- (NSString)wordSpacing
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"word-spacing"];
}

- (void)setWordSpacing:(NSString *)wordSpacing
{
}

- (NSString)zIndex
{
  return [(DOMCSSStyleDeclaration *)self getPropertyValue:@"z-index"];
}

- (void)setZIndex:(NSString *)zIndex
{
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal) {
      (*(void (**)(DOMObjectInternal *))(*(void *)internal + 24))(internal);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMCSSStyleDeclaration;
    [(DOMObject *)&v5 dealloc];
  }
}

- (NSString)cssText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 56))(&v7);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setCssText:(NSString *)cssText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v10, cssText);
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal + 64))(&v11, internal, &v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 72))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMCSSRule)parentRule
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::CSSRule *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 40))(self->super._internal);
  v4 = (DOMCSSRule *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)getPropertyValue:(NSString *)propertyName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v11, propertyName);
  (*(void (**)(WTF::StringImpl **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal
                                                                                                  + 96))(&v12, internal, &v11);
  if (!v12)
  {
    uint64_t v12 = 0;
    v7 = &stru_1F3C7DA90;
LABEL_7:
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v7 = (__CFString *)WTF::StringImpl::operator NSString *();
  v8 = v12;
  uint64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 == 2)
  {
    WTF::StringImpl::destroy(v8, v6);
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
  else
  {
    *(_DWORD *)v8 -= 2;
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
LABEL_8:
  if (*(_DWORD *)v9 == 2) {
    WTF::StringImpl::destroy(v9, v6);
  }
  else {
    *(_DWORD *)v9 -= 2;
  }
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
  return &v7->isa;
}

- (DOMCSSValue)getPropertyCSSValue:(NSString *)propertyName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v11, propertyName);
  (*(void (**)(WebCore::DeprecatedCSSOMValue **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal + 88))(&v12, internal, &v11);
  v7 = (DOMCSSValue *)kit(v12);
  v8 = v12;
  uint64_t v12 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 1)
    {
      WebCore::DeprecatedCSSOMValue::operator delete();
      uint64_t v9 = v11;
      uint64_t v11 = 0;
      if (!v9) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    --*(_DWORD *)v8;
  }
  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v9 == 2) {
    WTF::StringImpl::destroy(v9, v6);
  }
  else {
    *(_DWORD *)v9 -= 2;
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
  return v7;
}

- (NSString)removeProperty:(NSString *)propertyName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v13, propertyName);
  (*(void (**)(WTF::StringImpl **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal
                                                                                                  + 136))(&v14, internal, &v13);
  if (!v16)
  {
    v6 = v14;
    v14 = 0;
    if (v6)
    {
      v8 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v7);
        uint64_t v9 = v16;
        if (v16 == -1) {
          goto LABEL_8;
        }
      }
      else
      {
        *(_DWORD *)v6 -= 2;
        uint64_t v9 = v16;
        if (v16 == -1) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      v8 = &stru_1F3C7DA90;
      uint64_t v9 = v16;
    }
    ((void (*)(unsigned char *, WTF::StringImpl **))off_1F3C79F70[v9])(v18, &v14);
LABEL_8:
    unsigned int v16 = -1;
    v10 = v13;
    char v13 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v7);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
    return &v8->isa;
  }
  if (v16 == 1)
  {
    v18[0] = (_BYTE)v14;
    uint64_t v12 = v15;
    uint64_t v15 = 0;
    uint64_t v19 = v12;
    raiseDOMErrorException();
  }
  result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (NSString)getPropertyPriority:(NSString *)propertyName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v11, propertyName);
  (*(void (**)(WTF::StringImpl **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal
                                                                                                  + 104))(&v12, internal, &v11);
  if (!v12)
  {
    uint64_t v12 = 0;
    v7 = &stru_1F3C7DA90;
LABEL_7:
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v7 = (__CFString *)WTF::StringImpl::operator NSString *();
  v8 = v12;
  uint64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 == 2)
  {
    WTF::StringImpl::destroy(v8, v6);
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
  else
  {
    *(_DWORD *)v8 -= 2;
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
LABEL_8:
  if (*(_DWORD *)v9 == 2) {
    WTF::StringImpl::destroy(v9, v6);
  }
  else {
    *(_DWORD *)v9 -= 2;
  }
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
  return &v7->isa;
}

- (void)setProperty:(NSString *)propertyName value:(NSString *)value priority:(NSString *)priority
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v17, propertyName);
  MEMORY[0x1E4E442D0](&v16, value);
  MEMORY[0x1E4E442D0](&v15, priority);
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, WTF::StringImpl **, WTF::StringImpl **, WTF::StringImpl **))(*(void *)internal + 128))(&v18, internal, &v17, &v16, &v15);
  if (v20)
  {
    v21[80] = v18;
    uint64_t v14 = v19;
    uint64_t v19 = 0;
    uint64_t v22 = v14;
    raiseDOMErrorException();
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (!v11)
  {
LABEL_5:
    uint64_t v12 = v16;
    unsigned int v16 = 0;
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_5;
  }
  WTF::StringImpl::destroy(v11, v10);
  uint64_t v12 = v16;
  unsigned int v16 = 0;
  if (!v12) {
    goto LABEL_10;
  }
LABEL_8:
  if (*(_DWORD *)v12 == 2)
  {
    WTF::StringImpl::destroy(v12, v10);
    char v13 = v17;
    v17 = 0;
    if (!v13) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  *(_DWORD *)v12 -= 2;
LABEL_10:
  char v13 = v17;
  v17 = 0;
  if (!v13) {
    goto LABEL_16;
  }
LABEL_13:
  if (*(_DWORD *)v13 == 2) {
    WTF::StringImpl::destroy(v13, v10);
  }
  else {
    *(_DWORD *)v13 -= 2;
  }
LABEL_16:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v10);
}

- (NSString)item:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 80))(&v8);
  if (v8)
  {
    objc_super v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    v6 = v8;
    v8 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v4);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
  else
  {
    objc_super v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
  return &v5->isa;
}

- (NSString)getPropertyShorthand:(NSString *)propertyName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v11, propertyName);
  (*(void (**)(WTF::StringImpl **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal
                                                                                                  + 112))(&v12, internal, &v11);
  if (!v12)
  {
    uint64_t v12 = 0;
    v7 = &stru_1F3C7DA90;
LABEL_7:
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v7 = (__CFString *)WTF::StringImpl::operator NSString *();
  v8 = v12;
  uint64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 == 2)
  {
    WTF::StringImpl::destroy(v8, v6);
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
  else
  {
    *(_DWORD *)v8 -= 2;
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (!v9) {
      goto LABEL_11;
    }
  }
LABEL_8:
  if (*(_DWORD *)v9 == 2) {
    WTF::StringImpl::destroy(v9, v6);
  }
  else {
    *(_DWORD *)v9 -= 2;
  }
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
  return &v7->isa;
}

- (BOOL)isPropertyImplicit:(NSString *)propertyName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v10, propertyName);
  char v7 = (*(uint64_t (**)(DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal + 120))(internal, &v10);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
  return v7;
}

@end
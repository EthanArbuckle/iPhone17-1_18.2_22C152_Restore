@interface CRLWPStyleRun
- (BOOL)coalesceWith:(id)a3;
- (CRLWPFontHeightInfo)fontHeightInfo;
- (CRLWPStyleRun)init;
- (NSDictionary)attributes;
- (_NSRange)range;
- (_TtC8Freeform19CRLWPCharacterStyle)characterStyle;
- (__CTFont)ctFont;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)charIndex;
- (unint64_t)flags;
- (unint64_t)runLength;
- (void)setAttributes:(id)a3;
- (void)setCharIndex:(unint64_t)a3;
- (void)setCharacterStyle:(id)a3;
- (void)setCtFont:(__CTFont *)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setFontHeightInfo:(CRLWPFontHeightInfo *)a3;
- (void)setRunLength:(unint64_t)a3;
@end

@implementation CRLWPStyleRun

- (CRLWPStyleRun)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPStyleRun;
  result = [(CRLWPStyleRun *)&v3 init];
  if (result) {
    result->_charIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [v4 setCharIndex:[self charIndex]];
  [v4 setRunLength:[self runLength]];
  [v4 setFlags:[self flags]];
  v5 = [(CRLWPStyleRun *)self characterStyle];
  [v4 setCharacterStyle:v5];

  [v4 setCtFont:[self ctFont]];
  v6 = [(CRLWPStyleRun *)self attributes];
  [v4 setAttributes:v6];

  [(CRLWPStyleRun *)self fontHeightInfo];
  v8[2] = v8[8];
  v8[3] = v8[9];
  v8[4] = v8[10];
  v8[5] = v8[11];
  v8[0] = v8[6];
  v8[1] = v8[7];
  [v4 setFontHeightInfo:v8];
  return v4;
}

- (BOOL)coalesceWith:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(CRLWPStyleRun *)self charIndex];
  unint64_t v7 = [(CRLWPStyleRun *)self runLength];
  if ((id)(v7 + v6) != [v5 charIndex]) {
    goto LABEL_19;
  }
  id v8 = [(CRLWPStyleRun *)self flags];
  if (v8 != [v5 flags]) {
    goto LABEL_19;
  }
  v9 = [(CRLWPStyleRun *)self characterStyle];
  v10 = [v5 characterStyle];
  if (v9 != v10)
  {
    v21 = [(CRLWPStyleRun *)self characterStyle];
    objc_super v3 = [v5 characterStyle];
    if (![v21 isEqual:v3]) {
      goto LABEL_14;
    }
  }
  v11 = [(CRLWPStyleRun *)self ctFont];
  if (v11 != [v5 ctFont]
    && !CFEqual(-[CRLWPStyleRun ctFont](self, "ctFont"), [v5 ctFont]))
  {
    v18 = v9;
    if (v9 == v10)
    {
LABEL_15:

      goto LABEL_19;
    }
LABEL_14:

    v18 = v10;
    goto LABEL_15;
  }
  v12 = [(CRLWPStyleRun *)self attributes];
  v13 = [v5 attributes];
  if (v12 == v13)
  {

    v17 = v9;
    if (v9 != v10)
    {

      v17 = v10;
    }

    goto LABEL_18;
  }
  v14 = [(CRLWPStyleRun *)self attributes];
  v15 = [v5 attributes];
  unsigned __int8 v16 = [v14 isEqualToDictionary:v15];

  if (v9 == v10)
  {
  }
  else
  {
  }
  if ((v16 & 1) == 0)
  {
LABEL_19:
    BOOL v19 = 0;
    goto LABEL_20;
  }
LABEL_18:
  -[CRLWPStyleRun setRunLength:](self, "setRunLength:", (char *)[v5 runLength] + -[CRLWPStyleRun runLength](self, "runLength"));
  BOOL v19 = 1;
LABEL_20:

  return v19;
}

- (_NSRange)range
{
  unint64_t v3 = [(CRLWPStyleRun *)self charIndex];
  NSUInteger v4 = [(CRLWPStyleRun *)self runLength];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (unint64_t)charIndex
{
  return self->_charIndex;
}

- (void)setCharIndex:(unint64_t)a3
{
  self->_charIndex = a3;
}

- (unint64_t)runLength
{
  return self->_runLength;
}

- (void)setRunLength:(unint64_t)a3
{
  self->_runLength = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (_TtC8Freeform19CRLWPCharacterStyle)characterStyle
{
  return self->_characterStyle;
}

- (void)setCharacterStyle:(id)a3
{
}

- (__CTFont)ctFont
{
  return self->_ctFont;
}

- (void)setCtFont:(__CTFont *)a3
{
  self->_ctFont = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (CRLWPFontHeightInfo)fontHeightInfo
{
  long long v3 = *(_OWORD *)&self[1].attachmentHeight;
  *(_OWORD *)&retstr->descent = *(_OWORD *)&self->underlineThickness;
  *(_OWORD *)&retstr->leadingBelow = v3;
  long long v4 = *(_OWORD *)&self[1].leadingAbove;
  *(_OWORD *)&retstr->verticalHeight = *(_OWORD *)&self[1].capHeight;
  *(_OWORD *)&retstr->underlinePosition = v4;
  long long v5 = *(_OWORD *)&self->xHeight;
  *(_OWORD *)&retstr->spaceBefore = *(_OWORD *)&self->spaceAfter;
  *(_OWORD *)&retstr->ascent = v5;
  return self;
}

- (void)setFontHeightInfo:(CRLWPFontHeightInfo *)a3
{
  long long v3 = *(_OWORD *)&a3->spaceBefore;
  *(_OWORD *)&self->_fontHeightInfo.ascent = *(_OWORD *)&a3->ascent;
  *(_OWORD *)&self->_fontHeightInfo.spaceBefore = v3;
  long long v4 = *(_OWORD *)&a3->descent;
  long long v5 = *(_OWORD *)&a3->leadingBelow;
  long long v6 = *(_OWORD *)&a3->verticalHeight;
  *(_OWORD *)&self->_fontHeightInfo.underlinePosition = *(_OWORD *)&a3->underlinePosition;
  *(_OWORD *)&self->_fontHeightInfo.verticalHeight = v6;
  *(_OWORD *)&self->_fontHeightInfo.leadingBelow = v5;
  *(_OWORD *)&self->_fontHeightInfo.descent = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_characterStyle, 0);
}

@end
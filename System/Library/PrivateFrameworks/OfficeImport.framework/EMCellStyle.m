@interface EMCellStyle
+ (double)contentWidthForColumnWidth:(double)a3;
+ (id)_parseFontName:(id)a3 nameContainsBold:(BOOL *)a4 nameContainsItalic:(BOOL *)a5;
+ (id)styleForFont:(id)a3;
- (BOOL)isEqual:(id)a3;
- (EMCellStyle)initWithEDStyle:(id)a3 type:(int)a4 columnWidth:(unint64_t)a5 contentWidth:(unint64_t)a6 truncateContents:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cssStyleString;
- (unint64_t)hash;
- (void)addAlignmentStyle:(id)a3;
- (void)addBordersStyle:(id)a3;
- (void)addFillStyle:(id)a3;
- (void)addFontStyle:(id)a3;
- (void)resolveContentWidth;
- (void)resolveFormatType;
@end

@implementation EMCellStyle

- (void)addFontStyle:(id)a3
{
  id v6 = a3;
  mStyleString = self->super.mStyleString;
  v5 = [(id)objc_opt_class() styleForFont:v6];
  [(NSMutableString *)mStyleString appendString:v5];
}

- (void)addFillStyle:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
    int v5 = [v4 type];
    if (v5)
    {
      if (v5 == 1) {
        [v4 foreColor];
      }
      else {
      id v6 = [v4 backColor];
      }
      v7 = +[OITSUColor whiteColor];
      char v8 = [v6 isEqual:v7];

      if ((v8 & 1) == 0)
      {
        v9 = +[CMColorProperty cssStringFromTSUColor:v6];
        [(CMStyle *)self appendPropertyForName:0x26EC19198 stringWithColons:v9];
      }
    }
  }
}

- (void)addAlignmentStyle:(id)a3
{
  id v12 = a3;
  if ([v12 isVerticalAlignOverridden])
  {
    id v4 = -[EMEnumProperty initWithEnum:]([EMEnumProperty alloc], "initWithEnum:", [v12 verticalAlignment]);
    [(CMStyle *)self addProperty:v4 forKey:0x26EC18B78];
  }
  if ([v12 isHorizontalAlignOverridden]
    && [v12 horizontalAlignment])
  {
    int v5 = -[EMEnumProperty initWithEnum:]([EMEnumProperty alloc], "initWithEnum:", [v12 horizontalAlignment]);
    [(CMStyle *)self addProperty:v5 forKey:0x26EC195B8];
  }
  if ((int)[v12 indent] >= 1)
  {
    double v6 = 12.0;
    if ([(EDStyle *)self->_edStyle isFontOverridden])
    {
      v7 = [(EDStyle *)self->_edStyle font];
      [v7 height];
      double v6 = v8 / 20.0;
    }
    v9 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", v6 * (double)(int)[v12 indent]);
    [(CMStyle *)self addProperty:v9 forKey:0x26EC19558];
  }
  if ([v12 isTextWrapped]) {
    [(CMStyle *)self appendPropertyForName:0x26EC19638 stringWithColons:@":normal;"];
  }
  id v10 = [[CMLengthProperty alloc] initWithNumber:0.0];
  [(CMStyle *)self addProperty:v10 forKey:0x26EC19598];
  [(CMStyle *)self addProperty:v10 forKey:0x26EC19538];
  v11 = [[CMLengthProperty alloc] initWithNumber:1 unit:2.0];

  [(CMStyle *)self addProperty:v11 forKey:0x26EC19558];
  [(CMStyle *)self addProperty:v11 forKey:0x26EC19578];
}

- (void)addBordersStyle:(id)a3
{
  id v5 = a3;
  id v4 = [[EMBordersProperty alloc] initWithEDBorders:v5];
  [(CMStyle *)self addProperty:v4 forKey:@"Borders"];
}

- (EMCellStyle)initWithEDStyle:(id)a3 type:(int)a4 columnWidth:(unint64_t)a5 contentWidth:(unint64_t)a6 truncateContents:(BOOL)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EMCellStyle;
  v14 = [(CMStyle *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_edStyle, a3);
    v15->_edCellType = a4;
    v15->_contentWidth = (double)a6;
    v15->_columnWidth = (double)a5;
    v15->_truncateContents = a7;
    v15->_resolvedProperties = 0;
  }

  return v15;
}

- (void)resolveFormatType
{
  if (self->_edCellType == 2)
  {
    double v6 = [[CMStringProperty alloc] initWithString:0x26EC07AF8];
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:");
  }
  if ([(EDStyle *)self->_edStyle isAlignmentInfoOverridden])
  {
    id v7 = [(EDStyle *)self->_edStyle alignmentInfo];
    if ([v7 isHorizontalAlignOverridden])
    {
      v3 = [(EDStyle *)self->_edStyle alignmentInfo];
      int v4 = [v3 horizontalAlignment];

      if (v4) {
        return;
      }
    }
    else
    {
    }
  }
  if (self->_edCellType == 2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  double v8 = [[EMEnumProperty alloc] initWithEnum:v5];
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:");
}

- (void)resolveContentWidth
{
  if (self->_columnWidth < self->_contentWidth)
  {
    edStyle = self->_edStyle;
    if (edStyle)
    {
      if ([(EDStyle *)edStyle isAlignmentInfoOverridden])
      {
        id v8 = [(EDStyle *)self->_edStyle alignmentInfo];
        if (([v8 isTextWrapped] & 1) == 0 && !objc_msgSend(v8, "textRotation"))
        {
          double v4 = self->_contentWidth - self->_columnWidth;
          if (v4 >= 2.0)
          {
            uint64_t v5 = [(CMStyle *)self propertyForName:@"text-align"];
            if (v5)
            {
              double v6 = [(CMStyle *)self propertyForName:@"Borders"];
              switch([v5 value])
              {
                case 0u:
                case 1u:
                  if (self->_truncateContents)
                  {
                    id v7 = [[CMStringProperty alloc] initWithString:0x26EC07AF8];
                    [(CMStyle *)self addProperty:v7 forKey:0x26EC19518];
                    goto LABEL_18;
                  }
                  break;
                case 2u:
                case 6u:
                  if (v6)
                  {
                    [v6 setNoneAtLocation:2];
                    [v6 setNoneAtLocation:4];
                  }
                  double v4 = v4 * 0.5;
                  goto LABEL_17;
                case 3u:
                  if (v6) {
                    [v6 setNoneAtLocation:2];
                  }
LABEL_17:
                  id v7 = [[CMLengthProperty alloc] initWithNumber:-v4];
                  [(CMStyle *)self addProperty:v7 forKey:@"text-indent"];
LABEL_18:

                  break;
                default:
                  break;
              }
            }
          }
        }
      }
    }
  }
}

+ (id)styleForFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  __int16 v15 = 0;
  double v6 = [v4 name];

  if (v6)
  {
    id v7 = [v4 name];
    id v8 = [a1 _parseFontName:v7 nameContainsBold:(char *)&v15 + 1 nameContainsItalic:&v15];

    [v5 appendFormat:@"%@:%@;", 0x26EC08758, v8];
  }
  if (HIBYTE(v15) || [v4 isBoldOverridden] && objc_msgSend(v4, "isBold")) {
    [v5 appendString:@" font-weight:bold;"];
  }
  if ((_BYTE)v15 || [v4 isItalicOverridden] && objc_msgSend(v4, "isItalic")) {
    [v5 appendString:@" font-style:italic;"];
  }
  if ([v4 isStrikeOverridden] && objc_msgSend(v4, "isStrike")) {
    [v5 appendString:@" text-decoration:line-through;"];
  }
  if ([v4 isUnderlineOverridden])
  {
    [v5 appendString:@" "];
    v9 = +[EMEnumProperty mapUnderlineValue:](EMEnumProperty, "mapUnderlineValue:", [v4 underline]);
    [v5 appendString:v9];
  }
  id v10 = [v4 color];
  if (([v10 isBlack] & 1) == 0)
  {
    [v5 appendString:0x26EC18B58];
    v11 = +[CMColorProperty cssStringFromTSUColor:v10];
    [v5 appendString:v11];
  }
  if ([v4 isHeightOverridden])
  {
    [v4 height];
    if (v12 != 200.0)
    {
      [v5 appendString:0x26EC08778];
      [v4 height];
      id v13 = +[CMLengthProperty cssStringValue:unit:](CMLengthProperty, "cssStringValue:unit:", 2);
      [v5 appendString:v13];
    }
  }

  return v5;
}

+ (double)contentWidthForColumnWidth:(double)a3
{
  return a3 + -4.0;
}

+ (id)_parseFontName:(id)a3 nameContainsBold:(BOOL *)a4 nameContainsItalic:(BOOL *)a5
{
  id v7 = a3;
  if ([v7 hasSuffix:@" Bold"])
  {
    *a4 = 1;
    uint64_t v8 = [v7 length];
LABEL_3:
    uint64_t v9 = v8 - 5;
LABEL_13:
    id v11 = [v7 substringToIndex:v9];
    goto LABEL_14;
  }
  if ([v7 hasSuffix:@" BoldItalic"])
  {
    *a4 = 1;
    *a5 = 1;
    uint64_t v10 = [v7 length];
LABEL_6:
    uint64_t v9 = v10 - 11;
    goto LABEL_13;
  }
  if ([v7 hasSuffix:@" MediumItalic"])
  {
    *a5 = 1;
    uint64_t v9 = [v7 length] - 13;
    goto LABEL_13;
  }
  if ([v7 hasSuffix:@" SemiBold"])
  {
    *a4 = 1;
    uint64_t v9 = [v7 length] - 9;
    goto LABEL_13;
  }
  if ([v7 hasSuffix:@" SemiBoldItalic"])
  {
    *a4 = 1;
    *a5 = 1;
    uint64_t v9 = [v7 length] - 15;
    goto LABEL_13;
  }
  if ([v7 hasSuffix:@" Text"])
  {
    uint64_t v8 = [v7 length];
    goto LABEL_3;
  }
  if ([v7 hasSuffix:@" TextItalic"])
  {
    *a5 = 1;
    uint64_t v10 = [v7 length];
    goto LABEL_6;
  }
  id v11 = v7;
LABEL_14:
  double v12 = v11;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EMCellStyle;
  id v4 = [(CMStyle *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_edStyle);
  *((_DWORD *)v4 + 8) = self->_edCellType;
  v4[6] = *(id *)&self->_contentWidth;
  v4[5] = *(id *)&self->_columnWidth;
  return v4;
}

- (unint64_t)hash
{
  return [(EDStyle *)self->_edStyle hash] ^ self->_edCellType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMCellStyle *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(EDStyle *)v5->_edStyle isEqual:self->_edStyle]
        && v5->_contentWidth == self->_contentWidth
        && v5->_columnWidth == self->_columnWidth
        && v5->_edCellType == self->_edCellType;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)cssStyleString
{
  if (!self->_resolvedProperties)
  {
    self->_resolvedProperties = 1;
    v3 = [(EDStyle *)self->_edStyle font];

    if (v3)
    {
      id v4 = [(EDStyle *)self->_edStyle font];
      [(EMCellStyle *)self addFontStyle:v4];
    }
    if ([(EDStyle *)self->_edStyle isBordersOverridden])
    {
      uint64_t v5 = [(EDStyle *)self->_edStyle borders];
      [(EMCellStyle *)self addBordersStyle:v5];
    }
    BOOL v6 = [(EDStyle *)self->_edStyle fill];

    if (v6)
    {
      id v7 = [(EDStyle *)self->_edStyle fill];
      [(EMCellStyle *)self addFillStyle:v7];
    }
    uint64_t v8 = [(EDStyle *)self->_edStyle alignmentInfo];

    if (v8)
    {
      uint64_t v9 = [(EDStyle *)self->_edStyle alignmentInfo];
      [(EMCellStyle *)self addAlignmentStyle:v9];
    }
    [(EMCellStyle *)self resolveFormatType];
    [(EMCellStyle *)self resolveContentWidth];
  }
  v12.receiver = self;
  v12.super_class = (Class)EMCellStyle;
  uint64_t v10 = [(CMStyle *)&v12 cssStyleString];
  return v10;
}

- (void).cxx_destruct
{
}

@end
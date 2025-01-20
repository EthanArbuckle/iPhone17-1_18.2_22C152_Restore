@interface WMParagraphStyle
+ (BOOL)isShadingNull:(id)a3;
- (BOOL)isRTLWithOverridesFromProperties:(id)a3;
- (WMParagraphStyle)initWithWDStyle:(id)a3 isInTextFrame:(BOOL)a4;
- (id)leadingMarginPropertyNameWithOverridesFromProperties:(id)a3;
- (id)trailingMarginPropertyNameWithOverridesFromProperties:(id)a3;
- (void)addParagraphProperties:(id)a3;
- (void)addParagraphPropertiesFromStyle;
- (void)addParagraphPropertiesFromStyle:(id)a3;
- (void)addParagraphStyleCharacterProperties:(id)a3;
- (void)mapBorders:(id)a3;
@end

@implementation WMParagraphStyle

- (WMParagraphStyle)initWithWDStyle:(id)a3 isInTextFrame:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WMParagraphStyle;
  v8 = [(CMStyle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseStyle, a3);
    v9->_isInTextFrame = a4;
  }

  return v9;
}

- (void)addParagraphProperties:(id)a3
{
  id v23 = a3;
  if ([v23 isCharacterPropertiesOverridden])
  {
    v4 = [v23 characterProperties];
  }
  else
  {
    v4 = 0;
  }
  if ([v23 isBiDiOverridden] && objc_msgSend(v23, "biDi"))
  {
    v5 = [[CMStringProperty alloc] initWithString:0x26EC15398];
    [(CMStyle *)self addProperty:v5 forKey:0x26EC18AF8];
  }
  if ([v4 isRightToLeftOverridden])
  {
    if ([(WMParagraphStyle *)self isRTLWithOverridesFromProperties:v4]) {
      v6 = [[CMStringProperty alloc] initWithString:0x26EC15398];
    }
    else {
      v6 = [[CMStringProperty alloc] initWithString:0x26EC153B8];
    }
    [(CMStyle *)self addProperty:v6 forKey:0x26EC18AF8];
  }
  if ([v23 isSpaceAfterOverridden])
  {
    id v7 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)[v23 spaceAfter]);
    [(CMStyle *)self addProperty:v7 forKey:0x26EC19458];
  }
  if ([v23 isSpaceBeforeOverridden])
  {
    v8 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)[v23 spaceBefore]);
    [(CMStyle *)self addProperty:v8 forKey:0x26EC07B78];
  }
  if ([v23 isLineSpacingOverridden])
  {
    v9 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 8, (double)(int)[v23 lineSpacing] / 240.0 * 1.2);
    [(CMStyle *)self addProperty:v9 forKey:0x26EC19438];
  }
  if ([v23 isJustificationOverridden])
  {
    v10 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", (int)[v23 justification]);
    [(CMStyle *)self addProperty:v10 forKey:0x26EC195B8];
  }
  if ([v23 isLeftIndentOverridden])
  {
    objc_super v11 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)[v23 leftIndent]);
    [(CMStyle *)self addProperty:v11 forKey:0x26EC07B58];
  }
  if ([v23 isRightIndentOverridden])
  {
    v12 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)[v23 rightIndent]);
    [(CMStyle *)self addProperty:v12 forKey:0x26EC19478];
  }
  if ([v23 isLeadingIndentOverridden])
  {
    v13 = [(WMParagraphStyle *)self leadingMarginPropertyNameWithOverridesFromProperties:v4];
    v14 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)[v23 leadingIndent]);
    [(CMStyle *)self addProperty:v14 forKey:v13];
  }
  if ([v23 isFollowingIndentOverridden])
  {
    v15 = [(WMParagraphStyle *)self trailingMarginPropertyNameWithOverridesFromProperties:v4];
    v16 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)[v23 followingIndent]);
    [(CMStyle *)self addProperty:v16 forKey:v15];
  }
  if ([v23 isFirstLineIndentOverridden])
  {
    v17 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)[v23 firstLineIndent]);
    [(CMStyle *)self addProperty:v17 forKey:0x26EC195D8];
  }
  [(WMParagraphStyle *)self mapBorders:v23];
  if ([v23 isShadingOverridden])
  {
    v18 = [v23 shading];
    BOOL v19 = +[WMParagraphStyle isShadingNull:v18];

    if (!v19)
    {
      v20 = [v23 shading];
      v21 = +[CMColorProperty nsColorFromShading:v20];

      v22 = [[CMColorProperty alloc] initWithColor:v21];
      [(CMStyle *)self addProperty:v22 forKey:0x26EC19198];
    }
  }
}

- (void)mapBorders:(id)a3
{
  id v4 = a3;
  if (!self->_isInTextFrame)
  {
    id v8 = v4;
    if ([v4 isBottomBorderOverridden])
    {
      v5 = [v8 bottomBorder];
      v6 = v5;
      if (v5 && [v5 style])
      {
        id v7 = objc_alloc_init(WMBordersProperty);
        [(WMBordersProperty *)v7 setBorder:v6 location:3];
        [(CMStyle *)self addProperty:v7 forKey:0x26EC191F8];
      }
    }
    else
    {
      v6 = 0;
    }

    id v4 = v8;
  }
}

- (void)addParagraphStyleCharacterProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 baseStyle];
    if (v5 && v5 != v7) {
      [(WMParagraphStyle *)self addParagraphStyleCharacterProperties:v5];
    }
    v6 = [v7 characterProperties];
    [(WMStyle *)self addCharacterProperties:v6];

    id v4 = v7;
  }
}

+ (BOOL)isShadingNull:(id)a3
{
  id v3 = a3;
  int v4 = [v3 style];
  if (v4)
  {
    if (v4 == 0xFFFF)
    {
      id v5 = [v3 foreground];
      [v5 alphaComponent];
      if (v6 == 0.0)
      {
        id v7 = [v3 background];
        [v7 alphaComponent];
        BOOL v9 = v8 == 0.0;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)addParagraphPropertiesFromStyle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 baseStyle];
    if (v5 && v5 != v7) {
      [(WMParagraphStyle *)self addParagraphPropertiesFromStyle:v5];
    }
    double v6 = [v7 paragraphProperties];
    [(WMParagraphStyle *)self addParagraphProperties:v6];

    id v4 = v7;
  }
}

- (void)addParagraphPropertiesFromStyle
{
}

- (BOOL)isRTLWithOverridesFromProperties:(id)a3
{
  id v4 = a3;
  if ([v4 isRightToLeftOverridden])
  {
    int v5 = [v4 rightToLeft];
    if (!v5)
    {
      char v10 = 0;
      goto LABEL_7;
    }
    if (v5 == 1)
    {
      char v10 = 1;
      goto LABEL_7;
    }
    BOOL v6 = v5 == 129;
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [(CMStyle *)self propertyForName:0x26EC18AF8];
  double v8 = [v7 value];
  char v9 = [v8 isEqualToString:0x26EC15398];

  char v10 = v6 ^ v9;
LABEL_7:

  return v10;
}

- (id)leadingMarginPropertyNameWithOverridesFromProperties:(id)a3
{
  BOOL v3 = [(WMParagraphStyle *)self isRTLWithOverridesFromProperties:a3];
  id v4 = &HUPropNmMarginRight;
  if (!v3) {
    id v4 = &HUPropNmMarginLeft;
  }
  int v5 = (void *)*v4;
  return v5;
}

- (id)trailingMarginPropertyNameWithOverridesFromProperties:(id)a3
{
  BOOL v3 = [(WMParagraphStyle *)self isRTLWithOverridesFromProperties:a3];
  id v4 = &HUPropNmMarginLeft;
  if (!v3) {
    id v4 = &HUPropNmMarginRight;
  }
  int v5 = (void *)*v4;
  return v5;
}

- (void).cxx_destruct
{
}

@end
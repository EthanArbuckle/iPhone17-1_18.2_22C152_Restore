@interface WMStyle
- (WMStyle)initWithWDCharacterProperties:(id)a3;
- (WMStyle)initWithWDStyle:(id)a3;
- (WMStyle)initWithWDStyle:(id)a3 isInTextFrame:(BOOL)a4;
- (WMStyle)initWithWMStyle:(id)a3;
- (id)cssStyleString;
- (void)ResoveInterPropertyDependencies;
- (void)addCharacterProperties:(id)a3;
- (void)cascadeWithStyle:(id)a3;
@end

@implementation WMStyle

- (id)cssStyleString
{
  [(WMStyle *)self ResoveInterPropertyDependencies];
  v5.receiver = self;
  v5.super_class = (Class)WMStyle;
  v3 = [(CMStyle *)&v5 cssStyleString];
  return v3;
}

- (void)ResoveInterPropertyDependencies
{
  v3 = [(NSMutableDictionary *)self->super.properties objectForKey:@"vertical-align"];
  v4 = v3;
  if (v3)
  {
    v15 = v3;
    uint64_t v5 = [v3 value];
    v4 = v15;
    if (v5)
    {
      v6 = [(NSMutableDictionary *)self->super.properties objectForKey:@"font-size"];
      v7 = v6;
      if (v6)
      {
        [v6 value];
        double v9 = v8;
        uint64_t v10 = [v7 unitType];
        float v11 = v9;
        float v12 = v11 * 0.66;
        double v13 = (double)(int)v12;
      }
      else
      {
        double v13 = 7.0;
        uint64_t v10 = 1;
      }
      v14 = [[CMLengthProperty alloc] initWithNumber:v10 unit:v13];
      [(NSMutableDictionary *)self->super.properties setObject:v14 forKey:@"font-size"];

      v4 = v15;
    }
  }
}

- (WMStyle)initWithWDStyle:(id)a3
{
  return [(WMStyle *)self initWithWDStyle:a3 isInTextFrame:0];
}

- (WMStyle)initWithWDStyle:(id)a3 isInTextFrame:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 baseStyle];
  double v8 = (void *)v7;
  if (!v7 || (id)v7 == v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WMStyle;
    double v9 = [(CMStyle *)&v14 init];
  }
  else
  {
    double v9 = [(WMStyle *)self initWithWDStyle:v7 isInTextFrame:v4];
  }
  uint64_t v10 = v9;
  if (v9)
  {
    float v11 = [v6 characterProperties];
    [(WMStyle *)v10 addCharacterProperties:v11];

    float v12 = v10;
  }

  return v10;
}

- (void)addCharacterProperties:(id)a3
{
  id v26 = a3;
  if ([v26 isRightToLeftOverridden] && objc_msgSend(v26, "rightToLeft")) {
    [(CMStyle *)self appendPropertyForName:@"direction" stringValue:@"rtl"];
  }
  if ([v26 isBoldOverridden])
  {
    BOOL v4 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", [v26 bold]);
    uint64_t v5 = [(CMStyle *)self propertyForName:0x26EC087B8];
    [(CMToggleProperty *)v4 resolveWithBaseProperty:v5];
    [(CMStyle *)self addProperty:v4 forKey:0x26EC087B8];
  }
  if ([v26 isItalicOverridden])
  {
    id v6 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", [v26 italic]);
    uint64_t v7 = [(CMStyle *)self propertyForName:0x26EC087F8];
    [(CMToggleProperty *)v6 resolveWithBaseProperty:v7];
    [(CMStyle *)self addProperty:v6 forKey:0x26EC087F8];
  }
  if ([v26 isStrikeThroughOverridden])
  {
    double v8 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", [v26 strikeThrough]);
    double v9 = [(CMStyle *)self propertyForName:0x26EC19678];
    [(CMToggleProperty *)v8 resolveWithBaseProperty:v9];
    [(CMStyle *)self addProperty:v8 forKey:0x26EC19678];
  }
  if ([v26 isDoubleStrikeThroughOverridden])
  {
    uint64_t v10 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", [v26 doubleStrikeThrough]);
    float v11 = [(CMStyle *)self propertyForName:0x26EC19678];
    [(CMToggleProperty *)v10 resolveWithBaseProperty:v11];
    [(CMStyle *)self addProperty:v10 forKey:0x26EC19678];
  }
  if ([v26 isFontSizeOverridden])
  {
    float v12 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 6, (double)[v26 fontSize]);
    [(CMStyle *)self addProperty:v12 forKey:0x26EC08778];
  }
  if ([v26 isVerticalAlignOverridden])
  {
    double v13 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", [v26 verticalAlign]);
    [(CMStyle *)self addProperty:v13 forKey:0x26EC18B78];
  }
  if ([v26 isFontOverridden])
  {
    objc_super v14 = [CMStringProperty alloc];
    v15 = [v26 font];
    v16 = [v15 name];
    v17 = [(CMStringProperty *)v14 initWithString:v16];

    [(CMStyle *)self addProperty:v17 forKey:0x26EC08758];
  }
  if ([v26 isUnderlineOverridden])
  {
    v18 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", [v26 underline]);
    [(CMStyle *)self addProperty:v18 forKey:0x26EC08838];
  }
  if ([v26 isSmallCapsOverridden] && (objc_msgSend(v26, "smallCaps") & 0xFFFFFF7F) == 1) {
    [(CMStyle *)self appendPropertyForName:@"font-variant" stringWithColons:@":small-caps;"];
  }
  if ([v26 isCapsOverridden] && (objc_msgSend(v26, "caps") & 0xFFFFFF7F) == 1) {
    [(CMStyle *)self appendPropertyForName:@"text-transform" stringWithColons:@":uppercase;"];
  }
  if ([v26 isColorOverridden])
  {
    v19 = [v26 color];
    v20 = [[CMColorProperty alloc] initWithColor:v19];
    [(CMStyle *)self addProperty:v20 forKey:@"color"];
  }
  if ([v26 isShadingOverridden])
  {
    v21 = [v26 shading];
    v22 = [v21 background];
    v23 = v22;
    if (v22)
    {
      [v22 alphaComponent];
      if (v24 == 1.0)
      {
        v25 = [[CMColorProperty alloc] initWithColor:v23];
        [(CMStyle *)self addProperty:v25 forKey:0x26EC19198];
      }
    }
  }
}

- (WMStyle)initWithWMStyle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WMStyle;
  return [(CMStyle *)&v4 initWithStyle:a3];
}

- (WMStyle)initWithWDCharacterProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CMStyle *)self init];
  id v6 = v5;
  if (v5)
  {
    [(WMStyle *)v5 addCharacterProperties:v4];
    uint64_t v7 = v6;
  }

  return v6;
}

- (void)cascadeWithStyle:(id)a3
{
  id v10 = a3;
  id v4 = [v10 properties];
  uint64_t v5 = [v4 keyEnumerator];
  for (i = 0; ; i = (void *)v7)
  {
    uint64_t v7 = [v5 nextObject];

    if (!v7) {
      break;
    }
    double v8 = [v4 objectForKey:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = [(CMStyle *)self attributeForName:v7];
      [v8 resolveWithBaseProperty:v9];
    }
    [(CMStyle *)self addProperty:v8 forKey:v7];
  }
}

@end
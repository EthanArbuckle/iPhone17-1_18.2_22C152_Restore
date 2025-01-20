@interface WFWorkflowIcon
+ (BOOL)supportsSecureCoding;
+ (unint64_t)randomPaletteColor;
+ (unsigned)defaultGlyphCharacter;
- (BOOL)isEqual:(id)a3;
- (NSData)customImageData;
- (NSString)symbolOverride;
- (WFColor)backgroundColor;
- (WFIcon)icon;
- (WFWorkflowIcon)init;
- (WFWorkflowIcon)initWithBackgroundColorValue:(int64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5;
- (WFWorkflowIcon)initWithBackgroundColorValue:(int64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5 symbolOverride:(id)a6;
- (WFWorkflowIcon)initWithCoder:(id)a3;
- (WFWorkflowIcon)initWithPaletteColor:(unint64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5;
- (int64_t)backgroundColorValue;
- (unint64_t)hash;
- (unsigned)glyphCharacter;
- (void)encodeWithCoder:(id)a3;
- (void)setSymbolOverride:(id)a3;
@end

@implementation WFWorkflowIcon

- (WFWorkflowIcon)initWithBackgroundColorValue:(int64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5
{
  return [(WFWorkflowIcon *)self initWithBackgroundColorValue:a3 glyphCharacter:a4 customImageData:a5 symbolOverride:0];
}

- (WFWorkflowIcon)initWithBackgroundColorValue:(int64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5 symbolOverride:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFWorkflowIcon;
  v12 = [(WFWorkflowIcon *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_backgroundColorValue = a3;
    v12->_glyphCharacter = a4;
    uint64_t v14 = [v10 copy];
    customImageData = v13->_customImageData;
    v13->_customImageData = (NSData *)v14;

    uint64_t v16 = [v11 copy];
    symbolOverride = v13->_symbolOverride;
    v13->_symbolOverride = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (WFIcon)icon
{
  v3 = [WFIconGradientBackground alloc];
  v4 = [(WFWorkflowIcon *)self backgroundColor];
  v5 = [v4 paletteGradient];
  v6 = [(WFIconGradientBackground *)v3 initWithGradient:v5];

  v7 = WFSystemImageNameForGlyphCharacter([(WFWorkflowIcon *)self glyphCharacter]);
  if (v7) {
    v8 = [[WFSymbolIcon alloc] initWithSymbolName:v7 background:v6];
  }
  else {
    v8 = [[WFWorkflowGlyphIcon alloc] initWithGlyph:[(WFWorkflowIcon *)self glyphCharacter] background:v6];
  }
  v9 = v8;

  return (WFIcon *)v9;
}

- (WFColor)backgroundColor
{
  int64_t v2 = [(WFWorkflowIcon *)self backgroundColorValue];
  return +[WFColor colorWithRGBAValue:v2];
}

- (unint64_t)hash
{
  int64_t v3 = [(WFWorkflowIcon *)self backgroundColorValue];
  return v3 ^ [(WFWorkflowIcon *)self glyphCharacter];
}

- (int64_t)backgroundColorValue
{
  return self->_backgroundColorValue;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolOverride, 0);
  objc_storeStrong((id *)&self->_customImageData, 0);
}

- (void)setSymbolOverride:(id)a3
{
}

- (NSString)symbolOverride
{
  return self->_symbolOverride;
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFWorkflowIcon *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(WFWorkflowIcon *)self backgroundColorValue];
      if (v6 == [(WFWorkflowIcon *)v5 backgroundColorValue])
      {
        int v7 = [(WFWorkflowIcon *)self glyphCharacter];
        BOOL v8 = v7 == [(WFWorkflowIcon *)v5 glyphCharacter];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  int64_t v6 = objc_msgSend(v4, "numberWithInteger:", -[WFWorkflowIcon backgroundColorValue](self, "backgroundColorValue"));
  [v5 encodeObject:v6 forKey:@"backgroundColorValue"];

  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[WFWorkflowIcon glyphCharacter](self, "glyphCharacter"));
  [v5 encodeObject:v7 forKey:@"glyphCharacter"];

  BOOL v8 = [(WFWorkflowIcon *)self customImageData];
  [v5 encodeObject:v8 forKey:@"customImageData"];

  id v9 = [(WFWorkflowIcon *)self symbolOverride];
  [v5 encodeObject:v9 forKey:@"symbolOverride"];
}

- (WFWorkflowIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColorValue"];
  uint64_t v6 = [v5 integerValue];

  int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"glyphCharacter"];
  unsigned __int16 v8 = [v7 unsignedLongValue];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customImageData"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolOverride"];

  id v11 = [(WFWorkflowIcon *)self initWithBackgroundColorValue:v6 glyphCharacter:v8 customImageData:v9 symbolOverride:v10];
  return v11;
}

- (WFWorkflowIcon)initWithPaletteColor:(unint64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = +[WFColor colorWithPaletteColor:a3];
  id v10 = -[WFWorkflowIcon initWithBackgroundColorValue:glyphCharacter:customImageData:](self, "initWithBackgroundColorValue:glyphCharacter:customImageData:", (int)[v9 RGBAValue], v5, v8);

  return v10;
}

- (WFWorkflowIcon)init
{
  unint64_t v3 = +[WFWorkflowIcon randomPaletteColor];
  uint64_t v4 = +[WFWorkflowIcon defaultGlyphCharacter];
  return [(WFWorkflowIcon *)self initWithPaletteColor:v3 glyphCharacter:v4 customImageData:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unsigned)defaultGlyphCharacter
{
  return -4096;
}

+ (unint64_t)randomPaletteColor
{
  int64_t v2 = +[WFColor workflowPalette];
  uint32_t v3 = [v2 count];

  return arc4random_uniform(v3);
}

@end
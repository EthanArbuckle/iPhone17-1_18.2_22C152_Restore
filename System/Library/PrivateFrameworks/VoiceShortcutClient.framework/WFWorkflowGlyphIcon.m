@interface WFWorkflowGlyphIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)hasClearBackground;
- (BOOL)hasTransparentBackground;
- (BOOL)isEqual:(id)a3;
- (WFIconBackground)background;
- (WFWorkflowGlyphIcon)initWithCoder:(id)a3;
- (WFWorkflowGlyphIcon)initWithGlyph:(unsigned __int16)a3;
- (WFWorkflowGlyphIcon)initWithGlyph:(unsigned __int16)a3 background:(id)a4;
- (unint64_t)hash;
- (unsigned)glyph;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowGlyphIcon

- (void).cxx_destruct
{
}

- (WFIconBackground)background
{
  return self->_background;
}

- (unsigned)glyph
{
  return self->_glyph;
}

- (BOOL)hasTransparentBackground
{
  v2 = [(WFWorkflowGlyphIcon *)self background];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [v2 color];
    [v3 alpha];
    BOOL v5 = v4 < 1.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasClearBackground
{
  v2 = [(WFWorkflowGlyphIcon *)self background];
  v3 = +[WFIconColorBackground clearBackground];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t glyph = self->_glyph;
  id v5 = a3;
  [v5 encodeInteger:glyph forKey:@"glyph"];
  [v5 encodeObject:self->_background forKey:@"background"];
}

- (WFWorkflowGlyphIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [v4 decodeIntegerForKey:@"glyph"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"background"];

  v7 = [(WFWorkflowGlyphIcon *)self initWithGlyph:v5 background:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = 0;
    v12 = 0;
    char v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    char v11 = 0;
    id v8 = v4;
    goto LABEL_13;
  }
  int v5 = [(WFWorkflowGlyphIcon *)self glyph];
  if (v5 == [v4 glyph])
  {
    v6 = [(WFWorkflowGlyphIcon *)self background];
    v7 = [v4 background];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
      if (v8 && v9) {
        char v11 = [v8 isEqual:v9];
      }
    }

    v12 = v4;
    goto LABEL_13;
  }
  char v11 = 0;
  v12 = v4;
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  uint64_t glyph = self->_glyph;
  return [(WFIconBackground *)self->_background hash] ^ glyph;
}

- (WFWorkflowGlyphIcon)initWithGlyph:(unsigned __int16)a3 background:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFIcon.m", 50, @"Invalid parameter not satisfying: %@", @"background" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowGlyphIcon;
  id v9 = [(WFIcon *)&v14 _init];
  v10 = v9;
  if (v9)
  {
    v9->_uint64_t glyph = a3;
    objc_storeStrong((id *)&v9->_background, a4);
    char v11 = v10;
  }

  return v10;
}

- (WFWorkflowGlyphIcon)initWithGlyph:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = +[WFIconColorBackground clearBackground];
  v6 = [(WFWorkflowGlyphIcon *)self initWithGlyph:v3 background:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface ContentStyle
+ (BOOL)supportsSecureCoding;
+ (id)fontNameFromSummaryString:(id)a3;
- (BOOL)autoHyphenate;
- (BOOL)isEqual:(id)a3;
- (BOOL)justification;
- (BOOL)optimizeLegibility;
- (ContentStyle)init;
- (ContentStyle)initWithCoder:(id)a3;
- (ContentStyle)initWithFontFamily:(id)a3 andDetails:(id)a4;
- (ContentStyle)initWithSummaryString:(id)a3;
- (ContentStyleOverrideProvider)overrideProvider;
- (NSString)fontFamily;
- (float)fontSize;
- (float)lineHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summaryString;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoHyphenate:(BOOL)a3;
- (void)setFontFamily:(id)a3;
- (void)setFontSize:(float)a3;
- (void)setJustification:(BOOL)a3;
- (void)setLineHeight:(float)a3;
- (void)setOptimizeLegibility:(BOOL)a3;
- (void)setOverrideProvider:(id)a3;
@end

@implementation ContentStyle

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = [(ContentStyle *)self fontFamily];
  id v7 = [v6 copyWithZone:a3];
  [v5 setFontFamily:v7];

  [(ContentStyle *)self lineHeight];
  [v5 setLineHeight:];
  [(ContentStyle *)self fontSize];
  [v5 setFontSize:];
  [v5 setAutoHyphenate:[self autoHyphenate]];
  [v5 setOptimizeLegibility:[self optimizeLegibility]];
  [v5 setJustification:[self justification]];
  return v5;
}

- (BOOL)autoHyphenate
{
  BOOL autoHyphenate = self->_autoHyphenate;
  uint64_t v4 = [(ContentStyle *)self overrideProvider];
  if (!v4) {
    return autoHyphenate;
  }
  id v5 = (void *)v4;
  v6 = [(ContentStyle *)self overrideProvider];
  unsigned __int8 v7 = [v6 noAutoHyphenation];

  if (autoHyphenate) {
    return v7 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)justification
{
  BOOL justification = self->_justification;
  uint64_t v4 = [(ContentStyle *)self overrideProvider];
  if (!v4) {
    return justification;
  }
  id v5 = (void *)v4;
  v6 = [(ContentStyle *)self overrideProvider];
  unsigned __int8 v7 = [v6 noJustification];

  if (justification) {
    return v7 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(ContentStyle *)self fontSize];
    float v7 = v6;
    [v5 fontSize];
    if (v7 == v8)
    {
      mFontFamily = self->mFontFamily;
      v10 = [v5 fontFamily];
      if ([(NSString *)mFontFamily isEqualToString:v10]
        && (-[ContentStyle lineHeight](self, "lineHeight"), float v12 = v11, [v5 lineHeight], v12 == v13)
        && (unsigned int v14 = [(ContentStyle *)self autoHyphenate],
            v14 == [v5 autoHyphenate])
        && (unsigned int v15 = [(ContentStyle *)self optimizeLegibility],
            v15 == [v5 optimizeLegibility]))
      {
        unsigned int v18 = [(ContentStyle *)self justification];
        unsigned int v16 = v18 ^ [v5 justification] ^ 1;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)description
{
  v3 = [(ContentStyle *)self fontFamily];
  [(ContentStyle *)self lineHeight];
  double v5 = v4;
  [(ContentStyle *)self fontSize];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ContentStyle: <%p> font-family:%@; line-height:%g; font-size:%g; BOOL autoHyphenate = %d; optimizeLegibility = %d, justification=%d",
    self,
    v3,
    *(void *)&v5,
    v6,
    [(ContentStyle *)self autoHyphenate],
    [(ContentStyle *)self optimizeLegibility],
  float v7 = [(ContentStyle *)self justification]);

  return v7;
}

- (ContentStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(ContentStyle *)self init];
  if (v5)
  {
    float v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fontFamily"];
    [(ContentStyle *)v5 setFontFamily:v6];

    [v4 decodeFloatForKey:@"lineHeight"];
    -[ContentStyle setLineHeight:](v5, "setLineHeight:");
    [v4 decodeFloatForKey:@"fontSize"];
    -[ContentStyle setFontSize:](v5, "setFontSize:");
    -[ContentStyle setAutoHyphenate:](v5, "setAutoHyphenate:", [v4 decodeBoolForKey:@"autoHyphenate"]);
    -[ContentStyle setOptimizeLegibility:](v5, "setOptimizeLegibility:", [v4 decodeBoolForKey:@"legibility"]);
    -[ContentStyle setJustification:](v5, "setJustification:", [v4 decodeBoolForKey:@"justification"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ContentStyle *)self fontFamily];
  [v5 encodeObject:v4 forKey:@"fontFamily"];

  [(ContentStyle *)self lineHeight];
  [v5 encodeFloat:@"lineHeight"];
  [(ContentStyle *)self fontSize];
  [v5 encodeFloat:@"fontSize"];
  [v5 encodeBool:[self autoHyphenate] forKey:@"autoHyphenate"];
  [v5 encodeBool:[self optimizeLegibility] forKey:@"legibility"];
  [v5 encodeBool:[self justification] forKey:@"justification"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summaryString
{
  id v3 = objc_alloc((Class)NSArray);
  id v4 = [(ContentStyle *)self fontFamily];
  [(ContentStyle *)self lineHeight];
  float v6 = +[NSString stringWithFormat:@"%f", v5];
  [(ContentStyle *)self fontSize];
  float v8 = +[NSString stringWithFormat:@"%f", v7];
  v9 = +[NSString stringWithFormat:@"%d", [(ContentStyle *)self autoHyphenate]];
  v10 = +[NSString stringWithFormat:@"%d", [(ContentStyle *)self optimizeLegibility]];
  id v11 = [v3 initWithObjects:v4, v6, v8, v9, v10, 0];

  float v12 = [v11 componentsJoinedByString:gContentStyleSeparator];

  return v12;
}

- (ContentStyle)init
{
  v5.receiver = self;
  v5.super_class = (Class)ContentStyle;
  v2 = [(ContentStyle *)&v5 init];
  if (v2)
  {
    id v3 = +[NSString string];
    [(ContentStyle *)v2 setFontFamily:v3];
  }
  return v2;
}

+ (id)fontNameFromSummaryString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:gContentStyleSeparator];
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (ContentStyle)initWithSummaryString:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ContentStyle *)self init];
  if (v5)
  {
    float v6 = [v4 componentsSeparatedByString:gContentStyleSeparator];
    if ((unint64_t)[v6 count] >= 3)
    {
      uint64_t v7 = [v6 objectAtIndex:0];
      mFontFamily = v5->mFontFamily;
      v5->mFontFamily = (NSString *)v7;

      v9 = [v6 objectAtIndex:1];
      [v9 floatValue];
      -[ContentStyle setLineHeight:](v5, "setLineHeight:");
      v10 = [v6 objectAtIndex:2];
      [v10 floatValue];
      -[ContentStyle setFontSize:](v5, "setFontSize:");
      if ((unint64_t)[v6 count] >= 5)
      {
        id v11 = [v6 objectAtIndex:3];
        -[ContentStyle setAutoHyphenate:](v5, "setAutoHyphenate:", [v11 BOOLValue]);
      }
      if ((unint64_t)[v6 count] >= 6)
      {
        float v12 = [v6 objectAtIndex:4];
        -[ContentStyle setOptimizeLegibility:](v5, "setOptimizeLegibility:", [v12 BOOLValue]);
      }
    }
  }
  return v5;
}

- (ContentStyle)initWithFontFamily:(id)a3 andDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = [(ContentStyle *)self init];
  v9 = v8;
  if (v8)
  {
    [(ContentStyle *)v8 setFontFamily:v6];
    objc_opt_class();
    v10 = [v7 valueForKey:@"fontSize"];
    id v11 = BUDynamicCast();
    [v11 floatValue];
    -[ContentStyle setFontSize:](v9, "setFontSize:");

    objc_opt_class();
    float v12 = [v7 valueForKey:@"lineHeight"];
    float v13 = BUDynamicCast();
    [v13 floatValue];
    -[ContentStyle setLineHeight:](v9, "setLineHeight:");
  }
  return v9;
}

- (NSString)fontFamily
{
  return self->mFontFamily;
}

- (void)setFontFamily:(id)a3
{
}

- (float)lineHeight
{
  return self->_lineHeight;
}

- (void)setLineHeight:(float)a3
{
  self->_lineHeight = a3;
}

- (float)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(float)a3
{
  self->_fontSize = a3;
}

- (void)setAutoHyphenate:(BOOL)a3
{
  self->_BOOL autoHyphenate = a3;
}

- (BOOL)optimizeLegibility
{
  return self->_legibility;
}

- (void)setOptimizeLegibility:(BOOL)a3
{
  self->_legibility = a3;
}

- (void)setJustification:(BOOL)a3
{
  self->_BOOL justification = a3;
}

- (ContentStyleOverrideProvider)overrideProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideProvider);

  return (ContentStyleOverrideProvider *)WeakRetained;
}

- (void)setOverrideProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideProvider);

  objc_storeStrong((id *)&self->mFontFamily, 0);
}

@end
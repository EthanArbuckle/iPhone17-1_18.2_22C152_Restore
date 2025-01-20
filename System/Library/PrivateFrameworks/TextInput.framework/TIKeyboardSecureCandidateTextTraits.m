@interface TIKeyboardSecureCandidateTextTraits
+ (BOOL)supportsSecureCoding;
+ (id)traitsWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6 yCoordinate:(double)a7 baselineOffset:(double)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)fontName;
- (TIKeyboardSecureCandidateRGBColor)textColor;
- (TIKeyboardSecureCandidateTextTraits)init;
- (TIKeyboardSecureCandidateTextTraits)initWithCoder:(id)a3;
- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 fontSize:(double)a4 textColor:(id)a5;
- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6;
- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6 yCoordinate:(double)a7 baselineOffset:(double)a8;
- (double)baselineOffset;
- (double)maxFontSize;
- (double)minFontSize;
- (double)yCoordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setFontName:(id)a3;
- (void)setMaxFontSize:(double)a3;
- (void)setMinFontSize:(double)a3;
- (void)setTextColor:(id)a3;
- (void)setYCoordinate:(double)a3;
@end

@implementation TIKeyboardSecureCandidateTextTraits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_fontName, 0);
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setYCoordinate:(double)a3
{
  self->_yCoordinate = a3;
}

- (double)yCoordinate
{
  return self->_yCoordinate;
}

- (void)setTextColor:(id)a3
{
}

- (TIKeyboardSecureCandidateRGBColor)textColor
{
  return self->_textColor;
}

- (void)setMinFontSize:(double)a3
{
  self->_minFontSize = a3;
}

- (double)minFontSize
{
  return self->_minFontSize;
}

- (void)setMaxFontSize:(double)a3
{
  self->_maxFontSize = a3;
}

- (double)maxFontSize
{
  return self->_maxFontSize;
}

- (void)setFontName:(id)a3
{
}

- (NSString)fontName
{
  return self->_fontName;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = NSString;
    v7 = [(TIKeyboardSecureCandidateTextTraits *)self fontName];
    v8 = [v5 fontName];
    LODWORD(v6) = [v6 _string:v7 matchesString:v8];

    if (!v6) {
      goto LABEL_12;
    }
    [(TIKeyboardSecureCandidateTextTraits *)self maxFontSize];
    double v10 = v9;
    [v5 maxFontSize];
    if (v10 != v11) {
      goto LABEL_12;
    }
    [(TIKeyboardSecureCandidateTextTraits *)self minFontSize];
    double v13 = v12;
    [v5 minFontSize];
    if (v13 != v14) {
      goto LABEL_12;
    }
    v15 = [(TIKeyboardSecureCandidateTextTraits *)self textColor];
    uint64_t v16 = [v5 textColor];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = [(TIKeyboardSecureCandidateTextTraits *)self textColor];
      v19 = [v5 textColor];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_12;
      }
    }
    [(TIKeyboardSecureCandidateTextTraits *)self yCoordinate];
    double v23 = v22;
    [v5 yCoordinate];
    if (v23 == v24)
    {
      [(TIKeyboardSecureCandidateTextTraits *)self baselineOffset];
      double v26 = v25;
      [v5 baselineOffset];
      BOOL v21 = v26 == v27;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_13;
  }
  BOOL v21 = 0;
LABEL_14:

  return v21;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(TIKeyboardSecureCandidateTextTraits *)self fontName];
  [(TIKeyboardSecureCandidateTextTraits *)self maxFontSize];
  uint64_t v6 = v5;
  [(TIKeyboardSecureCandidateTextTraits *)self minFontSize];
  uint64_t v8 = v7;
  double v9 = [(TIKeyboardSecureCandidateTextTraits *)self textColor];
  [(TIKeyboardSecureCandidateTextTraits *)self yCoordinate];
  uint64_t v11 = v10;
  [(TIKeyboardSecureCandidateTextTraits *)self baselineOffset];
  objc_msgSend(v3, "appendFormat:", @"; fontName = %@, maxFontSize = %f, minFontSize = %f, textColor = %@, yCoordinate = %f, baselineOffset = %f",
    v4,
    v6,
    v8,
    v9,
    v11,
    v12);

  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  fontName = self->_fontName;
  id v9 = v4;
  if (fontName)
  {
    [v4 encodeObject:fontName forKey:@"fontName"];
    id v4 = v9;
  }
  double maxFontSize = self->_maxFontSize;
  if (maxFontSize != 0.0)
  {
    *(float *)&double maxFontSize = maxFontSize;
    [v9 encodeFloat:@"maxFontSize" forKey:maxFontSize];
    id v4 = v9;
  }
  double minFontSize = self->_minFontSize;
  if (minFontSize != 0.0)
  {
    *(float *)&double minFontSize = minFontSize;
    [v9 encodeFloat:@"minFontSize" forKey:minFontSize];
    id v4 = v9;
  }
  textColor = self->_textColor;
  if (textColor)
  {
    [v9 encodeObject:textColor forKey:@"textColor"];
    id v4 = v9;
  }
  [v4 encodeDouble:@"yCoordinate" forKey:self->_yCoordinate];
  [v9 encodeDouble:@"baselineOffset" forKey:self->_baselineOffset];
}

- (TIKeyboardSecureCandidateTextTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardSecureCandidateTextTraits *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fontName"];
    uint64_t v7 = [v6 copy];
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v7;

    [v4 decodeFloatForKey:@"maxFontSize"];
    v5->_double maxFontSize = v9;
    [v4 decodeFloatForKey:@"minFontSize"];
    v5->_double minFontSize = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
    textColor = v5->_textColor;
    v5->_textColor = (TIKeyboardSecureCandidateRGBColor *)v11;

    [v4 decodeDoubleForKey:@"yCoordinate"];
    v5->_yCoordinate = v13;
    [v4 decodeDoubleForKey:@"baselineOffset"];
    v5->_baselineOffset = v14;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TIKeyboardSecureCandidateTextTraits);
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_fontName copy];
    fontName = v4->_fontName;
    v4->_fontName = (NSString *)v5;

    v4->_double maxFontSize = self->_maxFontSize;
    v4->_double minFontSize = self->_minFontSize;
    objc_storeStrong((id *)&v4->_textColor, self->_textColor);
    v4->_yCoordinate = self->_yCoordinate;
    v4->_baselineOffset = self->_baselineOffset;
  }
  return v4;
}

- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6 yCoordinate:(double)a7 baselineOffset:(double)a8
{
  id v14 = a3;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardSecureCandidateTextTraits;
  uint64_t v16 = [(TIKeyboardSecureCandidateTextTraits *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    fontName = v16->_fontName;
    v16->_fontName = (NSString *)v17;

    v16->_double maxFontSize = a4;
    v16->_double minFontSize = a5;
    objc_storeStrong((id *)&v16->_textColor, a6);
    v16->_yCoordinate = a7;
    v16->_baselineOffset = a8;
  }

  return v16;
}

- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6
{
  return [(TIKeyboardSecureCandidateTextTraits *)self initWithFontName:a3 maxFontSize:a6 minFontSize:a4 textColor:a5 yCoordinate:0.0 baselineOffset:0.0];
}

- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 fontSize:(double)a4 textColor:(id)a5
{
  return [(TIKeyboardSecureCandidateTextTraits *)self initWithFontName:a3 maxFontSize:a5 minFontSize:a4 textColor:a4];
}

- (TIKeyboardSecureCandidateTextTraits)init
{
  return [(TIKeyboardSecureCandidateTextTraits *)self initWithFontName:0 fontSize:0 textColor:0.0];
}

+ (id)traitsWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6 yCoordinate:(double)a7 baselineOffset:(double)a8
{
  id v13 = a6;
  id v14 = a3;
  id v15 = [[TIKeyboardSecureCandidateTextTraits alloc] initWithFontName:v14 maxFontSize:v13 minFontSize:a4 textColor:a5 yCoordinate:a7 baselineOffset:a8];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface RTITextStyling
+ (BOOL)supportsSecureCoding;
+ (id)textStylingWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributes;
- (NSString)fontName;
- (RTITextStyling)initWithCoder:(id)a3;
- (double)fontSize;
- (double)fontWeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAttributes:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTITextStyling

+ (id)textStylingWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5
{
  id v8 = a3;
  v9 = (double *)objc_alloc_init((Class)a1);
  uint64_t v10 = [v8 copy];

  v11 = (void *)*((void *)v9 + 2);
  *((void *)v9 + 2) = v10;

  v9[3] = a4;
  v9[4] = a5;
  return v9;
}

- (void)addAttributes:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    attributes = self->_attributes;
    if (!attributes)
    {
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v6 = self->_attributes;
      self->_attributes = v5;

      attributes = self->_attributes;
    }
    [(NSMutableDictionary *)attributes addEntriesFromDictionary:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  v5 = [(RTITextStyling *)self fontName];
  [v4 encodeObject:v5 forKey:@"fontName"];

  [(RTITextStyling *)self fontSize];
  objc_msgSend(v4, "encodeDouble:forKey:", @"fontSize");
  [(RTITextStyling *)self fontWeight];
  objc_msgSend(v4, "encodeDouble:forKey:", @"fontWeight");
  id v6 = [(RTITextStyling *)self attributes];
  [v4 encodeObject:v6 forKey:@"attributes"];
}

- (RTITextStyling)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v17.receiver = self;
  v17.super_class = (Class)RTITextStyling;
  v5 = [(RTITextStyling *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fontName"];
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v6;

    [v4 decodeDoubleForKey:@"fontSize"];
    v5->_fontSize = v8;
    [v4 decodeDoubleForKey:@"fontWeight"];
    v5->_fontWeight = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(RTITextStyling *)self fontName];
  [(RTITextStyling *)self fontSize];
  double v6 = v5;
  [(RTITextStyling *)self fontWeight];
  double v8 = +[RTITextStyling textStylingWithFontName:v4 fontSize:v6 fontWeight:v7];

  double v9 = [(RTITextStyling *)self attributes];
  [v8 addAttributes:v9];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = (RTITextStyling *)a3;
  if (v5 == self)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = v5;
      double v7 = NSString;
      double v8 = [(RTITextStyling *)self fontName];
      double v9 = [(RTITextStyling *)v6 fontName];
      LODWORD(v7) = [v7 _string:v8 matchesString:v9];

      if (!v7
        || ([(RTITextStyling *)self fontSize],
            double v11 = v10,
            [(RTITextStyling *)v6 fontSize],
            v11 != v12)
        || ([(RTITextStyling *)self fontWeight],
            double v14 = v13,
            [(RTITextStyling *)v6 fontWeight],
            v14 != v15))
      {
        char v22 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v16 = [(RTITextStyling *)self attributes];
      objc_super v17 = [(RTITextStyling *)v6 attributes];
      if (v16 == v17)
      {
        char v22 = 1;
LABEL_20:

        goto LABEL_14;
      }
      v18 = [(RTITextStyling *)self attributes];
      uint64_t v19 = [v18 count];
      if (v19
        || ([(RTITextStyling *)v6 attributes],
            v3 = objc_claimAutoreleasedReturnValue(),
            [v3 count]))
      {
        v20 = [(RTITextStyling *)self attributes];
        v21 = [(RTITextStyling *)v6 attributes];
        char v22 = [v20 isEqualToDictionary:v21];

        if (v19)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {
        char v22 = 1;
      }

      goto LABEL_19;
    }
    char v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(RTITextStyling *)self fontName];
  [v3 appendFormat:@"; fontName = %@", v4];

  [(RTITextStyling *)self fontSize];
  objc_msgSend(v3, "appendFormat:", @"; fontSize = %f", v5);
  [(RTITextStyling *)self fontWeight];
  objc_msgSend(v3, "appendFormat:", @"; fontWeight = %f", v6);
  double v7 = [(RTITextStyling *)self attributes];
  [v3 appendFormat:@"; attributes = %@", v7];

  return v3;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (NSDictionary)attributes
{
  return &self->_attributes->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
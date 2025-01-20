@interface WFAQIScale
+ (BOOL)supportsSecureCoding;
- (BOOL)isAscending;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScale:(id)a3;
- (BOOL)isNumerical;
- (NSArray)categories;
- (NSString)displayLabel;
- (NSString)displayName;
- (NSString)identifier;
- (WFAQIScale)initWithCoder:(id)a3;
- (WFAQIScaleGradient)gradient;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAscending:(BOOL)a3;
- (void)setCategories:(id)a3;
- (void)setDisplayLabel:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGradient:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNumerical:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation WFAQIScale

- (BOOL)isEqual:(id)a3
{
  v4 = (WFAQIScale *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(WFAQIScale *)self isEqualToScale:v4];
  }

  return v5;
}

- (BOOL)isEqualToScale:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  v6 = [(WFAQIScale *)self identifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 isNumerical], v7 == -[WFAQIScale isNumerical](self, "isNumerical"))
    && (int v8 = [v4 isAscending], v8 == -[WFAQIScale isAscending](self, "isAscending")))
  {
    uint64_t v11 = [v4 range];
    uint64_t v13 = v12;
    char v9 = 0;
    if (v11 == [(WFAQIScale *)self range] && v13 == v14)
    {
      v15 = [v4 categories];
      v16 = [(WFAQIScale *)self categories];
      if ([v15 isEqualToArray:v16])
      {
        v17 = [v4 gradient];
        v18 = [(WFAQIScale *)self gradient];
        char v9 = [v17 isEqual:v18];
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WFAQIScale);
  BOOL v5 = [(WFAQIScale *)self identifier];
  [(WFAQIScale *)v4 setIdentifier:v5];

  v6 = [(WFAQIScale *)self displayName];
  [(WFAQIScale *)v4 setDisplayName:v6];

  int v7 = [(WFAQIScale *)self displayLabel];
  [(WFAQIScale *)v4 setDisplayLabel:v7];

  [(WFAQIScale *)v4 setNumerical:[(WFAQIScale *)self isNumerical]];
  [(WFAQIScale *)v4 setAscending:[(WFAQIScale *)self isAscending]];
  uint64_t v8 = [(WFAQIScale *)self range];
  -[WFAQIScale setRange:](v4, "setRange:", v8, v9);
  v10 = [(WFAQIScale *)self categories];
  [(WFAQIScale *)v4 setCategories:v10];

  uint64_t v11 = [(WFAQIScale *)self gradient];
  [(WFAQIScale *)v4 setGradient:v11];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFAQIScale *)self identifier];
  [v4 encodeObject:v5 forKey:@"WFAQIScaleIdentifierKey"];

  v6 = [(WFAQIScale *)self displayName];
  [v4 encodeObject:v6 forKey:@"WFAQIScaleDisplayNameKey"];

  int v7 = [(WFAQIScale *)self displayLabel];
  [v4 encodeObject:v7 forKey:@"WFAQIScaleDisplayLabelKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAQIScale isNumerical](self, "isNumerical"), @"WFAQIScaleNumericalKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFAQIScale isAscending](self, "isAscending"), @"WFAQIScaleAscendingKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAQIScale range](self, "range"), @"WFAQIScaleRangeLocationKey");
  [(WFAQIScale *)self range];
  [v4 encodeInteger:v8 forKey:@"WFAQIScaleRangeLengthKey"];
  uint64_t v9 = [(WFAQIScale *)self categories];
  [v4 encodeObject:v9 forKey:@"WFAQIScaleCategoriesKey"];

  id v10 = [(WFAQIScale *)self gradient];
  [v4 encodeObject:v10 forKey:@"WFAQIScaleGradientKey"];
}

- (WFAQIScale)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAQIScale;
  BOOL v5 = [(WFAQIScale *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleIdentifierKey"];
    [(WFAQIScale *)v5 setIdentifier:v6];

    int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleDisplayNameKey"];
    [(WFAQIScale *)v5 setDisplayName:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleDisplayLabelKey"];
    [(WFAQIScale *)v5 setDisplayLabel:v8];

    -[WFAQIScale setNumerical:](v5, "setNumerical:", [v4 decodeBoolForKey:@"WFAQIScaleNumericalKey"]);
    -[WFAQIScale setAscending:](v5, "setAscending:", [v4 decodeBoolForKey:@"WFAQIScaleAscendingKey"]);
    -[WFAQIScale setRange:](v5, "setRange:", [v4 decodeIntegerForKey:@"WFAQIScaleRangeLocationKey"], objc_msgSend(v4, "decodeIntegerForKey:", @"WFAQIScaleRangeLengthKey"));
    if (initWithCoder__onceToken_1 != -1) {
      dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_16);
    }
    uint64_t v9 = [v4 decodeObjectOfClasses:initWithCoder__categoryClasses forKey:@"WFAQIScaleCategoriesKey"];
    [(WFAQIScale *)v5 setCategories:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleGradientKey"];
    [(WFAQIScale *)v5 setGradient:v10];
  }
  return v5;
}

uint64_t __28__WFAQIScale_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = initWithCoder__categoryClasses;
  initWithCoder__categoryClasses = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(WFAQIScale *)self identifier];
  BOOL v5 = [(WFAQIScale *)self displayName];
  v6 = [(WFAQIScale *)self displayLabel];
  BOOL v7 = [(WFAQIScale *)self isNumerical];
  BOOL v8 = [(WFAQIScale *)self isAscending];
  uint64_t v9 = [(WFAQIScale *)self categories];
  id v10 = [v3 stringWithFormat:@"<WFAQIScale identifier: %@, displayName: %@, displayLabel: %@, isNumerical: %d, isAscending: %d, categories: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  id v4 = [(WFAQIScale *)self identifier];
  BOOL v5 = [(WFAQIScale *)self displayName];
  v6 = [(WFAQIScale *)self displayLabel];
  BOOL v7 = [(WFAQIScale *)self isNumerical];
  BOOL v8 = [(WFAQIScale *)self isAscending];
  uint64_t v9 = [(WFAQIScale *)self range];
  [(WFAQIScale *)self range];
  uint64_t v11 = v10;
  objc_super v12 = [(WFAQIScale *)self categories];
  uint64_t v13 = [(WFAQIScale *)self gradient];
  uint64_t v14 = [v3 stringWithFormat:@"<WFAQIScale identifier: %@, displayName: %@, displayLabel: %@, isNumerical: %d, isAscending: %d, rangeLocation: %lu, rangeLength: %lu, categories: %@, gradient: %@", v4, v5, v6, v7, v8, v9, v11, v12, v13];

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
}

- (BOOL)isNumerical
{
  return self->_numerical;
}

- (void)setNumerical:(BOOL)a3
{
  self->_numerical = a3;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (WFAQIScaleGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
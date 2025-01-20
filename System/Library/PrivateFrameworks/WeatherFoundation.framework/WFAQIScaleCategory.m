@interface WFAQIScaleCategory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScaleCategory:(id)a3;
- (NSString)categoryName;
- (NSString)color;
- (NSString)glyph;
- (NSString)localizedCategoryDescription;
- (NSString)recommendation;
- (WFAQIScaleCategory)initWithCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4;
- (WFAQIScaleCategory)initWithCoder:(id)a3;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)categoryIndex;
- (unint64_t)categoryNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryIndex:(unint64_t)a3;
- (void)setCategoryName:(id)a3;
- (void)setCategoryNumber:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setGlyph:(id)a3;
- (void)setLocalizedCategoryDescription:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setRecommendation:(id)a3;
@end

@implementation WFAQIScaleCategory

- (WFAQIScaleCategory)initWithCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAQIScaleCategory;
  v7 = [(WFAQIScaleCategory *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_categoryIndex = a3;
    uint64_t v9 = [v6 copy];
    localizedCategoryDescription = v8->_localizedCategoryDescription;
    v8->_localizedCategoryDescription = (NSString *)v9;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFAQIScaleCategory *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WFAQIScaleCategory *)self isEqualToScaleCategory:v4];
  }

  return v5;
}

- (BOOL)isEqualToScaleCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 categoryIndex];
  if (v5 == [(WFAQIScaleCategory *)self categoryIndex])
  {
    id v6 = [v4 categoryName];
    v7 = [(WFAQIScaleCategory *)self categoryName];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v4 color];
      uint64_t v9 = [(WFAQIScaleCategory *)self color];
      if ([v8 isEqualToString:v9])
      {
        uint64_t v10 = [v4 range];
        uint64_t v12 = v11;
        BOOL v15 = v10 == [(WFAQIScaleCategory *)self range] && v12 == v13;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WFAQIScaleCategory alloc];
  unint64_t v5 = [(WFAQIScaleCategory *)self categoryIndex];
  id v6 = [(WFAQIScaleCategory *)self localizedCategoryDescription];
  v7 = [(WFAQIScaleCategory *)v4 initWithCategoryIndex:v5 localizedCategoryDescription:v6];

  v8 = [(WFAQIScaleCategory *)self categoryName];
  [(WFAQIScaleCategory *)v7 setCategoryName:v8];

  uint64_t v9 = [(WFAQIScaleCategory *)self color];
  [(WFAQIScaleCategory *)v7 setColor:v9];

  uint64_t v10 = [(WFAQIScaleCategory *)self glyph];
  [(WFAQIScaleCategory *)v7 setGlyph:v10];

  uint64_t v11 = [(WFAQIScaleCategory *)self recommendation];
  [(WFAQIScaleCategory *)v7 setRecommendation:v11];

  [(WFAQIScaleCategory *)v7 setCategoryNumber:[(WFAQIScaleCategory *)self categoryNumber]];
  uint64_t v12 = [(WFAQIScaleCategory *)self range];
  -[WFAQIScaleCategory setRange:](v7, "setRange:", v12, v13);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAQIScaleCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_categoryIndex);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  uint64_t v7 = objc_opt_class();
  v8 = NSStringFromSelector(sel_localizedCategoryDescription);
  uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];

  uint64_t v10 = [(WFAQIScaleCategory *)self initWithCategoryIndex:v6 localizedCategoryDescription:v9];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleCategoryNameKey"];
  [(WFAQIScaleCategory *)v10 setCategoryName:v11];

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleCategoryColorKey"];
  [(WFAQIScaleCategory *)v10 setColor:v12];

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleCategoryGlyphKey"];
  [(WFAQIScaleCategory *)v10 setGlyph:v13];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleCategoryRecommendationKey"];
  [(WFAQIScaleCategory *)v10 setRecommendation:v14];

  -[WFAQIScaleCategory setCategoryNumber:](v10, "setCategoryNumber:", [v4 decodeIntegerForKey:@"WFAQIScaleCategoryNumberKey"]);
  uint64_t v15 = [v4 decodeIntegerForKey:@"WFAQIScaleCategoryRangeLocationKey"];
  uint64_t v16 = [v4 decodeIntegerForKey:@"WFAQIScaleCategoryRangeLengthKey"];

  -[WFAQIScaleCategory setRange:](v10, "setRange:", v15, v16);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [(WFAQIScaleCategory *)self categoryIndex];
  unint64_t v5 = NSStringFromSelector(sel_categoryIndex);
  [v13 encodeInteger:v4 forKey:v5];

  uint64_t v6 = [(WFAQIScaleCategory *)self localizedCategoryDescription];
  uint64_t v7 = NSStringFromSelector(sel_localizedCategoryDescription);
  [v13 encodeObject:v6 forKey:v7];

  v8 = [(WFAQIScaleCategory *)self categoryName];
  [v13 encodeObject:v8 forKey:@"WFAQIScaleCategoryNameKey"];

  uint64_t v9 = [(WFAQIScaleCategory *)self color];
  [v13 encodeObject:v9 forKey:@"WFAQIScaleCategoryColorKey"];

  uint64_t v10 = [(WFAQIScaleCategory *)self glyph];
  [v13 encodeObject:v10 forKey:@"WFAQIScaleCategoryGlyphKey"];

  uint64_t v11 = [(WFAQIScaleCategory *)self recommendation];
  [v13 encodeObject:v11 forKey:@"WFAQIScaleCategoryRecommendationKey"];

  objc_msgSend(v13, "encodeInteger:forKey:", -[WFAQIScaleCategory categoryNumber](self, "categoryNumber"), @"WFAQIScaleCategoryNumberKey");
  objc_msgSend(v13, "encodeInteger:forKey:", -[WFAQIScaleCategory range](self, "range"), @"WFAQIScaleCategoryRangeLocationKey");
  [(WFAQIScaleCategory *)self range];
  [v13 encodeInteger:v12 forKey:@"WFAQIScaleCategoryRangeLengthKey"];
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(WFAQIScaleCategory *)self categoryName];
  unint64_t v5 = [(WFAQIScaleCategory *)self color];
  uint64_t v6 = [(WFAQIScaleCategory *)self glyph];
  uint64_t v7 = [(WFAQIScaleCategory *)self recommendation];
  v8 = [v3 stringWithFormat:@"<WFAQIScaleCategory categoryName: %@, color: %@, glyph: %@, recommendation: %@, categoryNumber: %lu", v4, v5, v6, v7, -[WFAQIScaleCategory categoryNumber](self, "categoryNumber")];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(WFAQIScaleCategory *)self categoryName];
  unint64_t v5 = [(WFAQIScaleCategory *)self color];
  uint64_t v6 = [(WFAQIScaleCategory *)self glyph];
  uint64_t v7 = [(WFAQIScaleCategory *)self recommendation];
  unint64_t v8 = [(WFAQIScaleCategory *)self categoryNumber];
  uint64_t v9 = [(WFAQIScaleCategory *)self range];
  [(WFAQIScaleCategory *)self range];
  uint64_t v11 = [v3 stringWithFormat:@"<WFAQIScaleCategory categoryName: %@, color: %@, glyph: %@, recommendation: %@, categoryNumber: %lu, rangeLocation: %lu, rangeLength: %lu", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (NSString)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(id)a3
{
}

- (unint64_t)categoryNumber
{
  return self->_categoryNumber;
}

- (void)setCategoryNumber:(unint64_t)a3
{
  self->_categoryNumber = a3;
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

- (unint64_t)categoryIndex
{
  return self->_categoryIndex;
}

- (void)setCategoryIndex:(unint64_t)a3
{
  self->_categoryIndex = a3;
}

- (NSString)localizedCategoryDescription
{
  return self->_localizedCategoryDescription;
}

- (void)setLocalizedCategoryDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryDescription, 0);
  objc_storeStrong((id *)&self->_recommendation, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end
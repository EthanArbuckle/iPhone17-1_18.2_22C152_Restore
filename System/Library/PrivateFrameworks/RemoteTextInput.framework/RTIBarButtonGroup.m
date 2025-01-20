@interface RTIBarButtonGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)itemWidths;
- (RTIBarButtonGroup)initWithCoder:(id)a3;
- (float)representativeItemWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setItemWidths:(id)a3;
- (void)setRepresentativeItemWidth:(float)a3;
@end

@implementation RTIBarButtonGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  itemWidths = self->_itemWidths;
  if (itemWidths) {
    [v6 encodeObject:itemWidths forKey:@"items"];
  }
  v5 = v6;
  if (self->_representativeItemWidth != 0.0)
  {
    objc_msgSend(v6, "encodeFloat:forKey:", @"rpItem");
    v5 = v6;
  }
}

- (RTIBarButtonGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v13.receiver = self;
  v13.super_class = (Class)RTIBarButtonGroup;
  v5 = [(RTIBarButtonGroup *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    itemWidths = v5->_itemWidths;
    v5->_itemWidths = (NSArray *)v9;

    [v4 decodeFloatForKey:@"rpItem"];
    v5->_representativeItemWidth = v11;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[RTIBarButtonGroup allocWithZone:a3] init];
  uint64_t v5 = [(NSArray *)self->_itemWidths copy];
  itemWidths = v4->_itemWidths;
  v4->_itemWidths = (NSArray *)v5;

  v4->_representativeItemWidth = self->_representativeItemWidth;
  return v4;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(RTIBarButtonGroup *)self itemWidths];

  if (v4)
  {
    uint64_t v5 = [(RTIBarButtonGroup *)self itemWidths];
    [v3 appendFormat:@"; leadingBarButtonGroupWidths = %@", v5];
  }
  [(RTIBarButtonGroup *)self representativeItemWidth];
  if (v6 != 0.0)
  {
    [(RTIBarButtonGroup *)self representativeItemWidth];
    objc_msgSend(v3, "appendFormat:", @"; trailingBarButtonGroupWidths = %f", v7);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIBarButtonGroup *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      float v6 = [(RTIBarButtonGroup *)self itemWidths];
      uint64_t v7 = [(RTIBarButtonGroup *)v5 itemWidths];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(RTIBarButtonGroup *)self itemWidths];
        v10 = [(RTIBarButtonGroup *)v5 itemWidths];
        int v11 = [v9 isEqual:v10];

        if (!v11)
        {
          BOOL v12 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      [(RTIBarButtonGroup *)self representativeItemWidth];
      float v14 = v13;
      [(RTIBarButtonGroup *)v5 representativeItemWidth];
      BOOL v12 = v14 == v15;
      goto LABEL_10;
    }
    BOOL v12 = 0;
  }
LABEL_11:

  return v12;
}

- (NSArray)itemWidths
{
  return self->_itemWidths;
}

- (void)setItemWidths:(id)a3
{
}

- (float)representativeItemWidth
{
  return self->_representativeItemWidth;
}

- (void)setRepresentativeItemWidth:(float)a3
{
  self->_representativeItemWidth = a3;
}

- (void).cxx_destruct
{
}

@end
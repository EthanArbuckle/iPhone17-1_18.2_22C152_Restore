@interface MXMSampleAttributeFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)_matchesSampleAttributeNameWithName:(id)a3;
- (BOOL)_matchesSampleAttributeValueTypeWithAttributeValueType:(int64_t)a3;
- (BOOL)_matchesSampleAttributeValueWithValue:(id)a3;
- (BOOL)finite;
- (BOOL)matchesSampleWithAttribute:(id)a3;
- (MXMSampleAttributeFilter)initWithAttribute:(id)a3;
- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 numericValue:(id)a4;
- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 numericValues:(id)a4;
- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 stringValue:(id)a4;
- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 stringValues:(id)a4;
- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 valueType:(int64_t)a4 value:(id)a5;
- (MXMSampleAttributeFilter)initWithCoder:(id)a3;
- (NSNumber)numericValue;
- (NSSet)numericValues;
- (NSSet)stringValues;
- (NSSet)values;
- (NSString)stringValue;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMSampleAttributeFilter

- (NSSet)stringValues
{
  if ([(MXMSampleAttribute *)self valueType] == 1 && [(MXMSampleAttributeFilter *)self finite])
  {
    v3 = [MEMORY[0x263EFFA08] setWithArray:self->_matchingStringAttributeValues];
  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSSet)numericValues
{
  if ([(MXMSampleAttribute *)self valueType] == 2 && [(MXMSampleAttributeFilter *)self finite])
  {
    v3 = [MEMORY[0x263EFFA08] setWithArray:self->_matchingNumericAttributeValues];
  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSString)stringValue
{
  v3 = [(MXMSampleAttributeFilter *)self stringValues];
  if ([v3 count] == 1)
  {
    v4 = [(MXMSampleAttributeFilter *)self stringValues];
    v5 = [v4 anyObject];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)numericValue
{
  v3 = [(MXMSampleAttributeFilter *)self numericValues];
  if ([v3 count] == 1)
  {
    v4 = [(MXMSampleAttributeFilter *)self numericValues];
    v5 = [v4 anyObject];
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (id)value
{
  int64_t v3 = [(MXMSampleAttribute *)self valueType];
  if (v3 == 2)
  {
    v4 = [(MXMSampleAttributeFilter *)self numericValue];
  }
  else if (v3 == 1)
  {
    v4 = [(MXMSampleAttributeFilter *)self stringValue];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSSet)values
{
  int64_t v3 = [(MXMSampleAttribute *)self valueType];
  if (v3 == 2)
  {
    v4 = [(MXMSampleAttributeFilter *)self numericValues];
  }
  else if (v3 == 1)
  {
    v4 = [(MXMSampleAttributeFilter *)self stringValues];
  }
  else
  {
    v4 = 0;
  }
  return (NSSet *)v4;
}

- (BOOL)finite
{
  return 1;
}

- (MXMSampleAttributeFilter)initWithAttribute:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  uint64_t v6 = [v4 valueType];
  v7 = (void *)MEMORY[0x263EFFA08];
  v8 = [v4 value];

  v9 = [v7 setWithObject:v8];
  v10 = [(MXMSampleAttributeFilter *)self initWithAttributeName:v5 valueType:v6 value:v9];

  return v10;
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 stringValue:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  v8 = [v6 setWithObject:a4];
  v9 = [(MXMSampleAttributeFilter *)self initWithAttributeName:v7 stringValues:v8];

  return v9;
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 stringValues:(id)a4
{
  return [(MXMSampleAttributeFilter *)self initWithAttributeName:a3 valueType:1 value:a4];
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 numericValue:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  v8 = [v6 setWithObject:a4];
  v9 = [(MXMSampleAttributeFilter *)self initWithAttributeName:v7 numericValues:v8];

  return v9;
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 numericValues:(id)a4
{
  return [(MXMSampleAttributeFilter *)self initWithAttributeName:a3 valueType:2 value:a4];
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 valueType:(int64_t)a4 value:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MXMSampleAttributeFilter;
  v9 = [(MXMSampleAttribute *)&v14 initWithAttributeName:a3 valueType:a4 value:0];
  if (v9)
  {
    if (a4 == 2)
    {
      uint64_t v10 = [v8 allObjects];
      uint64_t v11 = 40;
      goto LABEL_6;
    }
    if (a4 == 1)
    {
      uint64_t v10 = [v8 allObjects];
      uint64_t v11 = 32;
LABEL_6:
      v12 = *(Class *)((char *)&v9->super.super.isa + v11);
      *(Class *)((char *)&v9->super.super.isa + v11) = (Class)v10;
    }
  }

  return v9;
}

- (BOOL)_matchesSampleAttributeValueWithValue:(id)a3
{
  id v4 = a3;
  v5 = [(MXMSampleAttributeFilter *)self values];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)_matchesSampleAttributeValueTypeWithAttributeValueType:(int64_t)a3
{
  return [(MXMSampleAttribute *)self valueType] == a3;
}

- (BOOL)_matchesSampleAttributeNameWithName:(id)a3
{
  id v4 = a3;
  v5 = [(MXMSampleAttribute *)self name];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)matchesSampleWithAttribute:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  if (-[MXMSampleAttributeFilter _matchesSampleAttributeNameWithName:](self, "_matchesSampleAttributeNameWithName:", v5)&& -[MXMSampleAttributeFilter _matchesSampleAttributeValueTypeWithAttributeValueType:](self, "_matchesSampleAttributeValueTypeWithAttributeValueType:", [v4 valueType]))
  {
    char v6 = [v4 value];
    BOOL v7 = [(MXMSampleAttributeFilter *)self _matchesSampleAttributeValueWithValue:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copy
{
  return [(MXMSampleAttributeFilter *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MXMSampleAttributeFilter alloc];
  v5 = [(MXMSampleAttribute *)self name];
  int64_t v6 = [(MXMSampleAttribute *)self valueType];
  BOOL v7 = [(MXMSampleAttributeFilter *)self values];
  id v8 = [(MXMSampleAttributeFilter *)v4 initWithAttributeName:v5 valueType:v6 value:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXMSampleAttributeFilter;
  id v4 = a3;
  [(MXMSampleAttribute *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingStringAttributeValues, @"matchingStrings", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_matchingNumericAttributeValues forKey:@"matchingNumerics"];
}

- (MXMSampleAttributeFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MXMSampleAttributeFilter;
  objc_super v5 = [(MXMSampleAttribute *)&v17 initWithCoder:v4];
  if (v5)
  {
    int64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"matchingStrings"];
    matchingStringAttributeValues = v5->_matchingStringAttributeValues;
    v5->_matchingStringAttributeValues = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"matchingNumerics"];
    matchingNumericAttributeValues = v5->_matchingNumericAttributeValues;
    v5->_matchingNumericAttributeValues = (NSArray *)v14;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingNumericAttributeValues, 0);
  objc_storeStrong((id *)&self->_matchingStringAttributeValues, 0);
}

@end
@interface _HKSPObjectProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)expectedValueClasses;
- (_HKSPObjectProperty)initWithCoder:(id)a3;
- (_HKSPObjectProperty)initWithIdentifier:(id)a3 propertyName:(id)a4 expectedValueClass:(Class)a5;
- (_HKSPObjectProperty)initWithIdentifier:(id)a3 propertyName:(id)a4 expectedValueClasses:(id)a5;
- (void)copyValueFromObject:(id)a3 toObject:(id)a4;
- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKSPObjectProperty

- (void).cxx_destruct
{
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "hksp_valueForProperty:", self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v8 copy];
  objc_msgSend(v6, "hksp_setValue:forProperty:", v7, self);
}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v12 = [(_HKSPObjectProperty *)self expectedValueClasses];
  v9 = [v6 setWithArray:v12];
  v10 = [(HKSPProperty *)self identifier];
  v11 = [v7 decodeObjectOfClasses:v9 forKey:v10];

  objc_msgSend(v8, "hksp_setValue:forProperty:", v11, self);
}

- (NSArray)expectedValueClasses
{
  return self->_expectedValueClasses;
}

- (_HKSPObjectProperty)initWithIdentifier:(id)a3 propertyName:(id)a4 expectedValueClass:(Class)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  Class v13 = a5;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:&v13 count:1];
  v11 = -[_HKSPObjectProperty initWithIdentifier:propertyName:expectedValueClasses:](self, "initWithIdentifier:propertyName:expectedValueClasses:", v9, v8, v10, v13, v14);

  return v11;
}

- (_HKSPObjectProperty)initWithIdentifier:(id)a3 propertyName:(id)a4 expectedValueClasses:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_HKSPObjectProperty;
  id v9 = [(HKSPProperty *)&v14 initWithIdentifier:a3 propertyName:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    expectedValueClasses = v9->_expectedValueClasses;
    v9->_expectedValueClasses = (NSArray *)v10;

    id v12 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HKSPObjectProperty;
  if ([(HKSPProperty *)&v10 isEqual:v4])
  {
    id v5 = v4;
    id v6 = [(_HKSPObjectProperty *)self expectedValueClasses];
    id v7 = [v5 expectedValueClasses];

    char v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "hksp_valueForProperty:", self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(HKSPProperty *)self identifier];
  [v6 encodeObject:v8 forKey:v7];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSPObjectProperty;
  id v4 = a3;
  [(HKSPProperty *)&v6 encodeWithCoder:v4];
  id v5 = -[NSArray na_map:](self->_expectedValueClasses, "na_map:", &__block_literal_global_23, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"HKSPExpectedClasses"];
}

- (_HKSPObjectProperty)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_HKSPObjectProperty;
  id v3 = a3;
  id v4 = [(HKSPProperty *)&v12 initWithCoder:v3];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v7 = [v5 setWithArray:v6];
  id v8 = [v3 decodeObjectOfClasses:v7 forKey:@"HKSPExpectedClasses"];

  uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_323);
  expectedValueClasses = v4->_expectedValueClasses;
  v4->_expectedValueClasses = (NSArray *)v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
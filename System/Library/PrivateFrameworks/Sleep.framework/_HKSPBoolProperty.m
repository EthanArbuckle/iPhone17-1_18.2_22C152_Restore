@interface _HKSPBoolProperty
- (BOOL)BOOLValueForObject:(id)a3;
- (void)copyValueFromObject:(id)a3 toObject:(id)a4;
- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4;
@end

@implementation _HKSPBoolProperty

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = a3;
  id v11 = [(HKSPProperty *)self identifier];
  uint64_t v9 = [v7 decodeBoolForKey:v11];

  v10 = [v6 numberWithBool:v9];
  objc_msgSend(v8, "hksp_setValue:forProperty:", v10, self);
}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(_HKSPBoolProperty *)self BOOLValueForObject:a3];
  id v8 = [(HKSPProperty *)self identifier];
  [v6 encodeBool:v7 forKey:v8];
}

- (BOOL)BOOLValueForObject:(id)a3
{
  v3 = objc_msgSend(a3, "hksp_valueForProperty:", self);
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  objc_msgSend(v6, "numberWithBool:", -[_HKSPBoolProperty BOOLValueForObject:](self, "BOOLValueForObject:", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setValue:forProperty:", v8, self);
}

@end
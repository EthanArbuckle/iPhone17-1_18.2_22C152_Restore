@interface _HKSPUnsignedIntegerProperty
- (unint64_t)unsignedIntegerValueForObject:(id)a3;
- (void)copyValueFromObject:(id)a3 toObject:(id)a4;
- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4;
@end

@implementation _HKSPUnsignedIntegerProperty

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[_HKSPUnsignedIntegerProperty unsignedIntegerValueForObject:](self, "unsignedIntegerValueForObject:", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setValue:forProperty:", v8, self);
}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = a3;
  id v11 = [(HKSPProperty *)self identifier];
  uint64_t v9 = [v7 decodeIntegerForKey:v11];

  v10 = [v6 numberWithInteger:v9];
  objc_msgSend(v8, "hksp_setValue:forProperty:", v10, self);
}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(_HKSPUnsignedIntegerProperty *)self unsignedIntegerValueForObject:a3];
  id v8 = [(HKSPProperty *)self identifier];
  [v6 encodeInteger:v7 forKey:v8];
}

- (unint64_t)unsignedIntegerValueForObject:(id)a3
{
  v3 = objc_msgSend(a3, "hksp_valueForProperty:", self);
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

@end
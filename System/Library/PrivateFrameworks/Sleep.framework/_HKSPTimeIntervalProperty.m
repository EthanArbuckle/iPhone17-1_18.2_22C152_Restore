@interface _HKSPTimeIntervalProperty
- (double)timeIntervalValueForObject:(id)a3;
- (void)copyValueFromObject:(id)a3 toObject:(id)a4;
- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4;
@end

@implementation _HKSPTimeIntervalProperty

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6 = a4;
  [(_HKSPTimeIntervalProperty *)self timeIntervalValueForObject:a3];
  double v8 = v7;
  id v9 = [(HKSPProperty *)self identifier];
  [v6 encodeDouble:v9 forKey:v8];
}

- (double)timeIntervalValueForObject:(id)a3
{
  v3 = objc_msgSend(a3, "hksp_valueForProperty:", self);
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = a3;
  id v12 = [(HKSPProperty *)self identifier];
  [v7 decodeDoubleForKey:v12];
  double v10 = v9;

  v11 = [v6 numberWithDouble:v10];
  objc_msgSend(v8, "hksp_setValue:forProperty:", v11, self);
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  [(_HKSPTimeIntervalProperty *)self timeIntervalValueForObject:a3];
  objc_msgSend(v6, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setValue:forProperty:", v8, self);
}

@end
@interface USOASRAlternative
+ (BOOL)supportsSecureCoding;
- (NSNumber)probability;
- (NSString)value;
- (USOASRAlternative)initWithCoder:(id)a3;
- (USOASRAlternative)initWithValue:(id)a3;
- (USOASRAlternative)initWithValue:(id)a3 probability:(float)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USOASRAlternative

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSNumber)probability
{
  return self->_probability;
}

- (NSString)value
{
  return self->_value;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(USOASRAlternative *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  id v6 = [(USOASRAlternative *)self probability];
  [v4 encodeObject:v6 forKey:@"probability"];
}

- (USOASRAlternative)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)USOASRAlternative;
  v5 = [(USOASRAlternative *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"probability"];
    probability = v5->_probability;
    v5->_probability = (NSNumber *)v8;
  }
  return v5;
}

- (USOASRAlternative)initWithValue:(id)a3 probability:(float)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOASRAlternative;
  uint64_t v8 = [(USOASRAlternative *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_value, a3);
    *(float *)&double v10 = a4;
    uint64_t v11 = [NSNumber numberWithFloat:v10];
    probability = v9->_probability;
    v9->_probability = (NSNumber *)v11;
  }
  return v9;
}

- (USOASRAlternative)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USOASRAlternative;
  uint64_t v6 = [(USOASRAlternative *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
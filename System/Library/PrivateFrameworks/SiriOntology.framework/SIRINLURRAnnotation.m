@interface SIRINLURRAnnotation
+ (BOOL)supportsSecureCoding;
- (NSString)key;
- (NSString)value;
- (SIRINLURRAnnotation)initWithCoder:(id)a3;
- (SIRINLURRAnnotation)initWithKey:(id)a3 value:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SIRINLURRAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{RRAnnotation\n  key: %@\n  value: %@\n}", self->_key, self->_value];
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (SIRINLURRAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLURRAnnotation;
  id v5 = [(SIRINLURRAnnotation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v8;
  }
  return v5;
}

- (SIRINLURRAnnotation)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLURRAnnotation;
  v9 = [(SIRINLURRAnnotation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
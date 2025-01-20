@interface SPDataIntegrityCheck
+ (BOOL)supportsSecureCoding;
- (NSString)value;
- (SPDataIntegrityCheck)initWithCoder:(id)a3;
- (SPDataIntegrityCheck)initWithValue:(id)a3 severity:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)severity;
- (void)encodeWithCoder:(id)a3;
- (void)setSeverity:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation SPDataIntegrityCheck

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPDataIntegrityCheck)initWithValue:(id)a3 severity:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPDataIntegrityCheck;
  v8 = [(SPDataIntegrityCheck *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_value, a3);
    v9->_severity = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPDataIntegrityCheck alloc];
  v5 = [(SPDataIntegrityCheck *)self value];
  v6 = [(SPDataIntegrityCheck *)v4 initWithValue:v5 severity:[(SPDataIntegrityCheck *)self severity]];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeInteger:self->_severity forKey:@"severity"];
}

- (SPDataIntegrityCheck)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  value = self->_value;
  self->_value = v5;

  int64_t v7 = [v4 decodeIntegerForKey:@"severity"];
  self->_severity = v7;
  return self;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(int64_t)a3
{
  self->_severity = a3;
}

- (void).cxx_destruct
{
}

@end
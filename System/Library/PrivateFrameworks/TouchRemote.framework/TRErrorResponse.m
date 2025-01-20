@interface TRErrorResponse
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (TRErrorResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation TRErrorResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRErrorResponse;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  error = self->_error;
  if (error) {
    [v4 encodeObject:error forKey:@"TRConnectionMessages_e"];
  }
}

- (TRErrorResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRErrorResponse;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRConnectionMessages_e"];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"error:%@", self->_error];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRErrorResponse;
  v5 = [(TRMessage *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
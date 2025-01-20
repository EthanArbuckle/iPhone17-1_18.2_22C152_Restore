@interface SWTransparencyExpiringVerificationResult
+ (BOOL)supportsSecureCoding;
- (NSDate)expiry;
- (SWTransparencyExpiringVerificationResult)initWithCoder:(id)a3;
- (SWTransparencyExpiringVerificationResult)initWithResult:(unint64_t)a3 expiry:(id)a4;
- (id)description;
- (unint64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SWTransparencyExpiringVerificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(SWTransparencyExpiringVerificationResult *)self result];
  v5 = [(SWTransparencyExpiringVerificationResult *)self expiry];
  v6 = [v3 stringWithFormat:@"<SWTransparencyVerificationResult: %d expire: %@>", v4, v5];

  return v6;
}

- (SWTransparencyExpiringVerificationResult)initWithResult:(unint64_t)a3 expiry:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWTransparencyExpiringVerificationResult;
  v8 = [(SWTransparencyExpiringVerificationResult *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_expiry, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t result = self->_result;
  id v5 = a3;
  [v5 encodeInteger:result forKey:@"result"];
  [v5 encodeObject:self->_expiry forKey:@"expiry"];
}

- (SWTransparencyExpiringVerificationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"result"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiry"];

  v12.receiver = self;
  v12.super_class = (Class)SWTransparencyExpiringVerificationResult;
  id v7 = [(SWTransparencyExpiringVerificationResult *)&v12 init];
  v8 = v7;
  if (v7) {
    BOOL v9 = v5 > 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v7->_unint64_t result = v5;
    objc_storeStrong((id *)&v7->_expiry, v6);
    v10 = v8;
  }

  return v10;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSDate)expiry
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end
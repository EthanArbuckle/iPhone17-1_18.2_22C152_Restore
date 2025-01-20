@interface MSDKPeerDemoGKResults
+ (BOOL)supportsSecureCoding;
- (BOOL)enrollmentResult;
- (MSDKPeerDemoGKResults)initWithCoder:(id)a3;
- (MSDKPeerDemoGKResults)initWithEnrollmentResult:(BOOL)a3 andResidualErrors:(id)a4;
- (NSArray)residualErrors;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnrollmentResult:(BOOL)a3;
- (void)setResidualErrors:(id)a3;
@end

@implementation MSDKPeerDemoGKResults

- (MSDKPeerDemoGKResults)initWithEnrollmentResult:(BOOL)a3 andResidualErrors:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MSDKPeerDemoGKResults;
  v7 = [(MSDKPeerDemoGKResults *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MSDKPeerDemoGKResults *)v7 setEnrollmentResult:v4];
    [(MSDKPeerDemoGKResults *)v8 setResidualErrors:v6];
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(MSDKPeerDemoGKResults *)self enrollmentResult];
  v7 = [(MSDKPeerDemoGKResults *)self residualErrors];
  v8 = [v3 stringWithFormat:@"<%@[%p]: EnrollmentResult=%d ResidualErrors=%@>", v5, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoGKResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDKPeerDemoGKResults;
  v5 = [(MSDKPeerDemoGKResults *)&v12 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnrollmentResult"];
    [(MSDKPeerDemoGKResults *)v5 setEnrollmentResult:v6 != 0];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    objc_super v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ResidualErrors"];
    [(MSDKPeerDemoGKResults *)v5 setResidualErrors:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  BOOL v6 = objc_msgSend(v4, "numberWithBool:", -[MSDKPeerDemoGKResults enrollmentResult](self, "enrollmentResult"));
  [v5 encodeObject:v6 forKey:@"EnrollmentResult"];

  id v7 = [(MSDKPeerDemoGKResults *)self residualErrors];
  [v5 encodeObject:v7 forKey:@"ResidualErrors"];
}

- (BOOL)enrollmentResult
{
  return self->_enrollmentResult;
}

- (void)setEnrollmentResult:(BOOL)a3
{
  self->_enrollmentResult = a3;
}

- (NSArray)residualErrors
{
  return self->_residualErrors;
}

- (void)setResidualErrors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
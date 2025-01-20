@interface SSUIRunPPTServiceRequest
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)entitlement;
- (NSString)testName;
- (SSUIRunPPTServiceRequest)initWithBSXPCCoder:(id)a3;
- (unint64_t)numberOfRequiredScreenshots;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setNumberOfRequiredScreenshots:(unint64_t)a3;
- (void)setTestName:(id)a3;
@end

@implementation SSUIRunPPTServiceRequest

+ (id)entitlement
{
  return SSUIRunPPTEntitlement;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSUIRunPPTServiceRequest;
  id v4 = a3;
  [(SSUIServiceRequest *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(SSUIRunPPTServiceRequest *)self testName];
  [v4 encodeObject:v5 forKey:@"SSUIRunPPTServiceRequestTestName"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSUIRunPPTServiceRequest numberOfRequiredScreenshots](self, "numberOfRequiredScreenshots"), @"SSUIRunPPTServiceRequestNumberOfRequiredScreenshots");
}

- (SSUIRunPPTServiceRequest)initWithBSXPCCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSUIRunPPTServiceRequest;
  id v3 = a3;
  id v4 = [(SSUIServiceRequest *)&v9 initWithBSXPCCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"SSUIRunPPTServiceRequestTestName", v9.receiver, v9.super_class);
  testName = v4->_testName;
  v4->_testName = (NSString *)v5;

  uint64_t v7 = [v3 decodeUInt64ForKey:@"SSUIRunPPTServiceRequestNumberOfRequiredScreenshots"];
  v4->_numberOfRequiredScreenshots = v7;
  return v4;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (unint64_t)numberOfRequiredScreenshots
{
  return self->_numberOfRequiredScreenshots;
}

- (void)setNumberOfRequiredScreenshots:(unint64_t)a3
{
  self->_numberOfRequiredScreenshots = a3;
}

- (void).cxx_destruct
{
}

@end
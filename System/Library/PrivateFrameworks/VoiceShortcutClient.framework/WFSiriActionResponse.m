@interface WFSiriActionResponse
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (WFSiriActionResponse)initWithCoder:(id)a3;
- (WFSiriActionResponse)initWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriActionResponse

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (WFSiriActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  v6 = [(WFSiriActionResponse *)self initWithError:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSiriActionResponse *)self error];
  [v4 encodeObject:v5 forKey:@"error"];
}

- (WFSiriActionResponse)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriActionResponse;
  v6 = [(WFSiriActionResponse *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
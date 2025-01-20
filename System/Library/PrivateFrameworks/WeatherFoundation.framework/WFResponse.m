@interface WFResponse
+ (BOOL)supportsSecureCoding;
+ (WFResponse)responseWithIdentifier:(id)a3 error:(id)a4;
- (NSError)error;
- (NSString)type;
- (NSUUID)identifier;
- (WFResponse)initWithCoder:(id)a3;
- (WFResponse)initWithIdentifier:(id)a3;
- (WFResponse)initWithIdentifier:(id)a3 error:(id)a4;
- (double)executionTime;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setExecutionTime:(double)a3;
@end

@implementation WFResponse

+ (WFResponse)responseWithIdentifier:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v6 error:v5];

  return (WFResponse *)v7;
}

- (WFResponse)initWithIdentifier:(id)a3
{
  return [(WFResponse *)self initWithIdentifier:a3 error:0];
}

- (WFResponse)initWithIdentifier:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFResponse;
  v9 = [(WFResponse *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [(WFResponse *)self initWithIdentifier:v5];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executionTime"];

  [v7 doubleValue];
  v6->_executionTime = v8;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFResponse *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = NSNumber;
  [(WFResponse *)self executionTime];
  objc_msgSend(v6, "numberWithDouble:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"executionTime"];
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
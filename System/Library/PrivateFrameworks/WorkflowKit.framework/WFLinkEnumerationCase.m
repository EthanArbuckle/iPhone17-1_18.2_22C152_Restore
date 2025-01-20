@interface WFLinkEnumerationCase
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (WFLinkEnumerationCase)initWithCoder:(id)a3;
- (WFLinkEnumerationCase)initWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLinkEnumerationCase

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFLinkEnumerationCase)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  if (v5)
  {
    self = [(WFLinkEnumerationCase *)self initWithIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLinkEnumerationCase *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (WFLinkEnumerationCase)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkEnumerationCase;
  id v5 = [(WFLinkEnumerationCase *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
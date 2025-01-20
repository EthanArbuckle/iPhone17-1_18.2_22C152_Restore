@interface WFListDisplayConfiguration
+ (BOOL)supportsSecureCoding;
- (NSNumber)titleLineLimit;
- (WFListDisplayConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTitleLineLimit:(id)a3;
@end

@implementation WFListDisplayConfiguration

- (void).cxx_destruct
{
}

- (void)setTitleLineLimit:(id)a3
{
}

- (NSNumber)titleLineLimit
{
  return self->_titleLineLimit;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFListDisplayConfiguration *)self titleLineLimit];
  [v4 encodeObject:v5 forKey:@"titleLineLimit"];
}

- (WFListDisplayConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFListDisplayConfiguration;
  id v5 = [(WFListDisplayConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleLineLimit"];
    titleLineLimit = v5->_titleLineLimit;
    v5->_titleLineLimit = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
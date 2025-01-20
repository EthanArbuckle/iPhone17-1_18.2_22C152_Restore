@interface SUCorePolicyPreflightPrerequisiteCheck
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)basePreflightOptions;
- (SUCorePolicyPreflightPrerequisiteCheck)init;
- (SUCorePolicyPreflightPrerequisiteCheck)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBasePreflightOptions:(id)a3;
- (void)setPerformPhase:(BOOL)a3;
@end

@implementation SUCorePolicyPreflightPrerequisiteCheck

- (SUCorePolicyPreflightPrerequisiteCheck)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyPreflightPrerequisiteCheck;
  v2 = [(SUCorePolicyPreflightPrerequisiteCheck *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_performPhase = 0;
    additionalOptions = v2->_additionalOptions;
    v2->_additionalOptions = 0;

    basePreflightOptions = v3->_basePreflightOptions;
    v3->_basePreflightOptions = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyPreflightPrerequisiteCheck)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyPreflightPrerequisiteCheck;
  v5 = [(SUCorePolicyPreflightPrerequisiteCheck *)&v9 init];
  if (v5)
  {
    v5->_performPhase = [v4 decodeBoolForKey:@"PerformPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

    basePreflightOptions = v5->_basePreflightOptions;
    v5->_basePreflightOptions = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPreflightPrerequisiteCheck performPhase](self, "performPhase"), @"PerformPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPerformPhase:", -[SUCorePolicyPreflightPrerequisiteCheck performPhase](self, "performPhase"));
  v6 = [(SUCorePolicyPreflightPrerequisiteCheck *)self basePreflightOptions];
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBasePreflightOptions:v7];

  v8 = [(SUCorePolicyPreflightPrerequisiteCheck *)self additionalOptions];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyPreflightPrerequisiteCheck *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(SUCorePolicyPreflightPrerequisiteCheck *)v4 performPhase];
      int v6 = v5 ^ [(SUCorePolicyPreflightPrerequisiteCheck *)self performPhase] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  if ([(SUCorePolicyPreflightPrerequisiteCheck *)self performPhase]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  BOOL v5 = [(SUCorePolicyPreflightPrerequisiteCheck *)self basePreflightOptions];
  if (v5)
  {
    int v6 = [(SUCorePolicyPreflightPrerequisiteCheck *)self basePreflightOptions];
  }
  else
  {
    int v6 = @"none";
  }
  objc_super v7 = [(SUCorePolicyPreflightPrerequisiteCheck *)self additionalOptions];
  if (v7)
  {
    v8 = [(SUCorePolicyPreflightPrerequisiteCheck *)self additionalOptions];
    objc_super v9 = [v3 stringWithFormat:@"SUCorePolicyPreflightPrerequisiteCheck(performPhase:%@|basePreflightOptions:%@|additionalOptions:%@)", v4, v6, v8];
  }
  else
  {
    objc_super v9 = [v3 stringWithFormat:@"SUCorePolicyPreflightPrerequisiteCheck(performPhase:%@|basePreflightOptions:%@|additionalOptions:%@)", v4, v6, @"none"];
  }

  if (v5) {

  }
  return v9;
}

- (id)summary
{
  if ([(SUCorePolicyPreflightPrerequisiteCheck *)self performPhase])
  {
    v3 = [&stru_26C1810A0 stringByAppendingString:@"|performPhase"];
  }
  else
  {
    v3 = &stru_26C1810A0;
  }
  id v4 = [(SUCorePolicyPreflightPrerequisiteCheck *)self basePreflightOptions];
  if (v4) {
    BOOL v5 = @"|withBasePreflightOptions";
  }
  else {
    BOOL v5 = @"|noBasePreflightOptions";
  }
  int v6 = [(__CFString *)v3 stringByAppendingString:v5];

  objc_super v7 = [(SUCorePolicyPreflightPrerequisiteCheck *)self additionalOptions];
  if (v7) {
    v8 = @"|withAdditionalOptions";
  }
  else {
    v8 = @"|noAdditionalOptions";
  }
  objc_super v9 = [v6 stringByAppendingString:v8];

  if (([v9 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|"];

    objc_super v9 = (void *)v10;
  }

  return v9;
}

- (BOOL)performPhase
{
  return self->_performPhase;
}

- (void)setPerformPhase:(BOOL)a3
{
  self->_performPhase = a3;
}

- (NSDictionary)basePreflightOptions
{
  return self->_basePreflightOptions;
}

- (void)setBasePreflightOptions:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);

  objc_storeStrong((id *)&self->_basePreflightOptions, 0);
}

@end
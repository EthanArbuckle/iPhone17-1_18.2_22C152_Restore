@interface STSurfPaymentAction
+ (BOOL)supportsSecureCoding;
- (STSurfPaymentAction)initWithCoder:(id)a3;
- (id)_initWithInteraction:(id)a3;
- (id)interaction;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSurfPaymentAction

- (void).cxx_destruct
{
}

- (STSurfPaymentAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSurfPaymentAction;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interaction"];
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSurfPaymentAction;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_interaction, @"_interaction", v5.receiver, v5.super_class);
}

- (unint64_t)action
{
  v3 = [(STSurfPaymentAction *)self interaction];
  id v4 = [v3 intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  v7 = [(STSurfPaymentAction *)self interaction];
  v8 = [v7 intent];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)interaction
{
  return self->_interaction;
}

- (id)_initWithInteraction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSurfPaymentAction;
  uint64_t v6 = [(AFSiriRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_interaction, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
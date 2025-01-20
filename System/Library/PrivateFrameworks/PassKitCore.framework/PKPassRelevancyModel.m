@interface PKPassRelevancyModel
+ (BOOL)supportsSecureCoding;
- (BOOL)relevancyActive;
- (PKPassRelevancyModel)init;
- (PKPassRelevancyModel)initWithCoder:(id)a3;
- (PKPassRelevancyModel)initWithRelevancyActive:(BOOL)a3;
- (id)_init;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRelevancyActive:(BOOL)a3;
@end

@implementation PKPassRelevancyModel

- (PKPassRelevancyModel)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassRelevancyModel;
  return [(PKPassRelevancyModel *)&v3 init];
}

- (PKPassRelevancyModel)initWithRelevancyActive:(BOOL)a3
{
  result = [(PKPassRelevancyModel *)self _init];
  if (result) {
    result->_relevancyActive = a3;
  }
  return result;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  if (self->_relevancyActive) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"relevancy active: %@", v5];
  [v4 appendFormat:@">"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassRelevancyModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassRelevancyModel *)self _init];
  if (v5) {
    v5->_relevancyActive = [v4 decodeBoolForKey:@"relevancyActive"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)relevancyActive
{
  return self->_relevancyActive;
}

- (void)setRelevancyActive:(BOOL)a3
{
  self->_relevancyActive = a3;
}

@end
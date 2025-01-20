@interface PKPassDynamicState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPassBalanceModel)balanceModel;
- (PKPassDynamicState)initWithCoder:(id)a3;
- (PKPassLiveRender)liveRender;
- (PKPassRelevancyModel)relevancyModel;
- (id)_init;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBalanceModel:(id)a3;
- (void)setLiveRender:(id)a3;
- (void)setRelevancyModel:(id)a3;
@end

@implementation PKPassDynamicState

- (void)setRelevancyModel:(id)a3
{
}

- (void)setLiveRender:(id)a3
{
}

- (void)setBalanceModel:(id)a3
{
}

- (PKPassDynamicState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassDynamicState *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"liveRender"];
    liveRender = v5->_liveRender;
    v5->_liveRender = (PKPassLiveRender *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balances"];
    balanceModel = v5->_balanceModel;
    v5->_balanceModel = (PKPassBalanceModel *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevancy"];
    relevancyModel = v5->_relevancyModel;
    v5->_relevancyModel = (PKPassRelevancyModel *)v10;
  }
  return v5;
}

- (PKPassRelevancyModel)relevancyModel
{
  return self->_relevancyModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancyModel, 0);
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_liveRender, 0);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassDynamicState;
  return [(PKPassDynamicState *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  liveRender = self->_liveRender;
  id v5 = a3;
  [v5 encodeObject:liveRender forKey:@"liveRender"];
  [v5 encodeObject:self->_balanceModel forKey:@"balances"];
  [v5 encodeObject:self->_relevancyModel forKey:@"relevancy"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassDynamicState;
  return [(PKPassDynamicState *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassDynamicState;
  return [(PKPassDynamicState *)&v3 hash];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_super v4 = [(PKPassLiveRender *)self->_liveRender description];
  [v3 appendFormat:@"liveRender: %@", v4];

  id v5 = [(PKPassBalanceModel *)self->_balanceModel description];
  [v3 appendFormat:@"balanceModel: %@", v5];

  uint64_t v6 = [(PKPassRelevancyModel *)self->_relevancyModel description];
  [v3 appendFormat:@"relevancyModel: %@", v6];

  [v3 appendFormat:@">"];
  return v3;
}

- (PKPassLiveRender)liveRender
{
  return self->_liveRender;
}

- (PKPassBalanceModel)balanceModel
{
  return self->_balanceModel;
}

@end
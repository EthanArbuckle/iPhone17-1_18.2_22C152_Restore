@interface PKPassBalanceModel
+ (BOOL)supportsSecureCoding;
- (PKPassBalanceModel)initWithBalances:(id)a3;
- (PKPassBalanceModel)initWithCoder:(id)a3;
- (id)balanceForIdentifier:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassBalanceModel

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKPassBalanceModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassBalanceModel *)self init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"balances"];
    balancesByID = v5->_balancesByID;
    v5->_balancesByID = (NSDictionary *)v10;
  }
  return v5;
}

- (PKPassBalanceModel)initWithBalances:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassBalanceModel;
  v5 = [(PKPassBalanceModel *)&v10 init];
  if (v5)
  {
    id v6 = [v4 allObjects];
    uint64_t v7 = objc_msgSend(v6, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_209);
    balancesByID = v5->_balancesByID;
    v5->_balancesByID = (NSDictionary *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __39__PKPassBalanceModel_initWithBalances___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifiers];
  v3 = [v2 anyObject];

  return v3;
}

- (id)balanceForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_balancesByID objectForKeyedSubscript:a3];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(NSDictionary *)self->_balancesByID allValues];
  v5 = [v4 componentsJoinedByString:@", "];
  [v3 appendFormat:@"{%@}", v5];

  [v3 appendString:@">"];
  return v3;
}

@end
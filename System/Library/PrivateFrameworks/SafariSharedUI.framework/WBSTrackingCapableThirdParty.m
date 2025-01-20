@interface WBSTrackingCapableThirdParty
- (BOOL)isEqual:(id)a3;
- (NSArray)firstParties;
- (NSString)domain;
- (WBSTrackingCapableThirdParty)init;
- (WBSTrackingCapableThirdParty)initWithDomain:(id)a3 firstParties:(id)a4;
- (unint64_t)hash;
@end

@implementation WBSTrackingCapableThirdParty

- (WBSTrackingCapableThirdParty)init
{
  return [(WBSTrackingCapableThirdParty *)self initWithDomain:&stru_1F031A860 firstParties:MEMORY[0x1E4F1CBF0]];
}

- (WBSTrackingCapableThirdParty)initWithDomain:(id)a3 firstParties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSTrackingCapableThirdParty;
  v8 = [(WBSTrackingCapableThirdParty *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    firstParties = v8->_firstParties;
    v8->_firstParties = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 domain];
    char v6 = [v5 isEqualToString:self->_domain];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_domain hash];
}

- (NSString)domain
{
  return self->_domain;
}

- (NSArray)firstParties
{
  return self->_firstParties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstParties, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
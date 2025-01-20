@interface WBSTrackingCapableFirstParty
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (WBSTrackingCapableFirstParty)init;
- (WBSTrackingCapableFirstParty)initWithDomain:(id)a3;
- (unint64_t)hash;
@end

@implementation WBSTrackingCapableFirstParty

- (WBSTrackingCapableFirstParty)init
{
  return [(WBSTrackingCapableFirstParty *)self initWithDomain:&stru_1F031A860];
}

- (WBSTrackingCapableFirstParty)initWithDomain:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTrackingCapableFirstParty;
  v5 = [(WBSTrackingCapableFirstParty *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[1] isEqualToString:self->_domain];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_domain hash];
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end
@interface FMSubscriptionContext
- (NSNumber)subscriptionID;
- (NSString)plmn;
- (NSUUID)uuid;
- (id)description;
- (id)init:(id)a3 subscriptionID:(id)a4 plmn:(id)a5;
@end

@implementation FMSubscriptionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id)init:(id)a3 subscriptionID:(id)a4 plmn:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FMSubscriptionContext;
  v12 = [(FMSubscriptionContext *)&v16 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    v14 = p_isa;
  }

  return p_isa;
}

- (id)description
{
  v3 = [(FMSubscriptionContext *)self uuid];
  v4 = [(FMSubscriptionContext *)self subscriptionID];
  v5 = [(FMSubscriptionContext *)self plmn];
  v6 = +[NSString stringWithFormat:@"UUID: %@, subscriptionID: %@, PLMN: %@", v3, v4, v5];

  return v6;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)plmn
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

@end
@interface PassApplicationSubcredentialState
- (NSSet)aliroGroupResolvingKeys;
- (PassApplicationSubcredentialState)initWithAliroGroupResolvingKeys:(id)a3;
@end

@implementation PassApplicationSubcredentialState

- (PassApplicationSubcredentialState)initWithAliroGroupResolvingKeys:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PassApplicationSubcredentialState;
  v6 = [(PassApplicationSubcredentialState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_aliroGroupResolvingKeys, a3);
  }

  return v7;
}

- (NSSet)aliroGroupResolvingKeys
{
  return self->_aliroGroupResolvingKeys;
}

- (void).cxx_destruct
{
}

@end
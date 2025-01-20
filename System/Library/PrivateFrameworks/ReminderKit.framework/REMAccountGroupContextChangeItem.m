@interface REMAccountGroupContextChangeItem
- (REMAccountChangeItem)accountChangeItem;
- (REMAccountGroupContextChangeItem)initWithAccountChangeItem:(id)a3;
- (void)setAccountChangeItem:(id)a3;
@end

@implementation REMAccountGroupContextChangeItem

- (REMAccountGroupContextChangeItem)initWithAccountChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountGroupContextChangeItem;
  v6 = [(REMAccountGroupContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountChangeItem, a3);
  }

  return v7;
}

- (REMAccountChangeItem)accountChangeItem
{
  return self->_accountChangeItem;
}

- (void)setAccountChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
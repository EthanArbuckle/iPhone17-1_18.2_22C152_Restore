@interface PKDashboardTransitItem
+ (id)identifier;
- (NSArray)actionGroups;
- (NSArray)transitCommutePlans;
- (PKDashboardTransitItem)initWithPass:(id)a3 transitBalanceModel:(id)a4 type:(unint64_t)a5;
- (PKPaymentPass)pass;
- (PKTransitBalanceModel)transitBalanceModel;
- (unint64_t)transitItemType;
- (void)setActionGroups:(id)a3;
- (void)setPass:(id)a3;
- (void)setTransitBalanceModel:(id)a3;
- (void)setTransitCommutePlans:(id)a3;
- (void)setTransitItemType:(unint64_t)a3;
@end

@implementation PKDashboardTransitItem

- (PKDashboardTransitItem)initWithPass:(id)a3 transitBalanceModel:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardTransitItem;
  v11 = [(PKDashboardTransitItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pass, a3);
    objc_storeStrong((id *)&v12->_transitBalanceModel, a4);
    v12->_transitItemType = a5;
  }

  return v12;
}

+ (id)identifier
{
  return @"transit";
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (unint64_t)transitItemType
{
  return self->_transitItemType;
}

- (void)setTransitItemType:(unint64_t)a3
{
  self->_transitItemType = a3;
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void)setTransitBalanceModel:(id)a3
{
}

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (void)setTransitCommutePlans:(id)a3
{
}

- (NSArray)actionGroups
{
  return self->_actionGroups;
}

- (void)setActionGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end
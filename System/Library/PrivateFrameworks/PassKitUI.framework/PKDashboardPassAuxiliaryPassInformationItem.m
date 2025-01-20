@interface PKDashboardPassAuxiliaryPassInformationItem
+ (id)identifier;
- (PKPassAuxiliaryPassInformationItem)item;
- (void)setItem:(id)a3;
@end

@implementation PKDashboardPassAuxiliaryPassInformationItem

+ (id)identifier
{
  return @"auxiliaryPassInformation";
}

- (PKPassAuxiliaryPassInformationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
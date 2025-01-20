@interface PKDashboardPassLinkedAppItem
+ (id)identifier;
- (PKLinkedApplication)linkedApplication;
- (void)setLinkedApplication:(id)a3;
@end

@implementation PKDashboardPassLinkedAppItem

+ (id)identifier
{
  return @"linkedApp";
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void)setLinkedApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface SACFPEXContactNameItem
+ (id)contactNameItem;
- (SAPerson)person;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPerson:(id)a3;
@end

@implementation SACFPEXContactNameItem

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow.local.pex";
}

- (id)encodedClassName
{
  return @"ContactNameItem";
}

+ (id)contactNameItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAPerson)person
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, @"person");
}

- (void)setPerson:(id)a3
{
}

@end
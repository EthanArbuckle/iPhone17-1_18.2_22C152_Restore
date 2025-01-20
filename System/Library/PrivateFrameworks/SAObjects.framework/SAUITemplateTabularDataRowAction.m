@interface SAUITemplateTabularDataRowAction
+ (id)tabularDataRowAction;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUITemplateTabularDataRowAction

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataRowAction";
}

+ (id)tabularDataRowAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end
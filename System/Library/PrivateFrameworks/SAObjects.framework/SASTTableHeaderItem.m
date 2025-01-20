@interface SASTTableHeaderItem
+ (id)tableHeaderItem;
- (NSArray)columnValues;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setColumnValues:(id)a3;
@end

@implementation SASTTableHeaderItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"TableHeaderItem";
}

+ (id)tableHeaderItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)columnValues
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"columnValues", v3);
}

- (void)setColumnValues:(id)a3
{
}

@end
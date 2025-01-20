@interface SAPersonAttribute
+ (id)personAttribute;
- (NSString)data;
- (NSString)dataType;
- (NSString)displayText;
- (SAAceComparable)typedData;
- (SAPerson)object;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setData:(id)a3;
- (void)setDataType:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setObject:(id)a3;
- (void)setTypedData:(id)a3;
@end

@implementation SAPersonAttribute

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PersonAttribute";
}

+ (id)personAttribute
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)data
{
  return (NSString *)[(AceObject *)self propertyForKey:@"data"];
}

- (void)setData:(id)a3
{
}

- (NSString)dataType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dataType"];
}

- (void)setDataType:(id)a3
{
}

- (NSString)displayText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayText"];
}

- (void)setDisplayText:(id)a3
{
}

- (SAPerson)object
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, @"object");
}

- (void)setObject:(id)a3
{
}

- (SAAceComparable)typedData
{
  return (SAAceComparable *)AceObjectAceObjectForProperty(self, @"typedData");
}

- (void)setTypedData:(id)a3
{
}

@end
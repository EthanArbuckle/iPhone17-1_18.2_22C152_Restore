@interface SASVDialogAct
+ (id)dialogAct;
- (NSString)name;
- (SASVDialogNode)parametersRoot;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setName:(id)a3;
- (void)setParametersRoot:(id)a3;
@end

@implementation SASVDialogAct

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"DialogAct";
}

+ (id)dialogAct
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SASVDialogNode)parametersRoot
{
  return (SASVDialogNode *)AceObjectAceObjectForProperty(self, @"parametersRoot");
}

- (void)setParametersRoot:(id)a3
{
}

@end
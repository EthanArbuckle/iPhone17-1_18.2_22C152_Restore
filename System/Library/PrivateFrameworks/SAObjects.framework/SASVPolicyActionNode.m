@interface SASVPolicyActionNode
+ (id)policyActionNode;
- (NSArray)children;
- (NSString)confirmationType;
- (NSString)name;
- (NSString)type;
- (SASVSpeechMetadata)speechMetadata;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChildren:(id)a3;
- (void)setConfirmationType:(id)a3;
- (void)setName:(id)a3;
- (void)setSpeechMetadata:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SASVPolicyActionNode

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"PolicyActionNode";
}

+ (id)policyActionNode
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)children
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"children", v3);
}

- (void)setChildren:(id)a3
{
}

- (NSString)confirmationType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"confirmationType"];
}

- (void)setConfirmationType:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SASVSpeechMetadata)speechMetadata
{
  return (SASVSpeechMetadata *)AceObjectAceObjectForProperty(self, @"speechMetadata");
}

- (void)setSpeechMetadata:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end
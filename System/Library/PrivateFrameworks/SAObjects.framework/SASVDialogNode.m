@interface SASVDialogNode
+ (id)dialogNode;
- (NSArray)children;
- (NSString)nodeTypeHint;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChildren:(id)a3;
- (void)setNodeTypeHint:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASVDialogNode

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"DialogNode";
}

+ (id)dialogNode
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

- (NSString)nodeTypeHint
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nodeTypeHint"];
}

- (void)setNodeTypeHint:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end
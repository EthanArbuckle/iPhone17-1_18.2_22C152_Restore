@interface WFJSONStructureLeafNode
+ (id)optionalLeafNode;
+ (id)requiredLeafNode;
- (BOOL)isRequired;
- (void)setRequired:(BOOL)a3;
@end

@implementation WFJSONStructureLeafNode

+ (id)requiredLeafNode
{
  v2 = objc_opt_new();
  [v2 setRequired:1];
  return v2;
}

+ (id)optionalLeafNode
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

@end
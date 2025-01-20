@interface USORootNode
- (USORootNode)initWithCppRootNode:(void *)a3;
@end

@implementation USORootNode

- (USORootNode)initWithCppRootNode:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USORootNode;
  result = -[USOGraphNode initWithCppGraphNode:](&v5, sel_initWithCppGraphNode_);
  if (result) {
    result->_usoRootNode = a3;
  }
  return result;
}

@end
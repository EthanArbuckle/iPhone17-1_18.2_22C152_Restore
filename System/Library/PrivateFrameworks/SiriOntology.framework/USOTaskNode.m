@interface USOTaskNode
- (USOTaskNode)initWithCppTaskNode:(void *)a3;
@end

@implementation USOTaskNode

- (USOTaskNode)initWithCppTaskNode:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USOTaskNode;
  result = -[USOEntityNode initWithCppEntityNode:](&v5, sel_initWithCppEntityNode_);
  if (result) {
    result->_usoTaskNode = a3;
  }
  return result;
}

@end
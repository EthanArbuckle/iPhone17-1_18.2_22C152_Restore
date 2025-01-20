@interface USOIntNode
- (USOIntNode)initWithCppIntNode:(void *)a3;
@end

@implementation USOIntNode

- (USOIntNode)initWithCppIntNode:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USOIntNode;
  result = -[USOEntityNode initWithCppEntityNode:](&v5, sel_initWithCppEntityNode_);
  if (result) {
    result->_usoIntNode = a3;
  }
  return result;
}

@end
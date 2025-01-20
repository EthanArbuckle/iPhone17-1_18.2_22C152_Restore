@interface USOStringNode
- (USOStringNode)initWithCppStringNode:(void *)a3;
@end

@implementation USOStringNode

- (USOStringNode)initWithCppStringNode:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USOStringNode;
  result = -[USOEntityNode initWithCppEntityNode:](&v5, sel_initWithCppEntityNode_);
  if (result) {
    result->_usoStringNode = a3;
  }
  return result;
}

@end
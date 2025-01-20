@interface USOGraphNode
- (USOGraphNode)initWithCppGraphNode:(UsoGraphNode *)a3;
- (void)setSuccessor:(const void *)a3 successor:(id)a4 enumeration:(unsigned int)a5;
@end

@implementation USOGraphNode

- (void)setSuccessor:(const void *)a3 successor:(id)a4 enumeration:(unsigned int)a5
{
}

- (USOGraphNode)initWithCppGraphNode:(UsoGraphNode *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USOGraphNode;
  result = [(USOGraphNode *)&v5 init];
  if (result) {
    result->_usoGraphNode = a3;
  }
  return result;
}

@end
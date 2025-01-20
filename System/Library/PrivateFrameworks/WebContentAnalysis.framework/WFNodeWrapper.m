@interface WFNodeWrapper
- (WFNodeWrapper)initWithNode:(_xmlNode *)a3;
- (_xmlNode)node;
- (void)dealloc;
@end

@implementation WFNodeWrapper

- (WFNodeWrapper)initWithNode:(_xmlNode *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFNodeWrapper;
  result = [(WFNodeWrapper *)&v5 init];
  if (result) {
    result->_node = a3;
  }
  return result;
}

- (_xmlNode)node
{
  return self->_node;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WFNodeWrapper;
  [(WFNodeWrapper *)&v2 dealloc];
}

@end
@interface UPResultIntermediateNode
- (NSArray)leafNodes;
- (UPResultIntermediateNode)initWithLabel:(id)a3 andLeafNodes:(id)a4;
@end

@implementation UPResultIntermediateNode

- (void).cxx_destruct
{
}

- (NSArray)leafNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (UPResultIntermediateNode)initWithLabel:(id)a3 andLeafNodes:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UPResultIntermediateNode;
  v8 = [(UPResultNode *)&v11 initWithLabel:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_leafNodes, a4);
  }

  return v9;
}

@end
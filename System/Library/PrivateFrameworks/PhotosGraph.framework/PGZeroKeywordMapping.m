@interface PGZeroKeywordMapping
- (NSArray)mappedMeaningNodes;
- (PGGraphMeaningNode)displayNode;
- (PGZeroKeywordMapping)initWithDisplayNode:(id)a3 mappedMeaningNodes:(id)a4;
@end

@implementation PGZeroKeywordMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedMeaningNodes, 0);
  objc_storeStrong((id *)&self->_displayNode, 0);
}

- (NSArray)mappedMeaningNodes
{
  return self->_mappedMeaningNodes;
}

- (PGGraphMeaningNode)displayNode
{
  return self->_displayNode;
}

- (PGZeroKeywordMapping)initWithDisplayNode:(id)a3 mappedMeaningNodes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGZeroKeywordMapping;
  v9 = [(PGZeroKeywordMapping *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayNode, a3);
    objc_storeStrong((id *)&v10->_mappedMeaningNodes, a4);
  }

  return v10;
}

@end
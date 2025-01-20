@interface PGGraphBuilderMomentEnvelope
- (NSArray)sceneEdges;
- (PGGraphBuilderMomentEnvelope)initWithMomentNode:(id)a3;
- (PGGraphMomentNode)momentNode;
- (void)setSceneEdges:(id)a3;
@end

@implementation PGGraphBuilderMomentEnvelope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneEdges, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
}

- (void)setSceneEdges:(id)a3
{
}

- (NSArray)sceneEdges
{
  return self->_sceneEdges;
}

- (PGGraphMomentNode)momentNode
{
  return (PGGraphMomentNode *)objc_getProperty(self, a2, 8, 1);
}

- (PGGraphBuilderMomentEnvelope)initWithMomentNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBuilderMomentEnvelope;
  v6 = [(PGGraphBuilderMomentEnvelope *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_momentNode, a3);
  }

  return v7;
}

@end
@interface PVCompositeDelegateContext
- (PVColorSpace)renderingColorSpace;
- (PVCompositeDelegateContext)initWithNode:(id)a3;
- (PVInstructionGraphSourceNode)sourceNode;
- (id)preprocessData;
- (void)setPreprocessData:(id)a3;
- (void)setRenderColorSpace:(id)a3;
@end

@implementation PVCompositeDelegateContext

- (PVCompositeDelegateContext)initWithNode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PVCompositeDelegateContext;
  v5 = [(PVCompositeDelegateContext *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceNode, v4);
    id preprocessData = v6->_preprocessData;
    v6->_id preprocessData = 0;
  }
  return v6;
}

- (void)setPreprocessData:(id)a3
{
}

- (void)setRenderColorSpace:(id)a3
{
}

- (PVInstructionGraphSourceNode)sourceNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceNode);

  return (PVInstructionGraphSourceNode *)WeakRetained;
}

- (id)preprocessData
{
  return self->_preprocessData;
}

- (PVColorSpace)renderingColorSpace
{
  return self->_renderingColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingColorSpace, 0);
  objc_storeStrong(&self->_preprocessData, 0);

  objc_destroyWeak((id *)&self->_sourceNode);
}

@end
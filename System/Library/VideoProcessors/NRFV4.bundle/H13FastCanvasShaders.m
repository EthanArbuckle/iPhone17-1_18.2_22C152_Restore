@interface H13FastCanvasShaders
- (H13FastCanvasShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)clone;
@end

@implementation H13FastCanvasShaders

- (H13FastCanvasShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)H13FastCanvasShaders;
  self = [(H13FastCanvasShaders *)&v8 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [v4 computePipelineStateFor:@"H13FastCanvas::clone" constants:0];
  clone = self->_clone;
  self->_clone = v5;

  if (!self->_clone)
  {
LABEL_7:
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (MTLComputePipelineState)clone
{
  return self->_clone;
}

- (void).cxx_destruct
{
}

@end
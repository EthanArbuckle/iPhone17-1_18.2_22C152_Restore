@interface CRLMetalContext
- (CGColorSpace)destinationColorSpace;
- (CGSize)viewportSize;
- (CRLMetalContext)initWithEnvironment:(id)a3;
- (CRLMetalEnvironment)environment;
- (CRLMetalShader)shader;
- (MTLCommandBuffer)commandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)renderEncoder;
- (MTLRenderPassDescriptor)passDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)currentBuffer;
- (unint64_t)pixelFormat;
- (void)setCommandBuffer:(id)a3;
- (void)setCurrentBuffer:(unint64_t)a3;
- (void)setPassDescriptor:(id)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setRenderEncoder:(id)a3;
- (void)setShader:(id)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation CRLMetalContext

- (CRLMetalContext)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLMetalContext;
  v6 = [(CRLMetalContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_environment, a3);
  }

  return v7;
}

- (MTLDevice)device
{
  v2 = [(CRLMetalContext *)self environment];
  v3 = [v2 device];

  return (MTLDevice *)v3;
}

- (MTLCommandQueue)commandQueue
{
  v2 = [(CRLMetalContext *)self environment];
  v3 = [v2 commandQueue];

  return (MTLCommandQueue *)v3;
}

- (CGColorSpace)destinationColorSpace
{
  v2 = [(CRLMetalContext *)self environment];
  v3 = (CGColorSpace *)[v2 destinationColorSpace];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[CRLMetalContext alloc] initWithEnvironment:self->_environment];
  [(CRLMetalContext *)v4 setPixelFormat:self->_pixelFormat];
  -[CRLMetalContext setViewportSize:](v4, "setViewportSize:", self->_viewportSize.width, self->_viewportSize.height);
  [(CRLMetalContext *)v4 setCurrentBuffer:self->_currentBuffer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandBuffer);
  [(CRLMetalContext *)v4 setCommandBuffer:WeakRetained];

  id v6 = objc_loadWeakRetained((id *)&self->_passDescriptor);
  [(CRLMetalContext *)v4 setPassDescriptor:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_shader);
  [(CRLMetalContext *)v4 setShader:v7];

  id v8 = objc_loadWeakRetained((id *)&self->_renderEncoder);
  [(CRLMetalContext *)v4 setRenderEncoder:v8];

  return v4;
}

- (CRLMetalEnvironment)environment
{
  return self->_environment;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (unint64_t)currentBuffer
{
  return self->_currentBuffer;
}

- (void)setCurrentBuffer:(unint64_t)a3
{
  self->_currentBuffer = a3;
}

- (MTLCommandBuffer)commandBuffer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandBuffer);

  return (MTLCommandBuffer *)WeakRetained;
}

- (void)setCommandBuffer:(id)a3
{
}

- (MTLRenderPassDescriptor)passDescriptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passDescriptor);

  return (MTLRenderPassDescriptor *)WeakRetained;
}

- (void)setPassDescriptor:(id)a3
{
}

- (CRLMetalShader)shader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shader);

  return (CRLMetalShader *)WeakRetained;
}

- (void)setShader:(id)a3
{
}

- (MTLRenderCommandEncoder)renderEncoder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderEncoder);

  return (MTLRenderCommandEncoder *)WeakRetained;
}

- (void)setRenderEncoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderEncoder);
  objc_destroyWeak((id *)&self->_shader);
  objc_destroyWeak((id *)&self->_passDescriptor);
  objc_destroyWeak((id *)&self->_commandBuffer);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end
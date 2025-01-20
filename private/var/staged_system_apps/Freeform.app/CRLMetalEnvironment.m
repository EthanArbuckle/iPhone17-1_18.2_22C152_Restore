@interface CRLMetalEnvironment
- (CGColorSpace)destinationColorSpace;
- (CRLMetalEnvironment)initWithDevice:(id)a3 commandQueue:(id)a4 destinationColorSpace:(CGColorSpace *)a5 shaderManager:(id)a6;
- (CRLMetalShaderManager)shaderManager;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (void)dealloc;
@end

@implementation CRLMetalEnvironment

- (CRLMetalEnvironment)initWithDevice:(id)a3 commandQueue:(id)a4 destinationColorSpace:(CGColorSpace *)a5 shaderManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRLMetalEnvironment;
  v14 = [(CRLMetalEnvironment *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_device, a3);
    objc_storeStrong((id *)&v15->_commandQueue, a4);
    v15->_destinationColorSpace = CGColorSpaceRetain(a5);
    objc_storeStrong((id *)&v15->_shaderManager, a6);
  }

  return v15;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_destinationColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)CRLMetalEnvironment;
  [(CRLMetalEnvironment *)&v3 dealloc];
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (CRLMetalShaderManager)shaderManager
{
  return self->_shaderManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderManager, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
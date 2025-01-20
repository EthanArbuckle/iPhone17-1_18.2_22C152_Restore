@interface PTRenderPipelineDescriptor
- (BOOL)gpuProfiling;
- (BOOL)useRGBA;
- (BOOL)verbose;
- (CGAffineTransform)preferredTransform;
- (CGSize)colorInputSize;
- (CGSize)colorOutputSize;
- (CGSize)disparitySize;
- (MTLDevice)device;
- (NSDictionary)options;
- (PTRenderPipelineDescriptor)initWithDevice:(id)a3 version:(unint64_t)a4 colorInputSize:(CGSize)a5 colorOutputSize:(CGSize)a6 disparitySize:(CGSize)a7;
- (PTRenderPipelineDescriptor)initWithDevice:(id)a3 version:(unint64_t)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6;
- (id)copy;
- (int64_t)debugRendering;
- (unint64_t)version;
- (void)setDebugRendering:(int64_t)a3;
- (void)setGpuProfiling:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPreferredTransform:(CGAffineTransform *)a3;
- (void)setUseRGBA:(BOOL)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation PTRenderPipelineDescriptor

- (id)copy
{
  v3 = -[PTRenderPipelineDescriptor initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:", self->_device, self->_version, self->_colorInputSize.width, self->_colorInputSize.height, self->_colorOutputSize.width, self->_colorOutputSize.height, self->_disparitySize.width, self->_disparitySize.height);
  [(PTRenderPipelineDescriptor *)v3 setDebugRendering:self->_debugRendering];
  [(PTRenderPipelineDescriptor *)v3 setVerbose:self->_verbose];
  [(PTRenderPipelineDescriptor *)v3 setUseRGBA:self->_useRGBA];
  long long v4 = *(_OWORD *)&self->_preferredTransform.c;
  v7[0] = *(_OWORD *)&self->_preferredTransform.a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&self->_preferredTransform.tx;
  [(PTRenderPipelineDescriptor *)v3 setPreferredTransform:v7];
  v5 = (void *)[(NSDictionary *)self->_options copy];
  [(PTRenderPipelineDescriptor *)v3 setOptions:v5];

  return v3;
}

- (void)setOptions:(id)a3
{
}

- (PTRenderPipelineDescriptor)initWithDevice:(id)a3 version:(unint64_t)a4 colorInputSize:(CGSize)a5 colorOutputSize:(CGSize)a6 disparitySize:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat v9 = a6.height;
  CGFloat v10 = a6.width;
  CGFloat v11 = a5.height;
  CGFloat v12 = a5.width;
  id v16 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PTRenderPipelineDescriptor;
  v17 = [(PTRenderPipelineDescriptor *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_device, a3);
    v18->_colorInputSize.CGFloat width = v12;
    v18->_colorInputSize.CGFloat height = v11;
    v18->_colorOutputSize.CGFloat width = v10;
    v18->_colorOutputSize.CGFloat height = v9;
    v18->_disparitySize.CGFloat width = width;
    v18->_disparitySize.CGFloat height = height;
    v18->_version = a4;
    v18->_debugRendering = 0;
    *(_WORD *)&v18->_verbose = 0;
    v18->_useRGBA = 0;
    uint64_t v19 = MEMORY[0x1E4F1DAB8];
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v18->_preferredTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v18->_preferredTransform.c = v20;
    *(_OWORD *)&v18->_preferredTransform.tx = *(_OWORD *)(v19 + 32);
    v21 = v18;
  }

  return v18;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void)setUseRGBA:(BOOL)a3
{
  self->_useRGBA = a3;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
}

- (void)setDebugRendering:(int64_t)a3
{
  self->_debugRendering = a3;
}

- (PTRenderPipelineDescriptor)initWithDevice:(id)a3 version:(unint64_t)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6
{
  return -[PTRenderPipelineDescriptor initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:](self, "initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:", a3, a4, a5.width, a5.height, a5.width, a5.height, a6.width, a6.height);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 16, 1);
}

- (CGSize)disparitySize
{
  objc_copyStruct(v4, &self->_disparitySize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)colorOutputSize
{
  objc_copyStruct(v4, &self->_colorOutputSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (NSDictionary)options
{
  return self->_options;
}

- (CGSize)colorInputSize
{
  objc_copyStruct(v4, &self->_colorInputSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (CGAffineTransform)preferredTransform
{
  objc_copyStruct(retstr, &self->_preferredTransform, 48, 1, 0);
  return result;
}

- (int64_t)debugRendering
{
  return self->_debugRendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (BOOL)gpuProfiling
{
  return self->_gpuProfiling;
}

- (void)setGpuProfiling:(BOOL)a3
{
  self->_gpuProfiling = a3;
}

- (BOOL)useRGBA
{
  return self->_useRGBA;
}

@end
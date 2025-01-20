@interface PTEffectManagerDebug
- (BOOL)enabled;
- (BOOL)reverseZ;
- (PTEffectManagerDebug)initWithMetalContext:(id)a3 colorSize:(id *)a4;
- (double)depthNearFar;
- (signed)effectType;
- (unint64_t)depthOutputPixelFormat;
- (unint64_t)effectPriority;
- (unint64_t)rgbaOutputPixelFormat;
- (void)render:(id)a3 renderRequest:(id)a4 input:(id)a5 output:(id)a6;
- (void)setDepthNearFar:(PTEffectManagerDebug *)self;
- (void)setEnabled:(BOOL)a3;
- (void)setReverseZ:(BOOL)a3;
@end

@implementation PTEffectManagerDebug

- (PTEffectManagerDebug)initWithMetalContext:(id)a3 colorSize:(id *)a4
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTEffectManagerDebug;
  v6 = [(PTEffectManagerDebug *)&v15 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  *(void *)&v6->depthNearFar[4] = 0x3F8000003DCCCCCDLL;
  v6->rgbaOutputPixelFormat = 81;
  v6->depthOutputPixelFormat = 260;
  v6->effectType = 1;
  v6->reverseZ = 1;
  uint64_t v8 = [v5 computePipelineStateFor:@"effectDepthDebug" withConstants:0];
  effectDepthDebug = v7->_effectDepthDebug;
  v7->_effectDepthDebug = (MTLComputePipelineState *)v8;

  if (!v7->_effectDepthDebug)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTEffectManagerDebug initWithMetalContext:colorSize:](v13);
    }
    goto LABEL_9;
  }
  v10 = [[PTUtil alloc] initWithMetalContext:v5];
  util = v7->_util;
  v7->_util = v10;

  if (!v7->_util)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTEffectManagerDebug initWithMetalContext:colorSize:](v13);
    }
LABEL_9:

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v7->maxDepth = 3.0;
  v12 = v7;
LABEL_11:

  return v12;
}

- (void)render:(id)a3 renderRequest:(id)a4 input:(id)a5 output:(id)a6
{
  id v8 = a6;
  id v9 = a3;
  v10 = [v9 computeCommandEncoder];
  [v10 setComputePipelineState:self->_effectDepthDebug];
  v11 = [v8 effectRGBA];
  [v10 setTexture:v11 atIndex:0];

  v12 = [v8 effectDepth];
  [v10 setTexture:v12 atIndex:1];

  [v10 setBytes:&self->depthNearFar[4] length:8 atIndex:0];
  [v10 setBytes:&self->reverseZ length:1 atIndex:1];
  [v10 setBytes:&self->maxDepth length:4 atIndex:2];
  v13 = [v8 effectRGBA];
  uint64_t v14 = [v13 width];
  objc_super v15 = [v8 effectRGBA];
  v21[0] = v14;
  v21[1] = [v15 height];
  v21[2] = 1;
  long long v19 = xmmword_1D081F8F0;
  uint64_t v20 = 1;
  [v10 dispatchThreads:v21 threadsPerThreadgroup:&v19];

  [v10 endEncoding];
  util = self->_util;
  v17 = [v8 effectRGBA];

  v18[0] = vdupq_n_s64(0xAuLL);
  v18[1] = xmmword_1D081FCF0;
  v18[2] = xmmword_1D081FD00;
  [(PTUtil *)util drawTurboLegend:v9 outRGBA:v17 rect:v18 maxValue:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(3.0))];
}

- (double)depthNearFar
{
  return *(double *)(a1 + 40);
}

- (void)setDepthNearFar:(PTEffectManagerDebug *)self
{
  *(void *)&self->depthNearFar[4] = v2;
}

- (unint64_t)depthOutputPixelFormat
{
  return self->depthOutputPixelFormat;
}

- (unint64_t)effectPriority
{
  return self->effectPriority;
}

- (signed)effectType
{
  return self->effectType;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (BOOL)reverseZ
{
  return self->reverseZ;
}

- (void)setReverseZ:(BOOL)a3
{
  self->reverseZ = a3;
}

- (unint64_t)rgbaOutputPixelFormat
{
  return self->rgbaOutputPixelFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_util, 0);

  objc_storeStrong((id *)&self->_effectDepthDebug, 0);
}

- (void)initWithMetalContext:(os_log_t)log colorSize:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "_effectDepthDebug";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithMetalContext:(os_log_t)log colorSize:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "_util";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

@end
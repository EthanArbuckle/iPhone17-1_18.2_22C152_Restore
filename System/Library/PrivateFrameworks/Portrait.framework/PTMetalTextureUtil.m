@interface PTMetalTextureUtil
- (PTMetalTextureUtil)initWithMetalContext:(id)a3;
- (id)createWithSize:(CGSize)a3 pixelFormat:(unint64_t)a4;
- (id)createWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5;
- (id)createWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 mipmapLevelCount:(unint64_t)a6;
- (id)mipmapLevelsUsingTextureView:(id)a3;
- (int)copy:(id)a3 inTex:(id)a4 outTex:(id)a5;
- (int)mix:(id)a3 inTexX:(id)a4 inTexY:(id)a5 outTex:(id)a6 alpha:(float)a7;
- (int)multiply:(id)a3 inTex:(id)a4 outTex:(id)a5 multiplier:(float)a6;
- (int)resample420To444:(id)a3 inLuma:(id)a4 inChroma:(id)a5 outYUV:(id)a6;
@end

@implementation PTMetalTextureUtil

- (PTMetalTextureUtil)initWithMetalContext:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTMetalTextureUtil;
  v5 = [(PTMetalTextureUtil *)&v50 init];
  if (!v5) {
    goto LABEL_20;
  }
  uint64_t v6 = [v4 device];
  device = v5->_device;
  v5->_device = (MTLDevice *)v6;

  int v8 = [v4 imageblocksSupported];
  v5->_imageblocksSupported = v8;
  if (v8)
  {
    uint64_t v9 = [v4 computePipelineStateFor:@"copy" withConstants:0];
    copy = v5->_copy;
    v5->_copy = (MTLComputePipelineState *)v9;

    if (!v5->_copy)
    {
      v11 = _PTLogSystem();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

LABEL_20:
        v27 = 0;
        goto LABEL_21;
      }
LABEL_5:
      -[PTMetalTextureUtil initWithMetalContext:](v11, v12, v13, v14, v15, v16, v17, v18);
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v19 = [v4 computePipelineStateFor:@"copyNoImageblocks" withConstants:0];
    v20 = v5->_copy;
    v5->_copy = (MTLComputePipelineState *)v19;

    if (!v5->_copy)
    {
      v11 = _PTLogSystem();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      goto LABEL_5;
    }
  }
  uint64_t v21 = [v4 computePipelineStateFor:@"multiply" withConstants:0];
  multiply = v5->_multiply;
  v5->_multiply = (MTLComputePipelineState *)v21;

  if (!v5->_multiply)
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTMetalTextureUtil initWithMetalContext:](v11, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_19;
  }
  uint64_t v23 = [v4 computePipelineStateFor:@"mix" withConstants:0];
  mix = v5->_mix;
  v5->_mix = (MTLComputePipelineState *)v23;

  if (!v5->_mix)
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTMetalTextureUtil initWithMetalContext:](v11, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_19;
  }
  uint64_t v25 = [v4 computePipelineStateFor:@"resample420To444" withConstants:0];
  resample420To444 = v5->_resample420To444;
  v5->_resample420To444 = (MTLComputePipelineState *)v25;

  if (!v5->_resample420To444)
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTMetalTextureUtil initWithMetalContext:].cold.4(v11, v42, v43, v44, v45, v46, v47, v48);
    }
    goto LABEL_19;
  }
  v27 = v5;
LABEL_21:

  return v27;
}

- (id)mipmapLevelsUsingTextureView:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 mipmapLevelCount])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = objc_msgSend(v3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v3, "pixelFormat"), objc_msgSend(v3, "textureType"), v5, 1, 0, 1);
      [v4 addObject:v6];

      ++v5;
    }
    while ([v3 mipmapLevelCount] > v5);
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)createWithSize:(CGSize)a3 pixelFormat:(unint64_t)a4
{
  return [(PTMetalTextureUtil *)self createWithWidth:(unint64_t)a3.width height:(unint64_t)a3.height pixelFormat:a4 mipmapLevelCount:0];
}

- (id)createWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 mipmapLevelCount:(unint64_t)a6
{
  int v8 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a5 width:a3 height:a4 mipmapped:a6 != 0];
  [v8 setUsage:19];
  if ([(MTLDevice *)self->_device supportsFamily:1007]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 32;
  }
  [v8 setResourceOptions:v9];
  if (a6 != -1)
  {
    if (a6 <= 1) {
      unint64_t v10 = 1;
    }
    else {
      unint64_t v10 = a6;
    }
    [v8 setMipmapLevelCount:v10];
  }
  v11 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v8];

  return v11;
}

- (id)createWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5
{
  return [(PTMetalTextureUtil *)self createWithWidth:a3 height:a4 pixelFormat:a5 mipmapLevelCount:0];
}

- (int)copy:(id)a3 inTex:(id)a4 outTex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[PTImageblockConfig alloc] initWithTexture:v8];
  uint64_t v12 = [v10 computeCommandEncoder];

  if (!v12)
  {
    uint64_t v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  if (self->_imageblocksSupported) {
    objc_msgSend(v12, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v11, "imageblockSize"), -[PTImageblockConfig imageblockSize](v11, "imageblockSize"));
  }
  [v12 setComputePipelineState:self->_copy];
  [v12 setTexture:v9 atIndex:0];

  [v12 setTexture:v8 atIndex:1];
  if (v11)
  {
    [(PTImageblockConfig *)v11 threads];
    [(PTImageblockConfig *)v11 threadsPerGroup];
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    memset(v22, 0, sizeof(v22));
  }
  [v12 dispatchThreads:v23 threadsPerThreadgroup:v22];
  [v12 endEncoding];

  return 0;
}

- (int)multiply:(id)a3 inTex:(id)a4 outTex:(id)a5 multiplier:(float)a6
{
  float v26 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    uint64_t v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setComputePipelineState:self->_multiply];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v26 length:4 atIndex:0];
  uint64_t v20 = [v9 width];
  uint64_t v21 = [v9 height];

  v25[0] = v20;
  v25[1] = v21;
  v25[2] = 1;
  long long v23 = xmmword_1D081F8F0;
  uint64_t v24 = 1;
  [v11 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v11 endEncoding];

  return 0;
}

- (int)mix:(id)a3 inTexX:(id)a4 inTexY:(id)a5 outTex:(id)a6 alpha:(float)a7
{
  float v29 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = [a3 computeCommandEncoder];
  if (!v14)
  {
    uint64_t v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  [v14 setComputePipelineState:self->_mix];
  [v14 setTexture:v13 atIndex:0];

  [v14 setTexture:v12 atIndex:1];
  [v14 setTexture:v11 atIndex:2];
  [v14 setBytes:&v29 length:4 atIndex:0];
  uint64_t v23 = [v11 width];
  uint64_t v24 = [v11 height];

  v28[0] = v23;
  v28[1] = v24;
  v28[2] = 1;
  long long v26 = xmmword_1D081F8F0;
  uint64_t v27 = 1;
  [v14 dispatchThreads:v28 threadsPerThreadgroup:&v26];
  [v14 endEncoding];

  return 0;
}

- (int)resample420To444:(id)a3 inLuma:(id)a4 inChroma:(id)a5 outYUV:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  +[PTColorConversion getChromaOffsetFromLuma:v12 texChroma:v11];
  uint64_t v22 = v14;
  uint64_t v15 = [v13 computeCommandEncoder];

  [v15 setComputePipelineState:self->_resample420To444];
  [v15 setTexture:v12 atIndex:0];

  [v15 setTexture:v11 atIndex:1];
  [v15 setTexture:v10 atIndex:2];
  [v15 setBytes:&v22 length:8 atIndex:0];
  uint64_t v16 = [v10 width];
  uint64_t v17 = [v10 height];

  v21[0] = v16;
  v21[1] = v17;
  v21[2] = 1;
  long long v19 = xmmword_1D081F8F0;
  uint64_t v20 = 1;
  [v15 dispatchThreads:v21 threadsPerThreadgroup:&v19];
  [v15 endEncoding];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resample420To444, 0);
  objc_storeStrong((id *)&self->_mix, 0);
  objc_storeStrong((id *)&self->_multiply, 0);
  objc_storeStrong((id *)&self->_copy, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
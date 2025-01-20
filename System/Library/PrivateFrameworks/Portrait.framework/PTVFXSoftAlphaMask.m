@interface PTVFXSoftAlphaMask
- (PTVFXSoftAlphaMask)initWithMetalContext:(id)a3 colorSize:(id *)a4;
- (id)debugTextures;
- (id)lazyInstantiateAlphaMaskForRenderRequest:(id)a3;
- (int)boxFilter:(id)a3 mask:(id)a4;
- (int)remapAlphaMask:(id)a3 effectRenderRequest:(id)a4;
- (int)updateSoftAlphaMask:(id)a3 inDisparity:(id)a4 focusDisparityModifiers:(id)a5 effectRenderRequest:(id)a6;
- (int)updateSoftAlphaMask:(id)a3 inSegmentation:(id)a4 effectRenderRequest:(id)a5;
@end

@implementation PTVFXSoftAlphaMask

- (PTVFXSoftAlphaMask)initWithMetalContext:(id)a3 colorSize:(id *)a4
{
  id v7 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PTVFXSoftAlphaMask;
  v8 = [(PTVFXSoftAlphaMask *)&v60 init];
  if (!v8) {
    goto LABEL_26;
  }
  unint64_t v9 = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)a4->var0, (double)a4->var1);
  unint64_t var0 = a4->var0;
  unint64_t var1 = a4->var1;
  uint64_t v12 = 288;
  if (v9 == 1) {
    uint64_t v12 = 320;
  }
  uint64_t v13 = 216;
  if (v9 == 1) {
    uint64_t v13 = 176;
  }
  if (var0 <= var1) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v12;
  }
  if (var0 <= var1) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = v13;
  }
  objc_storeStrong((id *)v8 + 1, a3);
  uint64_t v16 = [v7 computePipelineStateFor:@"disparityToAlphaMask" withConstants:0];
  v17 = (void *)*((void *)v8 + 2);
  *((void *)v8 + 2) = v16;

  if (!*((void *)v8 + 2))
  {
    v30 = _PTLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:](v30, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_25;
  }
  uint64_t v18 = [v7 computePipelineStateFor:@"remapAlphaMask" withConstants:0];
  v19 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v18;

  if (!*((void *)v8 + 3))
  {
    v30 = _PTLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:](v30, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_25;
  }
  v20 = [v7 textureUtil];
  uint64_t v21 = [v20 createWithWidth:v14 height:v15 pixelFormat:10];
  v22 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v21;

  if (!*((void *)v8 + 4))
  {
    v30 = _PTLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:](v30, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_25;
  }
  v23 = [v7 textureUtil];
  uint64_t v24 = [v23 createWithWidth:v14 height:v15 pixelFormat:10];
  v25 = (void *)*((void *)v8 + 6);
  *((void *)v8 + 6) = v24;

  if (!*((void *)v8 + 6))
  {
    v30 = _PTLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:].cold.4(v30, v52, v53, v54, v55, v56, v57, v58);
    }
LABEL_25:

LABEL_26:
    v29 = 0;
    goto LABEL_27;
  }
  long long v26 = *(_OWORD *)&a4->var0;
  *((void *)v8 + 9) = a4->var2;
  *(_OWORD *)(v8 + 56) = v26;
  v27 = [[PTBoxFilter alloc] initWithMetalContext:v7 options:1];
  v28 = (void *)*((void *)v8 + 10);
  *((void *)v8 + 10) = v27;

  v29 = v8;
LABEL_27:

  return v29;
}

- (int)updateSoftAlphaMask:(id)a3 inDisparity:(id)a4 focusDisparityModifiers:(id)a5 effectRenderRequest:(id)a6
{
  int v21 = 1065353216;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 computeCommandEncoder];
  [v14 setComputePipelineState:self->_disparityToAlphaMask];
  [v14 setTexture:v12 atIndex:0];

  [v14 setTexture:self->_alphaMask atIndex:1];
  [v14 setBuffer:v11 offset:0 atIndex:0];

  [v14 setBytes:&v21 length:4 atIndex:1];
  uint64_t v15 = [(MTLTexture *)self->_alphaMask width];
  uint64_t v16 = [(MTLTexture *)self->_alphaMask height];
  v20[0] = v15;
  v20[1] = v16;
  v20[2] = 1;
  long long v18 = xmmword_1D081F8F0;
  uint64_t v19 = 1;
  [v14 dispatchThreads:v20 threadsPerThreadgroup:&v18];
  [v14 endEncoding];
  LODWORD(v15) = [(PTVFXSoftAlphaMask *)self boxFilter:v13 mask:self->_alphaMask];
  LODWORD(self) = [(PTVFXSoftAlphaMask *)self remapAlphaMask:v13 effectRenderRequest:v10];

  return self | v15;
}

- (int)remapAlphaMask:(id)a3 effectRenderRequest:(id)a4
{
  if (self->_remappedAlphaMask)
  {
    id v6 = a4;
    id v7 = [a3 computeCommandEncoder];
    [v7 setComputePipelineState:self->_remapAlphaMask];
    [v7 setTexture:self->_alphaMask atIndex:0];
    [v7 setTexture:self->_remappedAlphaMask atIndex:1];
    [v6 reactionsCombinedCropRect];
    long long v12 = v8;

    long long v16 = v12;
    [v7 setBytes:&v16 length:16 atIndex:0];
    uint64_t v9 = [(MTLTexture *)self->_remappedAlphaMask width];
    uint64_t v10 = [(MTLTexture *)self->_remappedAlphaMask height];
    v15[0] = v9;
    v15[1] = v10;
    v15[2] = 1;
    long long v13 = xmmword_1D081F8F0;
    uint64_t v14 = 1;
    [v7 dispatchThreads:v15 threadsPerThreadgroup:&v13];
    [v7 endEncoding];
  }
  return 0;
}

- (id)lazyInstantiateAlphaMaskForRenderRequest:(id)a3
{
  id v4 = a3;
  [v4 inReactionVideoRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 outColorROI];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v52.origin.x = 0.0;
  v52.origin.y = 0.0;
  v52.size.unint64_t width = 1.0;
  v52.size.unint64_t height = 1.0;
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.unint64_t width = v10;
  v50.size.unint64_t height = v12;
  if (!CGRectEqualToRect(v50, v52)) {
    goto LABEL_4;
  }
  v53.origin.x = 0.0;
  v53.origin.y = 0.0;
  v53.size.unint64_t width = 1.0;
  v53.size.unint64_t height = 1.0;
  v51.origin.x = v14;
  v51.origin.y = v16;
  v51.size.unint64_t width = v18;
  v51.size.unint64_t height = v20;
  if (CGRectEqualToRect(v51, v53))
  {
    remappedAlphaMask = self->_remappedAlphaMask;
    self->_remappedAlphaMask = 0;

    p_alphaMask = &self->_alphaMask;
  }
  else
  {
LABEL_4:
    [v4 outColorROI];
    double v24 = v23;
    double v26 = v25;
    [v4 inReactionColorSize];
    unint64_t width = (unint64_t)v27;
    [v4 inReactionColorSize];
    unint64_t height = (unint64_t)v29;
    if (width) {
      BOOL v31 = height == 0;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31)
    {
      unint64_t width = self->_colorSize.width;
      unint64_t height = self->_colorSize.height;
    }
    float v32 = v24 * (double)width;
    unint64_t v33 = vcvtas_u32_f32(v32);
    float v34 = v26 * (double)height;
    unint64_t v35 = vcvtas_u32_f32(v34);
    if ((int)v35 * (int)v33 >= 62209)
    {
      float v36 = (float)((int)v35 * (int)v33) / 62208.0;
      unint64_t v33 = (unint64_t)(float)((float)v33 / v36);
      unint64_t v35 = (unint64_t)(float)((float)v35 / v36);
    }
    p_alphaMask = &self->_remappedAlphaMask;
    if ([(MTLTexture *)self->_remappedAlphaMask width] != v33
      || [(MTLTexture *)*p_alphaMask height] != v35)
    {
      uint64_t v37 = [(PTMetalContext *)self->_metalContext textureUtil];
      uint64_t v38 = [v37 createWithWidth:v33 height:v35 pixelFormat:10];
      uint64_t v39 = self->_remappedAlphaMask;
      self->_remappedAlphaMask = v38;

      if (!self->_remappedAlphaMask)
      {
        uint64_t v40 = _PTLogSystem();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[PTVFXSoftAlphaMask lazyInstantiateAlphaMaskForRenderRequest:](v40, v41, v42, v43, v44, v45, v46, v47);
        }
      }
    }
  }
  uint64_t v48 = *p_alphaMask;

  return v48;
}

- (int)updateSoftAlphaMask:(id)a3 inSegmentation:(id)a4 effectRenderRequest:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  LODWORD(a4) = [(PTVFXSoftAlphaMask *)self boxFilter:v9 mask:a4];
  LODWORD(self) = [(PTVFXSoftAlphaMask *)self remapAlphaMask:v9 effectRenderRequest:v8];

  return self | a4;
}

- (int)boxFilter:(id)a3 mask:(id)a4
{
  return [(PTBoxFilter *)self->_boxFilter boxFilter1Channel:a3 inTex:a4 intermediate:self->_intermediateTextureBox outTex:self->_alphaMask kernelWidth:15 outputRemapping:2.0];
}

- (id)debugTextures
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_alphaMask, self->_intermediateTextureBox, self->_remappedAlphaMask, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxFilter, 0);
  objc_storeStrong((id *)&self->_intermediateTextureBox, 0);
  objc_storeStrong((id *)&self->_remappedAlphaMask, 0);
  objc_storeStrong((id *)&self->_alphaMask, 0);
  objc_storeStrong((id *)&self->_remapAlphaMask, 0);
  objc_storeStrong((id *)&self->_disparityToAlphaMask, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lazyInstantiateAlphaMaskForRenderRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
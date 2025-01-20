@interface MTLTelemetryTexture
- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 descriptor:(id)a6 offset:(unint64_t)a7 bytesPerRow:(unint64_t)a8;
- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 descriptor:(id)a5;
- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 descriptor:(id)a5 plane:(unint64_t)a6;
- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 descriptor:(id)a6;
- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6;
- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6 textureType:(unint64_t)a7 levels:(_NSRange)a8 slices:(_NSRange)a9 swizzle:(id)a10;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (void)accumTextureDistribution:(id)a3 category:(unint64_t)a4 pixelFormat:(unint64_t)a5 baseAddr:(unint64_t)a6 rowBytes:(unint64_t)a7 isLinear:(BOOL)a8;
- (void)initMipmapClipType;
@end

@implementation MTLTelemetryTexture

- (void)accumTextureDistribution:(id)a3 category:(unint64_t)a4 pixelFormat:(unint64_t)a5 baseAddr:(unint64_t)a6 rowBytes:(unint64_t)a7 isLinear:(BOOL)a8
{
  int v12 = a4;
  int v15 = [a3 textureType];
  queue = self->_telemetryDevice->queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__MTLTelemetryTexture_accumTextureDistribution_category_pixelFormat_baseAddr_rowBytes_isLinear___block_invoke;
  block[3] = &unk_264E131E8;
  int v18 = v12;
  int v19 = v15;
  block[4] = self;
  block[5] = a3;
  BOOL v20 = a8;
  block[6] = a5;
  block[7] = a7;
  block[8] = a6;
  dispatch_sync(queue, block);
}

uint64_t __96__MTLTelemetryTexture_accumTextureDistribution_category_pixelFormat_baseAddr_rowBytes_isLinear___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88) + 224;
  v67 = (void *)(a1 + 48);
  v3 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>(v2, (unint64_t *)(a1 + 48), (uint64_t)&std::piecewise_construct, &v67)+ 3;
  int v5 = *(_DWORD *)(a1 + 72);
  unsigned int v4 = *(_DWORD *)(a1 + 76);
  unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 80) width];
  if (v6)
  {
    uint64_t v7 = (uint64_t)&v3[192 * v5 + 24 * v4];
    int v10 = *(_DWORD *)(v7 + 40);
    v8 = (_DWORD *)(v7 + 40);
    int v9 = v10;
    v11 = v8 - 4;
    int v12 = v8 - 3;
    if (v10)
    {
      if (*v12 < v6) {
        *int v12 = v6;
      }
      if (*v11 <= v6) {
        goto LABEL_9;
      }
    }
    else
    {
      *int v12 = v6;
    }
    unsigned int *v11 = v6;
LABEL_9:
    uint64_t v13 = (uint64_t)&v3[192 * v5 + 24 * v4];
    *(void *)(v13 + 32) += v6;
    _DWORD *v8 = v9 + 1;
  }
  unsigned int v14 = [*(id *)(*(void *)(a1 + 32) + 80) height];
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v18 = *(_DWORD *)(v15 + 64);
  v16 = (_DWORD *)(v15 + 64);
  int v17 = v18;
  int v19 = v16 - 4;
  BOOL v20 = v16 - 3;
  if (v18)
  {
    if (*v20 < v14) {
      *BOOL v20 = v14;
    }
    if (*v19 <= v14) {
      goto LABEL_18;
    }
  }
  else
  {
    *BOOL v20 = v14;
  }
  *int v19 = v14;
LABEL_18:
  uint64_t v21 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v21 + 56) += v14;
  _DWORD *v16 = v17 + 1;
LABEL_19:
  unsigned int v22 = [*(id *)(*(void *)(a1 + 32) + 80) depth];
  if (!v22) {
    goto LABEL_28;
  }
  uint64_t v23 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v26 = *(_DWORD *)(v23 + 88);
  v24 = (_DWORD *)(v23 + 88);
  int v25 = v26;
  v27 = v24 - 4;
  v28 = v24 - 3;
  if (v26)
  {
    if (*v28 < v22) {
      unsigned int *v28 = v22;
    }
    if (*v27 <= v22) {
      goto LABEL_27;
    }
  }
  else
  {
    unsigned int *v28 = v22;
  }
  unsigned int *v27 = v22;
LABEL_27:
  uint64_t v29 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v29 + 80) += v22;
  _DWORD *v24 = v25 + 1;
LABEL_28:
  unsigned int v30 = [*(id *)(*(void *)(a1 + 32) + 80) mipmapLevelCount];
  if (!v30) {
    goto LABEL_37;
  }
  uint64_t v31 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v34 = *(_DWORD *)(v31 + 112);
  v32 = (_DWORD *)(v31 + 112);
  int v33 = v34;
  v35 = v32 - 4;
  v36 = v32 - 3;
  if (v34)
  {
    if (*v36 < v30) {
      unsigned int *v36 = v30;
    }
    if (*v35 <= v30) {
      goto LABEL_36;
    }
  }
  else
  {
    unsigned int *v36 = v30;
  }
  unsigned int *v35 = v30;
LABEL_36:
  uint64_t v37 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v37 + 104) += v30;
  _DWORD *v32 = v33 + 1;
LABEL_37:
  unsigned int v38 = [*(id *)(*(void *)(a1 + 32) + 80) sampleCount];
  if (!v38) {
    goto LABEL_46;
  }
  uint64_t v39 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v42 = *(_DWORD *)(v39 + 136);
  v40 = (_DWORD *)(v39 + 136);
  int v41 = v42;
  v43 = v40 - 4;
  v44 = v40 - 3;
  if (v42)
  {
    if (*v44 < v38) {
      unsigned int *v44 = v38;
    }
    if (*v43 <= v38) {
      goto LABEL_45;
    }
  }
  else
  {
    unsigned int *v44 = v38;
  }
  unsigned int *v43 = v38;
LABEL_45:
  uint64_t v45 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v45 + 128) += v38;
  _DWORD *v40 = v41 + 1;
LABEL_46:
  unsigned int v46 = [*(id *)(*(void *)(a1 + 32) + 80) arrayLength];
  if (!v46) {
    goto LABEL_55;
  }
  uint64_t v47 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v50 = *(_DWORD *)(v47 + 160);
  v48 = (_DWORD *)(v47 + 160);
  int v49 = v50;
  v51 = v48 - 4;
  v52 = v48 - 3;
  if (v50)
  {
    if (*v52 < v46) {
      unsigned int *v52 = v46;
    }
    if (*v51 <= v46) {
      goto LABEL_54;
    }
  }
  else
  {
    unsigned int *v52 = v46;
  }
  unsigned int *v51 = v46;
LABEL_54:
  uint64_t v53 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v53 + 152) += v46;
  _DWORD *v48 = v49 + 1;
LABEL_55:
  if ([*(id *)(a1 + 40) isFramebufferOnly])
  {
    uint64_t v54 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v54 + 4);
  }
  if (([*(id *)(a1 + 40) usage] & 2) != 0)
  {
    uint64_t v55 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v55 + 8);
  }
  uint64_t result = [*(id *)(a1 + 40) usage];
  if ((result & 4) != 0)
  {
    uint64_t v57 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v57 + 12);
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v58 = *(void *)(a1 + 56);
    if (!v58) {
      goto LABEL_71;
    }
    uint64_t v59 = (uint64_t)&v3[192 * v5 + 24 * v4];
    int v62 = *(_DWORD *)(v59 + 184);
    v60 = (_DWORD *)(v59 + 184);
    int v61 = v62;
    v63 = v60 - 4;
    v64 = v60 - 3;
    if (v62)
    {
      if (*v64 < v58) {
        _DWORD *v64 = v58;
      }
      if (*v63 <= v58) {
        goto LABEL_70;
      }
    }
    else
    {
      _DWORD *v64 = v58;
    }
    _DWORD *v63 = v58;
LABEL_70:
    uint64_t v65 = (uint64_t)&v3[192 * v5 + 24 * v4];
    *(void *)(v65 + 176) += v58;
    _DWORD *v60 = v61 + 1;
LABEL_71:
    if (((*(_DWORD *)(a1 + 64) | v58) & 0x3FLL) != 0)
    {
      uint64_t v66 = (uint64_t)&v3[192 * v5 + 24 * v4];
      ++*(_DWORD *)(v66 + 16);
    }
  }
  ++LODWORD(v3[192 * v5 + 24 * v4]);
  return result;
}

- (void)initMipmapClipType
{
  unint64_t v3 = [(MTLToolsTexture *)self width];
  if (v3 <= [(MTLToolsTexture *)self height]) {
    unint64_t v4 = [(MTLToolsTexture *)self height];
  }
  else {
    unint64_t v4 = [(MTLToolsTexture *)self width];
  }
  if (v4 <= [(MTLToolsTexture *)self depth])
  {
    [(MTLToolsTexture *)self depth];
  }
  else
  {
    unint64_t v5 = [(MTLToolsTexture *)self width];
    if (v5 <= [(MTLToolsTexture *)self height]) {
      [(MTLToolsTexture *)self height];
    }
    else {
      [(MTLToolsTexture *)self width];
    }
  }
  unint64_t v6 = _mtlNumMipmapLevelsForSize();
  if (v6 <= [(MTLToolsTexture *)self mipmapLevelCount])
  {
    self->mipmapClipType = 0;
  }
  else
  {
    if ([(MTLToolsTexture *)self mipmapLevelCount] < 2)
    {
      if ([(MTLToolsTexture *)self parentRelativeLevel]) {
        unint64_t v7 = 2;
      }
      else {
        unint64_t v7 = 1;
      }
    }
    else
    {
      unint64_t v7 = 3;
    }
    self->mipmapClipType = v7;
  }
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 descriptor:(id)a6 offset:(unint64_t)a7 bytesPerRow:(unint64_t)a8
{
  v16.receiver = self;
  v16.super_class = (Class)MTLTelemetryTexture;
  unsigned int v14 = -[MTLToolsTexture initWithBaseObject:parent:buffer:](&v16, sel_initWithBaseObject_parent_buffer_);
  if (v14)
  {
    v14->_telemetryDescriptor = (MTLTextureDescriptor *)[a6 copy];
    v14->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if ([a4 enableTelemetry])
    {
      [(MTLTelemetryTexture *)v14 initMipmapClipType];
      -[MTLTelemetryTexture accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:](v14, "accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:", a3, 1, [a3 pixelFormat], objc_msgSend(a5, "contents") + a7, a8, 1);
    }
  }
  return v14;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 descriptor:(id)a5 plane:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)MTLTelemetryTexture;
  int v9 = -[MTLToolsResource initWithBaseObject:parent:](&v14, sel_initWithBaseObject_parent_, a3, a4, a5, a6);
  if (v9)
  {
    v9->_telemetryDescriptor = (MTLTextureDescriptor *)[a5 copy];
    v9->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if ([a4 enableTelemetry])
    {
      [(MTLTelemetryTexture *)v9 initMipmapClipType];
      int v10 = (__IOSurface *)objc_msgSend(-[MTLToolsObject baseObject](v9, "baseObject"), "iosurface");
      uint64_t v11 = [a3 pixelFormat];
      BaseAddress = IOSurfaceGetBaseAddress(v10);
      [(MTLTelemetryTexture *)v9 accumTextureDistribution:a3 category:3 pixelFormat:v11 baseAddr:BaseAddress rowBytes:IOSurfaceGetBytesPerRow(v10) isLinear:1];
    }
  }
  return v9;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v8 = [(MTLTelemetryTexture *)self initWithBaseTexture:a3 device:a4 descriptor:a5 plane:0];
  if (v8)
  {
    v8->_telemetryDescriptor = (MTLTextureDescriptor *)[a5 copy];
    v8->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if ([a4 enableTelemetry])
    {
      [(MTLTelemetryTexture *)v8 initMipmapClipType];
      -[MTLTelemetryTexture accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:](v8, "accumTextureDistribution:category:pixelFormat:baseAddr:rowBytes:isLinear:", a3, 0, [a3 pixelFormat], 0, 0, 0);
    }
  }
  return v8;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 descriptor:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryTexture;
  v8 = [(MTLToolsTexture *)&v10 initWithBaseObject:a3 parent:a4 parentTexture:a5];
  if (v8)
  {
    v8->_telemetryDescriptor = (MTLTextureDescriptor *)[a6 copy];
    v8->_telemetryDevice = (MTLTelemetryDevice *)a4;
    if ([a4 enableTelemetry]) {
      [(MTLTelemetryTexture *)v8 initMipmapClipType];
    }
  }
  return v8;
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6
{
  return [(MTLTelemetryTexture *)self initWithBaseTexture:a3 device:a4 texture:a5 descriptor:self->_telemetryDescriptor];
}

- (MTLTelemetryTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6 textureType:(unint64_t)a7 levels:(_NSRange)a8 slices:(_NSRange)a9 swizzle:(id)a10
{
  objc_super v14 = [(MTLTelemetryTexture *)self initWithBaseTexture:a3 device:a4 texture:a5 descriptor:self->_telemetryDescriptor];
  if (v14 && [a4 enableTelemetry])
  {
    queue = v14->_telemetryDevice->queue;
    if (a7 - 5 >= 2) {
      NSUInteger length = a9.length;
    }
    else {
      NSUInteger length = a9.length / 6;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__MTLTelemetryTexture_initWithBaseTexture_device_texture_pixelFormat_textureType_levels_slices_swizzle___block_invoke;
    block[3] = &unk_264E13210;
    int v20 = 2;
    int v21 = a7;
    block[6] = a6;
    block[7] = length;
    _NSRange v19 = a9;
    block[4] = v14;
    block[5] = a5;
    dispatch_sync(queue, block);
  }
  return v14;
}

uint64_t __104__MTLTelemetryTexture_initWithBaseTexture_device_texture_pixelFormat_textureType_levels_slices_swizzle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88) + 224;
  v60 = (void *)(a1 + 48);
  unint64_t v3 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryTextureDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>(v2, (unint64_t *)(a1 + 48), (uint64_t)&std::piecewise_construct, &v60)+ 3;
  int v5 = *(_DWORD *)(a1 + 80);
  unsigned int v4 = *(_DWORD *)(a1 + 84);
  unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 80) width];
  if (v6)
  {
    uint64_t v7 = (uint64_t)&v3[192 * v5 + 24 * v4];
    int v10 = *(_DWORD *)(v7 + 40);
    v8 = (_DWORD *)(v7 + 40);
    int v9 = v10;
    uint64_t v11 = v8 - 4;
    int v12 = v8 - 3;
    if (v10)
    {
      if (*v12 < v6) {
        *int v12 = v6;
      }
      if (*v11 <= v6) {
        goto LABEL_9;
      }
    }
    else
    {
      *int v12 = v6;
    }
    unsigned int *v11 = v6;
LABEL_9:
    uint64_t v13 = (uint64_t)&v3[192 * v5 + 24 * v4];
    *(void *)(v13 + 32) += v6;
    _DWORD *v8 = v9 + 1;
  }
  unsigned int v14 = [*(id *)(*(void *)(a1 + 32) + 80) height];
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v18 = *(_DWORD *)(v15 + 64);
  objc_super v16 = (_DWORD *)(v15 + 64);
  int v17 = v18;
  _NSRange v19 = v16 - 4;
  int v20 = v16 - 3;
  if (v18)
  {
    if (*v20 < v14) {
      *int v20 = v14;
    }
    if (*v19 <= v14) {
      goto LABEL_18;
    }
  }
  else
  {
    *int v20 = v14;
  }
  *_NSRange v19 = v14;
LABEL_18:
  uint64_t v21 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v21 + 56) += v14;
  _DWORD *v16 = v17 + 1;
LABEL_19:
  unsigned int v22 = [*(id *)(*(void *)(a1 + 32) + 80) depth];
  if (!v22) {
    goto LABEL_28;
  }
  uint64_t v23 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v26 = *(_DWORD *)(v23 + 88);
  v24 = (_DWORD *)(v23 + 88);
  int v25 = v26;
  v27 = v24 - 4;
  v28 = v24 - 3;
  if (v26)
  {
    if (*v28 < v22) {
      unsigned int *v28 = v22;
    }
    if (*v27 <= v22) {
      goto LABEL_27;
    }
  }
  else
  {
    unsigned int *v28 = v22;
  }
  unsigned int *v27 = v22;
LABEL_27:
  uint64_t v29 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v29 + 80) += v22;
  _DWORD *v24 = v25 + 1;
LABEL_28:
  uint64_t v30 = *(void *)(a1 + 56);
  if (!v30) {
    goto LABEL_37;
  }
  uint64_t v31 = *(void *)(a1 + 56);
  uint64_t v32 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v35 = *(_DWORD *)(v32 + 112);
  int v33 = (_DWORD *)(v32 + 112);
  int v34 = v35;
  v36 = v33 - 4;
  uint64_t v37 = v33 - 3;
  if (v35)
  {
    if (*v37 < v30) {
      *uint64_t v37 = v30;
    }
    if (*v36 <= v30) {
      goto LABEL_36;
    }
  }
  else
  {
    *uint64_t v37 = v30;
  }
  _DWORD *v36 = v30;
LABEL_36:
  uint64_t v38 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v38 + 104) += v31;
  *int v33 = v34 + 1;
LABEL_37:
  unsigned int v39 = [*(id *)(*(void *)(a1 + 32) + 80) sampleCount];
  if (!v39) {
    goto LABEL_46;
  }
  uint64_t v40 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v43 = *(_DWORD *)(v40 + 136);
  int v41 = (_DWORD *)(v40 + 136);
  int v42 = v43;
  v44 = v41 - 4;
  uint64_t v45 = v41 - 3;
  if (v43)
  {
    if (*v45 < v39) {
      *uint64_t v45 = v39;
    }
    if (*v44 <= v39) {
      goto LABEL_45;
    }
  }
  else
  {
    *uint64_t v45 = v39;
  }
  unsigned int *v44 = v39;
LABEL_45:
  uint64_t v46 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v46 + 128) += v39;
  *int v41 = v42 + 1;
LABEL_46:
  uint64_t v47 = *(void *)(a1 + 72);
  if (!v47) {
    goto LABEL_55;
  }
  uint64_t v48 = *(void *)(a1 + 72);
  uint64_t v49 = (uint64_t)&v3[192 * v5 + 24 * v4];
  int v52 = *(_DWORD *)(v49 + 160);
  int v50 = (_DWORD *)(v49 + 160);
  int v51 = v52;
  uint64_t v53 = v50 - 4;
  uint64_t v54 = v50 - 3;
  if (v52)
  {
    if (*v54 < v47) {
      *uint64_t v54 = v47;
    }
    if (*v53 <= v47) {
      goto LABEL_54;
    }
  }
  else
  {
    *uint64_t v54 = v47;
  }
  *uint64_t v53 = v47;
LABEL_54:
  uint64_t v55 = (uint64_t)&v3[192 * v5 + 24 * v4];
  *(void *)(v55 + 152) += v48;
  *int v50 = v51 + 1;
LABEL_55:
  if ([*(id *)(a1 + 40) isFramebufferOnly])
  {
    uint64_t v56 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v56 + 4);
  }
  if (([*(id *)(a1 + 40) usage] & 2) != 0)
  {
    uint64_t v57 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v57 + 8);
  }
  uint64_t result = [*(id *)(a1 + 40) usage];
  if ((result & 4) != 0)
  {
    uint64_t v59 = (uint64_t)&v3[192 * v5 + 24 * v4];
    ++*(_DWORD *)(v59 + 12);
  }
  ++LODWORD(v3[192 * v5 + 24 * v4]);
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureViewWithPixelFormat:", a3);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:", v6, -[MTLToolsObject device](self, "device"), self, a3, [v6 textureType], 0, objc_msgSend(v6, "arrayLength"), 0, 0, 84148994);

    return v7;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v8 = a5.length;
  NSUInteger v9 = a5.location;
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, a5.location, a5.length, a6.location, a6.length);
  if (result)
  {
    id v14 = result;
    uint64_t v15 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:", result, [(MTLToolsObject *)self device], self, a3, a4, v9, v8, location, length, 84148994);

    return v15;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v9 = a5.length;
  NSUInteger v10 = a5.location;
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7);
  if (result)
  {
    id v15 = result;
    objc_super v16 = -[MTLTelemetryTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:swizzle:", result, [(MTLToolsObject *)self device], self, a3, a4, v10, v9, location, length, *(unsigned int *)&a7);

    return v16;
  }
  return result;
}

@end
@interface MTLDebugResourceStateCommandEncoder
- (BOOL)checkEncoderState;
- (MTLDebugResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (id).cxx_construct;
- (void)_setDefaults;
- (void)dealloc;
- (void)endEncoding;
- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)updateFence:(id)a3;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7;
- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8;
- (void)validateSparseTextureMappingMode:(unint64_t)a3;
- (void)validateTextureAccess:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)waitForFence:(id)a3;
@end

@implementation MTLDebugResourceStateCommandEncoder

- (void)_setDefaults
{
  *(&self->hasEndedEncoding + 2) = 0;
  *(&self->hasEndedEncoding + 3) = 0;
  *(&self->hasEndedEncoding + 4) = 0;
  p_updatedFences = &self->updatedFences;
  var0 = (void **)self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  unint64_t v5 = (char *)var1 - (char *)var0;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      v6 = p_updatedFences->__map_.var1;
      var0 = (void **)(p_updatedFences->__map_.var0 + 1);
      p_updatedFences->__map_.var0 = (__end_ ***)var0;
      unint64_t v5 = (char *)v6 - (char *)var0;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    uint64_t v7 = 256;
  }
  else
  {
    if (v5 >> 3 != 2) {
      return;
    }
    uint64_t v7 = 512;
  }
  p_updatedFences->__start_ = v7;
}

- (MTLDebugResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugResourceStateCommandEncoder;
  uint64_t v7 = -[MTLToolsResourceStateCommandEncoder initWithResourceStateCommandEncoder:parent:descriptor:](&v11, sel_initWithResourceStateCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    [(MTLDebugResourceStateCommandEncoder *)v7 _setDefaults];
    if (a5)
    {
      for (uint64_t i = 0; i != 4; ++i)
        objc_msgSend(a4, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
    }
  }
  return v8;
}

- (void)dealloc
{
  p_updatedFences = &self->updatedFences;
  var0 = (void **)self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  unint64_t v6 = (char *)var1 - (char *)var0;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      uint64_t v7 = p_updatedFences->__map_.var1;
      var0 = (void **)(p_updatedFences->__map_.var0 + 1);
      p_updatedFences->__map_.var0 = (__end_ ***)var0;
      unint64_t v6 = (char *)v7 - (char *)var0;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    uint64_t v8 = 256;
  }
  else
  {
    if (v6 >> 3 != 2) {
      goto LABEL_8;
    }
    uint64_t v8 = 512;
  }
  p_updatedFences->__start_ = v8;
LABEL_8:
  if (*(&self->hasEndedEncoding + 2))
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugResourceStateCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugResourceStateCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
    MTLReportFailure();
  }
}

- (BOOL)checkEncoderState
{
  return !*(&self->hasEndedEncoding + 4);
}

- (void)validateSparseTextureMappingMode:(unint64_t)a3
{
  if (a3 >= 2) {
    MTLReportFailure();
  }
}

- (void)validateTextureAccess:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v11 = [a3 arrayLength];
  uint64_t v12 = [(id)v9 textureType];
  uint64_t v13 = 6;
  if ((unint64_t)(v12 - 5) >= 2) {
    uint64_t v13 = 1;
  }
  if (v13 * v11 <= a6)
  {
    unint64_t v24 = a6;
    uint64_t v26 = [(id)v9 arrayLength];
    MTLReportFailure();
  }
  unint64_t v14 = objc_msgSend((id)v9, "mipmapLevelCount", v24, v26) - 1;
  if (v14 >= [(id)v9 firstMipmapInTail]) {
    unint64_t v15 = [(id)v9 firstMipmapInTail];
  }
  else {
    unint64_t v15 = [(id)v9 mipmapLevelCount] - 1;
  }
  if (v15 < a5)
  {
    unint64_t v22 = [(id)v9 mipmapLevelCount] - 1;
    if (v22 >= [(id)v9 firstMipmapInTail]) {
      uint64_t v23 = [(id)v9 firstMipmapInTail];
    }
    else {
      uint64_t v23 = [(id)v9 mipmapLevelCount] - 1;
    }
    unint64_t v25 = a5;
    uint64_t v27 = v23;
    MTLReportFailure();
  }
  unint64_t device = (unint64_t)self->super.super.super._device;
  objc_msgSend((id)v9, "pixelFormat", v25, v27);
  [(id)v9 width];
  [(id)v9 height];
  [(id)v9 depth];
  [(id)v9 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (!v9)
  {
    MTLReleaseAssertionFailure();
LABEL_21:
    MTLReportFailure();
    goto LABEL_13;
  }
  v17 = (void *)[(id)v9 device];
  uint64_t v18 = [(id)v9 textureType];
  uint64_t v19 = [(id)v9 pixelFormat];
  uint64_t v20 = [(id)v9 sampleCount];
  if (v17) {
    [v17 sparseTileSizeWithTextureType:v18 pixelFormat:v19 sampleCount:v20];
  }
  unint64_t v9 = 0;
  unint64_t device = -1;
  a5 = 0xFFFFFFFFFFFFFFFFLL / 0;
  if (a4->var1.var0 + a4->var0.var0 > 0xFFFFFFFFFFFFFFFFLL / 0) {
    goto LABEL_21;
  }
LABEL_13:
  unint64_t v21 = device / v9;
  if (a4->var1.var1 + a4->var0.var1 > a5) {
    MTLReportFailure();
  }
  if (a4->var1.var2 + a4->var0.var2 > v21) {
    MTLReportFailure();
  }
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  if (![(MTLDebugResourceStateCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  if ([a3 isSparse])
  {
    if (!a8) {
      goto LABEL_11;
    }
  }
  else
  {
    MTLReportFailure();
    if (!a8) {
      goto LABEL_11;
    }
  }
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  do
  {
    unint64_t v17 = a6[v15];
    if (v17 > [a3 firstMipmapInTail])
    {
      unint64_t v21 = a6[v15];
      uint64_t v22 = [a3 firstMipmapInTail];
      unint64_t v20 = v16;
      MTLReportFailure();
    }
    uint64_t v18 = &a5[v15];
    long long v19 = *(_OWORD *)&v18->var0.var2;
    v23[0] = *(_OWORD *)&v18->var0.var0;
    v23[1] = v19;
    v23[2] = *(_OWORD *)&v18->var1.var1;
    -[MTLDebugResourceStateCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v23, a6[v15], a7[v15], v20, v21, v22);
    [(MTLDebugResourceStateCommandEncoder *)self validateSparseTextureMappingMode:a4];
    unint64_t v15 = (v16 + 1);
    unint64_t v16 = v15;
  }
  while (v15 < a8);
LABEL_11:
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7, a8);
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  if (![(MTLDebugResourceStateCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  if (([a3 isSparse] & 1) == 0) {
    MTLReportFailure();
  }
  if ([a3 firstMipmapInTail] < a6)
  {
    unint64_t v17 = a6;
    uint64_t v18 = [a3 firstMipmapInTail];
    MTLReportFailure();
  }
  long long v13 = *(_OWORD *)&a5->var0.var2;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v13;
  v20[2] = *(_OWORD *)&a5->var1.var1;
  -[MTLDebugResourceStateCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v20, a6, a7, v17, v18);
  [(MTLDebugResourceStateCommandEncoder *)self validateSparseTextureMappingMode:a4];
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a3 retained:1 purgeable:1];
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  long long v16 = *(_OWORD *)&a5->var0.var2;
  v19[0] = *(_OWORD *)&a5->var0.var0;
  v19[1] = v16;
  v19[2] = *(_OWORD *)&a5->var1.var1;
  [v14 updateTextureMapping:v15 mode:a4 region:v19 mipLevel:a6 slice:a7];
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  if (![(MTLDebugResourceStateCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  if (([a3 isSparse] & 1) == 0) {
    MTLReportFailure();
  }
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a3 retained:1 purgeable:1];
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a5 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (![(MTLDebugResourceStateCommandEncoder *)self checkEncoderState]) {
    _MTLMessageContextPush_();
  }
  if (([a3 isSparse] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (([a8 isSparse] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  uint64_t v16 = [a8 pixelFormat];
  if (v16 != [a3 pixelFormat]) {
    _MTLMessageContextPush_();
  }
  uint64_t v17 = [a3 heap];
  if (v17 != [a8 heap]) {
    _MTLMessageContextPush_();
  }
  uint64_t v18 = [a3 sampleCount];
  if (v18 != [a8 sampleCount])
  {
    uint64_t v31 = [a3 sampleCount];
    uint64_t v37 = [a8 sampleCount];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", v31, v37) <= a5)
  {
    unint64_t v32 = a5;
    uint64_t v38 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v19 = objc_msgSend(a3, "numFaces", v32, v38);
  if ([a3 arrayLength] * v19 <= a4)
  {
    uint64_t v29 = [a3 numFaces];
    unint64_t v33 = a4;
    uint64_t v39 = [a3 arrayLength] * v29;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "mipmapLevelCount", v33, v39) <= a10)
  {
    unint64_t v34 = a10;
    uint64_t v40 = [a8 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v20 = objc_msgSend(a8, "numFaces", v34, v40);
  if ([a8 arrayLength] * v20 <= a9)
  {
    uint64_t v30 = [a8 numFaces];
    unint64_t v35 = a9;
    uint64_t v41 = [a8 arrayLength] * v30;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "firstMipmapInTail", v35, v41) < a10)
  {
    unint64_t v36 = a10;
    uint64_t v42 = [a8 firstMipmapInTail];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "firstMipmapInTail", v36, v42) < a5)
  {
    [a3 firstMipmapInTail];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  unint64_t var2 = a6->var2;
  long long v53 = *(_OWORD *)&a6->var0;
  *(_OWORD *)&v54[8] = *(_OWORD *)&a7->var0;
  unint64_t v22 = a7->var2;
  *(void *)v54 = var2;
  *(void *)&v54[24] = v22;
  v52[0] = v53;
  v52[1] = *(_OWORD *)v54;
  v52[2] = *(_OWORD *)&v54[16];
  [(MTLDebugResourceStateCommandEncoder *)self validateTextureAccess:a3 region:v52 mipLevel:a5 slice:a4];
  unint64_t v23 = a11->var2;
  long long v24 = *(_OWORD *)&a11->var0;
  *(_OWORD *)&v51[8] = *(_OWORD *)&a7->var0;
  unint64_t v25 = a7->var2;
  *(void *)v51 = v23;
  *(void *)&v51[24] = v25;
  v50[0] = v24;
  v50[1] = *(_OWORD *)v51;
  v50[2] = *(_OWORD *)&v51[16];
  v50[3] = v24;
  [(MTLDebugResourceStateCommandEncoder *)self validateTextureAccess:a8 region:v50 mipLevel:a10 slice:a9];
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a3 retained:1 purgeable:1];
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a8 retained:1 purgeable:1];
  id v26 = [(MTLToolsObject *)self baseObject];
  uint64_t v27 = [a3 baseObject];
  long long v48 = *(_OWORD *)&a6->var0;
  unint64_t v49 = a6->var2;
  long long v46 = *(_OWORD *)&a7->var0;
  unint64_t v47 = a7->var2;
  uint64_t v28 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v45 = *a11;
  [v26 moveTextureMappingsFromTexture:v27 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v48 sourceSize:&v46 toTexture:v28 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v45];
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)updateFence:(id)a3
{
  id v5 = a3;
  std::deque<objc_object *>::push_back(&self->updatedFences.__map_.__first_, &v5);
  *(&self->hasEndedEncoding + 3) = 1;
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", objc_msgSend(a3, "baseObject"));
}

- (void)waitForFence:(id)a3
{
  p_updatedFences = &self->updatedFences;
  unint64_t value = self->updatedFences.__size_.__value_;
  if (value)
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      if ((*(__end_ ***)((char *)p_updatedFences->__map_.var0
                        + (((p_updatedFences->__start_ + v7) >> 6) & 0x3FFFFFFFFFFFFF8)))[(p_updatedFences->__start_
                                                                                           + v7) & 0x1FF] == a3)
      {
        MTLReportFailure();
        unint64_t value = p_updatedFences->__size_.__value_;
      }
      uint64_t v7 = v8;
    }
    while (value > v8++);
  }
  *(&self->hasEndedEncoding + 3) = 1;
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addObject:a3 retained:1 purgeable:0];
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  [v10 waitForFence:v11];
}

- (void)endEncoding
{
  if (*(&self->hasEndedEncoding + 4)) {
    MTLReportFailure();
  }
  if (!*(&self->hasEndedEncoding + 3)) {
    MTLReportFailure();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugResourceStateCommandEncoder;
  [(MTLToolsCommandEncoder *)&v3 endEncoding];
  *(&self->hasEndedEncoding + 4) = 1;
  *(&self->hasEndedEncoding + 2) = 1;
  *(&self->hasEndedEncoding + 3) = 0;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

@end
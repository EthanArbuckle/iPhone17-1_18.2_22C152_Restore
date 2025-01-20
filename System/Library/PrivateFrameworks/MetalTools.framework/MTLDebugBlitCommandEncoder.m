@interface MTLDebugBlitCommandEncoder
- (MTLDebugBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (id).cxx_construct;
- (void)_setDefaults;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6;
- (void)dealloc;
- (void)endEncoding;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)generateMipmapsForTexture:(id)a3;
- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9;
- (void)internalValidateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)invalidateCompressedTexture:(id)a3;
- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)updateFence:(id)a3;
- (void)validateCopyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12 move:(BOOL)a13;
- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceSize:(id *)a6 toTexture:(id)a7 destinationSlice:(unint64_t)a8 destinationLevel:(unint64_t)a9 options:(unint64_t)a10 sliceCount:(unint64_t)a11 levelCount:(unint64_t)a12;
- (void)validateTextureAccess:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)waitForFence:(id)a3;
@end

@implementation MTLDebugBlitCommandEncoder

- (void)_setDefaults
{
  *(&self->hasEndEncoding + 2) = 0;
  *(&self->hasEndEncoding + 3) = 0;
  *(&self->hasEndEncoding + 4) = 0;
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

- (MTLDebugBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugBlitCommandEncoder;
  uint64_t v7 = -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](&v11, sel_initWithBlitCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_commandBuffer = (MTLDebugCommandBuffer *)a4;
    [(MTLDebugBlitCommandEncoder *)v7 _setDefaults];
    if (a5)
    {
      for (uint64_t i = 0; i != 4; ++i)
        -[MTLDebugCommandBuffer addObject:retained:purgeable:](v8->_commandBuffer, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
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
  if (*(&self->hasEndEncoding + 2))
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugBlitCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugBlitCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
    MTLReportFailure();
  }
}

- (void)internalValidateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  memset(&v57, 0, sizeof(v57));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  unint64_t v19 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  if ((~(_BYTE)a12 & 3) == 0) {
    _MTLMessageContextPush_();
  }
  validateMTLBlitOption(a12 & 0xFFFFFFFF9FFFFFFFLL, &v57);
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  if (a3)
  {
    if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 conformsToProtocol:&unk_26EF9C6F8]) {
      goto LABEL_12;
    }
    unint64_t device = (unint64_t)self->super.super.super._device;
    if (device != [a3 device]) {
      _MTLMessageContextPush_();
    }
    if ([a3 storageMode] != 3)
    {
LABEL_12:
      if (a8) {
        goto LABEL_13;
      }
LABEL_167:
      _MTLMessageContextPush_();
      goto LABEL_19;
    }
  }
  _MTLMessageContextPush_();
  if (!a8) {
    goto LABEL_167;
  }
LABEL_13:
  if (([a8 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a8 conformsToProtocol:&unk_26EF9C6F8])
  {
    v20 = self->super.super.super._device;
    if (v20 != (MTLToolsDevice *)[a8 device]) {
      _MTLMessageContextPush_();
    }
    if ([a8 storageMode] == 3) {
      goto LABEL_167;
    }
  }
LABEL_19:
  if (!(a7->var1 * a7->var0 * a7->var2))
  {
    unint64_t var2 = a7->var2;
    uint64_t v50 = 0;
    unint64_t var0 = a7->var0;
    unint64_t var1 = a7->var1;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (a3 && a8)
  {
    v52 = a6;
    a6 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)a7->var0;
    unint64_t device = a7->var1;
    unint64_t v19 = a7->var2;
    memset(&v57, 0, sizeof(v57));
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    v51 = self;
    validateBlitProtectionOptions([(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions], a3, a8, @"texture");
    v21 = (unint64_t *)((char *)a3 + 72);
    v55 = (char *)a8 + 72;
    uint64_t v22 = [a3 pixelFormat];
    v53 = (char *)a3 + 72;
    if (v22 == [a8 pixelFormat]) {
      goto LABEL_72;
    }
    int v23 = *((_DWORD *)a3 + 20);
    if ((v23 & 0x20) != 0 && (*((unsigned char *)a8 + 80) & 0x20) != 0
      || (v23 & 0x40) != 0 && (*((unsigned char *)a8 + 80) & 0x40) != 0)
    {
      if (*((void *)a3 + 11) == *((void *)a8 + 11)) {
        goto LABEL_72;
      }
      unint64_t var0 = *v21;
      unint64_t var1 = *(void *)v55;
      goto LABEL_71;
    }
    v24 = (unint64_t *)((char *)a3 + 72);
    if ((v23 & 0x20) == 0)
    {
      if ((*((unsigned char *)a8 + 80) & 0x20) != 0) {
        v24 = (unint64_t *)((char *)a8 + 72);
      }
      else {
        v24 = 0;
      }
    }
    v25 = (unint64_t *)((char *)a3 + 72);
    if ((v23 & 0x40) == 0)
    {
      if ((*((unsigned char *)a8 + 80) & 0x40) != 0) {
        v25 = (unint64_t *)((char *)a8 + 72);
      }
      else {
        v25 = 0;
      }
    }
    if (v24)
    {
      if (!v25 || v24 == v25)
      {
        v26 = v21 == v24 ? (char *)a8 + 72 : (char *)a3 + 72;
        if ((v26[9] & 4) == 0)
        {
          uint64_t v27 = v24[3];
          if (v27 != 2) {
            uint64_t v27 = 4;
          }
          if (v27 == *((void *)v26 + 3))
          {
LABEL_72:
            uint64_t v34 = objc_msgSend(a3, "sampleCount", var0, var1, var2, v50);
            if (v34 == [a8 sampleCount]) {
              goto LABEL_73;
            }
            goto LABEL_165;
          }
        }
      }
      goto LABEL_70;
    }
    if (v25)
    {
      if (v21 == v25) {
        v28 = (char *)a8 + 72;
      }
      else {
        v28 = (char *)a3 + 72;
      }
      if ((v28[9] & 4) == 0 && *((void *)v28 + 3) == 1) {
        goto LABEL_72;
      }
      goto LABEL_70;
    }
    uint64_t v29 = *((void *)a3 + 11);
    uint64_t v30 = *((void *)a8 + 11);
    int v31 = *((_DWORD *)a8 + 20);
    if ((v23 & 0x400) != 0)
    {
      v32 = (unint64_t *)((char *)a3 + 72);
      if ((v31 & 0x400) != 0) {
        goto LABEL_69;
      }
    }
    else if ((v31 & 0x400) != 0)
    {
      v32 = (unint64_t *)((char *)a8 + 72);
    }
    else
    {
      v32 = 0;
    }
    if (v29 != v30 && v32)
    {
      if (v21 == v32) {
        v33 = (char *)a8 + 72;
      }
      else {
        v33 = (char *)a3 + 72;
      }
      if (*((void *)v33 + 3) == v32[3])
      {
        if (v21 == v32)
        {
          a6 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)((unint64_t)a6 / *((void *)a3 + 13));
          device /= *((void *)a3 + 14);
          v19 /= *((void *)a3 + 15);
        }
        else
        {
          a6 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)(v32[4] * (void)a6);
          device *= v32[5];
          v19 *= v32[6];
        }
        goto LABEL_72;
      }
      goto LABEL_70;
    }
LABEL_69:
    if (v29 == v30) {
      goto LABEL_72;
    }
LABEL_70:
    unint64_t var0 = *v21;
    unint64_t var1 = *(void *)v55;
LABEL_71:
    _MTLMessageContextPush_();
    goto LABEL_72;
  }
  MTLReleaseAssertionFailure();
LABEL_165:
  unint64_t var0 = objc_msgSend(a3, "sampleCount", var0);
  uint64_t v45 = [a8 sampleCount];
  _MTLMessageContextPush_();
LABEL_73:
  if (objc_msgSend(a3, "isFramebufferOnly", var0, v45)) {
    _MTLMessageContextPush_();
  }
  if ([a8 isFramebufferOnly]) {
    _MTLMessageContextPush_();
  }
  v54 = a6;
  if ([a3 mipmapLevelCount] <= a5)
  {
    unint64_t v41 = a5;
    uint64_t v46 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v35 = objc_msgSend(a3, "numFaces", v41, v46);
  if ([a3 arrayLength] * v35 <= a4)
  {
    uint64_t v39 = [a3 numFaces];
    unint64_t v42 = a4;
    uint64_t v47 = [a3 arrayLength] * v39;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "mipmapLevelCount", v42, v47) <= a10)
  {
    unint64_t v43 = a10;
    uint64_t v48 = [a8 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v36 = objc_msgSend(a8, "numFaces", v43, v48);
  if ([a8 arrayLength] * v36 <= a9)
  {
    [a8 numFaces];
    [a8 arrayLength];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [a3 pixelFormat];
  [a3 width];
  [a3 height];
  [a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  [a8 pixelFormat];
  [a8 width];
  [a8 height];
  [a8 depth];
  [a8 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  _MTLAdjustMTLSize();
  _MTLAdjustMTLSize();
  memset(&v57, 0, sizeof(v57));
  [(MTLToolsObject *)v51 device];
  _MTLMessageContextBegin_();
  unint64_t v37 = v52->var0;
  if ((v53[9] & 4) != 0)
  {
    if (v37) {
      _MTLMessageContextPush_();
    }
    if (v52->var1) {
      _MTLMessageContextPush_();
    }
    if (v52->var2) {
      goto LABEL_168;
    }
  }
  else
  {
    if (a7->var0 + v37) {
      _MTLMessageContextPush_();
    }
    if (a7->var1 + v52->var1) {
      _MTLMessageContextPush_();
    }
    if (a7->var2 + v52->var2) {
LABEL_168:
    }
      _MTLMessageContextPush_();
  }
  unint64_t v38 = a11->var0;
  if ((v55[9] & 4) != 0)
  {
    if (v38) {
      _MTLMessageContextPush_();
    }
    if (a11->var1) {
      _MTLMessageContextPush_();
    }
    if (a11->var2) {
      goto LABEL_169;
    }
  }
  else
  {
    if (($F99D9A4FB75BC57F3386B8DC8EE08D7A *)((char *)v54 + v38)) {
      _MTLMessageContextPush_();
    }
    if (a11->var1 + device) {
      _MTLMessageContextPush_();
    }
    if (a11->var2 + v19) {
LABEL_169:
    }
      _MTLMessageContextPush_();
  }
  if ((v53[9] & 4) != 0)
  {
    if (v52->var0 % *((void *)v53 + 4)) {
      _MTLMessageContextPush_();
    }
    if (v52->var1 % *((void *)v53 + 5)) {
      _MTLMessageContextPush_();
    }
    if (v52->var2 % *((void *)v53 + 6)) {
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)v53 + 4)) {
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)v53 + 5)) {
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)v53 + 6)) {
      _MTLMessageContextPush_();
    }
  }
  if ((v55[9] & 4) != 0)
  {
    if (a11->var0 % *((void *)v55 + 4)) {
      _MTLMessageContextPush_();
    }
    if (a11->var1 % *((void *)v55 + 5)) {
      _MTLMessageContextPush_();
    }
    if (a11->var2 % *((void *)v55 + 6)) {
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)v55 + 4)) {
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)v55 + 5)) {
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)v55 + 6)) {
      _MTLMessageContextPush_();
    }
  }
  if ((v53[9] & 0x20) != 0 || (v55[9] & 0x20) != 0)
  {
    if (v52->var0) {
      _MTLMessageContextPush_();
    }
    if (v52->var1) {
      _MTLMessageContextPush_();
    }
    if (v52->var2) {
      _MTLMessageContextPush_();
    }
    if (a7->var0) {
      _MTLMessageContextPush_();
    }
    if (a7->var1) {
      _MTLMessageContextPush_();
    }
    if (a7->var2) {
      _MTLMessageContextPush_();
    }
    if (a11->var0) {
      _MTLMessageContextPush_();
    }
    if (a11->var1) {
      _MTLMessageContextPush_();
    }
    if (a11->var2) {
      _MTLMessageContextPush_();
    }
    if (v54) {
      _MTLMessageContextPush_();
    }
    if (device) {
      _MTLMessageContextPush_();
    }
    if (v19) {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
}

- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12 move:(BOOL)a13
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v18 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v17 = *a11;
  -[MTLDebugBlitCommandEncoder internalValidateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "internalValidateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, &v19, &v18, a9, a10, &v17, a12);
  v16[1] = 0;
  v16[2] = 0;
  v15[2] = 0;
  v16[0] = a3;
  v15[0] = a8;
  v15[1] = 0;
  validateResourceAliasing((uint64_t)v16, (uint64_t)v15, a13);
}

- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceSize:(id *)a6 toTexture:(id)a7 destinationSlice:(unint64_t)a8 destinationLevel:(unint64_t)a9 options:(unint64_t)a10 sliceCount:(unint64_t)a11 levelCount:(unint64_t)a12
{
  char v14 = a5;
  memset(v27, 0, sizeof(v27));
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26 = *a6;
  memset(v25, 0, sizeof(v25));
  [(MTLDebugBlitCommandEncoder *)self internalValidateCopyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:v27 sourceSize:&v26 toTexture:a7 destinationSlice:a8 destinationLevel:a9 destinationOrigin:v25 options:a10];
  *(void *)&long long v23 = ResourceIdentity::UnwindTexture(a3, (MTLTextureType)a4, a11, v14, a12, &v24, (int *)&v24 + 1);
  DWORD2(v23) = [a3 usage];
  HIDWORD(v23) = [a3 bufferBytesPerRow];
  *(void *)&long long v21 = ResourceIdentity::UnwindTexture(a7, (MTLTextureType)a8, a11, a9, a12, &v22, (int *)&v22 + 1);
  DWORD2(v21) = [a7 usage];
  HIDWORD(v21) = [a7 bufferBytesPerRow];
  long long v19 = v23;
  uint64_t v20 = v24;
  uint64_t v18 = v22;
  long long v17 = v21;
  validateResourceAliasing((uint64_t)&v19, (uint64_t)&v17, 1);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v27 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a11;
  LOBYTE(v20) = 0;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:", a3, a4, a5, &v27, &v26, a9, a10, &v25, 0, v20);
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a8 retained:1 purgeable:1];
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a7;
  uint64_t v19 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a11;
  [v17 copyFromTexture:v18 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v24 sourceSize:&v23 toTexture:v19 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v22];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t v19 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  if ((a12 & 0x20000000) != 0)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v51 = *a6;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v50 = *a7;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v49 = *a11;
    LOBYTE(v29) = 0;
    [(MTLDebugBlitCommandEncoder *)self validateCopyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v51 sourceSize:&v50 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v49 options:a12 move:v29];
    *(&self->hasEndEncoding + 3) = 1;
    id v23 = [(MTLToolsObject *)self baseObject];
    uint64_t v24 = [a3 baseObject];
    long long v47 = *(_OWORD *)&a6->var0;
    unint64_t var2 = a6->var2;
    long long v45 = *(_OWORD *)&a7->var0;
    unint64_t v46 = a7->var2;
    uint64_t v25 = [a8 baseObject];
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v44 = *a11;
    [v23 copyFromTexture:v24 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v47 sourceSize:&v45 toTexture:v25 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v44 options:v19];
    return;
  }
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v43 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v42 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v41 = *a11;
  LOBYTE(v29) = 0;
  [(MTLDebugBlitCommandEncoder *)self validateCopyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v43 sourceSize:&v42 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v41 options:a12 move:v29];
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  int v20 = *((_DWORD *)a3 + 20);
  if ((~v20 & 0x60) == 0 && (~*((_DWORD *)a8 + 20) & 0x60) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v19) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
    int v20 = *((_DWORD *)a3 + 20);
  }
  if ((a12 & 1) != 0 && (v20 & 0x20) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v19) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
    int v20 = *((_DWORD *)a3 + 20);
  }
  if ((a12 & 2) != 0 && (v20 & 0x40) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v19) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
  }
  int v21 = *((_DWORD *)a8 + 20);
  if (a12)
  {
    unint64_t v22 = a4;
    if ((v21 & 0x20) == 0)
    {
      [(__CFString *)MTLBlitOptionString(v19) cStringUsingEncoding:4];
      _MTLMessageContextPush_();
      int v21 = *((_DWORD *)a8 + 20);
    }
    if ((a12 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  unint64_t v22 = a4;
  if ((a12 & 2) != 0)
  {
LABEL_18:
    if ((v21 & 0x40) == 0)
    {
      [(__CFString *)MTLBlitOptionString(v19) cStringUsingEncoding:4];
      _MTLMessageContextPush_();
    }
  }
LABEL_20:
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a8 retained:1 purgeable:1];
  id v26 = [(MTLToolsObject *)self baseObject];
  uint64_t v27 = [a3 baseObject];
  long long v35 = *(_OWORD *)&a6->var0;
  unint64_t v36 = a6->var2;
  long long v33 = *(_OWORD *)&a7->var0;
  unint64_t v34 = a7->var2;
  uint64_t v28 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v32 = *a11;
  [v26 copyFromTexture:v27 sourceSlice:v22 sourceLevel:a5 sourceOrigin:&v35 sourceSize:&v33 toTexture:v28 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v32 options:v19];
}

- (void)validateCopyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  memset(&v72, 0, sizeof(v72));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ((~(_BYTE)a12 & 3) == 0) {
    _MTLMessageContextPush_();
  }
  validateMTLBlitOption(a12 & 0xFFFFFFFF9FFFFFFFLL, &v72);
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  if (a3)
  {
    if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 conformsToProtocol:&unk_26EF82558]
      || (unint64_t device = self->super.super.super._device, device == (MTLToolsDevice *)[a3 device]))
    {
      if (a8) {
        goto LABEL_11;
      }
LABEL_67:
      _MTLMessageContextPush_();
      goto LABEL_17;
    }
  }
  _MTLMessageContextPush_();
  if (!a8) {
    goto LABEL_67;
  }
LABEL_11:
  if (([a8 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a8 conformsToProtocol:&unk_26EF9C6F8])
  {
    uint64_t v18 = self->super.super.super._device;
    if (v18 != (MTLToolsDevice *)[a8 device]) {
      _MTLMessageContextPush_();
    }
    if ([a8 storageMode] == 3) {
      goto LABEL_67;
    }
  }
LABEL_17:
  if (!(a7->var1 * a7->var0 * a7->var2))
  {
    unint64_t var2 = a7->var2;
    uint64_t v36 = 0;
    unint64_t var0 = a7->var0;
    unint64_t var1 = a7->var1;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  memset(&v72, 0, sizeof(v72));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  validateBlitProtectionOptions([(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions], a3, a8, @"buffer");
  if ([a8 isFramebufferOnly]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "mipmapLevelCount", var0, var1, var2, v36) <= a10)
  {
    unint64_t v27 = a10;
    uint64_t v31 = [a8 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v19 = objc_msgSend(a8, "numFaces", v27, v31);
  if ([a8 arrayLength] * v19 <= a9)
  {
    uint64_t v25 = [a8 numFaces];
    unint64_t v28 = a9;
    uint64_t v32 = [a8 arrayLength] * v25;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  uint64_t v71 = 0;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  [a8 pixelFormat];
  [a8 width];
  int v20 = (char *)[a8 height];
  [a8 depth];
  [a8 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  memset(&v72, 0, sizeof(v72));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a7->var0 + a11->var0)
  {
    unint64_t v28 = a7->var0 + a11->var0;
    uint64_t v32 = 0;
    _MTLMessageContextPush_();
  }
  if (a7->var1 + a11->var1 > *((void *)&v65 + 1))
  {
    unint64_t v28 = a7->var1 + a11->var1;
    uint64_t v32 = *((void *)&v65 + 1);
    _MTLMessageContextPush_();
  }
  if (a7->var2 + a11->var2 > (unint64_t)v66)
  {
    unint64_t v28 = a7->var2 + a11->var2;
    uint64_t v32 = v66;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (!a8)
  {
    MTLReleaseAssertionFailure();
    goto LABEL_63;
  }
  int v20 = (char *)a8 + 72;
  unint64_t v62 = 0;
  unint64_t v63 = 0;
  unint64_t v64 = 0;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v61 = *a11;
  long long v59 = *(_OWORD *)&a7->var0;
  unint64_t v60 = a7->var2;
  long long v56 = v69;
  long long v57 = v70;
  uint64_t v58 = v71;
  long long v52 = v65;
  long long v53 = v66;
  long long v54 = v67;
  long long v55 = v68;
  long long v21 = *(_OWORD *)((char *)a8 + 72);
  long long v22 = *(_OWORD *)((char *)a8 + 88);
  long long v23 = *(_OWORD *)((char *)a8 + 104);
  uint64_t v51 = *((void *)a8 + 15);
  long long v49 = v22;
  long long v50 = v23;
  long long v48 = v21;
  _MTLAdjustMTLSize();
  memset(&v72, 0, sizeof(v72));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  a7 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)*((void *)&v69 + 1);
  if (!*((void *)&v69 + 1))
  {
LABEL_63:
    unint64_t v28 = [(__CFString *)MTLBlitOptionString(a12 & 0xFFFFFFFF9FFFFFFFLL) cStringUsingEncoding:4];
    uint64_t v32 = *(void *)v20;
    goto LABEL_65;
  }
  if (!(a4 % *((void *)&v69 + 1))) {
    goto LABEL_34;
  }
  unint64_t v28 = a4;
  uint64_t v32 = *((void *)&v69 + 1);
LABEL_65:
  _MTLMessageContextPush_();
LABEL_34:
  if ((v20[9] & 4) == 0) {
    goto LABEL_51;
  }
  if (a11->var0 % *((void *)v20 + 4))
  {
    uint64_t v32 = *(void *)v20;
    uint64_t v35 = *((void *)v20 + 4);
    unint64_t v28 = a11->var0;
    _MTLMessageContextPush_();
  }
  if (a11->var1 % *((void *)v20 + 5))
  {
    uint64_t v32 = *(void *)v20;
    uint64_t v35 = *((void *)v20 + 5);
    unint64_t v28 = a11->var1;
    _MTLMessageContextPush_();
  }
  if (a11->var2 % *((void *)v20 + 6))
  {
    uint64_t v32 = *(void *)v20;
    uint64_t v35 = *((void *)v20 + 6);
    unint64_t v28 = a11->var2;
    _MTLMessageContextPush_();
  }
  if (v62 % *((void *)v20 + 4))
  {
    uint64_t v32 = *(void *)v20;
    uint64_t v35 = *((void *)v20 + 4);
    unint64_t v28 = v62;
    _MTLMessageContextPush_();
  }
  if (v63 % *((void *)v20 + 5))
  {
    uint64_t v32 = *(void *)v20;
    uint64_t v35 = *((void *)v20 + 5);
    unint64_t v28 = v63;
    _MTLMessageContextPush_();
  }
  if (v64 % *((void *)v20 + 6))
  {
    uint64_t v32 = *(void *)v20;
    uint64_t v35 = *((void *)v20 + 6);
    unint64_t v28 = v64;
    _MTLMessageContextPush_();
  }
  if ((v20[9] & 0x20) != 0)
  {
    if ((a12 & 4) != 0) {
      goto LABEL_51;
    }
  }
  else if ((a12 & 4) == 0)
  {
    goto LABEL_51;
  }
  unint64_t v28 = *(void *)v20;
  _MTLMessageContextPush_();
LABEL_51:
  _MTLMessageContextEnd();
  memset(&v72, 0, sizeof(v72));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  [a8 pixelFormat];
  [a8 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  unint64_t v24 = -(uint64_t)a5 - a6 + a4;
  if (v24 > objc_msgSend(a3, "length", v28, v32, v35))
  {
    unint64_t v29 = v24 + *((void *)&v43 + 1) * a6;
    long long v33 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[a3 length];
    _MTLMessageContextPush_();
  }
  if (a5 % (unint64_t)a7)
  {
    unint64_t v29 = a5;
    long long v33 = a7;
    _MTLMessageContextPush_();
  }
  if (a6 % (unint64_t)a7)
  {
    unint64_t v29 = a6;
    long long v33 = a7;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "textureType", v29, v33) != 9 && a5 > 0x7FFFLL * *((void *)&v69 + 1)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v40[1] = 0;
  v40[2] = 0;
  v39[2] = 0;
  v40[0] = a3;
  v39[0] = a8;
  v39[1] = 0;
  validateResourceAliasing((uint64_t)v40, (uint64_t)v39, 0);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a11;
  -[MTLDebugBlitCommandEncoder validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v26, a9, a10, &v25, 0);
  if ((~*((_DWORD *)a8 + 20) & 0x60) == 0)
  {
    uint64_t v20 = *((void *)a8 + 9);
    MTLReportFailure();
  }
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1, v20);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a8 retained:1 purgeable:1];
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  long long v23 = *(_OWORD *)&a7->var0;
  unint64_t var2 = a7->var2;
  uint64_t v19 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a11;
  [v17 copyFromBuffer:v18 sourceOffset:a4 sourceBytesPerRow:a5 sourceBytesPerImage:a6 sourceSize:&v23 toTexture:v19 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v22];
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t v16 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v32 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v31 = *a11;
  -[MTLDebugBlitCommandEncoder validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v32, a9, a10, &v31, a12);
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  int v17 = *((_DWORD *)a8 + 20);
  if ((a12 & 1) != 0 && (v17 & 0x20) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v16) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
    int v17 = *((_DWORD *)a8 + 20);
  }
  if ((a12 & 2) != 0 && (v17 & 0x40) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v16) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
    int v17 = *((_DWORD *)a8 + 20);
  }
  if ((v17 & 0x20) != 0 && !v16 && (v17 & 0x40) != 0)
  {
    [@"MTLBlitOptionNone" cStringUsingEncoding:4];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a8 retained:1 purgeable:1];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  long long v25 = *(_OWORD *)&a7->var0;
  unint64_t var2 = a7->var2;
  uint64_t v20 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a11;
  [v18 copyFromBuffer:v19 sourceOffset:a4 sourceBytesPerRow:a5 sourceBytesPerImage:a6 sourceSize:&v25 toTexture:v20 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v24 options:v16];
}

- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  memset(&v76, 0, sizeof(v76));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ((~(_BYTE)a12 & 3) == 0) {
    _MTLMessageContextPush_();
  }
  validateMTLBlitOption(a12 & 0xFFFFFFFF9FFFFFFFLL, &v76);
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  if (a3)
  {
    if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 conformsToProtocol:&unk_26EF9C6F8]) {
      goto LABEL_12;
    }
    unint64_t device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)[a3 device]) {
      _MTLMessageContextPush_();
    }
    if ([a3 storageMode] != 3)
    {
LABEL_12:
      if (a8) {
        goto LABEL_13;
      }
LABEL_73:
      _MTLMessageContextPush_();
      goto LABEL_17;
    }
  }
  _MTLMessageContextPush_();
  if (!a8) {
    goto LABEL_73;
  }
LABEL_13:
  if (([a8 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a8 conformsToProtocol:&unk_26EF82558])
  {
    uint64_t v20 = self->super.super.super._device;
    if (v20 != (MTLToolsDevice *)[a8 device]) {
      goto LABEL_73;
    }
  }
LABEL_17:
  if (!(a7->var1 * a7->var0 * a7->var2))
  {
    unint64_t var2 = a7->var2;
    uint64_t v40 = 0;
    unint64_t var0 = a7->var0;
    unint64_t var1 = a7->var1;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  memset(&v76, 0, sizeof(v76));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  validateBlitProtectionOptions([(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions], a3, a8, @"texture");
  if ([a3 isFramebufferOnly]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", var0, var1, var2, v40) <= a5)
  {
    unint64_t v31 = a5;
    uint64_t v35 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  id v41 = a8;
  uint64_t v21 = objc_msgSend(a3, "numFaces", v31, v35);
  if ([a3 arrayLength] * v21 <= a4)
  {
    uint64_t v29 = [a3 numFaces];
    unint64_t v32 = a4;
    uint64_t v36 = [a3 arrayLength] * v29;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  uint64_t v75 = 0;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  [a3 pixelFormat];
  [a3 width];
  [a3 height];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = (char *)[a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (!a3)
  {
    MTLReleaseAssertionFailure();
    goto LABEL_69;
  }
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = (char *)a3 + 72;
  unint64_t v66 = 0;
  unint64_t v67 = 0;
  unint64_t v68 = 0;
  long long v64 = *(_OWORD *)&a6->var0;
  unint64_t v65 = a6->var2;
  long long v62 = *(_OWORD *)&a7->var0;
  unint64_t v63 = a7->var2;
  long long v59 = v73;
  long long v60 = v74;
  uint64_t v61 = v75;
  long long v55 = v69;
  long long v56 = v70;
  long long v57 = v71;
  long long v58 = v72;
  uint64_t v54 = *((void *)a3 + 15);
  long long v23 = *(_OWORD *)((char *)a3 + 104);
  long long v24 = *(_OWORD *)((char *)a3 + 72);
  long long v52 = *(_OWORD *)((char *)a3 + 88);
  long long v53 = v23;
  long long v51 = v24;
  _MTLAdjustMTLSize();
  memset(&v76, 0, sizeof(v76));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  unint64_t v25 = a6->var0;
  if ((*((unsigned char *)a3 + 81) & 4) != 0)
  {
    unint64_t v27 = v66 + v25;
    if (v27 > (unint64_t)v72)
    {
      unint64_t v32 = v27;
      uint64_t v36 = v72;
      _MTLMessageContextPush_();
    }
    if (v67 + a6->var1 > *((void *)&v72 + 1))
    {
      unint64_t v32 = v67 + a6->var1;
      uint64_t v36 = *((void *)&v72 + 1);
      _MTLMessageContextPush_();
    }
    if (v68 + a6->var2 > (unint64_t)v73)
    {
      unint64_t v32 = v68 + a6->var2;
      uint64_t v36 = v73;
      goto LABEL_75;
    }
  }
  else
  {
    unint64_t v26 = a7->var0 + v25;
    if (v26 > (unint64_t)v69)
    {
      unint64_t v32 = v26;
      uint64_t v36 = v69;
      _MTLMessageContextPush_();
    }
    if (a7->var1 + a6->var1 > *((void *)&v69 + 1))
    {
      unint64_t v32 = a7->var1 + a6->var1;
      uint64_t v36 = *((void *)&v69 + 1);
      _MTLMessageContextPush_();
    }
    if (a7->var2 + a6->var2 > (unint64_t)v70)
    {
      unint64_t v32 = a7->var2 + a6->var2;
      uint64_t v36 = v70;
LABEL_75:
      _MTLMessageContextPush_();
    }
  }
  a7 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)a9;
  a5 = *((void *)&v73 + 1);
  if (!*((void *)&v73 + 1))
  {
LABEL_69:
    unint64_t v32 = [(__CFString *)MTLBlitOptionString(a12 & 0xFFFFFFFF9FFFFFFFLL) cStringUsingEncoding:4];
    uint64_t v36 = *(void *)v22;
    goto LABEL_71;
  }
  if (!(a9 % *((void *)&v73 + 1))) {
    goto LABEL_40;
  }
  unint64_t v32 = a9;
  uint64_t v36 = *((void *)&v73 + 1);
LABEL_71:
  _MTLMessageContextPush_();
LABEL_40:
  if ((v22[9] & 4) == 0) {
    goto LABEL_57;
  }
  if (a6->var0 % *((void *)v22 + 4))
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v39 = *((void *)v22 + 4);
    unint64_t v32 = a6->var0;
    _MTLMessageContextPush_();
  }
  if (a6->var1 % *((void *)v22 + 5))
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v39 = *((void *)v22 + 5);
    unint64_t v32 = a6->var1;
    _MTLMessageContextPush_();
  }
  if (a6->var2 % *((void *)v22 + 6))
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v39 = *((void *)v22 + 6);
    unint64_t v32 = a6->var2;
    _MTLMessageContextPush_();
  }
  if (v66 % *((void *)v22 + 4))
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v39 = *((void *)v22 + 4);
    unint64_t v32 = v66;
    _MTLMessageContextPush_();
  }
  if (v67 % *((void *)v22 + 5))
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v39 = *((void *)v22 + 5);
    unint64_t v32 = v67;
    _MTLMessageContextPush_();
  }
  if (v68 % *((void *)v22 + 6))
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v39 = *((void *)v22 + 6);
    unint64_t v32 = v68;
    _MTLMessageContextPush_();
  }
  if ((v22[9] & 0x20) != 0)
  {
    if ((a12 & 4) != 0) {
      goto LABEL_57;
    }
  }
  else if ((a12 & 4) == 0)
  {
    goto LABEL_57;
  }
  unint64_t v32 = *(void *)v22;
  _MTLMessageContextPush_();
LABEL_57:
  _MTLMessageContextEnd();
  memset(&v76, 0, sizeof(v76));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  [a3 pixelFormat];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  long long v28 = (char *)a7 - a10 - a11;
  if ((unint64_t)v28 > objc_msgSend(v41, "length", v32, v36, v39))
  {
    unint64_t v33 = (unint64_t)&v28[*((void *)&v46 + 1) * a11];
    unint64_t v37 = [v41 length];
    _MTLMessageContextPush_();
  }
  if (a10 % a5)
  {
    _MTLMessageContextPush_();
    unint64_t v33 = a10;
    unint64_t v37 = a5;
    _MTLMessageContextPush_();
  }
  if (a11 % a5)
  {
    unint64_t v33 = a11;
    unint64_t v37 = a5;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "textureType", v33, v37) != 9 && a10 > 0x7FFFLL * *((void *)&v73 + 1)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v43[1] = 0;
  v43[2] = 0;
  v42[2] = 0;
  v43[0] = a3;
  v42[0] = v41;
  v42[1] = 0;
  validateResourceAliasing((uint64_t)v43, (uint64_t)v42, 0);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a7;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v26, &v25, a9, a10, a11, 0);
  if ((~*((_DWORD *)a3 + 20) & 0x60) == 0)
  {
    uint64_t v19 = *((void *)a3 + 9);
    MTLReportFailure();
  }
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1, v19);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a8 retained:1 purgeable:1];
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  long long v23 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  long long v21 = *(_OWORD *)&a7->var0;
  unint64_t v22 = a7->var2;
  objc_msgSend(v17, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v18, a4, a5, &v23, &v21, objc_msgSend(a8, "baseObject"), a9, a10, a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  unint64_t v17 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v32 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v31 = *a7;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v32, &v31, a9, a10, a11, a12);
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  int v18 = *((_DWORD *)a3 + 20);
  if ((a12 & 1) != 0 && (v18 & 0x20) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v17) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
    int v18 = *((_DWORD *)a3 + 20);
  }
  if ((a12 & 2) != 0 && (v18 & 0x40) == 0)
  {
    [(__CFString *)MTLBlitOptionString(v17) cStringUsingEncoding:4];
    _MTLMessageContextPush_();
    int v18 = *((_DWORD *)a3 + 20);
  }
  if ((v18 & 0x20) != 0 && !v17 && (v18 & 0x40) != 0)
  {
    [@"MTLBlitOptionNone" cStringUsingEncoding:4];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a8 retained:1 purgeable:1];
  id v19 = [(MTLToolsObject *)self baseObject];
  uint64_t v20 = [a3 baseObject];
  long long v25 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  long long v23 = *(_OWORD *)&a7->var0;
  unint64_t v24 = a7->var2;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", v20, a4, a5, &v25, &v23, objc_msgSend(a8, "baseObject"), a9, a10, a11, v17);
}

- (void)generateMipmapsForTexture:(id)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    goto LABEL_17;
  }
  while (1)
  {
    unint64_t device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)[a3 device]) {
      _MTLMessageContextPush_();
    }
    if (objc_msgSend(a3, "storageMode", v8) == 3) {
      _MTLMessageContextPush_();
    }
    if ((unint64_t)[a3 mipmapLevelCount] <= 1)
    {
      uint64_t v8 = [a3 mipmapLevelCount];
      _MTLMessageContextPush_();
    }
    unint64_t v6 = (uint64_t *)((char *)a3 + 72);
    int v7 = *((_DWORD *)a3 + 20);
    if ((v7 & 0x10) != 0)
    {
      if ((v7 & 4) != 0) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v8 = *v6;
      _MTLMessageContextPush_();
      unint64_t v6 = (uint64_t *)((char *)a3 + 72);
      if ((*((_DWORD *)a3 + 20) & 4) != 0) {
        goto LABEL_12;
      }
    }
    uint64_t v8 = *v6;
    _MTLMessageContextPush_();
LABEL_12:
    if (*(&self->hasEndEncoding + 4)) {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
    if (a3) {
      break;
    }
    MTLReleaseAssertionFailure();
LABEL_17:
    _MTLMessageContextPush_();
  }
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "generateMipmapsForTexture:", objc_msgSend(a3, "baseObject"));
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (location + length > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (length) {
      goto LABEL_9;
    }
  }
  else if (length)
  {
    goto LABEL_9;
  }
  _MTLMessageContextPush_();
LABEL_9:
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:value:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (location + length > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (length) {
      goto LABEL_9;
    }
  }
  else if (length)
  {
    goto LABEL_9;
  }
  _MTLMessageContextPush_();
LABEL_9:
  if ((location & 3) != 0) {
    _MTLMessageContextPush_();
  }
  if ((length & 3) != 0) {
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:pattern4:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  if (a3)
  {
    if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 conformsToProtocol:&unk_26EF82558]
      || (unint64_t device = self->super.super.super._device, device == (MTLToolsDevice *)[a3 device]))
    {
      if (a5) {
        goto LABEL_9;
      }
LABEL_22:
      _MTLMessageContextPush_();
      goto LABEL_13;
    }
  }
  _MTLMessageContextPush_();
  if (!a5) {
    goto LABEL_22;
  }
LABEL_9:
  if (([a5 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a5 conformsToProtocol:&unk_26EF82558])
  {
    char v14 = self->super.super.super._device;
    if (v14 != (MTLToolsDevice *)[a5 device]) {
      goto LABEL_22;
    }
  }
LABEL_13:
  _MTLMessageContextEnd();
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a7 + a4 > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    unint64_t v15 = a7 + a4;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (a7 + a6 > objc_msgSend((id)objc_msgSend(a5, "baseObject", v15, v17), "length"))
  {
    unint64_t v16 = a7 + a6;
    uint64_t v18 = objc_msgSend((id)objc_msgSend(a5, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (a7) {
      goto LABEL_17;
    }
LABEL_20:
    unint64_t v16 = 0;
    _MTLMessageContextPush_();
    goto LABEL_17;
  }
  if (!a7) {
    goto LABEL_20;
  }
LABEL_17:
  validateBlitProtectionOptions([(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions], a3, a5, @"buffer");
  _MTLMessageContextEnd();
  v20[1] = 0;
  v20[2] = 0;
  v19[2] = 0;
  v20[0] = a3;
  v19[0] = a5;
  v19[1] = 0;
  validateResourceAliasing((uint64_t)v20, (uint64_t)v19, 1);
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a5 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6, a7);
}

- (void)updateFence:(id)a3
{
  id v5 = a3;
  std::deque<objc_object *>::push_back(&self->updatedFences.__map_.__first_, &v5);
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
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
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  [v10 waitForFence:v11];
}

- (void)endEncoding
{
  if (*(&self->hasEndEncoding + 4)) {
    MTLReportFailure();
  }
  if (!*(&self->hasEndEncoding + 3)) {
    MTLReportFailure();
  }
  *(&self->hasEndEncoding + 2) = 1;
  *(&self->hasEndEncoding + 4) = 1;
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 endEncoding];
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (a3 > a4)
  {
    uint64_t v10 = *(void *)&a3;
    uint64_t v11 = *(void *)&a4;
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 filterCounterRangeWithFirstBatch:v7 lastBatch:v6 filterIndex:v5];
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  BOOL v10 = a7;
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a8) {
    _MTLMessageContextPush_();
  }
  if (!(void)v25)
  {
    if (([a8 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    unint64_t device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)[a8 device]) {
      _MTLMessageContextPush_();
    }
    if (objc_msgSend((id)objc_msgSend(a8, "baseObject"), "length") < a9)
    {
      unint64_t v21 = a9;
      uint64_t v22 = objc_msgSend((id)objc_msgSend(a8, "baseObject"), "length");
      _MTLMessageContextPush_();
    }
  }
  if ((objc_msgSend(a3, "isSparse", v21, v22) & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  long long v17 = *(_OWORD *)&a4->var0.var2;
  v24[0] = *(_OWORD *)&a4->var0.var0;
  v24[1] = v17;
  v24[2] = *(_OWORD *)&a4->var1.var1;
  [(MTLDebugBlitCommandEncoder *)self validateTextureAccess:a3 region:v24 mipLevel:a5 slice:a6];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  long long v20 = *(_OWORD *)&a4->var0.var2;
  v23[0] = *(_OWORD *)&a4->var0.var0;
  v23[1] = v20;
  v23[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v18, "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:", v19, v23, a5, a6, v10, objc_msgSend(a8, "baseObject"), a9);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  if (([a3 isSparse] & 1) == 0) {
    MTLReportFailure();
  }
  long long v11 = *(_OWORD *)&a4->var0.var2;
  v16[0] = *(_OWORD *)&a4->var0.var0;
  v16[1] = v11;
  v16[2] = *(_OWORD *)&a4->var1.var1;
  [(MTLDebugBlitCommandEncoder *)self validateTextureAccess:a3 region:v16 mipLevel:a5 slice:a6];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  long long v14 = *(_OWORD *)&a4->var0.var2;
  v15[0] = *(_OWORD *)&a4->var0.var0;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a4->var1.var1;
  [v12 resetTextureAccessCounters:v13 region:v15 mipLevel:a5 slice:a6];
}

- (void)validateTextureAccess:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  unint64_t v10 = (unint64_t)self;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  uint64_t v11 = [a3 arrayLength];
  uint64_t v12 = [a3 textureType];
  uint64_t v13 = 6;
  if ((unint64_t)(v12 - 5) >= 2) {
    uint64_t v13 = 1;
  }
  if (v13 * v11 <= a6)
  {
    unint64_t v23 = a6;
    uint64_t v25 = [a3 arrayLength];
    _MTLMessageContextPush_();
  }
  unint64_t v14 = objc_msgSend(a3, "mipmapLevelCount", v23, v25) - 1;
  if (v14 >= [a3 firstMipmapInTail]) {
    unint64_t v15 = [a3 firstMipmapInTail];
  }
  else {
    unint64_t v15 = [a3 mipmapLevelCount] - 1;
  }
  if (v15 < a5)
  {
    unint64_t v21 = [a3 mipmapLevelCount] - 1;
    if (v21 >= [a3 firstMipmapInTail]) {
      uint64_t v22 = [a3 firstMipmapInTail];
    }
    else {
      uint64_t v22 = [a3 mipmapLevelCount] - 1;
    }
    unint64_t v24 = a5;
    uint64_t v26 = v22;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [a3 pixelFormat];
  [a3 width];
  [a3 height];
  [a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (!a3)
  {
    MTLReleaseAssertionFailure();
LABEL_21:
    _MTLMessageContextPush_();
    goto LABEL_13;
  }
  unint64_t v16 = (void *)[a3 device];
  uint64_t v17 = [a3 textureType];
  uint64_t v18 = [a3 pixelFormat];
  uint64_t v19 = [a3 sampleCount];
  if (v16) {
    [v16 sparseTileSizeWithTextureType:v17 pixelFormat:v18 sampleCount:v19];
  }
  objc_msgSend((id)v10, "device", v24, v26);
  _MTLMessageContextBegin_();
  a3 = 0;
  a5 = -1;
  unint64_t v10 = 0xFFFFFFFFFFFFFFFFLL / 0;
  if (a4->var1.var0 + a4->var0.var0 > 0xFFFFFFFFFFFFFFFFLL / 0) {
    goto LABEL_21;
  }
LABEL_13:
  unint64_t v20 = a5 / (unint64_t)a3;
  if (a4->var1.var1 + a4->var0.var1 > v10) {
    _MTLMessageContextPush_();
  }
  if (a4->var1.var2 + a4->var0.var2 > v20) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:", objc_msgSend(a3, "baseObject"));
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if ([a3 mipmapLevelCount] <= a5)
  {
    unint64_t v11 = a5;
    uint64_t v12 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v10 = objc_msgSend(a3, "numFaces", v11, v12);
  if ([a3 arrayLength] * v10 <= a4)
  {
    [a3 numFaces];
    [a3 arrayLength];
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:", objc_msgSend(a3, "baseObject"));
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if ([a3 mipmapLevelCount] <= a5)
  {
    unint64_t v11 = a5;
    uint64_t v12 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v10 = objc_msgSend(a3, "numFaces", v11, v12);
  if ([a3 arrayLength] * v10 <= a4)
  {
    [a3 numFaces];
    [a3 arrayLength];
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v80.NSUInteger length = [a3 size];
  v78.NSUInteger location = location;
  v78.NSUInteger length = length;
  v80.NSUInteger location = 0;
  NSRange v8 = NSIntersectionRange(v78, v80);
  if (v8.location != location || v8.length != length)
  {
    NSUInteger v70 = length;
    uint64_t v71 = [a3 size];
    NSUInteger v69 = location;
    MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1, v69, v70, v71);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resetCommandsInBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
  __p = 0;
  _MTLMessageContext v76 = 0;
  v77 = 0;
  uint64_t v10 = (void *)[a3 optimizedRangeList];
  unint64_t v11 = 0;
  long long v72 = 0;
  long long v73 = 0;
  long long v74 = 0;
  while (v11 < [v10 count])
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", v11), "rangeValue");
    uint64_t v14 = v13;
    v79.NSUInteger location = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", v11), "rangeValue");
    v81.NSUInteger location = location;
    v81.NSUInteger length = length;
    NSRange v15 = NSIntersectionRange(v79, v81);
    if (v12 == location && v14 == length)
    {
      unint64_t v16 = v76;
      if (v76 >= (unint64_t *)v77)
      {
        uint64_t v17 = (unint64_t *)__p;
        uint64_t v18 = ((char *)v76 - (unsigned char *)__p) >> 3;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v20 = v77 - (unsigned char *)__p;
        if ((v77 - (unsigned char *)__p) >> 2 > v19) {
          unint64_t v19 = v20 >> 2;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v21)
        {
          uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v77, v21);
          uint64_t v17 = (unint64_t *)__p;
          unint64_t v16 = v76;
        }
        else
        {
          uint64_t v22 = 0;
        }
        long long v29 = (unint64_t *)&v22[8 * v18];
        *long long v29 = v11;
        unint64_t v23 = v29 + 1;
        while (v16 != v17)
        {
          unint64_t v30 = *--v16;
          *--long long v29 = v30;
        }
        goto LABEL_50;
      }
LABEL_22:
      *unint64_t v16 = v11;
      unint64_t v23 = v16 + 1;
      goto LABEL_52;
    }
    if (v12 == v15.location && v14 == v15.length)
    {
      unint64_t v16 = v76;
      if (v76 < (unint64_t *)v77) {
        goto LABEL_22;
      }
      uint64_t v17 = (unint64_t *)__p;
      uint64_t v26 = ((char *)v76 - (unsigned char *)__p) >> 3;
      unint64_t v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v28 = v77 - (unsigned char *)__p;
      if ((v77 - (unsigned char *)__p) >> 2 > v27) {
        unint64_t v27 = v28 >> 2;
      }
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v27;
      }
      if (v21)
      {
        uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v77, v21);
        uint64_t v17 = (unint64_t *)__p;
        unint64_t v16 = v76;
      }
      else
      {
        uint64_t v22 = 0;
      }
      long long v29 = (unint64_t *)&v22[8 * v26];
      *long long v29 = v11;
      unint64_t v23 = v29 + 1;
      while (v16 != v17)
      {
        unint64_t v37 = *--v16;
        *--long long v29 = v37;
      }
LABEL_50:
      __p = v29;
      _MTLMessageContext v76 = v23;
      v77 = &v22[8 * v21];
      if (v17) {
        operator delete(v17);
      }
LABEL_52:
      _MTLMessageContext v76 = v23;
      goto LABEL_53;
    }
    if (v15.length)
    {
      unint64_t v24 = v76;
      if (v76 >= (unint64_t *)v77)
      {
        $F99D9A4FB75BC57F3386B8DC8EE08D7A v31 = (unint64_t *)__p;
        uint64_t v32 = ((char *)v76 - (unsigned char *)__p) >> 3;
        unint64_t v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v34 = v77 - (unsigned char *)__p;
        if ((v77 - (unsigned char *)__p) >> 2 > v33) {
          unint64_t v33 = v34 >> 2;
        }
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v35 = v33;
        }
        if (v35)
        {
          uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v77, v35);
          $F99D9A4FB75BC57F3386B8DC8EE08D7A v31 = (unint64_t *)__p;
          unint64_t v24 = v76;
        }
        else
        {
          uint64_t v36 = 0;
        }
        long long v38 = (unint64_t *)&v36[8 * v32];
        *long long v38 = v11;
        uint64_t v25 = v38 + 1;
        while (v24 != v31)
        {
          unint64_t v39 = *--v24;
          *--long long v38 = v39;
        }
        __p = v38;
        _MTLMessageContext v76 = v25;
        v77 = &v36[8 * v35];
        if (v31) {
          operator delete(v31);
        }
      }
      else
      {
        *_MTLMessageContext v76 = v11;
        uint64_t v25 = v24 + 1;
      }
      _MTLMessageContext v76 = v25;
      uint64_t v40 = (LODWORD(v15.location) - v12);
      if ((int)v40 < 1)
      {
        LODWORD(v40) = 0;
      }
      else
      {
        id v41 = v73;
        if (v73 >= v74)
        {
          long long v43 = v72;
          uint64_t v44 = (v73 - v72) >> 4;
          unint64_t v45 = v44 + 1;
          if ((unint64_t)(v44 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v46 = v74 - v72;
          if ((v74 - v72) >> 3 > v45) {
            unint64_t v45 = v46 >> 3;
          }
          if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v45;
          }
          if (v47)
          {
            long long v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)&v74, v47);
            long long v43 = v72;
            id v41 = v73;
          }
          else
          {
            long long v48 = 0;
          }
          long long v49 = (uint64_t *)&v48[16 * v44];
          *long long v49 = v12;
          v49[1] = v40;
          uint64_t v50 = v49;
          if (v41 != v43)
          {
            do
            {
              *((_OWORD *)v50 - 1) = *((_OWORD *)v41 - 1);
              v50 -= 2;
              v41 -= 16;
            }
            while (v41 != v43);
            long long v43 = v72;
          }
          long long v42 = (char *)(v49 + 2);
          long long v72 = (char *)v50;
          long long v74 = &v48[16 * v47];
          if (v43) {
            operator delete(v43);
          }
        }
        else
        {
          *(void *)long long v73 = v12;
          *((void *)v73 + 1) = v40;
          long long v42 = v73 + 16;
        }
        long long v73 = v42;
      }
      NSUInteger v51 = (v14 - (v40 + LODWORD(v15.length)));
      if ((int)v51 >= 1)
      {
        NSUInteger v52 = v15.location + v15.length;
        long long v53 = v73;
        if (v73 >= v74)
        {
          long long v55 = v72;
          uint64_t v56 = (v73 - v72) >> 4;
          unint64_t v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v58 = v74 - v72;
          if ((v74 - v72) >> 3 > v57) {
            unint64_t v57 = v58 >> 3;
          }
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v59 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v59 = v57;
          }
          if (v59)
          {
            long long v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)&v74, v59);
            long long v55 = v72;
            long long v53 = v73;
          }
          else
          {
            long long v60 = 0;
          }
          uint64_t v61 = (NSUInteger *)&v60[16 * v56];
          *uint64_t v61 = v52;
          v61[1] = v51;
          long long v62 = v61;
          if (v53 != v55)
          {
            do
            {
              *((_OWORD *)v62 - 1) = *((_OWORD *)v53 - 1);
              v62 -= 2;
              v53 -= 16;
            }
            while (v53 != v55);
            long long v55 = v72;
          }
          uint64_t v54 = (char *)(v61 + 2);
          long long v72 = (char *)v62;
          long long v74 = &v60[16 * v59];
          if (v55) {
            operator delete(v55);
          }
        }
        else
        {
          *(void *)long long v73 = v52;
          *((void *)v73 + 1) = v51;
          uint64_t v54 = v73 + 16;
        }
        long long v73 = v54;
      }
    }
LABEL_53:
    ++v11;
  }
  unint64_t v63 = __p;
  if (v76 != __p)
  {
    uint64_t v64 = 0;
    unint64_t v65 = 0;
    do
    {
      [v10 removeObjectAtIndex:v64 + v63[v65++]];
      unint64_t v63 = __p;
      --v64;
    }
    while (v65 < ((char *)v76 - (unsigned char *)__p) >> 3);
  }
  unint64_t v66 = v73;
  if (v73 != v72)
  {
    uint64_t v67 = 0;
    unint64_t v68 = 0;
    unint64_t v66 = v72;
    do
    {
      objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", *(void *)&v66[v67], *(void *)&v66[v67 + 8]));
      ++v68;
      unint64_t v66 = v72;
      v67 += 16;
    }
    while (v68 < (v73 - v72) >> 4);
  }
  if (v66) {
    operator delete(v66);
  }
  if (__p)
  {
    _MTLMessageContext v76 = (unint64_t *)__p;
    operator delete(__p);
  }
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (([a3 conformsToProtocol:&unk_26EF7E940] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (([a5 conformsToProtocol:&unk_26EF7E940] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a5 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  v20.NSUInteger length = [a3 size];
  v18.NSUInteger location = location;
  v18.NSUInteger length = length;
  v20.NSUInteger location = 0;
  NSRange v8 = NSIntersectionRange(v18, v20);
  if (v8.location != location || v8.length != length)
  {
    NSUInteger v16 = length;
    uint64_t v17 = [a3 size];
    NSUInteger v15 = location;
    _MTLMessageContextPush_();
  }
  id v9 = objc_msgSend(a3, "optimizedRangeList", v15, v16, v17);
  if (![v9 count])
  {
    _MTLMessageContextEnd();
LABEL_21:
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length));
    goto LABEL_22;
  }
  uint64_t v10 = 0;
  do
  {
    BOOL v12 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "rangeValue") == location
       && v11 == length;
    char v13 = v12;
    if (!v12)
    {
      v19.NSUInteger location = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "rangeValue");
      v21.NSUInteger location = location;
      v21.NSUInteger length = length;
      if (NSIntersectionRange(v19, v21).length) {
        _MTLMessageContextPush_();
      }
    }
    if (++v10 >= (unint64_t)[v9 count]) {
      char v14 = 1;
    }
    else {
      char v14 = v13;
    }
  }
  while ((v14 & 1) == 0);
  _MTLMessageContextEnd();
  if ((v13 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_22:
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeIndirectCommandBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4))
  {
    _MTLMessageContextPush_();
    if (a7) {
      goto LABEL_3;
    }
  }
  else if (a7)
  {
    goto LABEL_3;
  }
  _MTLMessageContextPush_();
LABEL_3:
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  validateTextureRegion(self->super.super.super._device, a3, a4, a5, a6, (uint64_t)&v27);
  if ((BYTE8(v27) & 0x61) == 1)
  {
    if ((WORD4(v27) & 0x2000) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v18 = v27;
    _MTLMessageContextPush_();
    if ((WORD4(v27) & 0x2000) == 0) {
      goto LABEL_17;
    }
  }
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_msgSend(a3, "pixelFormat", v18);
  [a3 width];
  [a3 height];
  [a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (a6->var0.var0) {
    _MTLMessageContextPush_();
  }
  if (a6->var0.var1) {
    _MTLMessageContextPush_();
  }
  if (a6->var0.var2) {
    _MTLMessageContextPush_();
  }
  if (a6->var1.var0 != (void)v20) {
    _MTLMessageContextPush_();
  }
  if (a6->var1.var1 != *((void *)&v20 + 1)) {
    _MTLMessageContextPush_();
  }
  if (a6->var1.var2 != (void)v21) {
    _MTLMessageContextPush_();
  }
LABEL_17:
  if (*((void *)&v28 + 1) > a8) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  long long v17 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v17;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  [v15 fillTexture:v16 level:a4 slice:a5 region:v19 bytes:a7 length:a8];
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  validateTextureRegion(self->super.super.super._device, a3, a4, a5, a6, (uint64_t)v20);
  if ((WORD4(v20[0]) & 0x461) != 1) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  id v16 = [(MTLToolsObject *)self baseObject];
  uint64_t v17 = [a3 baseObject];
  long long v18 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v18;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v16, "fillTexture:level:slice:region:color:", v17, a4, a5, v19, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4)) {
    _MTLMessageContextPush_();
  }
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  validateTextureRegion(self->super.super.super._device, a3, a4, a5, a6, (uint64_t)&v23);
  uint64_t v22 = 0;
  memset(&v21[3], 0, 48);
  [(MTLToolsObject *)self->super.super.super._device baseObject];
  MTLPixelFormatGetInfoForDevice();
  _MTLMessageContextPush_();
  if ((void)v24) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  long long v20 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v20;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:pixelFormat:", v19, a4, a5, v21, a8, var0, var1, var2, var3);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  uint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  _MTLMessageContextBegin_();
  if (!a9) {
    _MTLMessageContextPush_();
  }
  if (!a10) {
    _MTLMessageContextPush_();
  }
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  [a3 pixelFormat];
  [a3 width];
  [a3 height];
  [a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDevice();
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  [a6 pixelFormat];
  [a6 width];
  [a6 height];
  [a6 depth];
  [a6 sampleCount];
  MTLGetTextureLevelInfoForDevice();
  uint64_t v27 = [a3 numFaces];
  uint64_t v28 = [a6 numFaces];
  if (a10 + a5 > objc_msgSend(a3, "mipmapLevelCount", v13, v17, v21, v25))
  {
    unint64_t v18 = a10;
    uint64_t v22 = [a3 mipmapLevelCount];
    unint64_t v14 = a5;
    _MTLMessageContextPush_();
  }
  if (a10 + a8 > objc_msgSend(a6, "mipmapLevelCount", v14, v18, v22))
  {
    unint64_t v19 = a10;
    uint64_t v23 = [a6 mipmapLevelCount];
    unint64_t v15 = a8;
    _MTLMessageContextPush_();
  }
  if (a9 + a4 > objc_msgSend(a3, "arrayLength", v15, v19, v23) * v27)
  {
    uint64_t v24 = [a3 arrayLength];
    uint64_t v26 = v27;
    unint64_t v16 = a4;
    unint64_t v20 = a9;
    _MTLMessageContextPush_();
  }
  if (a9 + a7 > objc_msgSend(a6, "arrayLength", v16, v20, v24, v26) * v28)
  {
    [a6 arrayLength];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  memset(v33, 0, sizeof(v33));
  [(MTLDebugBlitCommandEncoder *)self validateCopyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceSize:v33 toTexture:a6 destinationSlice:a7 destinationLevel:a8 options:0 sliceCount:a9 levelCount:a10];
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a6 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, a10);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  unint64_t v6 = [a3 width];
  unint64_t v7 = [a3 height];
  unint64_t v8 = [a3 depth];
  unint64_t v74 = v8;
  unint64_t v75 = v7;
  unint64_t v9 = [a4 width];
  unint64_t v10 = [a4 height];
  unint64_t v11 = [a4 depth];
  uint64_t v12 = 0;
  unint64_t v72 = v11;
  unint64_t v73 = v10;
  uint64_t v13 = &v73;
  unint64_t v14 = &v72;
  unint64_t v15 = &v73;
  unint64_t v16 = &v72;
  BOOL v17 = v8 > v11;
  if (v8 <= v11) {
    unint64_t v18 = v11;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v8 <= v11) {
    unint64_t v19 = v10;
  }
  else {
    unint64_t v19 = v7;
  }
  if (v17) {
    unint64_t v20 = v9;
  }
  else {
    unint64_t v20 = v6;
  }
  if (v17)
  {
    unint64_t v21 = v6;
  }
  else
  {
    unint64_t v16 = &v74;
    unint64_t v21 = v9;
  }
  int v22 = v17;
  if (!v17) {
    unint64_t v15 = &v75;
  }
  if (v7 <= v10) {
    unint64_t v23 = v18;
  }
  else {
    unint64_t v23 = v8;
  }
  if (v7 <= v10) {
    unint64_t v24 = v19;
  }
  else {
    unint64_t v24 = v7;
  }
  if (v7 <= v10) {
    unint64_t v25 = v20;
  }
  else {
    unint64_t v25 = v9;
  }
  if (v7 <= v10)
  {
    int v26 = v22;
  }
  else
  {
    unint64_t v21 = v6;
    int v26 = 1;
  }
  if (v7 <= v10) {
    uint64_t v27 = v16;
  }
  else {
    uint64_t v27 = &v72;
  }
  if (v7 <= v10) {
    uint64_t v28 = v15;
  }
  else {
    uint64_t v28 = &v73;
  }
  if (v6 <= v9) {
    unint64_t v29 = v23;
  }
  else {
    unint64_t v29 = v8;
  }
  if (v6 <= v9) {
    unint64_t v30 = v24;
  }
  else {
    unint64_t v30 = v7;
  }
  if (v6 <= v9) {
    unint64_t v31 = v25;
  }
  else {
    unint64_t v31 = v9;
  }
  if (v6 <= v9) {
    unint64_t v32 = v21;
  }
  else {
    unint64_t v32 = v6;
  }
  if (v6 <= v9) {
    int v33 = v26;
  }
  else {
    int v33 = 1;
  }
  if (v6 <= v9)
  {
    unint64_t v14 = v27;
    uint64_t v13 = v28;
  }
  while (v32 > v31 || v30 > *v13 || v29 > *v14)
  {
    v32 >>= 1;
    v30 >>= 1;
    ++v12;
    v29 >>= 1;
  }
  if (v33) {
    uint64_t v34 = v12;
  }
  else {
    uint64_t v34 = 0;
  }
  if (v33) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = v12;
  }
  uint64_t v51 = v34;
  uint64_t v71 = 0;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  [a4 pixelFormat];
  [a4 width];
  [a4 height];
  [a4 depth];
  [a4 sampleCount];
  MTLGetTextureLevelInfoForDevice();
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  [a3 pixelFormat];
  [a3 width];
  [a3 height];
  [a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDevice();
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  uint64_t v36 = v35;
  _MTLMessageContextEnd();
  uint64_t v37 = [a3 arrayLength];
  uint64_t v38 = [a3 numFaces];
  uint64_t v39 = [a4 arrayLength];
  uint64_t v40 = [a4 numFaces];
  unint64_t v41 = [a3 mipmapLevelCount] - v51;
  unint64_t v42 = [a4 mipmapLevelCount] - v36;
  if (v41 >= v42) {
    id v43 = a4;
  }
  else {
    id v43 = a3;
  }
  if (v41 >= v42) {
    uint64_t v44 = v36;
  }
  else {
    uint64_t v44 = v51;
  }
  uint64_t v45 = objc_msgSend(v43, "mipmapLevelCount", v47, v48, v49, v50);
  uint64_t v46 = v38 * v37;
  if (v38 * v37 >= (unint64_t)(v40 * v39)) {
    uint64_t v46 = v40 * v39;
  }
  memset(v53, 0, sizeof(v53));
  [(MTLDebugBlitCommandEncoder *)self validateCopyFromTexture:a3 sourceSlice:0 sourceLevel:v51 sourceSize:v53 toTexture:a4 destinationSlice:0 destinationLevel:v36 options:0 sliceCount:v46 levelCount:v45 - v44];
  *(&self->hasEndEncoding + 3) = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a4 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:toTexture:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF802D0] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if ([a3 sampleCount] <= a4)
  {
    unint64_t v10 = a4;
    uint64_t v11 = [a3 sampleCount];
    _MTLMessageContextPush_();
  }
  if (!-[MTLToolsDevice supportsCounterSampling:](self->super.super.super._device, "supportsCounterSampling:", 4, v10, v11))_MTLMessageContextPush_(); {
  _MTLMessageContextEnd();
  }
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (([a3 conformsToProtocol:&unk_26EF802D0] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (([a5 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  unint64_t device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  uint64_t v13 = self->super.super.super._device;
  if (v13 != (MTLToolsDevice *)[a5 device]) {
    _MTLMessageContextPush_();
  }
  unint64_t v14 = [(MTLToolsDevice *)self->super.super.super._device minConstantBufferAlignmentBytes];
  if (a6 % v14)
  {
    unint64_t v15 = a6;
    unint64_t v16 = v14;
    _MTLMessageContextPush_();
  }
  if (location + length > objc_msgSend(a3, "sampleCount", v15, v16))
  {
    [a3 sampleCount];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a5 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resolveCounters:inRange:destinationBuffer:destinationOffset:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)invalidateCompressedTexture:(id)a3
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!(void)v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    unint64_t device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)[a3 device]) {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugBlitCommandEncoder;
  [(MTLToolsBlitCommandEncoder *)&v6 invalidateCompressedTexture:a3];
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (!(void)v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _MTLMessageContextPush_();
    }
    unint64_t device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)[a3 device]) {
      _MTLMessageContextPush_();
    }
    if ([a3 mipmapLevelCount] <= a5)
    {
      unint64_t v11 = a5;
      uint64_t v12 = [a3 mipmapLevelCount];
      _MTLMessageContextPush_();
    }
    uint64_t v10 = objc_msgSend(a3, "numFaces", v11, v12);
    if ([a3 arrayLength] * v10 <= a4)
    {
      [a3 numFaces];
      [a3 arrayLength];
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugBlitCommandEncoder;
  [(MTLToolsBlitCommandEncoder *)&v13 invalidateCompressedTexture:a3 slice:a4 level:a5];
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
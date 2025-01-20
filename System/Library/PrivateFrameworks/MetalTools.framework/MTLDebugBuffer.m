@interface MTLDebugBuffer
- (BOOL)detachBacking;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isContentExposedToCPU;
- (BOOL)purgeableStateValidForRendering;
- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (MTLDebugBuffer)initWithBuffer:(id)a3 device:(id)a4 bytes:(const void *)a5 options:(unint64_t)a6;
- (MTLDebugBuffer)initWithBuffer:(id)a3 device:(id)a4 options:(unint64_t)a5;
- (MTLDebugBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5 options:(unint64_t)a6;
- (MTLDebugResource)common;
- (const)pointer;
- (id)copyDebugMarkers;
- (id)description;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (unint64_t)gpuAddress;
- (unint64_t)length;
- (unint64_t)parentGPUAddress;
- (unint64_t)parentGPUSize;
- (unint64_t)resourceIndex;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (void)addDebugMarker:(id)a3 range:(_NSRange)a4;
- (void)contents;
- (void)dealloc;
- (void)didModifyRange:(_NSRange)a3;
- (void)lockPurgeableState;
- (void)makeAliasable;
- (void)removeAllDebugMarkers;
- (void)setIsContentExposedToCPU:(BOOL)a3;
- (void)setParentGPUAddress:(unint64_t)a3;
- (void)setParentGPUSize:(unint64_t)a3;
- (void)unlockPurgeableState;
@end

@implementation MTLDebugBuffer

- (unint64_t)length
{
  return self->_length;
}

- (MTLDebugBuffer)initWithBuffer:(id)a3 device:(id)a4 options:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugBuffer;
  v7 = [(MTLToolsResource *)&v9 initWithBaseObject:a3 parent:a4];
  if (v7)
  {
    v7->_length = [a3 length];
    v7->_common = [[MTLDebugResource alloc] initWithBaseObject:a3];
    v7->super.super._options = a5;
    atomic_store(0, (unsigned int *)&v7->_purgeableStateToken);
    v7->_purgeableStateHasBeenSet = 0;
  }
  return v7;
}

- (MTLDebugBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugBuffer;
  v8 = [(MTLToolsResource *)&v10 initWithBaseObject:a3 parent:a4 heap:a4];
  if (v8)
  {
    v8->_length = [a3 length];
    v8->_common = [[MTLDebugResource alloc] initWithBaseObject:a3];
    v8->super.super._options = a6;
    atomic_store(0, (unsigned int *)&v8->_purgeableStateToken);
    v8->_purgeableStateHasBeenSet = 0;
  }
  return v8;
}

- (MTLDebugBuffer)initWithBuffer:(id)a3 device:(id)a4 bytes:(const void *)a5 options:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugBuffer;
  objc_super v9 = [(MTLToolsResource *)&v11 initWithBaseObject:a3 parent:a4];
  if (v9)
  {
    v9->_length = [a3 length];
    v9->_common = [[MTLDebugResource alloc] initWithBaseObject:a3];
    v9->_pointer = a5;
    v9->super.super._options = a6;
    atomic_store(0, (unsigned int *)&v9->_purgeableStateToken);
    v9->_purgeableStateHasBeenSet = 0;
    v9->_isContentExposedToCPU = 1;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugBuffer;
  [(MTLToolsBuffer *)&v3 dealloc];
}

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (BOOL)doesAliasResource:(id)a3
{
  return [(MTLDebugResource *)self->_common doesAliasResource:a3];
}

- (void)makeAliasable
{
  if (!objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    MTLReportFailure();
  }
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 makeAliasable];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (unint64_t)parentGPUAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 parentGPUAddress];
}

- (void)setParentGPUAddress:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setParentGPUAddress:a3];
}

- (unint64_t)parentGPUSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 parentGPUSize];
}

- (void)setParentGPUSize:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setParentGPUSize:a3];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  return [(MTLDebugResource *)self->_common doesAliasAllResources:a3 count:a4];
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  return [(MTLDebugResource *)self->_common doesAliasAnyResources:a3 count:a4];
}

- (id)description
{
  return [(MTLToolsBuffer *)self formattedDescription:0];
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  objc_super v9 = (void *)[(MTLDevice *)[(MTLToolsObject *)self device] baseObject];
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a3 textureType] == 9) {
    _validateTextureBufferDescriptor(a3, v9);
  }
  _MTLMessageContextEnd();
  uint64_t v10 = [a3 textureType];
  uint64_t v11 = [a3 pixelFormat];
  if (v10 == 9) {
    unint64_t v12 = [v9 minimumTextureBufferAlignmentForPixelFormat:v11];
  }
  else {
    unint64_t v12 = [v9 minimumLinearTextureAlignmentForPixelFormat:v11];
  }
  validateNewTexture(self, (MTLTextureDescriptor *)a3, a4, a5, v12, v12);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  __int16 v13 = [a3 resourceOptions];
  unint64_t options_low = LOBYTE(self->super.super._options);
  __int16 v15 = [(MTLToolsResource *)self resourceOptions];
  if ((v13 & 0x300) != 0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15 & 0x300;
  }
  if ((v16 | v13 & 0x3FF) != (v15 & 0x300 | options_low))
  {
    uint64_t v21 = [a3 resourceOptions];
    unint64_t options = self->super.super._options;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "depth", v21, options) != 1)
  {
    uint64_t v22 = [a3 depth];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", v22) != 1)
  {
    uint64_t v23 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "sampleCount", v23) != 1)
  {
    uint64_t v24 = [a3 sampleCount];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "arrayLength", v24) != 1)
  {
    uint64_t v25 = [a3 arrayLength];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "compressionType", v25) || objc_msgSend(a3, "compressionFootprint")) {
    _MTLMessageContextPush_();
  }
  if (([v9 supportsRenderToLinearTextures] & 1) == 0 && (objc_msgSend(a3, "usage") & 4) != 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  uint64_t v17 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5);
  if (!v17) {
    return 0;
  }
  v18 = (void *)v17;
  v19 = [[MTLDebugTexture alloc] initWithBaseTexture:v17 device:[(MTLToolsObject *)self device] buffer:self offset:a4 bytesPerRow:a5];

  return v19;
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  uint64_t v11 = (void *)[(MTLDevice *)[(MTLToolsObject *)self device] baseObject];
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a3 textureType] == 3)
  {
    int v12 = [v11 linearTextureArrayAlignmentBytes];
    uint64_t v13 = [v11 linearTextureArrayAlignmentSlice];
    uint64_t v14 = v13;
    if (!v12 || !v13) {
      _MTLMessageContextPush_();
    }
    if ((a6 & (v14 - 1)) != 0)
    {
      uint64_t v26 = v14;
      _MTLMessageContextPush_();
    }
  }
  else if ([a3 textureType] == 9)
  {
    _validateTextureBufferDescriptor(a3, v11);
  }
  _MTLMessageContextEnd();
  if ([a3 textureType] == 3)
  {
    unint64_t v15 = [v11 linearTextureArrayAlignmentBytes];
    unint64_t v16 = [v11 linearTextureArrayAlignmentSlice];
  }
  else if ([a3 textureType] == 9)
  {
    unint64_t v16 = objc_msgSend(v11, "minimumTextureBufferAlignmentForPixelFormat:", objc_msgSend(a3, "pixelFormat"));
    unint64_t v15 = 0;
  }
  else
  {
    if ([a3 usage] == 1) {
      uint64_t v17 = [v11 deviceLinearReadOnlyTextureAlignmentBytes];
    }
    else {
      uint64_t v17 = objc_msgSend(v11, "minLinearTextureAlignmentForPixelFormat:", objc_msgSend(a3, "pixelFormat"));
    }
    unint64_t v15 = v17;
    unint64_t v16 = v17;
  }
  validateNewTexture(self, (MTLTextureDescriptor *)a3, a4, a5, v16, v15);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  __int16 v18 = [a3 resourceOptions];
  unint64_t options_low = LOBYTE(self->super.super._options);
  __int16 v20 = [(MTLToolsResource *)self resourceOptions];
  if ((v18 & 0x300) != 0) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v20 & 0x300;
  }
  if ((v21 | v18 & 0x3FF) != (v20 & 0x300 | options_low))
  {
    uint64_t v26 = [a3 resourceOptions];
    unint64_t options = self->super.super._options;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "depth", v26, options) != 1)
  {
    uint64_t v27 = [a3 depth];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", v27) != 1)
  {
    uint64_t v28 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "sampleCount", v28) != 1)
  {
    uint64_t v29 = [a3 sampleCount];
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend(v11, "supportsRenderToLinearTextures", v29) & 1) == 0 && (objc_msgSend(a3, "usage") & 4) != 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  uint64_t v22 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", a3, a4, a5, a6);
  if (!v22) {
    return 0;
  }
  uint64_t v23 = (void *)v22;
  uint64_t v24 = [[MTLDebugTexture alloc] initWithBaseTexture:v22 device:[(MTLToolsObject *)self device] buffer:self offset:a4 bytesPerRow:a5 bytesPerImage:a6];

  return v24;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    MTLReportFailure();
  }
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken)) {
        MTLReportFailure();
      }
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 setPurgeableState:a3];
}

- (void)didModifyRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v5, "didModifyRange:", location, length);
}

- (void)contents
{
  [(MTLToolsResource *)self validateCPUWriteable];
  self->_isContentExposedToCPU = 1;
  id v3 = [(MTLToolsObject *)self baseObject];

  return (void *)[v3 contents];
}

- (id)copyDebugMarkers
{
  id result = (id)[(NSMutableArray *)self->_debugMarkers count];
  if (result)
  {
    debugMarkers = self->_debugMarkers;
    return (id)[(NSMutableArray *)debugMarkers copy];
  }
  return result;
}

- (void)addDebugMarker:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugBuffer;
  -[MTLToolsBuffer addDebugMarker:range:](&v10, sel_addDebugMarker_range_);
  v8 = objc_alloc_init(MTLDebugBufferMarker);
  [(MTLDebugBufferMarker *)v8 setLabel:a3];
  -[MTLDebugBufferMarker setRange:](v8, "setRange:", location, length);
  debugMarkers = self->_debugMarkers;
  if (!debugMarkers)
  {
    debugMarkers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_debugMarkers = debugMarkers;
  }
  [(NSMutableArray *)debugMarkers addObject:v8];
}

- (void)removeAllDebugMarkers
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugBuffer;
  [(MTLToolsBuffer *)&v3 removeAllDebugMarkers];
  [(NSMutableArray *)self->_debugMarkers removeAllObjects];
}

- (void)lockPurgeableState
{
}

- (void)unlockPurgeableState
{
}

- (BOOL)purgeableStateValidForRendering
{
  return !self->_purgeableStateHasBeenSet || [(MTLDebugBuffer *)self setPurgeableState:1] == 2;
}

- (BOOL)detachBacking
{
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsResourceDetachBacking] & 1) == 0)MTLReportFailure(); {
  id v3 = [(MTLToolsObject *)self baseObject];
  }

  return [v3 detachBacking];
}

- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsResourceDetachBacking] & 1) == 0)MTLReportFailure(); {
  [(MTLToolsObject *)self device];
  }
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithBytesNoCopy:length:deallocator:", a3, a4, a5);
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsResourceDetachBacking] & 1) == 0)MTLReportFailure(); {
  [(MTLToolsObject *)self device];
  }
  _MTLMessageContextBegin_();
  [(MTLDebugDevice *)self->_debugDevice validateAddressRanges:a3 expectedTotalSize:[(MTLDebugBuffer *)self length] context:&v8];
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithRanges:readOnly:", a3, v4);
}

- (MTLDebugResource)common
{
  return self->_common;
}

- (const)pointer
{
  return self->_pointer;
}

- (BOOL)isContentExposedToCPU
{
  return self->_isContentExposedToCPU;
}

- (void)setIsContentExposedToCPU:(BOOL)a3
{
  self->_isContentExposedToCPU = a3;
}

@end
@interface MTLDebugHeap
- (BOOL)detachBacking;
- (BOOL)purgeableStateValidForRendering;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (MTLDebugDevice)debugDevice;
- (MTLDebugHeap)initWithHeap:(id)a3 device:(id)a4;
- (id)_newDebugAccelerationStructure:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (void)lockPurgeableState;
- (void)unlockPurgeableState;
- (void)validateHeapResourceOptions:(unint64_t)a3 isTexture:(BOOL)a4 isIOSurface:(BOOL)a5 context:(_MTLMessageContext *)a6;
- (void)validateHeapTextureUsage:(unint64_t)a3 options:(unint64_t)a4 context:(_MTLMessageContext *)a5;
- (void)validateOffset:(unint64_t)a3 withRequirements:(id)a4;
- (void)validatePixelFormatWithHeap:(unint64_t)a3 context:(_MTLMessageContext *)a4;
- (void)validateRaytracingHeap;
- (void)validateTextureAtomicFlags:(id)a3 context:(_MTLMessageContext *)a4;
@end

@implementation MTLDebugHeap

- (void)validatePixelFormatWithHeap:(unint64_t)a3 context:(_MTLMessageContext *)a4
{
  if ([(MTLToolsHeap *)self type] == 2) {
    MTLPixelFormatGetInfoForDevice();
  }
}

- (void)validateHeapResourceOptions:(unint64_t)a3 isTexture:(BOOL)a4 isIOSurface:(BOOL)a5 context:(_MTLMessageContext *)a6
{
  BOOL v6 = a4;
  unint64_t v9 = a3 & 0xF;
  unint64_t v10 = (a3 >> 8) & 3;
  if (v10 && v10 != [(MTLToolsHeap *)self hazardTrackingMode]) {
    _MTLMessageContextPush_();
  }
  if (v9 != [(MTLToolsHeap *)self cpuCacheMode]) {
    _MTLMessageContextPush_();
  }
  if (a3 >> 4 == [(MTLToolsHeap *)self storageMode])
  {
    if (a3 >> 4) {
      goto LABEL_11;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (a3 >> 4) {
      goto LABEL_11;
    }
  }
  if (v6
    && ([(MTLDevice *)[(MTLToolsObject *)self device] supportsSharedStorageTextures] & 1) == 0)
  {
    _MTLMessageContextPush_();
  }
LABEL_11:
  if ((a3 & 0xFFFFFFFFFFF3FC00) != 0) {
    _MTLMessageContextPush_();
  }
}

- (void)validateHeapTextureUsage:(unint64_t)a3 options:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  char v5 = a3;
  int64_t v6 = [(MTLToolsHeap *)self type];
  if ((v5 & 2) != 0 && v6 == 2)
  {
    _MTLMessageContextPush_();
  }
}

- (void)validateTextureAtomicFlags:(id)a3 context:(_MTLMessageContext *)a4
{
  if (([a3 usage] & 0x20) != 0)
  {
    if (([a3 usage] & 3) == 0) {
      _MTLMessageContextPush_();
    }
    if ([a3 pixelFormat] != 53
      && [a3 pixelFormat] != 54
      && [a3 pixelFormat] != 103)
    {
      _MTLMessageContextPush_();
    }
  }
}

- (MTLDebugHeap)initWithHeap:(id)a3 device:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugHeap;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3);
  if (result)
  {
    result->_debugDevice = (MTLDebugDevice *)a4;
    atomic_store(0, (unsigned int *)&result->super.super._externalReferences + 1);
    LOBYTE(result->_purgeableStateToken.__a_.__a_value) = 0;
  }
  return result;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  if ((a3 & (a3 - 1)) != 0) {
    MTLReportFailure();
  }
  id v5 = [(MTLToolsObject *)self baseObject];

  return [v5 maxAvailableSizeWithAlignment:a3];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self size] < a3)
  {
    unint64_t v11 = a3;
    unint64_t v13 = [(MTLToolsHeap *)self size];
    _MTLMessageContextPush_();
  }
  if ((void)[(MTLToolsDevice *)self->_debugDevice limits][256] < a3)
  {
    unint64_t v12 = a3;
    uint64_t v14 = (void)[(MTLToolsDevice *)self->_debugDevice limits][256] >> 20;
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self type] == 2) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self type] == 1) {
    _MTLMessageContextPush_();
  }
  [(MTLDebugHeap *)self validateHeapResourceOptions:a4 isTexture:0 isIOSurface:0 context:v15];
  _MTLMessageContextEnd();
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (!v7) {
    return 0;
  }
  v8 = (void *)v7;
  unint64_t v9 = [[MTLDebugBuffer alloc] initWithBuffer:v7 heap:self device:self->_debugDevice options:a4];

  return v9;
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self type] == 1) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v9[0])
  {
    [(MTLDebugDevice *)self->_debugDevice validateMemorylessResource:a3 context:v9];
    if ([a3 textureType] == 9) {
      _validateTextureBufferDescriptor(a3, [(MTLToolsObject *)self->_debugDevice baseObject]);
    }
    -[MTLDebugHeap validateHeapResourceOptions:isTexture:isIOSurface:context:](self, "validateHeapResourceOptions:isTexture:isIOSurface:context:", [a3 resourceOptions], 1, 0, v9);
    -[MTLDebugHeap validateHeapTextureUsage:options:context:](self, "validateHeapTextureUsage:options:context:", [a3 usage], objc_msgSend(a3, "resourceOptions"), v9);
    if ([(MTLToolsHeap *)self type] == 2
      && ([(MTLToolsHeap *)self type] != 2
       || ([(MTLDevice *)[(MTLToolsObject *)self device] supportsSparseTextures] & 1) == 0))
    {
      _MTLMessageContextPush_();
    }
    if (-[MTLToolsHeap type](self, "type") == 2 && [a3 storageMode] != 2) {
      _MTLMessageContextPush_();
    }
    if ([(MTLToolsHeap *)self type] == 2)
    {
      if (![a3 textureType] || objc_msgSend(a3, "textureType") == 1) {
        _MTLMessageContextPush_();
      }
      if ([a3 textureType] == 9) {
        _MTLMessageContextPush_();
      }
    }
    if ([a3 sparseSurfaceDefaultValue] == 1 && objc_msgSend(a3, "pixelFormat") != 252) {
      _MTLMessageContextPush_();
    }
    -[MTLDebugHeap validatePixelFormatWithHeap:context:](self, "validatePixelFormatWithHeap:context:", [a3 pixelFormat], v9);
    [(MTLDebugHeap *)self validateTextureAtomicFlags:a3 context:v9];
  }
  _MTLMessageContextEnd();
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (!v5) {
    return 0;
  }
  objc_super v6 = (void *)v5;
  uint64_t v7 = [[MTLDebugTexture alloc] initWithBaseTexture:v5 heap:self device:self->_debugDevice];

  return v7;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->super.super._externalReferences + 1)) {
        MTLReportFailure();
      }
    }
    LOBYTE(self->_purgeableStateToken.__a_.__a_value) = 1;
  }
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 setPurgeableState:a3];
}

- (void)lockPurgeableState
{
}

- (void)unlockPurgeableState
{
}

- (BOOL)purgeableStateValidForRendering
{
  return !LOBYTE(self->_purgeableStateToken.__a_.__a_value)
      || [(MTLDebugHeap *)self setPurgeableState:1] == 2;
}

- (void)validateOffset:(unint64_t)a3 withRequirements:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (var0 + a3 > [(MTLToolsHeap *)self size])
  {
    [(MTLToolsHeap *)self size];
    _MTLMessageContextPush_();
  }
  if (a3 % var1) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self size] < a3)
  {
    unint64_t v15 = a3;
    unint64_t v17 = [(MTLToolsHeap *)self size];
    _MTLMessageContextPush_();
  }
  if ((void)[(MTLToolsDevice *)self->_debugDevice limits][256] < a3)
  {
    unint64_t v16 = a3;
    uint64_t v18 = (void)[(MTLToolsDevice *)self->_debugDevice limits][256] >> 20;
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self type] != 1) {
    _MTLMessageContextPush_();
  }
  [(MTLDebugHeap *)self validateHeapResourceOptions:a4 isTexture:0 isIOSurface:0 context:v19];
  _MTLMessageContextEnd();
  uint64_t v9 = [(MTLDevice *)[(MTLToolsObject *)self device] heapBufferSizeAndAlignWithLength:a3 options:a4];
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a5, v9, v10);
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:offset:", a3, a4, a5);
  if (!v11) {
    return 0;
  }
  unint64_t v12 = (void *)v11;
  unint64_t v13 = [[MTLDebugBuffer alloc] initWithBuffer:v11 heap:self device:self->_debugDevice options:a4];

  return v13;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsHeap *)self type] != 1) {
    _MTLMessageContextPush_();
  }
  if (!*(void *)&v13[0])
  {
    [(MTLDebugDevice *)self->_debugDevice validateMemorylessResource:a3 context:v13];
    if ([a3 textureType] == 9) {
      _validateTextureBufferDescriptor(a3, [(MTLToolsObject *)self->_debugDevice baseObject]);
    }
    -[MTLDebugHeap validateHeapResourceOptions:isTexture:isIOSurface:context:](self, "validateHeapResourceOptions:isTexture:isIOSurface:context:", [a3 resourceOptions], 1, 0, v13);
    -[MTLDebugHeap validateHeapTextureUsage:options:context:](self, "validateHeapTextureUsage:options:context:", [a3 usage], objc_msgSend(a3, "resourceOptions"), v13);
    -[MTLDebugHeap validatePixelFormatWithHeap:context:](self, "validatePixelFormatWithHeap:context:", [a3 pixelFormat], v13);
    [(MTLDebugHeap *)self validateTextureAtomicFlags:a3 context:v13];
  }
  _MTLMessageContextEnd();
  uint64_t v7 = [(MTLDevice *)[(MTLToolsObject *)self device] heapTextureSizeAndAlignWithDescriptor:a3];
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v7, v8);
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:", a3, a4);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [[MTLDebugTexture alloc] initWithBaseTexture:v9 heap:self device:self->_debugDevice];

  return v11;
}

- (id)_newDebugAccelerationStructure:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [[MTLDebugAccelerationStructure alloc] initWithBaseObject:a3 parent:self heap:self];

  return v4;
}

- (void)validateRaytracingHeap
{
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsRaytracing] & 1) == 0) {
    MTLReportFailure();
  }
  if ([(MTLToolsHeap *)self storageMode] != 2)
  {
    MTLReportFailure();
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  [(MTLDebugHeap *)self validateRaytracingHeap];
  if (!a3) {
    MTLReportFailure();
  }
  if ([(MTLToolsHeap *)self size] < a3)
  {
    unint64_t v7 = a3;
    unint64_t v8 = [(MTLToolsHeap *)self size];
    MTLReportFailure();
  }
  uint64_t v5 = -[MTLToolsObject newAccelerationStructureWithSize:](self->super.super._baseObject, "newAccelerationStructureWithSize:", a3, v7, v8);

  return [(MTLDebugHeap *)self _newDebugAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  [(MTLDebugHeap *)self validateRaytracingHeap];
  checkAccelerationStructureDescriptor([(MTLToolsObject *)self device], a3, 0);
  uint64_t v5 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3)];

  return [(MTLDebugHeap *)self _newDebugAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  [(MTLDebugHeap *)self validateRaytracingHeap];
  if ([(MTLToolsHeap *)self type] == 1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3) {
      goto LABEL_3;
    }
  }
  MTLReportFailure();
LABEL_3:
  if ([(MTLToolsHeap *)self size] < a3)
  {
    unint64_t v11 = a3;
    unint64_t v12 = [(MTLToolsHeap *)self size];
    MTLReportFailure();
  }
  uint64_t v7 = [(MTLDevice *)[(MTLToolsObject *)self device] heapAccelerationStructureSizeAndAlignWithSize:a3];
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v7, v8);
  uint64_t v9 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithSize:a3 offset:a4];

  return [(MTLDebugHeap *)self _newDebugAccelerationStructure:v9];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  [(MTLDebugHeap *)self validateRaytracingHeap];
  checkAccelerationStructureDescriptor([(MTLToolsObject *)self device], a3, 0);
  if ([(MTLToolsHeap *)self type] != 1) {
    MTLReportFailure();
  }
  uint64_t v7 = [(MTLDevice *)[(MTLToolsObject *)self device] heapAccelerationStructureSizeAndAlignWithDescriptor:a3];
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v7, v8);
  uint64_t v9 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3) offset:a4];

  return [(MTLDebugHeap *)self _newDebugAccelerationStructure:v9];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  [(MTLDebugHeap *)self validateRaytracingHeap];
  if (!a3) {
    MTLReportFailure();
  }
  if ([(MTLToolsHeap *)self size] < a3)
  {
    unint64_t v9 = a3;
    unint64_t v10 = [(MTLToolsHeap *)self size];
    MTLReportFailure();
  }
  uint64_t v7 = -[MTLToolsObject newAccelerationStructureWithSize:resourceIndex:](self->super.super._baseObject, "newAccelerationStructureWithSize:resourceIndex:", a3, a4, v9, v10);

  return [(MTLDebugHeap *)self _newDebugAccelerationStructure:v7];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  [(MTLDebugHeap *)self validateRaytracingHeap];
  if ([(MTLToolsHeap *)self type] == 1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3) {
      goto LABEL_3;
    }
  }
  MTLReportFailure();
LABEL_3:
  if ([(MTLToolsHeap *)self size] < a3)
  {
    unint64_t v13 = a3;
    unint64_t v14 = [(MTLToolsHeap *)self size];
    MTLReportFailure();
  }
  uint64_t v9 = [(MTLDevice *)[(MTLToolsObject *)self device] heapAccelerationStructureSizeAndAlignWithSize:a3];
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v9, v10);
  uint64_t v11 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithSize:a3 offset:a4 resourceIndex:a5];

  return [(MTLDebugHeap *)self _newDebugAccelerationStructure:v11];
}

- (BOOL)detachBacking
{
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsResourceDetachBacking] & 1) == 0)MTLReportFailure(); {
  id v3 = [(MTLToolsObject *)self baseObject];
  }

  return [v3 detachBacking];
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsResourceDetachBacking] & 1) == 0)MTLReportFailure(); {
  [(MTLToolsObject *)self device];
  }
  _MTLMessageContextBegin_();
  [(MTLDebugDevice *)self->_debugDevice validateAddressRanges:a3 expectedTotalSize:[(MTLToolsHeap *)self size] context:&v8];
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithRanges:readOnly:", a3, v4);
}

- (MTLDebugDevice)debugDevice
{
  return self->_debugDevice;
}

@end
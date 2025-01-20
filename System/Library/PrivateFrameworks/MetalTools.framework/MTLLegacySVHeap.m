@interface MTLLegacySVHeap
- (MTLLegacySVHeap)initWithHeap:(id)a3 descriptor:(id)a4 device:(id)a5;
- (id).cxx_construct;
- (id)_newGPUDebugAccelerationStructure:(id)a3;
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
- (void)enumerateAccelerationStructureIndices:(id)a3;
- (void)enumerateBufferIndices:(id)a3;
- (void)enumerateTextureIndices:(id)a3;
- (void)notifyResourceReleasing:(id)a3;
@end

@implementation MTLLegacySVHeap

- (MTLLegacySVHeap)initWithHeap:(id)a3 descriptor:(id)a4 device:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVHeap;
  result = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a5];
  if (result)
  {
    *(_DWORD *)&result->_enableResourceUsageValidation = 0;
    result->_textureLock._os_unfair_lock_opaque = 0;
    *((unsigned char *)&result->super.super._externalReferences + 4) = (*(void *)((unsigned char *)a5 + 284) & 0x200000001) != 0;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super.super._baseObject newBufferWithLength:a3 options:a4];
  if (!v5) {
    return 0;
  }
  v6 = (void *)v5;
  objc_super v7 = [[MTLLegacySVBuffer alloc] initWithBuffer:v5 heap:self device:self->super.super._device];
  addBufferForUsageValidation(self, v7);

  return v7;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v6 = [(MTLToolsObject *)self->super.super._baseObject newBufferWithLength:a3 options:a4 offset:a5];
  if (!v6) {
    return 0;
  }
  objc_super v7 = (void *)v6;
  v8 = [[MTLLegacySVBuffer alloc] initWithBuffer:v6 heap:self device:self->super.super._device];
  addBufferForUsageValidation(self, v8);

  return v8;
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v4 = [(MTLToolsObject *)self->super.super._baseObject newTextureWithDescriptor:a3];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = [[MTLLegacySVTexture alloc] initWithTexture:v4 heap:self device:self->super.super._device];
  addTextureForUsageValidation(self, v6);

  return v6;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super.super._baseObject newTextureWithDescriptor:a3 offset:a4];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)v5;
  objc_super v7 = [[MTLLegacySVTexture alloc] initWithTexture:v5 heap:self device:self->super.super._device];
  addTextureForUsageValidation(self, v7);

  return v7;
}

- (void)notifyResourceReleasing:(id)a3
{
  if (*((unsigned char *)&self->super.super._externalReferences + 4))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      p_textureLock = &self->_textureLock;
      os_unfair_lock_lock(&self->_textureLock);
      p_textureIndices = &self->_textureIndices;
      begin = (__int32 *)self->_textureIndices.__begin_;
      end = (__int32 *)p_textureIndices->__end_;
      __int32 v17 = [a3 resourceIndex];
      std::remove[abi:ne180100]<std::__wrap_iter<unsigned int *>,unsigned int>(begin, end, &v17);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        p_textureLock = (os_unfair_lock_s *)&self->_enableResourceUsageValidation;
        os_unfair_lock_lock((os_unfair_lock_t)&self->_enableResourceUsageValidation);
        p_bufferIndices = &self->_bufferIndices;
        v10 = (__int32 *)self->_bufferIndices.__begin_;
        v11 = (__int32 *)p_bufferIndices->__end_;
        __int32 v16 = [a3 bufferIndex];
        std::remove[abi:ne180100]<std::__wrap_iter<unsigned int *>,unsigned int>(v10, v11, &v16);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return;
        }
        p_textureLock = (os_unfair_lock_s *)&self->_enableResourceUsageValidation;
        os_unfair_lock_lock((os_unfair_lock_t)&self->_enableResourceUsageValidation);
        p_accelerationStructureIndices = &self->_accelerationStructureIndices;
        v13 = (__int32 *)self->_accelerationStructureIndices.__begin_;
        v14 = (__int32 *)p_accelerationStructureIndices->__end_;
        __int32 v15 = [a3 resourceIndex];
        std::remove[abi:ne180100]<std::__wrap_iter<unsigned int *>,unsigned int>(v13, v14, &v15);
      }
    }
    os_unfair_lock_unlock(p_textureLock);
  }
}

- (void)enumerateBufferIndices:(id)a3
{
  p_enableResourceUsageValidation = &self->_enableResourceUsageValidation;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_enableResourceUsageValidation);
  (*((void (**)(id))a3 + 2))(a3);

  os_unfair_lock_unlock((os_unfair_lock_t)p_enableResourceUsageValidation);
}

- (void)enumerateTextureIndices:(id)a3
{
  p_textureLock = &self->_textureLock;
  os_unfair_lock_lock(&self->_textureLock);
  (*((void (**)(id))a3 + 2))(a3);

  os_unfair_lock_unlock(p_textureLock);
}

- (void)enumerateAccelerationStructureIndices:(id)a3
{
  p_accelerationStructureLock = &self->_accelerationStructureLock;
  os_unfair_lock_lock(&self->_accelerationStructureLock);
  (*((void (**)(id))a3 + 2))(a3);

  os_unfair_lock_unlock(p_accelerationStructureLock);
}

- (id)_newGPUDebugAccelerationStructure:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:a3 heap:self];
  if (*((unsigned char *)&self->super.super._externalReferences + 4))
  {
    p_accelerationStructureLock = &self->_accelerationStructureLock;
    os_unfair_lock_lock(&self->_accelerationStructureLock);
    unsigned int v7 = [(MTLToolsAccelerationStructure *)v5 resourceIndex];
    unsigned int v8 = v7;
    p_accelerationStructureIndices = &self->_accelerationStructureIndices;
    end = p_accelerationStructureIndices->__end_;
    value = p_accelerationStructureIndices->__end_cap_.__value_;
    if (end >= value)
    {
      begin = p_accelerationStructureIndices->__begin_;
      uint64_t v14 = end - p_accelerationStructureIndices->__begin_;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v16 = (char *)value - (char *)begin;
      if (v16 >> 1 > v15) {
        unint64_t v15 = v16 >> 1;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&p_accelerationStructureIndices->__end_cap_, v17);
        begin = p_accelerationStructureIndices->__begin_;
        end = p_accelerationStructureIndices->__end_;
      }
      else
      {
        v18 = 0;
      }
      v19 = (unsigned int *)&v18[4 * v14];
      v20 = (unsigned int *)&v18[4 * v17];
      unsigned int *v19 = v8;
      v12 = v19 + 1;
      while (end != begin)
      {
        unsigned int v21 = *--end;
        *--v19 = v21;
      }
      p_accelerationStructureIndices->__begin_ = v19;
      p_accelerationStructureIndices->__end_ = v12;
      p_accelerationStructureIndices->__end_cap_.__value_ = v20;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      unsigned int *end = v7;
      v12 = end + 1;
    }
    p_accelerationStructureIndices->__end_ = v12;
    os_unfair_lock_unlock(p_accelerationStructureLock);
  }

  return v5;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  uint64_t v4 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithSize:a3];

  return [(MTLLegacySVHeap *)self _newGPUDebugAccelerationStructure:v4];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  uint64_t v4 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3)];

  return [(MTLLegacySVHeap *)self _newGPUDebugAccelerationStructure:v4];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithSize:a3 offset:a4];

  return [(MTLLegacySVHeap *)self _newGPUDebugAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3) offset:a4];

  return [(MTLLegacySVHeap *)self _newGPUDebugAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  uint64_t v5 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithSize:a3 resourceIndex:a4];

  return [(MTLLegacySVHeap *)self _newGPUDebugAccelerationStructure:v5];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  uint64_t v6 = [(MTLToolsObject *)self->super.super._baseObject newAccelerationStructureWithSize:a3 offset:a4 resourceIndex:a5];

  return [(MTLLegacySVHeap *)self _newGPUDebugAccelerationStructure:v6];
}

- (void).cxx_destruct
{
  p_accelerationStructureIndices = &self->_accelerationStructureIndices;
  begin = self->_accelerationStructureIndices.__begin_;
  if (begin)
  {
    p_accelerationStructureIndices->__end_ = begin;
    operator delete(begin);
  }
  uint64_t v5 = self->_textureIndices.__begin_;
  if (v5)
  {
    self->_textureIndices.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = self->_bufferIndices.__begin_;
  if (v6)
  {
    self->_bufferIndices.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 14) = 0;
  return self;
}

@end
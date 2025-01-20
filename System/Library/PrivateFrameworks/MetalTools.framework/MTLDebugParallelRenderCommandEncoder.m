@interface MTLDebugParallelRenderCommandEncoder
- (MTLDebugParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (MTLRenderPassDescriptor)descriptor;
- (id)description;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)formattedDescription:(unint64_t)a3;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (void)dealloc;
- (void)endEncoding;
- (void)endEncoding_private;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)mergeAttachmentWriteMask:(unint64_t)a3;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
@end

@implementation MTLDebugParallelRenderCommandEncoder

- (MTLDebugParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  v6 = -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:](&v13, sel_initWithParallelRenderCommandEncoder_parent_descriptor_, a3, a4);
  if (v6)
  {
    v7 = (MTLRenderPassDescriptor *)[a5 copy];
    v6->_descriptor = v7;
    if (v7)
    {
      v8 = [(MTLRenderPassDescriptor *)v7 colorAttachments];
      for (uint64_t i = 0; i != 10; ++i)
      {
        v10 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)v8 _descriptorAtIndex:i];
        if (v10)
        {
          v11 = v10;
          if ([v10 texture])
          {
            if ([v11 storeAction] == 4) {
              *(&v6->_unknownStoreActions + 1) |= 1 << i;
            }
          }
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void)mergeAttachmentWriteMask:(unint64_t)a3
{
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  v7 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
  {
    v9 = [[MTLDebugRenderCommandEncoder alloc] initWithRenderCommandEncoder:v8 parallelRenderCommandEncoder:self descriptor:self->_descriptor];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)renderCommandEncoder
{
  objc_super v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (v4)
  {
    v5 = [[MTLDebugRenderCommandEncoder alloc] initWithRenderCommandEncoder:v4 parallelRenderCommandEncoder:self descriptor:self->_descriptor];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (a4 >= 8)
  {
    unint64_t v9 = a4;
    uint64_t v10 = 8;
    MTLReportFailure();
  }
  v7 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)self->_descriptor colorAttachments] _descriptorAtIndex:a4];
  _MTLDebugValidateDeferredStoreActionOnDevice([(MTLToolsObject *)self device], a3, v7, a4, *(&self->_unknownStoreActions + 1));
  [v7 setStoreAction:a3];
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setColorStoreAction:a3 atIndex:a4];
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  v5 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)self->_descriptor colorAttachments] _descriptorAtIndex:8];
  _MTLDebugValidateDeferredStoreActionOnDevice([(MTLToolsObject *)self device], a3, v5, 8uLL, *(&self->_unknownStoreActions + 1));
  [v5 setStoreAction:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setDepthStoreAction:a3];
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  v5 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)self->_descriptor colorAttachments] _descriptorAtIndex:9];
  _MTLDebugValidateDeferredStoreActionOnDevice([(MTLToolsObject *)self device], a3, v5, 9uLL, *(&self->_unknownStoreActions + 1));
  [v5 setStoreAction:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setStencilStoreAction:a3];
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (a4 >= 8)
  {
    unint64_t v9 = a4;
    uint64_t v10 = 8;
    MTLReportFailure();
  }
  v7 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)self->_descriptor colorAttachments] _descriptorAtIndex:a4];
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice([(MTLToolsObject *)self device], a3, v7, a4, *(&self->_unknownStoreActions + 1));
  [v7 setStoreActionOptions:a3];
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setColorStoreActionOptions:a3 atIndex:a4];
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  v5 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)self->_descriptor colorAttachments] _descriptorAtIndex:8];
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice([(MTLToolsObject *)self device], a3, v5, 8, *(&self->_unknownStoreActions + 1));
  [v5 setStoreActionOptions:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setDepthStoreActionOptions:a3];
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  v5 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)self->_descriptor colorAttachments] _descriptorAtIndex:9];
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice([(MTLToolsObject *)self device], a3, v5, 9, *(&self->_unknownStoreActions + 1));
  [v5 setStoreActionOptions:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setStencilStoreActionOptions:a3];
}

- (void)endEncoding_private
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  descriptor = self->_descriptor;
  if (descriptor)
  {
    uint64_t v4 = [(MTLRenderPassDescriptor *)descriptor colorAttachments];
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v21 = 0;
    uint64_t v7 = 0;
    int v8 = 0;
    int v9 = 0;
    do
    {
      uint64_t v10 = (void *)[(MTLRenderPassColorAttachmentDescriptorArray *)v4 _descriptorAtIndex:v5];
      if (v10)
      {
        v11 = v10;
        uint64_t v12 = [v10 texture];
        if (v12)
        {
          objc_super v13 = (void *)v12;
          if (v5 > 7)
          {
            uint64_t v14 = [v11 storeAction];
            if (v5 == 8)
            {
              if (v14 == 4) {
                MTLReportFailure();
              }
              uint64_t v7 = [v11 storeAction];
              int v9 = 1;
            }
            else
            {
              if (v14 == 4) {
                MTLReportFailure();
              }
              uint64_t v21 = [v11 storeAction];
              uint64_t v6 = *(void *)([v11 _descriptorPrivate] + 104);
              int v8 = 1;
            }
          }
          else if ([v11 storeAction] == 4)
          {
            unint64_t v20 = v5;
            MTLReportFailure();
          }
          if (objc_msgSend(v13, "storageMode", v20, v21) == 3
            && [v11 storeAction]
            && [v11 storeAction] != 2)
          {
            MTLReportFailure();
          }
          int v15 = MTLReportFailureTypeEnabled();
          if (v5 <= 7 && v15 && ((*(&self->_unknownStoreActions + 1) >> v5) & 1) != 0) {
            [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] validateStoreLoadTransition:v11 atIndex:v5 renderTargetArrayLength:[(MTLRenderPassDescriptor *)self->_descriptor renderTargetArrayLength]];
          }
        }
      }
      ++v5;
    }
    while (v5 != 10);
    if (v9 & v8) {
      _MTLValidateDepthStencilStoreState(v7, v21, v6, 0);
    }
    if ([(MTLToolsDevice *)self->super.super.super._device storeValidationEnabled])
    {
      v16 = (void *)MEMORY[0x23ECD5710]();
      id v17 = [(MTLDebugParallelRenderCommandEncoder *)self renderCommandEncoder];
      v22[0] = xmmword_23BE4AD30;
      v22[1] = unk_23BE4AD40;
      device = self->super.super.super._device;
      unint64_t v19 = atomic_load(&self->_attachmentWriteMask.__a_.__a_value);
      [(MTLToolsDevice *)device clearRenderEncoder:v17 writeMask:v19 withCheckerboard:v22];
      [v17 endEncoding];
    }
  }
}

- (void)endEncoding
{
  [(MTLDebugParallelRenderCommandEncoder *)self endEncoding_private];
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  [(MTLToolsParallelRenderCommandEncoder *)&v3 endEncoding];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  [(MTLDebugParallelRenderCommandEncoder *)self endEncoding_private];
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  return [(MTLToolsParallelRenderCommandEncoder *)&v4 endEncodingAndRetrieveProgramAddressTable];
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  id v6 = [(MTLToolsObject *)&v10 description];
  descriptor = self->_descriptor;
  if (descriptor) {
    int v8 = (__CFString *)[(MTLRenderPassDescriptor *)descriptor formattedDescription:a3 + 4];
  }
  else {
    int v8 = @"<null>";
  }
  return (id)[v5 stringWithFormat:@"%@%@", v6, v8];
}

- (id)description
{
  return [(MTLDebugParallelRenderCommandEncoder *)self formattedDescription:0];
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  MTLReportFailure();
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 filterCounterRangeWithFirstBatch:v7 lastBatch:v6 filterIndex:v5];
}

- (MTLRenderPassDescriptor)descriptor
{
  return self->_descriptor;
}

@end
@interface MTLLegacySVCommandQueue
- (MTLLegacySVCommandQueue)initWithCommandQueue:(id)a3 device:(id)a4;
- (NSString)tracePath;
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
@end

@implementation MTLLegacySVCommandQueue

- (MTLLegacySVCommandQueue)initWithCommandQueue:(id)a3 device:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVCommandQueue;
  result = -[MTLToolsCommandQueue initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3);
  if (result) {
    result->_deviceOptions = (LegacySVDeviceOptions *)((char *)a4 + 292);
  }
  return result;
}

- (id)commandBuffer
{
  v2 = -[MTLLegacySVCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLLegacySVCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer"), self, 0);

  return v2;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  id v6 = [(MTLToolsDevice *)self->super.super._device unwrapMTLCommandBufferDescriptor:a3 alwaysCopy:1];
  [v6 setRetainedReferences:1];
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", v6);
  if (v7)
  {
    v8 = [[MTLLegacySVCommandBuffer alloc] initWithCommandBuffer:v7 commandQueue:self descriptor:a3];
    return v8;
  }
  else
  {
    return 0;
  }
}

- (NSString)tracePath
{
  return self->_tracePath;
}

@end
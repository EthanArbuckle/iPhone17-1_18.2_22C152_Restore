@interface MTLCountersParallelRenderCommandEncoder
- (MTLCountersParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
@end

@implementation MTLCountersParallelRenderCommandEncoder

- (MTLCountersParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLCountersParallelRenderCommandEncoder;
  return [(MTLToolsParallelRenderCommandEncoder *)&v6 initWithParallelRenderCommandEncoder:a3 parent:a4 descriptor:a5];
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  v7 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
  {
    v9 = [[MTLCountersRenderCommandEncoder alloc] initWithRenderCommandEncoder:v8 parent:self];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)renderCommandEncoder
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (v4)
  {
    v5 = [[MTLCountersRenderCommandEncoder alloc] initWithRenderCommandEncoder:v4 parent:self];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setColorStoreAction:a3 atIndex:a4];
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDepthStoreAction:a3];
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStencilStoreAction:a3];
}

@end
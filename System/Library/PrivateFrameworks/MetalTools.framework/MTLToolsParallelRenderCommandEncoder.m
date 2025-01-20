@interface MTLToolsParallelRenderCommandEncoder
- (BOOL)isMemorylessRender;
- (MTLToolsParallelRenderCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsParallelRenderCommandEncoder)initWithParallelRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (void)endEncoding;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
@end

@implementation MTLToolsParallelRenderCommandEncoder

- (MTLToolsParallelRenderCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsParallelRenderCommandEncoder;
  return [(MTLToolsCommandEncoder *)&v5 initWithBaseObject:a3 parent:a4];
}

- (MTLToolsParallelRenderCommandEncoder)initWithParallelRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLToolsParallelRenderCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3);
  if (v7)
  {
    [a4 retainObjectsFromRenderPassDescriptor:a5];
    [a4 setUseRetainedObjectsLock:1];
  }
  return v7;
}

- (void)endEncoding
{
  [(MTLToolsObject *)self->super.super._parent setUseRetainedObjectsLock:0];
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsParallelRenderCommandEncoder;
  [(MTLToolsCommandEncoder *)&v3 endEncoding];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  [(MTLToolsObject *)self->super.super._parent setUseRetainedObjectsLock:0];
  id v3 = [(MTLToolsObject *)self baseObject];

  return (id)[v3 endEncodingAndRetrieveProgramAddressTable];
}

- (BOOL)isMemorylessRender
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isMemorylessRender];
}

- (id)renderCommandEncoder
{
  id v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (v4) {
    objc_super v5 = [(MTLToolsCommandEncoder *)[MTLToolsRenderCommandEncoder alloc] initWithBaseObject:v4 parallelRenderCommandEncoder:self];
  }
  else {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  v7 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8) {
    objc_super v9 = [(MTLToolsCommandEncoder *)[MTLToolsRenderCommandEncoder alloc] initWithBaseObject:v8 parallelRenderCommandEncoder:self];
  }
  else {
    objc_super v9 = 0;
  }

  return v9;
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

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setColorStoreActionOptions:a3 atIndex:a4];
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDepthStoreActionOptions:a3];
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStencilStoreActionOptions:a3];
}

@end
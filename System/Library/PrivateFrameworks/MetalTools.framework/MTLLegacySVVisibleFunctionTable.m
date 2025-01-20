@interface MTLLegacySVVisibleFunctionTable
- (MTLLegacySVVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 computePipeline:(id)a5;
- (MTLLegacySVVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 device:(id)a5;
- (MTLLegacySVVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 renderPipeline:(id)a5 stage:(unint64_t)a6;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)gpuAddress;
- (unint64_t)handleForOffset:(unint64_t)a3;
- (unint64_t)length;
- (void)_setupCommon;
- (void)dealloc;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4;
- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
@end

@implementation MTLLegacySVVisibleFunctionTable

- (MTLLegacySVVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 computePipeline:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVVisibleFunctionTable;
  v5 = [(MTLToolsResource *)&v7 initWithBaseObject:a3 parent:a5];
  [(MTLLegacySVVisibleFunctionTable *)v5 _setupCommon];
  return v5;
}

- (MTLLegacySVVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 renderPipeline:(id)a5 stage:(unint64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVVisibleFunctionTable;
  objc_super v7 = [(MTLToolsResource *)&v9 initWithBaseObject:a3 parent:a5];
  [(MTLLegacySVVisibleFunctionTable *)v7 _setupCommon];
  v7->_stage = a6;
  return v7;
}

- (MTLLegacySVVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 device:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVVisibleFunctionTable;
  v5 = [(MTLToolsResource *)&v7 initWithBaseObject:a3 parent:a5];
  [(MTLLegacySVVisibleFunctionTable *)v5 _setupCommon];
  return v5;
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return *(void *)([(MTLBuffer *)self->_handleBuffer contents] + 8 * a3);
}

- (void)_setupCommon
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setDataType:115];
  [v3 setIndex:0];
  id v4 = [(MTLToolsObject *)self->super.super.super._device originalObject];
  v7[0] = v3;
  v5 = objc_msgSend(v4, "newArgumentEncoderWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 1));

  v6 = objc_msgSend(-[MTLToolsObject originalObject](self->super.super.super._device, "originalObject"), "newBufferWithLength:options:", 8, 0);
  [v5 setArgumentBuffer:v6 offset:0];
  objc_msgSend(v5, "setVisibleFunctionTable:atIndex:", -[MTLToolsObject originalObject](self, "originalObject"), 0);

  self->_gpuIdentifier = *(void *)[v6 contents];
  self->_handleBuffer = (MTLBuffer *)[(MTLToolsDevice *)self->super.super.super._device newInternalBufferWithLength:248 options:0];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7 = [a3 handleForOffset:a4];
  *(void *)([(MTLBuffer *)self->_handleBuffer contents] + 8 * a5) = v7;
  baseObject = self->super.super.super._baseObject;
  handleBuffer = self->_handleBuffer;

  [(MTLToolsObject *)baseObject setBuffer:handleBuffer offset:8 * a5 atIndex:a5];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      [(MTLLegacySVVisibleFunctionTable *)self setBuffer:a3[v10] offset:a4[v10] atIndex:v10 + location];
      uint64_t v10 = v11;
    }
    while (length > v11++);
  }
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->_handleBuffer);
  baseObject = self->super.super.super._baseObject;

  [a3 useResourceInternal:baseObject usage:a4];
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  unint64_t var1 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_handleBuffer);
  baseObject = self->super.super.super._baseObject;

  objc_msgSend(a3, "useResourceInternal:usage:stages:", baseObject, a4, var1, v5);
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return self->_gpuIdentifier;
}

- (unint64_t)gpuAddress
{
  return self->_gpuIdentifier;
}

- (unint64_t)length
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVVisibleFunctionTable;
  [(MTLToolsResource *)&v3 dealloc];
}

@end
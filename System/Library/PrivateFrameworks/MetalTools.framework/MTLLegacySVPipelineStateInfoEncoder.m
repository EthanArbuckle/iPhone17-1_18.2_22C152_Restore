@interface MTLLegacySVPipelineStateInfoEncoder
- (MTLLegacySVPipelineStateInfoEncoder)initWithDevice:(id)a3;
- (unint64_t)encodedLength;
- (void)dealloc;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setComputePipelineState:(id)a3;
- (void)setRenderPipelineState:(id)a3;
@end

@implementation MTLLegacySVPipelineStateInfoEncoder

- (MTLLegacySVPipelineStateInfoEncoder)initWithDevice:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVPipelineStateInfoEncoder;
  v4 = [(MTLLegacySVPipelineStateInfoEncoder *)&v9 init];
  v5 = (void *)MEMORY[0x23ECD5710]();
  id v6 = objc_alloc_init(MEMORY[0x263F127B8]);
  [v6 setArrayLength:0];
  [v6 setAccess:1];
  id v7 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:11];
  [v6 setIndex:0];
  [v6 setDataType:78];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:1];
  [v6 setDataType:79];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:2];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:3];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:4];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:5];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:6];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:7];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:8];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:9];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:10];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:11];
  [v6 setDataType:29];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:12];
  [v6 setDataType:29];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:13];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:14];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:15];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  [v6 setIndex:16];
  [v6 setDataType:30];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  v4->_argumentEncoder = (MTLArgumentEncoder *)objc_msgSend((id)objc_msgSend(a3, "baseObject"), "newArgumentEncoderWithArguments:", v7);
  return v4;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  argumentEncoder = self->_argumentEncoder;
  uint64_t v7 = [a3 baseObject];
  unint64_t v8 = [a3 offset] + a4;

  [(MTLArgumentEncoder *)argumentEncoder setArgumentBuffer:v7 offset:v8];
}

- (void)setRenderPipelineState:(id)a3
{
  -[MTLArgumentEncoder setRenderPipelineState:atIndex:](self->_argumentEncoder, "setRenderPipelineState:atIndex:", [a3 baseObject], 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:2] = a3;
  uint64_t v5 = [a3 vertexFunctionData];
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:3] = v5;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "vertexConstantsBuffer"), "handleForOffset:", 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:7] = v6;
  uint64_t v7 = [a3 fragmentFunctionData];
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:5] = v7;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "fragmentConstantsBuffer"), "handleForOffset:", 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:9] = v8;
  uint64_t v9 = [a3 tileFunctionData];
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:6] = v9;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "tileConstantsBuffer"), "handleForOffset:", 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:10] = v10;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:4] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:8] = 0;
  *(_DWORD *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:11] = 0;
  *(_DWORD *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:12] = 0;
  uint64_t v11 = [a3 meshFunctionData];
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:14] = v11;
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "meshConstantsBuffer"), "handleForOffset:", 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:16] = v12;
  uint64_t v13 = [a3 objectFunctionData];
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:13] = v13;
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "objectConstantsBuffer"), "handleForOffset:", 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:15] = v14;
}

- (void)setComputePipelineState:(id)a3
{
  id v3 = a3;
  -[MTLArgumentEncoder setComputePipelineState:atIndex:](self->_argumentEncoder, "setComputePipelineState:atIndex:", [a3 baseObject], 1);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:2] = v3;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:3] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:7] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:5] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:9] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:6] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:10] = 0;
  uint64_t v5 = [v3 kernelFunctionData];
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:4] = v5;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v3, "globalConstantsBuffer"), "handleForOffset:", 0);
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:8] = v6;
  LODWORD(v6) = objc_msgSend((id)objc_msgSend(v3, "debugInstrumentationData"), "threadgroupArgumentOffset");
  *(_DWORD *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:11] = v6;
  LODWORD(v3) = objc_msgSend((id)objc_msgSend(v3, "debugInstrumentationData"), "activeThreadgroupMask");
  *(_DWORD *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:12] = v3;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:14] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:16] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:13] = 0;
  *(void *)[(MTLArgumentEncoder *)self->_argumentEncoder constantDataAtIndex:15] = 0;
}

- (unint64_t)encodedLength
{
  return [(MTLArgumentEncoder *)self->_argumentEncoder encodedLength];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVPipelineStateInfoEncoder;
  [(MTLLegacySVPipelineStateInfoEncoder *)&v3 dealloc];
}

@end
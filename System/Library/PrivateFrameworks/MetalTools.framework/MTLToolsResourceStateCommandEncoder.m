@interface MTLToolsResourceStateCommandEncoder
- (MTLToolsResourceStateCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8;
- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)updateFence:(id)a3;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7;
- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8;
- (void)waitForFence:(id)a3;
@end

@implementation MTLToolsResourceStateCommandEncoder

- (MTLToolsResourceStateCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  return [(MTLToolsResourceStateCommandEncoder *)self initWithResourceStateCommandEncoder:a3 parent:a4 descriptor:0];
}

- (MTLToolsResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLToolsResourceStateCommandEncoder;
  v6 = [(MTLToolsCommandEncoder *)&v10 initWithBaseObject:a3 parent:a4];
  v7 = v6;
  if (a5 && v6)
  {
    for (uint64_t i = 0; i != 4; ++i)
      -[MTLToolsCommandEncoder addRetainedObject:](v7, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v7;
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];

  [v15 updateTextureMappings:v16 mode:a4 regions:a5 mipLevels:a6 slices:a7 numRegions:a8];
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];
  long long v15 = *(_OWORD *)&a5->var0.var2;
  v16[0] = *(_OWORD *)&a5->var0.var0;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a5->var1.var1;
  [v13 updateTextureMapping:v14 mode:a4 region:v16 mipLevel:a6 slice:a7];
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  uint64_t v13 = [a5 baseObject];

  [v11 updateTextureMapping:v12 mode:a4 indirectBuffer:v13 indirectBufferOffset:a6];
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a7;
  uint64_t v20 = [a8 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a11;
  [v18 moveTextureMappingsFromTexture:v19 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v23 sourceSize:&v22 toTexture:v20 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v21];
}

- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  uint64_t v17 = [a6 baseObject];

  [v15 copyMappingStateFromTexture:v16 mipLevel:a4 slice:a5 toBuffer:v17 offset:a7 numTiles:a8];
}

- (void)updateFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 updateFence:v6];
}

- (void)waitForFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 waitForFence:v6];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 endEncodingAndRetrieveProgramAddressTable];
}

@end
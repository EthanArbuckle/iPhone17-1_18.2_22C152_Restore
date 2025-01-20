@interface PXGSharedMetalRenderContext
- (BOOL)supportsSharedTextures;
- (BOOL)wantsMutableSharedTextures;
- (id)newTextureWithDescriptor:(id)a3;
- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
@end

@implementation PXGSharedMetalRenderContext

- (BOOL)wantsMutableSharedTextures
{
  return 0;
}

- (BOOL)supportsSharedTextures
{
  return 1;
}

- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14 = a4;
  if ([v14 isShareable])
  {
    uint64_t v15 = -*MEMORY[0x263EF8AF8];
    unint64_t v16 = v15 & (unint64_t)a3;
    v17 = (char *)a3 - (v15 & (unint64_t)a3);
    unint64_t v18 = (((unint64_t)a3 + a6 + *MEMORY[0x263EF8AF8] - 1) & v15) - (v15 & (unint64_t)a3);
    v19 = [(PXGMetalRenderContext *)self device];
    v20 = (void *)[v19 newBufferWithBytesNoCopy:v16 length:v18 options:0 deallocator:0];

    long long v21 = *(_OWORD *)&a5->var0.var2;
    long long v23 = *(_OWORD *)&a5->var0.var0;
    long long v24 = v21;
    long long v25 = *(_OWORD *)&a5->var1.var1;
    [(PXGMetalRenderContext *)self _blitFromBuffer:v20 toTexture:v14 inRegion:&v23 bytesPerRow:a7 offset:v17 bytesPerImage:a8];
  }
  else
  {
    long long v22 = *(_OWORD *)&a5->var0.var2;
    long long v23 = *(_OWORD *)&a5->var0.var0;
    long long v24 = v22;
    long long v25 = *(_OWORD *)&a5->var1.var1;
    [(PXGSharedMetalRenderContext *)self copyBytes:a3 toTexture:v14 inRegion:&v23 length:a6 bytesPerRow:a7 bytesPerImage:a8];
  }
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14 = a4;
  if ([v14 isShareable])
  {
    uint64_t v15 = [(PXGMetalRenderContext *)self device];
    unint64_t v16 = (void *)[v15 newBufferWithBytes:a3 length:a6 options:0];

    long long v17 = *(_OWORD *)&a5->var0.var2;
    long long v19 = *(_OWORD *)&a5->var0.var0;
    long long v20 = v17;
    long long v21 = *(_OWORD *)&a5->var1.var1;
    [(PXGMetalRenderContext *)self _blitFromBuffer:v16 toTexture:v14 inRegion:&v19 bytesPerRow:a7 offset:0 bytesPerImage:a8];
  }
  else
  {
    long long v18 = *(_OWORD *)&a5->var0.var2;
    long long v19 = *(_OWORD *)&a5->var0.var0;
    long long v20 = v18;
    long long v21 = *(_OWORD *)&a5->var1.var1;
    if (a8) {
      [v14 replaceRegion:&v19 mipmapLevel:0 slice:0 withBytes:a3 bytesPerRow:a7 bytesPerImage:a8];
    }
    else {
      [v14 replaceRegion:&v19 mipmapLevel:0 withBytes:a3 bytesPerRow:a7];
    }
  }
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v4 = a3;
  [v4 setStorageMode:2];
  v5 = [(PXGMetalRenderContext *)self device];
  v6 = (void *)[v5 newSharedTextureWithDescriptor:v4];

  return v6;
}

@end
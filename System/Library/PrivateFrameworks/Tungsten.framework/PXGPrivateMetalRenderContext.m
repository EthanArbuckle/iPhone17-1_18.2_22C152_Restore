@interface PXGPrivateMetalRenderContext
- (BOOL)supportsSharedTextures;
- (BOOL)wantsMutableSharedTextures;
- (PXGPrivateMetalRenderContext)initWithDevice:(id)a3;
- (id)newTextureWithDescriptor:(id)a3;
- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
@end

@implementation PXGPrivateMetalRenderContext

- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  long long v8 = *(_OWORD *)&a5->var0.var2;
  v9[0] = *(_OWORD *)&a5->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a5->var1.var1;
  [(PXGPrivateMetalRenderContext *)self copyBytes:a3 toTexture:a4 inRegion:v9 length:a6 bytesPerRow:a7 bytesPerImage:a8];
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  long long v8 = *(_OWORD *)&a5->var0.var2;
  v9[0] = *(_OWORD *)&a5->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a5->var1.var1;
  if (a8) {
    objc_msgSend(a4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, 0, a3, a7);
  }
  else {
    [a4 replaceRegion:v9 mipmapLevel:0 withBytes:a3 bytesPerRow:a7];
  }
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [(PXGMetalRenderContext *)self device];
  v6 = (void *)[v5 newTextureWithDescriptor:v4];

  return v6;
}

- (BOOL)wantsMutableSharedTextures
{
  return 0;
}

- (BOOL)supportsSharedTextures
{
  return 0;
}

- (PXGPrivateMetalRenderContext)initWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGPrivateMetalRenderContext;
  return [(PXGMetalRenderContext *)&v4 initWithDevice:a3 commandQueue:0];
}

@end
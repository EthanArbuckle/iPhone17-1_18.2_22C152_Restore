@interface MTLTelemetryBuffer
- (MTLTelemetryBuffer)initWithBuffer:(id)a3 device:(id)a4 bytes:(const void *)a5 options:(unint64_t)a6;
- (MTLTelemetryBuffer)initWithBuffer:(id)a3 device:(id)a4 options:(unint64_t)a5;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (void)accumBufferDistribution:(id)a3 options:(unint64_t)a4;
@end

@implementation MTLTelemetryBuffer

- (void)accumBufferDistribution:(id)a3 options:(unint64_t)a4
{
  if ([a3 enableTelemetry])
  {
    v6 = *((void *)a3 + 91);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__MTLTelemetryBuffer_accumBufferDistribution_options___block_invoke;
    v7[3] = &unk_264E13B98;
    v7[4] = a3;
    v7[5] = self;
    dispatch_sync(v6, v7);
  }
}

uint64_t __54__MTLTelemetryBuffer_accumBufferDistribution_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 216);
  uint64_t result = [*(id *)(a1 + 40) length];
  if (result)
  {
    int v3 = *(_DWORD *)(v1 + 16);
    if (v3)
    {
      if (*(_DWORD *)(v1 + 4) < result) {
        *(_DWORD *)(v1 + 4) = result;
      }
      if (*(_DWORD *)v1 <= result) {
        goto LABEL_9;
      }
    }
    else
    {
      *(_DWORD *)(v1 + 4) = result;
    }
    *(_DWORD *)uint64_t v1 = result;
LABEL_9:
    *(void *)(v1 + 8) += result;
    *(_DWORD *)(v1 + 16) = v3 + 1;
  }
  return result;
}

- (MTLTelemetryBuffer)initWithBuffer:(id)a3 device:(id)a4 options:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryBuffer;
  v7 = -[MTLToolsResource initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3);
  v8 = v7;
  if (v7) {
    [(MTLTelemetryBuffer *)v7 accumBufferDistribution:a4 options:a5];
  }
  return v8;
}

- (MTLTelemetryBuffer)initWithBuffer:(id)a3 device:(id)a4 bytes:(const void *)a5 options:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLTelemetryBuffer;
  v8 = -[MTLToolsResource initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3, a4, a5);
  v9 = v8;
  if (v8) {
    [(MTLTelemetryBuffer *)v8 accumBufferDistribution:a4 options:a6];
  }
  return v9;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5);
  if (result)
  {
    id v10 = result;
    objc_super v11 = [[MTLTelemetryTexture alloc] initWithBaseTexture:result device:[(MTLToolsObject *)self device] buffer:self descriptor:a3 offset:a4 bytesPerRow:a5];

    return v11;
  }
  return result;
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", a3, a4, a5, a6);
  if (result)
  {
    id v11 = result;
    v12 = [[MTLTelemetryTexture alloc] initWithBaseTexture:result device:[(MTLToolsObject *)self device] buffer:self descriptor:a3 offset:a4 bytesPerRow:a5];

    return v12;
  }
  return result;
}

@end
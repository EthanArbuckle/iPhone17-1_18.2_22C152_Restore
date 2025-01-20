@interface MTLTelemetryHeap
- (MTLTelemetryDevice)telemetryDevice;
- (MTLTelemetryHeap)initWithHeap:(id)a3 descriptor:(id)a4 device:(id)a5;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (unint64_t)setPurgeableState:(unint64_t)a3;
@end

@implementation MTLTelemetryHeap

- (MTLTelemetryHeap)initWithHeap:(id)a3 descriptor:(id)a4 device:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)MTLTelemetryHeap;
  v7 = [(MTLToolsObject *)&v12 initWithBaseObject:a3 parent:a5];
  v8 = v7;
  if (v7)
  {
    v7->_telemetryDevice = (MTLTelemetryDevice *)a5;
    if ([a5 enableTelemetry])
    {
      if (*MEMORY[0x263F12D18])
      {
        if (*MEMORY[0x263F12D18] != 1) {
          return v8;
        }
        printf("\n\nHeap, size=%u", [a4 size]);
      }
      v9 = [a5 telemetryLog];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [a4 size];
        *(_DWORD *)buf = 67109120;
        int v14 = v10;
        _os_log_impl(&dword_23BD25000, v9, OS_LOG_TYPE_DEFAULT, "Heap, size=%u", buf, 8u);
      }
    }
  }
  return v8;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (result)
  {
    id v7 = result;
    v8 = [[MTLTelemetryBuffer alloc] initWithBuffer:result device:self->_telemetryDevice options:a4];

    return v8;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLTelemetryTexture alloc] initWithBaseTexture:result device:self->_telemetryDevice descriptor:a3];

    return v7;
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setPurgeableState:a3];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:offset:", a3, a4, a5);
  if (result)
  {
    id v8 = result;
    v9 = [[MTLTelemetryBuffer alloc] initWithBuffer:result device:self->_telemetryDevice options:a4];

    return v9;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:", a3, a4);
  if (result)
  {
    id v7 = result;
    id v8 = [[MTLTelemetryTexture alloc] initWithBaseTexture:result device:self->_telemetryDevice descriptor:a3];

    return v8;
  }
  return result;
}

- (MTLTelemetryDevice)telemetryDevice
{
  return self->_telemetryDevice;
}

@end
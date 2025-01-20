@interface PXGPayloadTexture
- (BOOL)isOpaque;
- (CGImage)imageRepresentation;
- (CGSize)pixelSize;
- (NSCopying)payload;
- (PXGPayloadTexture)init;
- (PXGPayloadTexture)initWithPayload:(id)a3 presentationType:(unsigned __int8)a4;
- (int64_t)estimatedByteSize;
- (unsigned)presentationType;
@end

@implementation PXGPayloadTexture

- (NSCopying)payload
{
  return self->_payload;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (PXGPayloadTexture)initWithPayload:(id)a3 presentationType:(unsigned __int8)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGPayloadTexture;
  v7 = [(PXGBaseTexture *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:0];
    payload = v7->_payload;
    v7->_payload = (NSCopying *)v8;

    v7->_presentationType = a4;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (CGSize)pixelSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isOpaque
{
  return 0;
}

- (CGImage)imageRepresentation
{
  return 0;
}

- (int64_t)estimatedByteSize
{
  return 0;
}

- (PXGPayloadTexture)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPayloadTexture.m", 25, @"%s is not available as initializer", "-[PXGPayloadTexture init]");

  abort();
}

@end
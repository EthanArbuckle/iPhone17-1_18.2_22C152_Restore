@interface VFXREDrawCall
- (BOOL)drawsForBlur;
- (BOOL)hasCustomHandler;
- (BOOL)hasLightingEnabled;
- (BOOL)isAdditive;
- (BOOL)isDepthOnly;
- (BOOL)needsLinearDepth;
- (BOOL)writesColor;
- (BOOL)writesSeparateDepth;
- (NSString)emitterIdentifier;
- (NSString)renderPassName;
- (VFXREDrawCall)init;
- (id)customHandler;
- (id)indexBuffer;
- (int)materialType;
- (int)renderingOrder;
- (int64_t)indexBufferOffset;
- (int64_t)indexBufferSize;
- (int64_t)indexCount;
- (int64_t)instanceCount;
- (int64_t)vertexCount;
- (uint64_t)boundingBoxMax;
- (uint64_t)boundingBoxMin;
- (unint64_t)materialIdentifier;
- (unint64_t)primitiveType;
- (unint64_t)winding;
- (unsigned)indexType;
- (unsigned)renderPassIdentifier;
- (void)enumerateBuffers:(id)a3;
- (void)setEmitterIdentifier:(id)a3;
- (void)setRenderPassIdentifier:(unsigned __int8)a3;
- (void)setRenderPassName:(id)a3;
- (void)withDefaultIBLConstantBuffer:(void *)a3 :(id)a4;
- (void)withDefaultLightConstantBuffer:(void *)a3 :(id)a4;
@end

@implementation VFXREDrawCall

- (VFXREDrawCall)init
{
  return (VFXREDrawCall *)VFXREDrawCall.init()();
}

- (unint64_t)materialIdentifier
{
  return 0;
}

- (void)enumerateBuffers:(id)a3
{
  v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (BOOL)hasLightingEnabled
{
  return 1;
}

- (void)withDefaultLightConstantBuffer:(void *)a3 :(id)a4
{
}

- (void)withDefaultIBLConstantBuffer:(void *)a3 :(id)a4
{
}

- (int64_t)indexCount
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[8];
}

- (unsigned)indexType
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[7] < 0x100uLL) {
    return (*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[7];
  }
  unsigned __int8 result = sub_1B6E32BD8();
  __break(1u);
  return result;
}

- (id)indexBuffer
{
  v2 = self;
  v3 = (void *)sub_1B6B66A00();

  return v3;
}

- (int64_t)indexBufferOffset
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall);
  if (*(void *)(v2 + 32)) {
    return *(void *)(v2 + 40);
  }
  else {
    return 0;
  }
}

- (int64_t)indexBufferSize
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall);
  if (*(void *)(v2 + 32)) {
    return *(void *)(v2 + 48);
  }
  else {
    return 0;
  }
}

- (int64_t)vertexCount
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[13];
}

- (int64_t)instanceCount
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[15];
}

- (unint64_t)primitiveType
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[2];
}

- (unint64_t)winding
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[18];
}

- (id)customHandler
{
  uint64_t v2 = *(void *)&self->drawCall[OBJC_IVAR___VFXREDrawCall_handler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_handler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_1B6B66BC0;
  v5[3] = &unk_1F0FBA270;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();

  return v3;
}

- (BOOL)hasCustomHandler
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_handler);
  uint64_t v3 = *(void *)&self->drawCall[OBJC_IVAR___VFXREDrawCall_handler];
  if (v2)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v5 = sub_1B6B67B70;
  }
  else
  {
    v5 = 0;
  }
  sub_1B62C6A60(v2);
  sub_1B62C6A50((uint64_t)v5);
  return v2 != 0;
}

- (NSString)renderPassName
{
  return (NSString *)sub_1B6B66DEC();
}

- (void)setRenderPassName:(id)a3
{
}

- (unsigned)renderPassIdentifier
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_renderPassIdentifier);
}

- (void)setRenderPassIdentifier:(unsigned __int8)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_renderPassIdentifier) = a3;
}

- (BOOL)writesColor
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__writesColor);
}

- (BOOL)writesSeparateDepth
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__writesSeparateDepth);
}

- (BOOL)needsLinearDepth
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__needsLinearDepth);
}

- (BOOL)isDepthOnly
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__isDepthOnly);
}

- (BOOL)drawsForBlur
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__drawsForBlur);
}

- (BOOL)isAdditive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__isAdditive);
}

- (int)materialType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall__materialType);
}

- (uint64_t)boundingBoxMin
{
  return sub_1B6B66DB4(a1, a2, (uint64_t (*)(__n128, __n128))sub_1B6B67B30);
}

- (uint64_t)boundingBoxMax
{
  return sub_1B6B66DB4(a1, a2, (uint64_t (*)(__n128, __n128))sub_1B6B67B28);
}

- (int)renderingOrder
{
  return (*(_DWORD **)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_drawCall))[6];
}

- (NSString)emitterIdentifier
{
  return (NSString *)sub_1B6B66DEC();
}

- (void)setEmitterIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B62C6A50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREDrawCall_handler));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
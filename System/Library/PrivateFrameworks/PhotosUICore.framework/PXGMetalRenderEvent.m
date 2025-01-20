@interface PXGMetalRenderEvent
+ (id)eventWithRenderTexture:(id *)a3 pipeline:(id *)a4;
- (PXGMetalRenderEvent)initWithRenderTexture:(id *)a3 pipeline:(id *)a4;
- (id)serializable;
@end

@implementation PXGMetalRenderEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingTexture, 0);
  __destructor_8_s16_s24_s32((uint64_t)&self->_pipeline);
}

- (id)serializable
{
  v3 = objc_alloc_init(PXGMetalRecordingRenderEventSerializable);
  v4 = [(PXGMetalRecordingMetalSpriteTexture *)self->_recordingTexture serializable];
  [(PXGMetalRecordingRenderEventSerializable *)v3 setTexture:v4];

  -[PXGMetalRecordingRenderEventSerializable setBufferRange:](v3, "setBufferRange:", self->_renderTexture.bufferRange.location, self->_renderTexture.bufferRange.length);
  *(float *)&double v5 = self->_renderTexture.zPosition;
  [(PXGMetalRecordingRenderEventSerializable *)v3 setZPosition:v5];
  [(PXGMetalRecordingRenderEventSerializable *)v3 setContentsGravity:self->_renderTexture.contentsGravity];
  [(PXGMetalRecordingRenderEventSerializable *)v3 setIsOpaque:self->_anon_88[12]];
  v6 = (void *)MEMORY[0x1E4F1CA48];
  v7 = [(PXGMetalRecordingMetalSpriteTexture *)self->_recordingTexture spriteIndexes];
  v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  v9 = [(PXGMetalRecordingMetalSpriteTexture *)self->_recordingTexture spriteIndexes];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__PXGMetalRenderEvent_serializable__block_invoke;
  v12[3] = &unk_1E5DD3010;
  id v13 = v8;
  id v10 = v8;
  [v9 enumerateIndexesUsingBlock:v12];

  [(PXGMetalRecordingRenderEventSerializable *)v3 setSpriteIndices:v10];
  return v3;
}

void __35__PXGMetalRenderEvent_serializable__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (PXGMetalRenderEvent)initWithRenderTexture:(id *)a3 pipeline:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PXGMetalRenderEvent;
  v6 = [(PXGTungstenRecordingEvent *)&v14 initWithComponent:1 eventName:@"render"];
  v7 = v6;
  if (v6)
  {
    __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)&v6->_pipeline, (uint64_t)a4);
    long long v8 = *(_OWORD *)&a3[1].var0;
    long long v10 = *(_OWORD *)&a3->var0;
    _NSRange var2 = a3->var2;
    *(_OWORD *)&v7->_renderTexture.zPosition = *(_OWORD *)&a3->var3;
    *(_OWORD *)v7->_anon_88 = v8;
    *(_OWORD *)&v7->_renderTexture.texture = v10;
    v7->_renderTexture.bufferRange = var2;
    v7->_renderTexture.shader = 0;
    v11 = [[PXGMetalRecordingMetalSpriteTexture alloc] initWithTexture:a3->var0];
    recordingTexture = v7->_recordingTexture;
    v7->_recordingTexture = v11;
  }
  __destructor_8_s16_s24_s32((uint64_t)a4);
  return v7;
}

+ (id)eventWithRenderTexture:(id *)a3 pipeline:(id *)a4
{
  id v6 = objc_alloc((Class)a1);
  long long v13 = *(_OWORD *)&a4->var0;
  id v7 = a4->var2;
  id v14 = v7;
  id v8 = a4->var3;
  id v15 = v8;
  id v9 = a4->var4;
  id v16 = v9;
  BOOL var5 = a4->var5;
  if (v6)
  {
    long long v10 = (void *)[v6 initWithRenderTexture:a3 pipeline:&v13];
  }
  else
  {
    v11 = v9;

    long long v10 = 0;
  }
  __destructor_8_s16_s24_s32((uint64_t)a4);
  return v10;
}

@end
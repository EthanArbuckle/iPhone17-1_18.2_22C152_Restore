@interface PXGViewRecordingViewEvent
+ (id)eventWithSpriteTexture:(id)a3 payload:(id)a4 spriteIndex:(unsigned int)a5 needsParenting:(BOOL)a6;
- (PXGViewRecordingViewEvent)initWithSpriteTexture:(id)a3 payload:(id)a4 spriteIndex:(unsigned int)a5 needsParenting:(BOOL)a6;
- (id)serializable;
@end

@implementation PXGViewRecordingViewEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  return self->_serializable;
}

- (PXGViewRecordingViewEvent)initWithSpriteTexture:(id)a3 payload:(id)a4 spriteIndex:(unsigned int)a5 needsParenting:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXGViewRecordingViewEvent;
  v12 = [(PXGTungstenRecordingEvent *)&v19 initWithComponent:2 eventName:@"frameEnd"];
  if (v12)
  {
    v13 = objc_alloc_init(PXGViewRecordingViewSerializable);
    serializable = v12->_serializable;
    v12->_serializable = v13;

    [(PXGViewRecordingViewSerializable *)v12->_serializable setSpriteIndex:v7];
    -[PXGViewRecordingViewSerializable setPresentationType:](v12->_serializable, "setPresentationType:", [v10 presentationType]);
    uint64_t v15 = NSStringFromClass((Class)[v11 viewClass]);
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_1F00B0030;
    }
    [(PXGViewRecordingViewSerializable *)v12->_serializable setPayloadViewClass:v17];

    [(PXGViewRecordingViewSerializable *)v12->_serializable setNeedsParenting:v6];
  }

  return v12;
}

+ (id)eventWithSpriteTexture:(id)a3 payload:(id)a4 spriteIndex:(unsigned int)a5 needsParenting:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithSpriteTexture:v11 payload:v10 spriteIndex:v7 needsParenting:v6];

  return v12;
}

@end
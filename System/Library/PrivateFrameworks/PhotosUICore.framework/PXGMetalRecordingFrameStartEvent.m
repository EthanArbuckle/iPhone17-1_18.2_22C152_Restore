@interface PXGMetalRecordingFrameStartEvent
+ (id)eventWithViewSize:(CGSize)a3 renderOrigin:(double)a4 screenScale:;
- (PXGMetalRecordingFrameStartEvent)initWithViewSize:(CGSize)a3 renderOrigin:(double)a4 screenScale:;
- (id)serializable;
@end

@implementation PXGMetalRecordingFrameStartEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  return self->_serializable;
}

- (PXGMetalRecordingFrameStartEvent)initWithViewSize:(CGSize)a3 renderOrigin:(double)a4 screenScale:
{
  double v5 = v4;
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalRecordingFrameStartEvent;
  v8 = [(PXGTungstenRecordingEvent *)&v13 initWithComponent:1 eventName:@"frameStart"];
  if (v8)
  {
    v9 = objc_alloc_init(PXGMetalRecordingFrameStartEventSerializable);
    serializable = v8->_serializable;
    v8->_serializable = v9;

    -[PXGMetalRecordingFrameStartEventSerializable setViewSize:](v8->_serializable, "setViewSize:", width, height);
    [(PXGMetalRecordingFrameStartEventSerializable *)v8->_serializable setRenderOrigin:a4];
    [(PXGMetalRecordingFrameStartEventSerializable *)v8->_serializable setScreenScale:v5];
  }
  return v8;
}

+ (id)eventWithViewSize:(CGSize)a3 renderOrigin:(double)a4 screenScale:
{
  double v5 = -[PXGMetalRecordingFrameStartEvent initWithViewSize:renderOrigin:screenScale:]([PXGMetalRecordingFrameStartEvent alloc], "initWithViewSize:renderOrigin:screenScale:", a3.width, a3.height, a4, v4);
  return v5;
}

@end
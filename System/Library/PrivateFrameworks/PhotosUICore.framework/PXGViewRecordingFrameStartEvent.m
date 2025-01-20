@interface PXGViewRecordingFrameStartEvent
+ (id)eventWithViewSize:(CGSize)a3 renderOrigin:(CGPoint)a4 screenScale:(double)a5;
- (PXGViewRecordingFrameStartEvent)initWithViewSize:(CGSize)a3 renderOrigin:(CGPoint)a4 screenScale:(double)a5;
- (id)serializable;
@end

@implementation PXGViewRecordingFrameStartEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  return self->_serializable;
}

- (PXGViewRecordingFrameStartEvent)initWithViewSize:(CGSize)a3 renderOrigin:(CGPoint)a4 screenScale:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)PXGViewRecordingFrameStartEvent;
  v10 = [(PXGTungstenRecordingEvent *)&v14 initWithComponent:2 eventName:@"frameStart"];
  if (v10)
  {
    v11 = objc_alloc_init(PXGViewRecordingFrameStartEventSerializable);
    serializable = v10->_serializable;
    v10->_serializable = v11;

    -[PXGViewRecordingFrameStartEventSerializable setViewSize:](v10->_serializable, "setViewSize:", width, height);
    -[PXGViewRecordingFrameStartEventSerializable setRenderOrigin:](v10->_serializable, "setRenderOrigin:", x, y);
    [(PXGViewRecordingFrameStartEventSerializable *)v10->_serializable setScreenScale:a5];
  }
  return v10;
}

+ (id)eventWithViewSize:(CGSize)a3 renderOrigin:(CGPoint)a4 screenScale:(double)a5
{
  v5 = -[PXGViewRecordingFrameStartEvent initWithViewSize:renderOrigin:screenScale:]([PXGViewRecordingFrameStartEvent alloc], "initWithViewSize:renderOrigin:screenScale:", a3.width, a3.height, a4.x, a4.y, a5);
  return v5;
}

@end
@interface PXGVisionRecordingFrameEndEventSerializable
- (PXGVisionRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
@end

@implementation PXGVisionRecordingFrameEndEventSerializable

- (id)createSerializableObject
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PXGVisionRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGVisionRecordingFrameEndEventSerializable;
  return [(PXGVisionRecordingFrameEndEventSerializable *)&v4 init];
}

@end
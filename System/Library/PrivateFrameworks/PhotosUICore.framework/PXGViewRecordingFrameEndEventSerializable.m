@interface PXGViewRecordingFrameEndEventSerializable
- (PXGViewRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
@end

@implementation PXGViewRecordingFrameEndEventSerializable

- (id)createSerializableObject
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PXGViewRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGViewRecordingFrameEndEventSerializable;
  return [(PXGViewRecordingFrameEndEventSerializable *)&v4 init];
}

@end
@interface PXGMetalRecordingFrameEndEventSerializable
- (PXGMetalRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
@end

@implementation PXGMetalRecordingFrameEndEventSerializable

- (id)createSerializableObject
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PXGMetalRecordingFrameEndEventSerializable)initWithSerializableObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGMetalRecordingFrameEndEventSerializable;
  return [(PXGMetalRecordingFrameEndEventSerializable *)&v4 init];
}

@end
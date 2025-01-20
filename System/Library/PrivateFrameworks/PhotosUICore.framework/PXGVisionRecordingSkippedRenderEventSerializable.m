@interface PXGVisionRecordingSkippedRenderEventSerializable
- (PXGVisionRecordingSkippedRenderEventSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
@end

@implementation PXGVisionRecordingSkippedRenderEventSerializable

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (id)createSerializableObject
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"reason";
  v2 = [NSNumber numberWithUnsignedInteger:self->_reason];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (PXGVisionRecordingSkippedRenderEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGVisionRecordingSkippedRenderEventSerializable;
  v5 = [(PXGVisionRecordingSkippedRenderEventSerializable *)&v8 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    v5->_reason = [v6 unsignedIntValue];
  }
  return v5;
}

@end
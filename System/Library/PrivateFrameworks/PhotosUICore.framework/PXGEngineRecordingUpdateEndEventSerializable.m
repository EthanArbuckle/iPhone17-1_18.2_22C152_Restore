@interface PXGEngineRecordingUpdateEndEventSerializable
- (BOOL)updated;
- (PXGEngineRecordingUpdateEndEventSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setUpdated:(BOOL)a3;
@end

@implementation PXGEngineRecordingUpdateEndEventSerializable

- (void)setUpdated:(BOOL)a3
{
  self->_updated = a3;
}

- (BOOL)updated
{
  return self->_updated;
}

- (id)createSerializableObject
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"updated";
  unsigned int v2 = [(PXGEngineRecordingUpdateEndEventSerializable *)self updated];
  v3 = [NSNumber numberWithDouble:(double)v2];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (PXGEngineRecordingUpdateEndEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGEngineRecordingUpdateEndEventSerializable;
  v5 = [(PXGEngineRecordingUpdateEndEventSerializable *)&v8 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"updated"];
    v5->_updated = [v6 BOOLValue];
  }
  return v5;
}

@end
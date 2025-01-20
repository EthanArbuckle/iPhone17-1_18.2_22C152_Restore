@interface PXGEngineRecordingUpdateStartEventSerializable
- (PXGEngineRecordingUpdateStartEventSerializable)initWithSerializableObject:(id)a3;
- (double)targetTimestamp;
- (id)createSerializableObject;
- (unint64_t)needsUpdate;
- (unint64_t)pendingUpdateEntities;
- (void)setNeedsUpdate:(unint64_t)a3;
- (void)setPendingUpdateEntities:(unint64_t)a3;
- (void)setTargetTimestamp:(double)a3;
@end

@implementation PXGEngineRecordingUpdateStartEventSerializable

- (void)setPendingUpdateEntities:(unint64_t)a3
{
  self->_pendingUpdateEntities = a3;
}

- (unint64_t)pendingUpdateEntities
{
  return self->_pendingUpdateEntities;
}

- (void)setNeedsUpdate:(unint64_t)a3
{
  self->_needsUpdate = a3;
}

- (unint64_t)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setTargetTimestamp:(double)a3
{
  self->_targetTimestamp = a3;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (id)createSerializableObject
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"targetTimestamp";
  [(PXGEngineRecordingUpdateStartEventSerializable *)self targetTimestamp];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  v11[0] = v3;
  v10[1] = @"needsUpdate";
  unint64_t v4 = [(PXGEngineRecordingUpdateStartEventSerializable *)self needsUpdate];
  v5 = [NSNumber numberWithUnsignedInteger:v4];
  v11[1] = v5;
  v10[2] = @"pendingUpdateEntities";
  unint64_t v6 = [(PXGEngineRecordingUpdateStartEventSerializable *)self pendingUpdateEntities];
  v7 = [NSNumber numberWithUnsignedInteger:v6];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (PXGEngineRecordingUpdateStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXGEngineRecordingUpdateStartEventSerializable;
  v5 = [(PXGEngineRecordingUpdateStartEventSerializable *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 objectForKeyedSubscript:@"targetTimestamp"];
    [v7 doubleValue];
    double v9 = v8;

    v5->_targetTimestamp = v9;
    id v10 = [v6 objectForKeyedSubscript:@"needsUpdate"];
    unint64_t v11 = [v10 unsignedIntValue];

    v5->_needsUpdate = v11;
    v12 = [v6 objectForKeyedSubscript:@"pendingUpdateEntities"];

    id v13 = v12;
    unint64_t v14 = [v13 unsignedIntValue];

    v5->_pendingUpdateEntities = v14;
  }

  return v5;
}

@end
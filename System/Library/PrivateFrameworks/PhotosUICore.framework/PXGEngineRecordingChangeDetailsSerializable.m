@interface PXGEngineRecordingChangeDetailsSerializable
- (NSDictionary)changeDetails;
- (PXGEngineRecordingChangeDetailsSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setChangeDetails:(id)a3;
@end

@implementation PXGEngineRecordingChangeDetailsSerializable

- (void).cxx_destruct
{
}

- (void)setChangeDetails:(id)a3
{
}

- (NSDictionary)changeDetails
{
  return self->_changeDetails;
}

- (id)createSerializableObject
{
  v2 = [(PXGEngineRecordingChangeDetailsSerializable *)self changeDetails];
  v3 = PXGCreateDictionaryWithTransforms(v2, &__block_literal_global_3_190414, &__block_literal_global_190410);

  return v3;
}

- (PXGEngineRecordingChangeDetailsSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGEngineRecordingChangeDetailsSerializable;
  v5 = [(PXGEngineRecordingChangeDetailsSerializable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = PXGCreateDictionaryWithTransforms(v4, &__block_literal_global_7_190422, &__block_literal_global_190410);
    changeDetails = v5->_changeDetails;
    v5->_changeDetails = (NSDictionary *)v6;
  }
  return v5;
}

@end
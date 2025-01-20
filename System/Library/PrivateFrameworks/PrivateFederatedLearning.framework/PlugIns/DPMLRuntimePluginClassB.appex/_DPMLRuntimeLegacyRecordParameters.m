@interface _DPMLRuntimeLegacyRecordParameters
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (NSNumber)numBucket;
- (_DPMLRuntimeLegacyRecordParameters)initWithNumBucket:(id)a3 minValue:(id)a4 maxValue:(id)a5;
@end

@implementation _DPMLRuntimeLegacyRecordParameters

- (_DPMLRuntimeLegacyRecordParameters)initWithNumBucket:(id)a3 minValue:(id)a4 maxValue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_DPMLRuntimeLegacyRecordParameters;
  v12 = [(_DPMLRuntimeLegacyRecordParameters *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_numBucket, a3);
    objc_storeStrong((id *)&v13->_minValue, a4);
    objc_storeStrong((id *)&v13->_maxValue, a5);
  }

  return v13;
}

- (NSNumber)numBucket
{
  return self->_numBucket;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_numBucket, 0);
}

@end
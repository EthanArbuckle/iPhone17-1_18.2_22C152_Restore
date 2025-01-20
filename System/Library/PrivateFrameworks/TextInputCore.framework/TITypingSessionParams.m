@interface TITypingSessionParams
- (NSArray)activeInputModes;
- (NSDictionary)testingParameters;
- (NSString)wordSeparator;
- (TITypingSessionParams)initWithActiveInputModes:(id)a3 wordSeparator:(id)a4 testingParameters:(id)a5 assetAvailabilityStatus:(int64_t)a6;
- (int64_t)assetAvailabilityStatus;
@end

@implementation TITypingSessionParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingParameters, 0);
  objc_storeStrong((id *)&self->_wordSeparator, 0);

  objc_storeStrong((id *)&self->_activeInputModes, 0);
}

- (int64_t)assetAvailabilityStatus
{
  return self->_assetAvailabilityStatus;
}

- (NSDictionary)testingParameters
{
  return self->_testingParameters;
}

- (NSString)wordSeparator
{
  return self->_wordSeparator;
}

- (NSArray)activeInputModes
{
  return self->_activeInputModes;
}

- (TITypingSessionParams)initWithActiveInputModes:(id)a3 wordSeparator:(id)a4 testingParameters:(id)a5 assetAvailabilityStatus:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TITypingSessionParams;
  v14 = [(TITypingSessionParams *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activeInputModes, a3);
    objc_storeStrong((id *)&v15->_wordSeparator, a4);
    objc_storeStrong((id *)&v15->_testingParameters, a5);
    v15->_assetAvailabilityStatus = a6;
  }

  return v15;
}

@end
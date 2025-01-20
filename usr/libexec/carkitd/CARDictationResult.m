@interface CARDictationResult
- (CARDictationResult)initWithText:(id)a3;
- (NSError)error;
- (NSString)transcription;
@end

@implementation CARDictationResult

- (CARDictationResult)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARDictationResult;
  v6 = [(CARDictationResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transcription, a3);
  }

  return v7;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_transcription, 0);
}

@end
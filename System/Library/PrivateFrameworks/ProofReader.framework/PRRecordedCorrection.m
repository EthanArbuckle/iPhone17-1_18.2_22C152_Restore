@interface PRRecordedCorrection
- (BOOL)hasRecordedResponse;
- (PRRecordedCorrection)initWithCorrectionResult:(id)a3 correctedString:(id)a4;
- (id)correctedString;
- (id)correctionResult;
- (id)description;
- (void)dealloc;
- (void)setHasRecordedResponse:(BOOL)a3;
@end

@implementation PRRecordedCorrection

- (PRRecordedCorrection)initWithCorrectionResult:(id)a3 correctedString:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PRRecordedCorrection;
  v6 = [(PRRecordedCorrection *)&v8 init];
  if (v6)
  {
    v6->_correctionResult = (NSTextCheckingResult *)[a3 copy];
    v6->_correctedString = (NSString *)[a4 copy];
    v6->_hasRecordedResponse = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRRecordedCorrection;
  [(PRRecordedCorrection *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PRRecordedCorrection;
  return (id)[NSString stringWithFormat:@"%@ %@->%@ %d", -[PRRecordedCorrection description](&v3, sel_description), self->_correctedString, self->_correctionResult, self->_hasRecordedResponse];
}

- (id)correctionResult
{
  return self->_correctionResult;
}

- (id)correctedString
{
  return self->_correctedString;
}

- (BOOL)hasRecordedResponse
{
  return self->_hasRecordedResponse;
}

- (void)setHasRecordedResponse:(BOOL)a3
{
  self->_hasRecordedResponse = a3;
}

@end
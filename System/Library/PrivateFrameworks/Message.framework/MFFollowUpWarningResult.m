@interface MFFollowUpWarningResult
- (MFFollowUpWarningResult)initWithFollowUpWarning:(id)a3 error:(id)a4;
- (NSError)error;
- (SGMailIntelligenceFollowUpWarning)followUpWarning;
@end

@implementation MFFollowUpWarningResult

- (MFFollowUpWarningResult)initWithFollowUpWarning:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFFollowUpWarningResult;
  v9 = [(MFFollowUpWarningResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_followUpWarning, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (SGMailIntelligenceFollowUpWarning)followUpWarning
{
  return self->_followUpWarning;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_followUpWarning, 0);
}

@end
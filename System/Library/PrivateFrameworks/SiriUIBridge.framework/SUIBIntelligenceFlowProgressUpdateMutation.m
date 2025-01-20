@interface SUIBIntelligenceFlowProgressUpdateMutation
- (NSString)additionalProgressDescription;
- (NSString)progressDescription;
- (float)progress;
- (void)setAdditionalProgressDescription:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressDescription:(id)a3;
@end

@implementation SUIBIntelligenceFlowProgressUpdateMutation

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (NSString)progressDescription
{
  return self->_progressDescription;
}

- (void)setProgressDescription:(id)a3
{
}

- (NSString)additionalProgressDescription
{
  return self->_additionalProgressDescription;
}

- (void)setAdditionalProgressDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProgressDescription, 0);
  objc_storeStrong((id *)&self->_progressDescription, 0);
}

@end
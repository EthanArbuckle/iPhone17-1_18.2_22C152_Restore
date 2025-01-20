@interface NRFOutput
- (NRFCompletionStatus)completionStatus;
- (void)setCompletionStatus:(id)a3;
@end

@implementation NRFOutput

- (NRFCompletionStatus)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
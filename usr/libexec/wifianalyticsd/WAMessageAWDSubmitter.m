@interface WAMessageAWDSubmitter
- (WAMessageAWDSubmissionDelegate)submissionDelegate;
- (id)submitMessage:(id)a3;
- (void)setSubmissionDelegate:(id)a3;
@end

@implementation WAMessageAWDSubmitter

- (id)submitMessage:(id)a3
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Abstract. You must override %@ in a subclass", v3 format];

  return 0;
}

- (WAMessageAWDSubmissionDelegate)submissionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_submissionDelegate);

  return (WAMessageAWDSubmissionDelegate *)WeakRetained;
}

- (void)setSubmissionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
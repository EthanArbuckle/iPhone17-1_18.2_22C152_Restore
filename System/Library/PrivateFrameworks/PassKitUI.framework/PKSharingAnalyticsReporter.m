@interface PKSharingAnalyticsReporter
- (NSData)sessionToken;
- (PKSharingAnalyticsReporter)init;
- (PKSharingAnalyticsReporter)initWithSubject:(id)a3 sessionToken:(id)a4 reuseExistingSession:(BOOL)a5;
- (void)dealloc;
- (void)sendEvent:(id)a3;
@end

@implementation PKSharingAnalyticsReporter

- (PKSharingAnalyticsReporter)init
{
  return 0;
}

- (PKSharingAnalyticsReporter)initWithSubject:(id)a3 sessionToken:(id)a4 reuseExistingSession:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingAnalyticsReporter;
  v11 = [(PKSharingAnalyticsReporter *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subject, a3);
    if (v10)
    {
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v9 withArchivedParent:v10];
    }
    else if (!v5 {
           || ([MEMORY[0x1E4F843E0] reporterForSubject:v12->_subject],
    }
               v13 = objc_claimAutoreleasedReturnValue(),
               v13,
               !v13))
    {
      v12->_isSessionOwned = 1;
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v12->_subject];
    }
  }

  return v12;
}

- (void)dealloc
{
  if (self->_isSessionOwned) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:self->_subject];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKSharingAnalyticsReporter;
  [(PKSharingAnalyticsReporter *)&v3 dealloc];
}

- (void)sendEvent:(id)a3
{
}

- (NSData)sessionToken
{
  return (NSData *)[MEMORY[0x1E4F843E0] archivedSessionTokenForSubject:self->_subject];
}

- (void).cxx_destruct
{
}

@end
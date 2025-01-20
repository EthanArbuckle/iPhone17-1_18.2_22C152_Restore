@interface FeedbackSubmissionPostActionManager
- (BOOL)saveFeedbackObject:(id)a3 forSubmissionIdentifier:(id)a4;
- (FeedbackSubmissionPostActionManager)init;
- (void)performActionWithFeedbackResponse:(id)a3 feedbackRequest:(id)a4;
@end

@implementation FeedbackSubmissionPostActionManager

- (FeedbackSubmissionPostActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FeedbackSubmissionPostActionManager;
  v2 = [(FeedbackSubmissionPostActionManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FeedbackSubmissionPostActionStorage);
    submissionStorage = v2->_submissionStorage;
    v2->_submissionStorage = v3;
  }
  return v2;
}

- (BOOL)saveFeedbackObject:(id)a3 forSubmissionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [[RapFeedbackSubmissionPostAction alloc] initWithRapUserProfileRecord:v8];
    BOOL v10 = [(FeedbackSubmissionPostActionStorage *)self->_submissionStorage saveFeedbackAction:v9 forSubmissionIdentifier:v7];
    v11 = sub_100109EF8();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v7;
        v13 = "Successfully saved feedback action to disk %@";
        v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v7;
      v13 = "Failed to save feedback action to disk %@";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  LOBYTE(v10) = 0;
LABEL_10:

  return v10;
}

- (void)performActionWithFeedbackResponse:(id)a3 feedbackRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 feedbackRequestParameters];
  v9 = [v8 submissionParameters];
  BOOL v10 = [v9 clientSubmissionUuid];

  v11 = [v7 feedbackRequestParameters];
  v12 = [v11 submissionParameters];
  unsigned int v13 = [v12 hasClientSubmissionUuid];

  if (v13 && v10)
  {
    v14 = [(FeedbackSubmissionPostActionStorage *)self->_submissionStorage feedbackActionForSubmissionIdentifier:v10];
    [v14 performActionWithFeedbackResponse:v6 feedbackRequest:v7];
    [(FeedbackSubmissionPostActionStorage *)self->_submissionStorage removefeedbackActionForSubmissionIdentifier:v10];
  }
  else
  {
    os_log_type_t v15 = sub_100109EF8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "SubmissionIdentifier is nil. Check feedbackRequest %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

@end
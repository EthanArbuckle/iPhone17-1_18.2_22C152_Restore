@interface RapFeedbackSubmissionPostAction
+ (BOOL)supportsSecureCoding;
- (RapFeedbackSubmissionPostAction)initWithRapUserProfileRecord:(id)a3;
- (void)performActionWithFeedbackResponse:(id)a3 feedbackRequest:(id)a4;
@end

@implementation RapFeedbackSubmissionPostAction

- (RapFeedbackSubmissionPostAction)initWithRapUserProfileRecord:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RapFeedbackSubmissionPostAction;
  v5 = [(RapFeedbackSubmissionPostAction *)&v8 init];
  if (v5)
  {
    v6 = [v4 data];
    [(FeedbackSubmissionPostAction *)v5 setData:v6];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performActionWithFeedbackResponse:(id)a3 feedbackRequest:(id)a4
{
  id v49 = a3;
  id v6 = a4;
  v7 = [v6 feedbackRequestParameters];
  objc_super v8 = [v7 submissionParameters];
  unsigned int v9 = [v8 type];

  if (v9 == 21)
  {
    v10 = [v6 feedbackRequestParameters];
    v11 = [v10 submissionParameters];
    v12 = [v11 parentFeedbackId];
    +[RAPRecordManager editStatusOfRAPRecordWithReportID:v12 status:0 completion:&stru_1012ED8F0];
  }
  else
  {
    v13 = [RapUserProfileRecord alloc];
    v14 = [(FeedbackSubmissionPostAction *)self data];
    v15 = [(RapUserProfileRecord *)v13 initWithData:v14];

    v16 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v48 = [v16 countryCode];

    id v17 = objc_alloc_init((Class)GEORPFeedbackSubmissionParameters);
    v18 = [v49 feedbackResult];
    v19 = [v18 submissionResult];
    v20 = [v19 rapInfo];
    v21 = [v20 title];
    v22 = [v21 stringValue];
    id v47 = v17;
    if (v22)
    {
      [(RapUserProfileRecord *)v15 setTitle:v22];
    }
    else
    {
      v23 = [v6 feedbackRequestParameters];
      v24 = [v23 submissionParameters];
      v25 = [v17 stringForFeedbackType:[v24 type]];
      [(RapUserProfileRecord *)v15 setTitle:v25];
    }
    v26 = [v49 feedbackResult];
    v27 = [v26 submissionResult];
    v28 = [v27 rapInfo];
    v29 = [v28 summary];
    v30 = [v29 stringValue];
    [(RapUserProfileRecord *)v15 setSubtitle:v30];

    v42 = [RAPRecord alloc];
    v46 = [v49 feedbackResult];
    v45 = [v46 submissionResult];
    v41 = [v45 feedbackId];
    v44 = [v6 feedbackRequestParameters];
    v43 = [v44 submissionParameters];
    id v31 = [v43 type];
    v32 = [(RapUserProfileRecord *)v15 subtitle];
    v33 = [(RapUserProfileRecord *)v15 title];
    +[NSDate now];
    v10 = v15;
    v35 = v34 = v6;
    v36 = [v34 userInfo];
    v37 = [v36 tdmUserInfo];
    v38 = [v37 anonymousUserId];
    LOWORD(v40) = 0;
    v11 = (void *)v48;
    v39 = [(RAPRecord *)v42 initWithReportID:v41 reportType:v31 reportSummary:v32 reportTitle:v33 dateOfReportCreation:v35 countryCodeUponCreation:v48 reportStatus:v40 contentData:v10 communityIdentifier:v38 rapResponse:0];

    id v6 = v34;
    +[RAPRecordManager addRAPRecord:v39 completion:&stru_1012ED910];

    v12 = v47;
  }
}

@end
@interface MFCatchUpFeedbackTriageInteraction
+ (OS_os_log)log;
- (BOOL)supportsSelectAll;
- (MFCatchUpFeedbackCardAction)feedbackCardAction;
- (id)_iconImageName;
- (id)cardActionWithCompletion:(id)a3;
- (id)title;
- (void)performInteractionWithType:(int64_t)a3 completion:(id)a4;
- (void)setFeedbackCardAction:(id)a3;
@end

@implementation MFCatchUpFeedbackTriageInteraction

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100179A64;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006999D8 != -1) {
    dispatch_once(&qword_1006999D8, block);
  }
  v2 = (void *)qword_1006999D0;

  return (OS_os_log *)v2;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4 = a3;
  if (+[MUICatchUpFeedbackController isFeedbackRestricted])
  {
    v5 = [(MFCatchUpFeedbackTriageInteraction *)self title];
    v6 = [(MFCatchUpFeedbackTriageInteraction *)self _iconImageName];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100179D4C;
    v18[3] = &unk_10060ABB8;
    v18[4] = self;
    id v19 = v4;
    v7 = +[MFCardAction cardActionWithTitle:v5 shortTitle:0 imageName:v6 tintColor:0 handler:v18];
    v8 = &v19;
  }
  else
  {
    v9 = [(MFCatchUpFeedbackTriageInteraction *)self title];
    v10 = [(MFCatchUpFeedbackTriageInteraction *)self _iconImageName];
    v7 = +[MFCatchUpFeedbackCardHeaderAction cardActionWithTitle:v9 shortTitle:0 imageName:v10 tintColor:0 handler:&stru_10060ABF8];

    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100179D60;
    v15 = &unk_10060ABB8;
    v16 = self;
    id v17 = v4;
    v5 = +[MFCatchUpFeedbackCardAction cardActionWithTitle:0 shortTitle:0 imageName:0 tintColor:0 handler:&v12];
    [v7 setFeedbackAction:v5, v12, v13, v14, v15, v16];
    v8 = &v17;
  }

  return v7;
}

- (id)title
{
  +[MUICatchUpFeedbackController isFeedbackRestricted];
  v2 = _EFLocalizedString();

  return v2;
}

- (id)_iconImageName
{
  return MFImageGlyphCatchUpFeedback;
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (void)performInteractionWithType:(int64_t)a3 completion:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)MFCatchUpFeedbackTriageInteraction;
  [(MFTriageInteraction *)&v25 performInteractionWithCompletion:a4];
  v6 = [(MFTriageInteraction *)self messageListItemSelection];
  v7 = [v6 messageListItems];
  v8 = [v7 firstObject];

  v9 = [v8 generatedSummary];
  v10 = [v9 messageItemID];

  if (v10)
  {
    id v11 = objc_alloc((Class)EMMessageObjectID);
    v12 = +[EMMailboxScope allMailboxesScope];
    uint64_t v13 = [v11 initWithCollectionItemID:v10 mailboxScope:v12];

    v14 = [(MFTriageInteraction *)self delegate];
    v15 = [v14 messageRepositoryForTriageInteraction:self];
    v16 = [v14 presentingViewControllerForTriageInteraction:self];
    id v17 = [v15 messageForObjectID:v13];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10017A1A0;
    v22[3] = &unk_10060AC20;
    int64_t v24 = a3;
    id v18 = v16;
    id v23 = v18;
    [v17 addSuccessBlock:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10017A2B0;
    v20[3] = &unk_100604F70;
    id v21 = v10;
    [v17 addFailureBlock:v20];
  }
  else
  {
    uint64_t v13 = +[MFCatchUpFeedbackTriageInteraction log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v8 ef_publicDescription];
      sub_10045C3FC(v19, buf, v13);
    }
  }
}

- (MFCatchUpFeedbackCardAction)feedbackCardAction
{
  return self->_feedbackCardAction;
}

- (void)setFeedbackCardAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
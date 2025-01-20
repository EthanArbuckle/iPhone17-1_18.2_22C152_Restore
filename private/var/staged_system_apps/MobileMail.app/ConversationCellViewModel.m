@interface ConversationCellViewModel
- (ConversationCellViewModel)initWithBuilder:(id)a3;
- (ConversationCellViewModel)initWithItemBuilder:(id)a3;
- (ECSubject)subject;
- (EMGeneratedSummary)generatedSummary;
- (MFMessageLoadingContext)messageLoadingContext;
- (MUIAvatarImageContext)avatarContext;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIManualSummaryContext)manualSummaryContext;
- (MessageContentRepresentationRequest)messageContentRequest;
- (NSArray)senderList;
- (NSString)summary;
- (id)copyWithBuilder:(id)a3;
- (id)copyWithFlagsModelBuilder:(id)a3;
- (void)setAvatarContext:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setManualSummaryContext:(id)a3;
- (void)setMessageContentRequest:(id)a3;
- (void)setMessageLoadingContext:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation ConversationCellViewModel

- (ConversationCellViewModel)initWithBuilder:(id)a3
{
  v5 = (void (**)(id, ConversationCellViewModel *))a3;
  if (!v5)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ConversationCellViewModel.m", 31, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)ConversationCellViewModel;
  v6 = [(ConversationCellViewModel *)&v9 init];
  if (v6) {
    v5[2](v5, v6);
  }

  return v6;
}

- (ConversationCellViewModel)initWithItemBuilder:(id)a3
{
  id v5 = a3;
  [(ConversationCellViewModel *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationCellViewModel initWithItemBuilder:]", "ConversationCellViewModel.m", 42, "0");
}

- (id)copyWithFlagsModelBuilder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ConversationCellViewModel.m", 50, @"Invalid parameter not satisfying: %@", @"flagsBuilderBlock" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006483C;
  v11[3] = &unk_100604710;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  id v8 = [v6 initWithBuilder:v11];

  return v8;
}

- (id)copyWithBuilder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ConversationCellViewModel.m", 71, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064B58;
  v11[3] = &unk_100604710;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  id v8 = [v6 initWithBuilder:v11];

  return v8;
}

- (MessageContentRepresentationRequest)messageContentRequest
{
  return self->_messageContentRequest;
}

- (void)setMessageContentRequest:(id)a3
{
}

- (MFMessageLoadingContext)messageLoadingContext
{
  return self->_messageLoadingContext;
}

- (void)setMessageLoadingContext:(id)a3
{
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
}

- (ECSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (EMGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (MUIManualSummaryContext)manualSummaryContext
{
  return self->_manualSummaryContext;
}

- (void)setManualSummaryContext:(id)a3
{
}

- (MUIAvatarImageContext)avatarContext
{
  return self->_avatarContext;
}

- (void)setAvatarContext:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_avatarContext, 0);
  objc_storeStrong((id *)&self->_manualSummaryContext, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_messageLoadingContext, 0);

  objc_storeStrong((id *)&self->_messageContentRequest, 0);
}

@end
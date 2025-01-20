@interface MailActionsViewDataSource
+ (id)log;
- (BOOL)includeCategorizationAction;
- (BOOL)includeReadLaterAction;
- (BOOL)isTargetValid;
- (ComposeCapable)scene;
- (EFFuture)predictedMailbox;
- (MFFlagChangeTriageInteractionDelegate)flagChangeInteractionDelegate;
- (MFMessagePrinterDelegate)printerDelegate;
- (MFMoveToPredictionTriageInteractionDelegate)moveToPredictionTriageInteractionDelegate;
- (MFTriageInteractionDelegate)delegate;
- (MFTriageInteractionTarget)target;
- (MUIPresentationSource)presentationSource;
- (MailActionsViewDataSource)initWithBuilderBlock:(id)a3;
- (UIViewController)presentingViewControllerForTransferUI;
- (id)_archiveOrDeleteInteractionForMessageListItems:(id)a3 deleteOrArchive:(unint64_t)a4 presentationSource:(id)a5 type:(int64_t)a6 shouldAskForConfirmation:(BOOL)a7;
- (id)_categoryMailActionsWithCompletion:(id)a3;
- (id)_mailActionCardFlagActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5;
- (id)_mailActionCardHorizontalActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5;
- (id)_mailActionCardSendAgainAndUnreadActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5;
- (id)_mailActionCardVerticalActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5;
- (id)allMessagesInConversation;
- (id)completion;
- (id)mailboxes;
- (id)messageListItem;
- (id)preparation;
- (id)primaryMessage;
- (id)primaryMessageContentRequest;
- (id)sectionDataForMailActionsViewController:(id)a3;
- (id)selectedMessageContent;
- (id)targetedMessages;
- (id)undoManager;
- (int64_t)origin;
- (int64_t)targetPreference;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlagChangeInteractionDelegate:(id)a3;
- (void)setIncludeCategorizationAction:(BOOL)a3;
- (void)setIncludeReadLaterAction:(BOOL)a3;
- (void)setMoveToPredictionTriageInteractionDelegate:(id)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setPredictedMailbox:(id)a3;
- (void)setPreparation:(id)a3;
- (void)setPresentationSource:(id)a3;
- (void)setPresentingViewControllerForTransferUI:(id)a3;
- (void)setPrinterDelegate:(id)a3;
- (void)setScene:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation MailActionsViewDataSource

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFA2C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699528 != -1) {
    dispatch_once(&qword_100699528, block);
  }
  v2 = (void *)qword_100699520;

  return v2;
}

- (MailActionsViewDataSource)initWithBuilderBlock:(id)a3
{
  v4 = (void (**)(id, MailActionsViewDataSource *))a3;
  v7.receiver = self;
  v7.super_class = (Class)MailActionsViewDataSource;
  v5 = [(MailActionsViewDataSource *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (id)sectionDataForMailActionsViewController:(id)a3
{
  if ([(MailActionsViewDataSource *)self isTargetValid])
  {
    v5 = [(MailActionsViewDataSource *)self primaryMessageContentRequest];

    if (v5)
    {
      v6 = [(MailActionsViewDataSource *)self presentationSource];
      objc_super v7 = [(MailActionsViewDataSource *)self completion];
      v8 = [(MailActionsViewDataSource *)self preparation];
      v9 = [(MailActionsViewDataSource *)self predictedMailbox];
      v65 = [v9 resultIfAvailable];

      v67 = [(MailActionsViewDataSource *)self moveToPredictionTriageInteractionDelegate];
      v66 = [(MailActionsViewDataSource *)self presentingViewControllerForTransferUI];
      v60 = [(MailActionsViewDataSource *)self delegate];
      v69 = [(MailActionsViewDataSource *)self undoManager];
      v70 = [(MailActionsViewDataSource *)self allMessagesInConversation];
      v10 = objc_opt_new();
      v68 = [(MailActionsViewDataSource *)self _mailActionCardHorizontalActionsWithPresentationSource:v6 preparation:v8 completion:v7];
      v11 = [[MFCardActionSectionData alloc] initWithActions:v68 viewLayout:1];
      [v10 addObject:v11];

      if ([(MailActionsViewDataSource *)self includeReadLaterAction])
      {
        v12 = +[MFReadLaterTriageInteraction interactionWithMessageListItems:v70 undoManager:v69 origin:[(MailActionsViewDataSource *)self origin] actor:2];
        [v12 setPresentationSource:v6];
        [v12 setDelegate:v60];
        v13 = [v12 selectedDate];
        BOOL v14 = v13 != 0;

        v15 = [v12 cardActionWithPreparation:v8 completion:v7];
        [v15 setShouldDismissCardBeforeExecuteHandler:1];
        [v15 setShouldDeferDismissHandler:1];
        v16 = [MFCardActionSectionData alloc];
        v77 = v15;
        v17 = +[NSArray arrayWithObjects:&v77 count:1];
        v18 = [(MFCardActionSectionData *)v16 initWithActions:v17 viewLayout:0];
        [v10 addObject:v18];
      }
      else
      {
        BOOL v14 = 0;
      }
      v59 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v70 undoManager:v69 origin:[(MailActionsViewDataSource *)self origin] actor:2];
      if ((([v59 isPermitted] ^ 1 | v14) & 1) == 0)
      {
        v19 = [v59 cardActionWithPreparation:v8 completion:v7];
        v20 = [MFCardActionSectionData alloc];
        v76 = v19;
        v21 = +[NSArray arrayWithObjects:&v76 count:1];
        v22 = [(MFCardActionSectionData *)v20 initWithActions:v21 viewLayout:0];
        [v10 addObject:v22];
      }
      v61 = [(MailActionsViewDataSource *)self _mailActionCardFlagActionsWithPresentationSource:v6 preparation:v8 completion:v7];
      if ([v61 count])
      {
        v23 = [[MFCardActionSectionData alloc] initWithActions:v61 viewLayout:2];
        [v10 addObject:v23];
      }
      v64 = [(MailActionsViewDataSource *)self _mailActionCardSendAgainAndUnreadActionsWithPresentationSource:v6 preparation:v8 completion:v7];
      v24 = [[MFCardActionSectionData alloc] initWithActions:v64 viewLayout:0];
      [v10 addObject:v24];

      v25 = [(MailActionsViewDataSource *)self allMessagesInConversation];
      v26 = [(MailActionsViewDataSource *)self undoManager];
      v63 = +[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:v25 undoManager:v26 origin:[(MailActionsViewDataSource *)self origin] actor:2 presentationSource:v6 delegate:v67 presentingViewController:v66 predictedMailbox:v65];

      v62 = [v63 cardActionsWithCompletion:v7];
      v27 = [[MFCardActionSectionData alloc] initWithActions:v62 viewLayout:2];
      [v10 addObject:v27];

      v28 = [(MailActionsViewDataSource *)self _mailActionCardVerticalActionsWithPresentationSource:v6 preparation:v8 completion:v7];
      v29 = [[MFCardActionSectionData alloc] initWithActions:v28 viewLayout:0];
      [v10 addObject:v29];

      if ((id)[(MailActionsViewDataSource *)self origin] == (id)2)
      {
        if (_os_feature_enabled_impl())
        {
          if (EMIsGreymatterSupportedWithOverride())
          {
            if (_os_feature_enabled_impl())
            {
              v30 = [(MailActionsViewDataSource *)self targetedMessages];
              v31 = [v30 firstObject];
              v32 = [v31 generatedSummary];
              BOOL v33 = v32 == 0;

              if (!v33)
              {
                v34 = [(MailActionsViewDataSource *)self targetedMessages];
                v57 = +[MFTriageInteraction interactionWithMessageListItems:v34 undoManager:v69 origin:[(MailActionsViewDataSource *)self origin] actor:2];

                [v57 setDelegate:v60];
                if (+[MUICatchUpFeedbackController isFeedbackRestricted])
                {
                  v35 = [MFCardActionSectionData alloc];
                  v55 = [v57 cardActionWithCompletion:v7];
                  v75 = v55;
                  v36 = +[NSArray arrayWithObjects:&v75 count:1];
                  v37 = [(MFCardActionSectionData *)v35 initWithActions:v36 viewLayout:0];
                  [v10 addObject:v37];
                }
                else
                {
                  v55 = [v57 cardActionWithCompletion:v7];
                  v41 = [MFCardActionSectionData alloc];
                  v74[0] = v55;
                  v36 = [v55 feedbackAction];
                  v74[1] = v36;
                  v37 = +[NSArray arrayWithObjects:v74 count:2];
                  v42 = [(MFCardActionSectionData *)v41 initWithActions:v37 viewLayout:2];
                  [v10 addObject:v42];
                }
              }
            }
          }
        }
      }
      if (EMBlackPearlIsFeatureEnabled())
      {
        v43 = +[EFDevice currentDevice];
        unsigned int v44 = [v43 isInternal];

        if (v44)
        {
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_1000D0830;
          v71[3] = &unk_100607378;
          id v72 = v7;
          v58 = objc_retainBlock(v71);
          id v45 = [objc_alloc((Class)MSMessageListItemSelection) initWithMessageListItems:v70];
          v56 = +[MFTriageInteraction interactionWithMessageListItemSelection:v45 undoManager:0 origin:[(MailActionsViewDataSource *)self origin] actor:2];
          v46 = [MFCardActionSectionData alloc];
          v47 = ((void (*)(void *, void *))v58[2])(v58, v56);
          v48 = [(MFCardActionSectionData *)v46 initWithActions:v47 viewLayout:2];
          [v10 addObject:v48];

          if (([v45 isActingOnSender] & 1) == 0)
          {
            v54 = +[MFCategoryHighImpactFeedbackTriageInteraction interactionWithMessageListItemSelection:v45 origin:[(MailActionsViewDataSource *)self origin] actor:2];
            v49 = [MFCardActionSectionData alloc];
            v50 = [v54 cardAction];
            v73 = v50;
            v51 = +[NSArray arrayWithObjects:&v73 count:1];
            v52 = [(MFCardActionSectionData *)v49 initWithActions:v51 viewLayout:0];
            [v10 addObject:v52];
          }
        }
      }
    }
    else
    {
      v6 = +[MailActionsViewDataSource log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v38 = [(MailActionsViewDataSource *)self primaryMessage];
        v39 = [v38 itemID];
        v40 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v79 = v39;
        __int16 v80 = 2114;
        v81 = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "No contentRequest for %{public}@ in %{public}@", buf, 0x16u);
      }
      v10 = &__NSArray0__struct;
    }
  }
  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)primaryMessage
{
  v2 = [(MailActionsViewDataSource *)self target];
  v3 = [v2 primaryMessage];

  return v3;
}

- (id)selectedMessageContent
{
  v2 = [(MailActionsViewDataSource *)self target];
  v3 = [v2 selectedMessageContent];

  return v3;
}

- (id)primaryMessageContentRequest
{
  v2 = [(MailActionsViewDataSource *)self target];
  v3 = [v2 primaryMessageContentRequest];

  return v3;
}

- (id)messageListItem
{
  v2 = [(MailActionsViewDataSource *)self target];
  v3 = [v2 messageListItem];

  return v3;
}

- (id)mailboxes
{
  v2 = [(MailActionsViewDataSource *)self target];
  v3 = [v2 messageListItem];
  v4 = [v3 mailboxes];

  return v4;
}

- (id)targetedMessages
{
  v2 = [(MailActionsViewDataSource *)self target];
  v3 = [v2 targetedMessages];

  return v3;
}

- (id)allMessagesInConversation
{
  if ([(MailActionsViewDataSource *)self targetPreference])
  {
    v3 = [(MailActionsViewDataSource *)self messageListItem];
    v6 = v3;
    v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    v4 = [(MailActionsViewDataSource *)self targetedMessages];
  }

  return v4;
}

- (int64_t)targetPreference
{
  v2 = [(MailActionsViewDataSource *)self target];
  id v3 = [v2 targetPreference];

  return (int64_t)v3;
}

- (id)undoManager
{
  v2 = [(MailActionsViewDataSource *)self scene];
  id v3 = [v2 undoManager];

  return v3;
}

- (BOOL)isTargetValid
{
  v4 = [(MailActionsViewDataSource *)self delegate];
  if (!v4)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MailActionsViewDataSource.m" lineNumber:202 description:@"MessageTriageInteractionHelper requires delegate to create triage interactions"];
  }
  v5 = [(MailActionsViewDataSource *)self messageListItem];
  v6 = [(MailActionsViewDataSource *)self primaryMessage];
  if (!v6)
  {
    v8 = +[MailActionsViewDataSource log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      sub_100459EC8(v9, v13, v8);
    }
    goto LABEL_10;
  }
  if (!v5)
  {
    v8 = +[MailActionsViewDataSource log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      sub_100459F20(v10, v13, v8);
    }
LABEL_10:

    BOOL v7 = 0;
    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)_mailActionCardHorizontalActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v32 = a4;
  id v31 = a5;
  v9 = [(MailActionsViewDataSource *)self primaryMessage];
  v38 = v9;
  uint64_t v10 = [(MailActionsViewDataSource *)self primaryMessageContentRequest];
  v37 = (void *)v10;
  v30 = [(MailActionsViewDataSource *)self delegate];
  v40 = [(MailActionsViewDataSource *)self scene];
  v39 = objc_opt_new();
  v29 = [(MailActionsViewDataSource *)self selectedMessageContent];
  [(MailActionsViewDataSource *)self mailboxes];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000D1330;
  v41[3] = &unk_1006073A0;
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  id v42 = v36;
  id v11 = v8;
  id v43 = v11;
  id v34 = v30;
  id v44 = v34;
  id v33 = v29;
  id v45 = v33;
  v46 = self;
  id v12 = v32;
  id v47 = v12;
  id v13 = v31;
  id v48 = v13;
  BOOL v14 = objc_retainBlock(v41);
  v35 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v10 scene:v40];
  v15 = ((void (*)(void *, void *))v14[2])(v14, v35);
  [v39 addObject:v15];

  v16 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v10 scene:v40];
  if ([v16 isPermitted])
  {
    v17 = ((void (*)(void *, void *))v14[2])(v14, v16);
    [v39 addObject:v17];
  }
  v18 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v10 scene:v40];
  v19 = ((void (*)(void *, void *))v14[2])(v14, v18);
  [v39 addObject:v19];

  unsigned int v20 = [v9 shouldArchiveByDefault];
  int64_t v21 = [(MailActionsViewDataSource *)self targetPreference];
  v22 = [(MailActionsViewDataSource *)self targetedMessages];
  if (v20) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  v24 = [(MailActionsViewDataSource *)self _archiveOrDeleteInteractionForMessageListItems:v22 deleteOrArchive:v23 presentationSource:v11 type:v21 != 0 shouldAskForConfirmation:0];

  v25 = [v24 cardActionWithPreparation:v12 completion:v13];
  v26 = v25;
  v27 = &MFImageGlyphArchiveFill;
  if (!v20) {
    v27 = &MFImageGlyphTrashFill;
  }
  [v25 setImageName:*v27];
  [v39 addObject:v26];

  return v39;
}

- (id)_mailActionCardFlagActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v6 = a5;
  BOOL v7 = [(MailActionsViewDataSource *)self undoManager];
  id v8 = objc_opt_new();
  v9 = [(MailActionsViewDataSource *)self targetedMessages];
  uint64_t v10 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v9 undoManager:v7 origin:[(MailActionsViewDataSource *)self origin] actor:2 reason:4];
  if ([v10 isPermitted])
  {
    id v11 = [(MailActionsViewDataSource *)self flagChangeInteractionDelegate];
    [v10 setDelegate:v11];

    id v12 = [v10 cardActionWithCompletion:v6];
    [v8 addObject:v12];

    id v13 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v9 undoManager:v7 origin:[(MailActionsViewDataSource *)self origin] actor:2 reason:4];
    BOOL v14 = [v13 cardActionWithCompletion:v6];
    [v8 addObject:v14];

    id v15 = v8;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_mailActionCardSendAgainAndUnreadActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MailActionsViewDataSource *)self delegate];
  id v12 = objc_opt_new();
  if (![(MailActionsViewDataSource *)self targetPreference])
  {
    id v13 = [(MailActionsViewDataSource *)self primaryMessageContentRequest];
    BOOL v14 = [(MailActionsViewDataSource *)self scene];
    id v15 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v13 scene:v14];

    v16 = [(MailActionsViewDataSource *)self mailboxes];
    [v15 setMessageSourceMailboxes:v16];

    if ([v15 isPermitted])
    {
      [v15 setPresentationSource:v8];
      [v15 setDelegate:v11];
      v17 = [v15 cardActionWithPreparation:v9 completion:v10];
      [v12 addObject:v17];
    }
  }
  v18 = [(MailActionsViewDataSource *)self targetedMessages];
  v19 = [(MailActionsViewDataSource *)self undoManager];
  unsigned int v20 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v18 undoManager:v19 origin:[(MailActionsViewDataSource *)self origin] actor:2 reason:4];

  int64_t v21 = [v20 cardActionWithPreparation:v9 completion:v10];
  [v12 addObject:v21];

  return v12;
}

- (id)_mailActionCardVerticalActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v46 = a5;
  id v43 = [(MailActionsViewDataSource *)self delegate];
  id v10 = [(MailActionsViewDataSource *)self scene];
  v50 = [(MailActionsViewDataSource *)self undoManager];
  v52 = [(MailActionsViewDataSource *)self primaryMessage];
  v51 = [(MailActionsViewDataSource *)self allMessagesInConversation];
  id v11 = objc_opt_new();
  id v47 = [(MailActionsViewDataSource *)self primaryMessageContentRequest];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000D20D0;
  v53[3] = &unk_1006073C8;
  id v12 = v8;
  id v54 = v12;
  id v48 = v43;
  id v55 = v48;
  id v13 = v11;
  id v56 = v13;
  id v14 = v9;
  id v57 = v14;
  id v15 = v46;
  id v58 = v15;
  v49 = objc_retainBlock(v53);
  if ([v52 shouldArchiveByDefault]) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  id v45 = [(MailActionsViewDataSource *)self _archiveOrDeleteInteractionForMessageListItems:v51 deleteOrArchive:v16 presentationSource:v12 type:1 shouldAskForConfirmation:0];
  v17 = [v45 cardActionWithPreparation:v14 completion:v15];
  [v13 addObject:v17];

  if (EMBlackPearlIsFeatureEnabled()
    && [(MailActionsViewDataSource *)self includeCategorizationAction])
  {
    id v18 = [objc_alloc((Class)MSMessageListItemSelection) initWithMessageListItems:v51];
    v19 = +[MFTriageInteraction interactionWithMessageListItemSelection:v18 undoManager:v50 origin:[(MailActionsViewDataSource *)self origin] actor:2];
    [v19 setDelegate:v48];
    [v19 setPresentationSource:v12];
    unsigned int v20 = [v19 cardActionWithCompletion:v15];
    [v20 setShouldDismissCardBeforeExecuteHandler:1];
    [v13 addObject:v20];
  }
  id v44 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v51 undoManager:v50 origin:[(MailActionsViewDataSource *)self origin] actor:2 reason:4];
  int64_t v21 = [v44 cardActionWithPreparation:v14 completion:v15];
  [v13 addObject:v21];

  v22 = [(MailActionsViewDataSource *)self target];
  uint64_t v23 = [v22 targetedMessages];
  unsigned __int8 v24 = [v23 ef_any:&stru_1006073E8];

  if ((v24 & 1) == 0)
  {
    v25 = +[MFConversationFlagTriageInteraction interactionWithReferenceMessage:v52 undoManager:v50 origin:[(MailActionsViewDataSource *)self origin] actor:2];
    [v25 setPresentationSource:v12];
    [v25 setDelegate:v48];
    if ([v25 isPermitted])
    {
      v26 = [v25 cardActionWithPreparation:v14 completion:v15];
      [v13 addObject:v26];
    }
    v27 = +[MFConversationFlagTriageInteraction interactionWithReferenceMessage:v52 undoManager:v50 origin:[(MailActionsViewDataSource *)self origin] actor:2];
    ((void (*)(void *, void *))v49[2])(v49, v27);
  }
  if (+[UIPrintInteractionController isPrintingAvailable]&& ![(MailActionsViewDataSource *)self targetPreference])
  {
    v28 = [(MailActionsViewDataSource *)self printerDelegate];
    v29 = +[MFPrintTriageInteraction interactionWithContentRequest:v47 scene:v10 delegate:v28];

    [v29 setDelegate:v48];
    [v29 setPresentationSource:v12];
    v30 = [v29 cardActionWithPreparation:v14 completion:v15];
    [v30 setShouldDismissCardBeforeExecuteHandler:1];
    [v13 addObject:v30];
  }
  id v31 = +[MFSenderBlockingTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:blockSender:](MFSenderBlockingTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:blockSender:", v51, v50, -[MailActionsViewDataSource origin](self, "origin"), 2, [v52 isBlocked] ^ 1);
  ((void (*)(void *, void *))v49[2])(v49, v31);
  if (((unint64_t)[v52 unsubscribeType] & 5) != 0)
  {
    id v32 = +[MFUnsubscribeTriageInteraction interactionWithReferenceMessageListItems:v51 origin:[(MailActionsViewDataSource *)self origin] actor:2];
    ((void (*)(void *, void *))v49[2])(v49, v32);
  }
  id v33 = +[NSUserDefaults standardUserDefaults];
  id v34 = mf_defaultsKeyForFeature();
  unsigned int v35 = [v33 BOOLForKey:v34];

  id v36 = +[NSUserDefaults standardUserDefaults];
  id v37 = [v36 BOOLForKey:@"ShowSendEmlToTriageTeam"];

  if ((v35 | v37) == 1)
  {
    v38 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v47 scene:v10];
    v39 = [(MailActionsViewDataSource *)self mailboxes];
    [v38 setMessageSourceMailboxes:v39];

    [v38 setForTriageTeam:v37];
    [v38 setPresentationSource:v12];
    v40 = [v38 cardActionWithPreparation:v14 completion:v15];
    [v13 addObject:v40];
  }
  id v41 = v13;

  return v41;
}

- (id)_archiveOrDeleteInteractionForMessageListItems:(id)a3 deleteOrArchive:(unint64_t)a4 presentationSource:(id)a5 type:(int64_t)a6 shouldAskForConfirmation:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  id v14 = [(MailActionsViewDataSource *)self undoManager];
  id v15 = [(MailActionsViewDataSource *)self delegate];
  if (a4 == 2) {
    uint64_t v16 = MFArchiveTriageInteraction;
  }
  else {
    uint64_t v16 = MFDeleteTriageInteraction;
  }
  v17 = [(__objc2_class *)v16 interactionWithMessageListItems:v12 undoManager:v14 origin:[(MailActionsViewDataSource *)self origin] actor:2];
  [v17 setDelegate:v15];
  [v17 setPresentationSource:v13];
  [v17 setType:a6];
  [v17 setShouldAskForConfirmation:v7];

  return v17;
}

- (id)_categoryMailActionsWithCompletion:(id)a3
{
  return 0;
}

- (BOOL)includeReadLaterAction
{
  return self->includeReadLaterAction;
}

- (void)setIncludeReadLaterAction:(BOOL)a3
{
  self->includeReadLaterAction = a3;
}

- (BOOL)includeCategorizationAction
{
  return self->includeCategorizationAction;
}

- (void)setIncludeCategorizationAction:(BOOL)a3
{
  self->includeCategorizationAction = a3;
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (MFTriageInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTriageInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFFlagChangeTriageInteractionDelegate)flagChangeInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flagChangeInteractionDelegate);

  return (MFFlagChangeTriageInteractionDelegate *)WeakRetained;
}

- (void)setFlagChangeInteractionDelegate:(id)a3
{
}

- (MUIPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
}

- (MFTriageInteractionTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (id)preparation
{
  return self->_preparation;
}

- (void)setPreparation:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
}

- (MFMoveToPredictionTriageInteractionDelegate)moveToPredictionTriageInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moveToPredictionTriageInteractionDelegate);

  return (MFMoveToPredictionTriageInteractionDelegate *)WeakRetained;
}

- (void)setMoveToPredictionTriageInteractionDelegate:(id)a3
{
}

- (UIViewController)presentingViewControllerForTransferUI
{
  return self->_presentingViewControllerForTransferUI;
}

- (void)setPresentingViewControllerForTransferUI:(id)a3
{
}

- (MFMessagePrinterDelegate)printerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printerDelegate);

  return (MFMessagePrinterDelegate *)WeakRetained;
}

- (void)setPrinterDelegate:(id)a3
{
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printerDelegate);
  objc_storeStrong((id *)&self->_presentingViewControllerForTransferUI, 0);
  objc_destroyWeak((id *)&self->_moveToPredictionTriageInteractionDelegate);
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_preparation, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_presentationSource, 0);
  objc_destroyWeak((id *)&self->_flagChangeInteractionDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_scene);
}

@end
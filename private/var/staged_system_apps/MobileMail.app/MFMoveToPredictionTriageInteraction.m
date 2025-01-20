@interface MFMoveToPredictionTriageInteraction
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 presentationSource:(id)a7 delegate:(id)a8 presentingViewController:(id)a9 predictedMailbox:(id)a10;
+ (id)predictMailboxForMovingMessages:(id)a3;
+ (id)predictMailboxForMovingMessages:(id)a3 completionHandler:(id)a4;
+ (id)predictMailboxForMovingMessagesWithIDs:(id)a3;
- (BOOL)hasPrediction;
- (BOOL)needShrinkAnimationAfterCompletion;
- (EMMailbox)prediction;
- (NSArray)previewActions;
- (UIViewController)transferUIViewController;
- (id)_mailboxForObjectID:(id)a3;
- (id)alertActionsWithCompletion:(id)a3;
- (id)cardActionsWithCompletion:(id)a3;
- (id)didDismissHandler;
- (id)lazyPreviewActionHandler;
- (id)lazyPreviewActions;
- (id)previewActionHandler;
- (id)previewActionItemForSwipe:(BOOL)a3;
- (void)_enumeratePredictionActions:(id)a3;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)_presentFollowUpActionSheetWithCompletion:(id)a3;
- (void)_presentTransferUI;
- (void)moveToTargetEMMailbox:(id)a3;
- (void)setDidDismissHandler:(id)a3;
- (void)setPrediction:(id)a3;
- (void)setPreviewActionHandler:(id)a3;
- (void)setPreviewActions:(id)a3;
- (void)setTransferUIViewController:(id)a3;
@end

@implementation MFMoveToPredictionTriageInteraction

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 presentationSource:(id)a7 delegate:(id)a8 presentingViewController:(id)a9 predictedMailbox:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___MFMoveToPredictionTriageInteraction;
  v21 = [super interactionWithMessageListItems:v16 undoManager:a4 origin:a5 actor:a6];
  v22 = v21;
  if (v21)
  {
    [v21 setTransferUIViewController:v19];
    [v22 setDelegate:v18];
    [v22 setPresentationSource:v17];
    if (v20)
    {
      [v22 setPrediction:v20];
    }
    else
    {
      [v22 setPrediction:0];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v22);
      v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      v27 = sub_1001CAE34;
      v28 = &unk_10060C8A0;
      objc_copyWeak(&v29, &location);
      id v23 = [a1 predictMailboxForMovingMessages:v16 completionHandler:&v25];
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    [v22 setCanHavePrediction:1 v25, v26, v27, v28];
  }

  return v22;
}

+ (id)predictMailboxForMovingMessages:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[UIApplication sharedApplication];
  v8 = [v7 daemonInterface];
  v9 = [v8 messageRepository];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001CAFFC;
  v13[3] = &unk_10060C8C8;
  id v10 = v6;
  id v14 = v10;
  v11 = [v9 predictMailboxForMovingMessages:v5 completionHandler:v13];

  return v11;
}

+ (id)predictMailboxForMovingMessages:(id)a3
{
  id v3 = a3;
  v4 = +[EFPromise promise];
  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 daemonInterface];
  v7 = [v6 messageRepository];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001CB2E4;
  v16[3] = &unk_10060C8F0;
  id v8 = v4;
  id v17 = v8;
  id v9 = v3;
  id v18 = v9;
  id v10 = [v7 predictMailboxForMovingMessages:v9 completionHandler:v16];

  v11 = [v8 future];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001CB3D4;
  v14[3] = &unk_100604F70;
  id v12 = v10;
  id v15 = v12;
  [v11 addFailureBlock:v14];

  return v11;
}

+ (id)predictMailboxForMovingMessagesWithIDs:(id)a3
{
  id v3 = a3;
  v4 = +[EFPromise promise];
  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 daemonInterface];
  v7 = [v6 messageRepository];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001CB664;
  v16[3] = &unk_10060C8F0;
  id v8 = v4;
  id v17 = v8;
  id v9 = v3;
  id v18 = v9;
  id v10 = [v7 predictMailboxForMovingMessagesWithIDs:v9 completionHandler:v16];

  v11 = [v8 future];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001CB738;
  v14[3] = &unk_100604F70;
  id v12 = v10;
  id v15 = v12;
  [v11 addFailureBlock:v14];

  return v11;
}

- (void)moveToTargetEMMailbox:(id)a3
{
  id v4 = a3;
  [(MFMoveMessageTriageInteraction *)self setTargetMailbox:v4];
  v5.receiver = self;
  v5.super_class = (Class)MFMoveToPredictionTriageInteraction;
  [(MFTriageInteraction *)&v5 _performInteractionAfterPreparation:0 completion:0];
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if ([(MFMoveToPredictionTriageInteraction *)self hasPrediction]) {
    [(MFMoveToPredictionTriageInteraction *)self _presentFollowUpActionSheetWithCompletion:v5];
  }
  else {
    [(MFMoveToPredictionTriageInteraction *)self _presentTransferUI];
  }
}

- (id)previewActionItemForSwipe:(BOOL)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFMoveToPredictionTriageInteraction;
    id v4 = [(MFTriageInteraction *)&v7 previewActionItemForSwipe:1];
  }
  else
  {
    id v5 = [(MFMoveMessageTriageInteraction *)self title];
    id v4 = +[_MFLazyPreviewActionItem previewActionItemWithTitle:v5 dataSource:self];
  }

  return v4;
}

- (id)lazyPreviewActions
{
  if (!self->_previewActions)
  {
    if ([(MFMoveToPredictionTriageInteraction *)self hasPrediction])
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1001CBA64;
      v10[3] = &unk_10060C940;
      id v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      v11 = v3;
      [(MFMoveToPredictionTriageInteraction *)self _enumeratePredictionActions:v10];
      previewActions = self->_previewActions;
      self->_previewActions = v3;
      id v5 = v3;
    }
    else
    {
      id v6 = (NSArray *)objc_alloc_init((Class)NSArray);
      objc_super v7 = self->_previewActions;
      self->_previewActions = v6;
    }
  }
  id v8 = self->_previewActions;

  return v8;
}

- (id)lazyPreviewActionHandler
{
  id previewActionHandler = self->_previewActionHandler;
  if (!previewActionHandler)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001CBC64;
    v8[3] = &unk_10060C968;
    objc_copyWeak(&v9, &location);
    id v4 = [v8 copy];
    id v5 = self->_previewActionHandler;
    self->_id previewActionHandler = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id previewActionHandler = self->_previewActionHandler;
  }
  id v6 = objc_retainBlock(previewActionHandler);

  return v6;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 1;
}

- (id)cardActionsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(MFMoveToPredictionTriageInteraction *)self hasPrediction])
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001CBF54;
    v22[3] = &unk_10060C9B8;
    v22[4] = self;
    id v24 = v4;
    id v6 = v5;
    id v23 = v6;
    [(MFMoveToPredictionTriageInteraction *)self _enumeratePredictionActions:v22];
    id v7 = [v6 copy];

    id v8 = v24;
  }
  else
  {
    id v9 = [(MFMoveMessageTriageInteraction *)self cardTitle];
    [v9 ef_stringByTrimmingWhitespaceAndNewlineCharacters];
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    id v10 = [(MFMoveMessageTriageInteraction *)self _iconImageName];
    v11 = [(MFTriageInteraction *)self _tintColor];
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_1001CC178;
    id v19 = &unk_10060AEB0;
    id v20 = self;
    id v21 = v4;
    id v12 = +[MFCardAction cardActionWithTitle:v6 shortTitle:0 imageName:v10 tintColor:v11 handler:&v16];

    v13 = [(MFMoveMessageTriageInteraction *)self accessibilityIdentifer];
    [v12 setAccessibilityIdentifer:v13];

    id v14 = objc_alloc((Class)NSArray);
    id v7 = [v14 initWithObjects:v12, 0, v16, v17, v18, v19];

    id v8 = v21;
  }

  return v7;
}

- (id)alertActionsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(MFMoveToPredictionTriageInteraction *)self hasPrediction])
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001CC364;
    v9[3] = &unk_10060CA08;
    id v11 = v4;
    v9[4] = self;
    id v6 = v5;
    id v10 = v6;
    [(MFMoveToPredictionTriageInteraction *)self _enumeratePredictionActions:v9];
    id v7 = [v6 copy];
  }
  else
  {
    id v6 = [(MFTriageInteraction *)self alertActionWithCompletion:v4];
    id v12 = v6;
    id v7 = +[NSArray arrayWithObjects:&v12 count:1];
  }

  return v7;
}

- (BOOL)hasPrediction
{
  v2 = [(MFMoveToPredictionTriageInteraction *)self prediction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_mailboxForObjectID:(id)a3
{
  id v3 = a3;
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 daemonInterface];
  id v6 = [v5 mailboxRepository];
  id v7 = [v6 mailboxForObjectID:v3];
  id v8 = [v7 result];

  return v8;
}

- (void)_enumeratePredictionActions:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"MOVE_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
  id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [(MFTriageInteraction *)self messageCount]);

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:v7 value:&stru_100619928 table:@"Main"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001CC8C8;
  v17[3] = &unk_1006047A0;
  v17[4] = self;
  (*((void (**)(id, void *, void, void *))v4 + 2))(v4, v9, 0, v17);

  id v10 = [(MFMoveToPredictionTriageInteraction *)self prediction];
  if (v10)
  {
    id v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"MOVE_TO" value:&stru_100619928 table:@"Main"];
    v13 = [v10 name];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001CC8D0;
    v15[3] = &unk_100604618;
    v15[4] = self;
    id v16 = v10;
    (*((void (**)(id, void *, uint64_t, void *))v4 + 2))(v4, v14, 1, v15);
  }
}

- (void)_presentTransferUI
{
  v9.receiver = self;
  v9.super_class = (Class)MFMoveToPredictionTriageInteraction;
  id v3 = [(MFTriageInteraction *)&v9 delegate];
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___MFMoveToPredictionTriageInteractionDelegate])
  {
    [(MFMoveMessageTriageInteraction *)self setDidPresentTransferUI:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v4 = [(MFMoveToPredictionTriageInteraction *)self prediction];
    id v5 = [(MFMoveToPredictionTriageInteraction *)self transferUIViewController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001CCA84;
    v6[3] = &unk_100604FE8;
    objc_copyWeak(&v7, &location);
    [v3 presentTransferUIWithMoveInteraction:self prediction:v4 fromViewController:v5 didDismissHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_presentFollowUpActionSheetWithCompletion:(id)a3
{
  id v4 = (Block_layout *)a3;
  id v5 = &stru_10060CA70;
  if (v4) {
    id v5 = v4;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001CCD8C;
  v17[3] = &unk_10060CA98;
  id v6 = v5;
  v17[4] = self;
  id v18 = v6;
  +[UIAlertController mf_actionSheetWithTitle:0 cancellationHandler:v17];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001CCDA4;
  v13[3] = &unk_10060C9B8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v6;
  id v15 = self;
  id v16 = v8;
  [(MFMoveToPredictionTriageInteraction *)self _enumeratePredictionActions:v13];
  objc_super v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"MFMoveToPredictionTriageInteractionPredictionPresented" object:self];

  id v10 = [(MFTriageInteraction *)self delegate];
  id v11 = [v10 presentingViewControllerForTriageInteraction:self];

  id v12 = [(MFTriageInteraction *)self presentationSource];
  [v7 mf_presentFromViewController:v11 withSource:v12];
}

- (EMMailbox)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(id)a3
{
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
}

- (UIViewController)transferUIViewController
{
  return self->_transferUIViewController;
}

- (void)setTransferUIViewController:(id)a3
{
}

- (NSArray)previewActions
{
  return self->_previewActions;
}

- (void)setPreviewActions:(id)a3
{
}

- (id)previewActionHandler
{
  return self->_previewActionHandler;
}

- (void)setPreviewActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewActionHandler, 0);
  objc_storeStrong((id *)&self->_previewActions, 0);
  objc_storeStrong((id *)&self->_transferUIViewController, 0);
  objc_storeStrong(&self->_didDismissHandler, 0);

  objc_storeStrong((id *)&self->_prediction, 0);
}

@end
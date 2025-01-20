@interface MFMoveMessageTriageInteraction
- (BOOL)canHavePrediction;
- (BOOL)didPresentTransferUI;
- (BOOL)hasPrediction;
- (BOOL)isPermittedWithTargetAccount:(id)a3;
- (BOOL)predictionSelected;
- (BOOL)supportsSelectAll;
- (EMMailbox)targetMailbox;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)cardTitle;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (id)updateReason;
- (int64_t)targetMailboxType;
- (void)_dispatchInteractionWithCompletion:(id)a3;
- (void)setCanHavePrediction:(BOOL)a3;
- (void)setDidPresentTransferUI:(BOOL)a3;
- (void)setHasPrediction:(BOOL)a3;
- (void)setPredictionSelected:(BOOL)a3;
- (void)setTargetMailbox:(id)a3;
- (void)setTargetMailboxType:(int64_t)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFMoveMessageTriageInteraction

- (id)triageAction
{
  if (!self->_triageAction)
  {
    int64_t v3 = [(MFMoveMessageTriageInteraction *)self targetMailboxType];
    id v4 = objc_alloc((Class)MSMoveTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    if (v3)
    {
      LOBYTE(v14) = 0;
      v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self destinationMailboxType:v3 flagChange:0 copyMessages:v14];
      triageAction = self->_triageAction;
      self->_triageAction = v6;
    }
    else
    {
      int64_t v8 = [(MFTriageInteraction *)self origin];
      int64_t v9 = [(MFTriageInteraction *)self actor];
      triageAction = [(MFMoveMessageTriageInteraction *)self targetMailbox];
      LOBYTE(v14) = 0;
      v10 = (MSTriageAction *)[v4 initWithMessageListSelection:v5 origin:v8 actor:v9 delegate:self destinationMailbox:triageAction flagChange:0 copyMessages:v14];
      v11 = self->_triageAction;
      self->_triageAction = v10;
    }
  }
  v12 = self->_triageAction;

  return v12;
}

- (BOOL)isPermittedWithTargetAccount:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = [(MFTriageInteraction *)self messageListItemSelection];
  v6 = [v5 messageListItems];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    id v22 = v7;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        int64_t v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        int64_t v9 = [v8 mailboxes:v22];
        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v27;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
              uint64_t v14 = +[UIApplication sharedApplication];
              v15 = [v14 accountsProvider];
              v16 = [v13 accountIdentifier];
              v17 = [v15 legacyMailAccountForObjectID:v16];

              if (v17)
              {
                v18 = +[MCProfileConnection sharedConnection];
                unsigned int v19 = +[MailAccount canMoveMessagesFromAccount:v17 toAccount:v4 profileConnection:v18];

                if (!v19)
                {

                  BOOL v20 = 0;
                  goto LABEL_20;
                }
              }
            }
            id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      BOOL v20 = 1;
      id v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_20:

  return v20;
}

- (void)_dispatchInteractionWithCompletion:(id)a3
{
  id v4 = a3;
  sub_1001CA09C((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)MFMoveMessageTriageInteraction;
  [(MFTriageInteraction *)&v5 _dispatchInteractionWithCompletion:v4];
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  int64_t v3 = [v2 localizedStringForKey:@"MOVE_MESSAGE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMoveMessage;
}

- (id)shortTitle
{
  v2 = +[NSBundle mainBundle];
  int64_t v3 = [v2 localizedStringForKey:@"SWIPE_MOVE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)cardTitle
{
  if ([(MFTriageInteraction *)self messageCount] < 2)
  {
    int64_t v3 = +[NSBundle mainBundle];
    objc_super v5 = [v3 localizedStringForKey:@"MOVE_MESSAGE" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    int64_t v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"MOVE_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
    objc_super v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [(MFTriageInteraction *)self messageCount]);
  }

  return v5;
}

- (id)_iconImageName
{
  return MFImageGlyphMove;
}

- (id)_previewImageName
{
  return MFImageGlyphMove;
}

- (id)color
{
  return +[UIColor systemIndigoColor];
}

- (BOOL)supportsSelectAll
{
  return 1;
}

- (id)updateReason
{
  return @"messageMoved";
}

- (void)setTriageAction:(id)a3
{
}

- (EMMailbox)targetMailbox
{
  return self->_targetMailbox;
}

- (void)setTargetMailbox:(id)a3
{
}

- (int64_t)targetMailboxType
{
  return self->_targetMailboxType;
}

- (void)setTargetMailboxType:(int64_t)a3
{
  self->_targetMailboxType = a3;
}

- (BOOL)didPresentTransferUI
{
  return self->_didPresentTransferUI;
}

- (void)setDidPresentTransferUI:(BOOL)a3
{
  self->_didPresentTransferUI = a3;
}

- (BOOL)canHavePrediction
{
  return self->_canHavePrediction;
}

- (void)setCanHavePrediction:(BOOL)a3
{
  self->_canHavePrediction = a3;
}

- (BOOL)hasPrediction
{
  return self->_hasPrediction;
}

- (void)setHasPrediction:(BOOL)a3
{
  self->_hasPrediction = a3;
}

- (BOOL)predictionSelected
{
  return self->_predictionSelected;
}

- (void)setPredictionSelected:(BOOL)a3
{
  self->_predictionSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMailbox, 0);

  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
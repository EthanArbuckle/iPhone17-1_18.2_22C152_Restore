@interface MFGroupedSenderDestructiveTriageInteraction
+ (id)interactionWithQuery:(id)a3 groupedSenderDisplayName:(id)a4 selectedBucket:(int64_t)a5 undoManager:(id)a6 origin:(int64_t)a7 actor:(int64_t)a8;
+ (unint64_t)deleteOrArchive;
- (BOOL)_requiresConfirmationPrompt;
- (BOOL)isDestructive;
- (NSString)displayName;
- (id)_alertMessageForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6;
- (id)_alertTitleForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6;
- (int64_t)selectedBucket;
- (void)_addMessageDeletionActionsForAlertController:(id)a3 triageInteraction:(id)a4 categoryMessageCount:(unint64_t)a5 continuation:(id)a6;
- (void)_performContinuation:(id)a3 withAlertController:(id)a4;
- (void)_updateAlertController:(id)a3 triageInteraction:(id)a4 displayName:(id)a5 selectedBucket:(int64_t)a6 categoryMessageCount:(unint64_t)a7 totalMessageCount:(unint64_t)a8 continuation:(id)a9;
- (void)setDisplayName:(id)a3;
- (void)setSelectedBucket:(int64_t)a3;
@end

@implementation MFGroupedSenderDestructiveTriageInteraction

+ (id)interactionWithQuery:(id)a3 groupedSenderDisplayName:(id)a4 selectedBucket:(int64_t)a5 undoManager:(id)a6 origin:(int64_t)a7 actor:(int64_t)a8
{
  id v14 = a4;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___MFGroupedSenderDestructiveTriageInteraction;
  v15 = [super interactionWithQuery:a3 undoManager:a6 origin:a7 actor:a8];
  [v15 setDisplayName:v14];
  [v15 setSelectedBucket:a5];

  return v15;
}

+ (unint64_t)deleteOrArchive
{
  return 1;
}

- (id)_alertTitleForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6
{
  id v8 = a3;
  [(MFGroupedSenderDestructiveTriageInteraction *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFGroupedSenderDestructiveTriageInteraction _alertTitleForDisplayName:selectedBucket:categoryMessageCount:totalMessageCount:]", "MFGroupedSenderDestructiveTriageInteraction-BlackPearlUI.m", 37, "0");
}

- (id)_alertMessageForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6
{
  id v8 = a3;
  [(MFGroupedSenderDestructiveTriageInteraction *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFGroupedSenderDestructiveTriageInteraction _alertMessageForDisplayName:selectedBucket:categoryMessageCount:totalMessageCount:]", "MFGroupedSenderDestructiveTriageInteraction-BlackPearlUI.m", 41, "0");
}

- (void)_addMessageDeletionActionsForAlertController:(id)a3 triageInteraction:(id)a4 categoryMessageCount:(unint64_t)a5 continuation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(MFGroupedSenderDestructiveTriageInteraction *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFGroupedSenderDestructiveTriageInteraction _addMessageDeletionActionsForAlertController:triageInteraction:categoryMessageCount:continuation:]", "MFGroupedSenderDestructiveTriageInteraction-BlackPearlUI.m", 45, "0");
}

- (void)_updateAlertController:(id)a3 triageInteraction:(id)a4 displayName:(id)a5 selectedBucket:(int64_t)a6 categoryMessageCount:(unint64_t)a7 totalMessageCount:(unint64_t)a8 continuation:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  id v19 = v15;
  id v25 = v19;
  v26 = self;
  id v20 = v17;
  id v27 = v20;
  int64_t v30 = a6;
  unint64_t v31 = a7;
  unint64_t v32 = a8;
  id v21 = v16;
  id v28 = v21;
  id v22 = v18;
  id v29 = v22;
  v23 = +[EFScheduler mainThreadScheduler];
  [v23 performBlock:&v24];
}

- (void)_performContinuation:(id)a3 withAlertController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
  v9 = [(MFTriageInteraction *)self delegate];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10019B5E8;
  id v16 = &unk_10060B848;
  id v17 = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  [v9 groupedSenderMessageCountForDestructiveTriageInteraction:self completionHandler:&v13];
  [v9 updateAvatarViewControllerForTriageInteraction:self alertController:v10 v13, v14, v15, v16, v17];
}

- (BOOL)_requiresConfirmationPrompt
{
  return 1;
}

- (BOOL)isDestructive
{
  return 1;
}

- (int64_t)selectedBucket
{
  return self->_selectedBucket;
}

- (void)setSelectedBucket:(int64_t)a3
{
  self->_selectedBucket = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
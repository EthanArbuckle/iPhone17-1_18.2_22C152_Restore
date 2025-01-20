@interface MFUnsubscribeTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
+ (id)interactionWithReferenceMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
+ (id)interactionWithReferenceMessageListItemsAndConfirmation:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 shouldAskForConfirmation:(BOOL)a6;
+ (id)log;
- (BOOL)_requiresConfirmationPrompt;
- (BOOL)shouldUpdateWidget;
- (BOOL)supportsSelectAll;
- (NSString)sender;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)alertTitle;
- (id)color;
- (id)senderForMessageList:(id)a3;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (id)unsubscribeMessageAlertFormat;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setSender:(id)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFUnsubscribeTriageInteraction

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FD5E4;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699DC8 != -1) {
    dispatch_once(&qword_100699DC8, block);
  }
  v2 = (void *)qword_100699DC0;

  return v2;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___MFUnsubscribeTriageInteraction;
  v9 = [super interactionWithMessageListItemSelection:v8 undoManager:0 origin:a4 actor:a5];
  v10 = [v8 messageListItems];
  v11 = [v10 firstObject];
  v12 = [v11 groupedSenderMessageListItems];
  v13 = [v9 senderForMessageList:v12];

  [v9 setSender:v13];

  return v9;
}

+ (id)interactionWithReferenceMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)MSMessageListItemSelection) initWithMessageListItems:v8];
  v10 = [a1 interactionWithMessageListItemSelection:v9 origin:a4 actor:a5];

  return v10;
}

+ (id)interactionWithReferenceMessageListItemsAndConfirmation:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 shouldAskForConfirmation:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [objc_alloc((Class)MSMessageListItemSelection) initWithMessageListItems:v10];
  v12 = [a1 interactionWithMessageListItemSelection:v11 origin:a4 actor:a5];
  [v12 setShouldAskForConfirmation:v6];

  return v12;
}

- (id)senderForMessageList:(id)a3
{
  id v20 = a3;
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v20;
  id v21 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16 v20];
  if (v21)
  {
    uint64_t v23 = *(void *)v47;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v31 = v4;
        id v25 = [v4 mailboxes];
        id v22 = [v25 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v22)
        {
          uint64_t v24 = *(void *)v43;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v25);
              }
              v5 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              BOOL v6 = [v5 account];
              id v29 = [v6 emailAddresses];

              id v32 = [v29 countByEnumeratingWithState:&v38 objects:v51 count:16];
              if (v32)
              {
                uint64_t v30 = *(void *)v39;
                do
                {
                  for (k = 0; k != v32; k = (char *)k + 1)
                  {
                    if (*(void *)v39 != v30) {
                      objc_enumerationMutation(v29);
                    }
                    v7 = *(void **)(*((void *)&v38 + 1) + 8 * (void)k);
                    long long v34 = 0u;
                    long long v35 = 0u;
                    long long v36 = 0u;
                    long long v37 = 0u;
                    id v8 = [v31 toList];
                    id v9 = [v8 countByEnumeratingWithState:&v34 objects:v50 count:16];
                    if (v9)
                    {
                      uint64_t v10 = *(void *)v35;
                      do
                      {
                        for (m = 0; m != v9; m = (char *)m + 1)
                        {
                          if (*(void *)v35 != v10) {
                            objc_enumerationMutation(v8);
                          }
                          v12 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)m) emailAddressValue];
                          v13 = [v12 simpleAddress];
                          v14 = [v7 simpleAddress];
                          unsigned int v15 = [v13 isEqualToString:v14];

                          if (v15)
                          {
                            v16 = [v7 simpleAddress];
                            [v3 addObject:v16];
                          }
                        }
                        id v9 = [v8 countByEnumeratingWithState:&v34 objects:v50 count:16];
                      }
                      while (v9);
                    }
                  }
                  id v32 = [v29 countByEnumeratingWithState:&v38 objects:v51 count:16];
                }
                while (v32);
              }
            }
            id v22 = [v25 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v22);
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v21);
  }

  v17 = [v3 allObjects];
  v18 = [v17 componentsJoinedByString:@", "];

  return v18;
}

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSUnsubscribeTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    BOOL v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (id)title
{
  return (id)_EFLocalizedString();
}

- (id)shortTitle
{
  return (id)_EFLocalizedString();
}

- (id)alertTitle
{
  return @"ALERT TITLE!!!";
}

- (id)_iconImageName
{
  return MFImageGlyphCircleXMark;
}

- (id)_previewImageName
{
  return MFImageGlyphCircleXMark;
}

- (id)color
{
  return +[UIColor systemIndigoColor];
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)shouldUpdateWidget
{
  return 1;
}

- (BOOL)_requiresConfirmationPrompt
{
  return 1;
}

- (void)dealloc
{
  NSLog(@"Deallocating", a2);
  v3.receiver = self;
  v3.super_class = (Class)MFUnsubscribeTriageInteraction;
  [(MFUnsubscribeTriageInteraction *)&v3 dealloc];
}

- (id)unsubscribeMessageAlertFormat
{
  return (id)_EFLocalizedString();
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MFTriageInteraction *)self shouldAskForConfirmation])
  {
    id v8 = +[MFUnsubscribeTriageInteraction log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shouldAskForConfirmation = true, presenting UIAlert to confirm MFUnsubscribeTriageInteraction", buf, 2u);
    }

    id v21 = [(MFTriageInteraction *)self delegate];
    id v9 = [v21 presentingViewControllerForTriageInteraction:self];
    uint64_t v10 = _EFLocalizedString();
    id v11 = [(MFUnsubscribeTriageInteraction *)self unsubscribeMessageAlertFormat];
    v12 = [(MFUnsubscribeTriageInteraction *)self sender];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

    v14 = +[UIAlertController alertControllerWithTitle:v10 message:v13 preferredStyle:1];
    unsigned int v15 = _EFLocalizedString();
    v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];

    v17 = _EFLocalizedString();
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001FE3A8;
    v23[3] = &unk_10060D868;
    id v24 = v6;
    id v25 = v7;
    v23[4] = self;
    v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v23];

    [v14 addAction:v16];
    [v14 addAction:v18];
    [v14 setModalPresentationStyle:7];
    v19 = [(MFTriageInteraction *)self presentationSource];
    [v14 mf_presentFromViewController:v9 withSource:v19];
  }
  else
  {
    id v20 = +[MFUnsubscribeTriageInteraction log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "shouldAskForConfirmation = false, performing MFUnsubscribeTriageInteraction directly without confirmation", buf, 2u);
    }

    v22.receiver = self;
    v22.super_class = (Class)MFUnsubscribeTriageInteraction;
    [(MFTriageInteraction *)&v22 _performInteractionAfterPreparation:v6 completion:v7];
  }
}

- (void)setTriageAction:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
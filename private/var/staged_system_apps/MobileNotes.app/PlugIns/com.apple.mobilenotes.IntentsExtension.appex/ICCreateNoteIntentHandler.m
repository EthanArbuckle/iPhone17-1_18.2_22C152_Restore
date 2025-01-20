@interface ICCreateNoteIntentHandler
- (ICCreateNoteIntentHandler)init;
- (ICNAEventReporter)eventReporter;
- (void)dealloc;
- (void)handleCreateNote:(id)a3 completion:(id)a4;
- (void)provideGroupNameOptionsForCreateNote:(id)a3 withCompletion:(id)a4;
- (void)resolveContentForCreateNote:(id)a3 withCompletion:(id)a4;
- (void)resolveGroupNameForCreateNote:(id)a3 withCompletion:(id)a4;
- (void)resolveTitleForCreateNote:(id)a3 withCompletion:(id)a4;
@end

@implementation ICCreateNoteIntentHandler

- (ICCreateNoteIntentHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICCreateNoteIntentHandler;
  v2 = [(ICBaseIntentHandler *)&v6 init];
  v3 = [(ICBaseIntentHandler *)v2 noteContext];
  [v3 enableHTMLContextChangeLogging];

  v4 = +[ICNAController sharedController];
  [v4 startAppSession];

  return v2;
}

- (void)dealloc
{
  v3 = +[ICNAController sharedController];
  [v3 appSessionDidTerminate];

  v4.receiver = self;
  v4.super_class = (Class)ICCreateNoteIntentHandler;
  [(ICCreateNoteIntentHandler *)&v4 dealloc];
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAEventReporter);
    objc_super v4 = (ICNAEventReporter *)[v3 initWithSubTrackerName:kICNASubtrackerNameCreateNoteIntentHandler];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v4;
  }
  objc_super v6 = self->_eventReporter;

  return v6;
}

- (void)provideGroupNameOptionsForCreateNote:(id)a3 withCompletion:(id)a4
{
  v28 = (void (**)(id, void *, void))a4;
  v5 = [(ICBaseIntentHandler *)self noteContext];
  objc_super v6 = [v5 modernManagedObjectContext];
  v7 = [(ICBaseIntentHandler *)self noteContext];
  v8 = [v7 htmlManagedObjectContext];
  v9 = +[NotesAssistantUtilities folderOptionsForModernContext:v6 htmlContext:v8];

  v10 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v16 = [v15 managedObjectID];
        v17 = [v16 URIRepresentation];

        v18 = [v15 accountIdentifier];

        if (v18)
        {
          id v19 = [objc_alloc((Class)NSURLComponents) initWithURL:v17 resolvingAgainstBaseURL:0];
          v20 = [v15 accountIdentifier];
          v21 = +[NSURLQueryItem queryItemWithName:@"accountIdentifier" value:v20];
          v34 = v21;
          v22 = +[NSArray arrayWithObjects:&v34 count:1];
          [v19 setQueryItems:v22];

          uint64_t v23 = [v19 URL];

          v17 = (void *)v23;
        }
        id v24 = objc_alloc((Class)INSpeakableString);
        v25 = [v17 absoluteString];
        v26 = [v15 fullTitle];
        id v27 = [v24 initWithVocabularyIdentifier:v25 spokenPhrase:v26 pronunciationHint:0];

        [v10 addObject:v27];
      }
      id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  v28[2](v28, v10, 0);
}

- (void)resolveTitleForCreateNote:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v9 = [a3 title];
  objc_super v6 = [v9 spokenPhrase];
  id v7 = [v6 length];

  if (v7) {
    +[INSpeakableStringResolutionResult successWithResolvedString:v9];
  }
  else {
  v8 = +[INSpeakableStringResolutionResult notRequired];
  }
  v5[2](v5, v8);
}

- (void)resolveContentForCreateNote:(id)a3 withCompletion:(id)a4
{
  v14 = (void (**)(id, void *))a4;
  id v5 = a3;
  objc_super v6 = [v5 title];
  id v7 = [v5 content];

  objc_opt_class();
  v8 = ICDynamicCast();
  id v9 = [v6 spokenPhrase];
  id v10 = [v9 length];

  id v11 = [v8 text];
  id v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = +[INNoteContentResolutionResult successWithResolvedNoteContent:v8];
    v14[2](v14, v13);
  }
  else
  {
    if (v10) {
      +[INNoteContentResolutionResult notRequired];
    }
    else {
    uint64_t v13 = +[INNoteContentResolutionResult needsValue];
    }
    v14[2](v14, v13);
  }
}

- (void)resolveGroupNameForCreateNote:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  objc_super v6 = [v9 groupName];

  if (v6)
  {
    id v7 = [v9 groupName];
    uint64_t v8 = +[INSpeakableStringResolutionResult successWithResolvedString:v7];
    v5[2](v5, v8);

    id v5 = (void (**)(id, uint64_t))v8;
  }
  else
  {
    id v7 = +[INSpeakableStringResolutionResult notRequired];
    v5[2](v5, (uint64_t)v7);
  }
}

- (void)handleCreateNote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = +[ICNAController sharedController];
  id v9 = +[NSURL URLWithString:kICNAIntentsExtensionReferralURL];
  [v8 startSessionWithReferralURL:v9 referralApplication:0];

  objc_opt_class();
  id v10 = [v6 content];
  id v11 = ICDynamicCast();
  id v12 = [v11 text];

  uint64_t v13 = [v6 groupName];

  if (v13)
  {
    v14 = [v6 groupName];
    v15 = [(ICBaseIntentHandler *)self noteContext];
    v16 = [v15 modernManagedObjectContext];
    v17 = [(ICBaseIntentHandler *)self noteContext];
    v18 = [v17 htmlManagedObjectContext];
    v34 = +[NotesAssistantUtilities folderForGroupName:v14 withNoteContext:v16 htmlNoteContext:v18];
  }
  else
  {
    v34 = 0;
  }
  id v19 = objc_alloc((Class)ICCreateNoteAction);
  v20 = [(ICBaseIntentHandler *)self noteContext];
  id v21 = [v19 initWithNoteContext:v20];

  if (v12) {
    id v22 = [objc_alloc((Class)NSAttributedString) initWithString:v12];
  }
  else {
    id v22 = 0;
  }
  uint64_t v23 = [v6 title];
  id v24 = [v23 spokenPhrase];
  id v44 = 0;
  v25 = [v21 performWithTitle:v24 contents:v22 container:v34 error:&v44];
  id v26 = v44;

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100005648;
  v42 = sub_100005658;
  id v43 = 0;
  if (v25)
  {
    id v27 = [v25 managedObjectContext];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100005660;
    v35[3] = &unk_100020788;
    v35[4] = self;
    id v28 = v25;
    id v36 = v28;
    v37 = &v38;
    [v27 performBlockAndWait:v35];

    if ([v28 isModernNote])
    {
      v29 = +[ICSharingExtensionAttachmentsManager sharedManager];
      [v29 completeExtensionRequestInBackground];
    }
  }
  else
  {
    if (v26)
    {
      long long v30 = os_log_create("com.apple.notes", "Intents");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100013DE4((uint64_t)v26, v30);
      }
    }
    id v31 = [objc_alloc((Class)INCreateNoteIntentResponse) initWithCode:4 userActivity:0];
    long long v32 = (void *)v39[5];
    v39[5] = (uint64_t)v31;
  }
  v7[2](v7, v39[5]);
  long long v33 = +[ICNAController sharedController];
  [v33 endSessionSynchronously:0 endReason:7];

  _Block_object_dispose(&v38, 8);
}

- (void).cxx_destruct
{
}

@end
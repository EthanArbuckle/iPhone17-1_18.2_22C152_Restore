@interface ICAppendToNoteIntentHandler
- (ICAppendToNoteIntentHandler)init;
- (id)findNoteForIntent:(id)a3;
- (id)updateHTMLNote:(id)a3 withIntent:(id)a4;
- (id)updateModernNote:(id)a3 withIntent:(id)a4;
- (void)handleAppendToNote:(id)a3 completion:(id)a4;
- (void)resolveContentForAppendToNote:(id)a3 withCompletion:(id)a4;
- (void)resolveTargetNoteForAppendToNote:(id)a3 withCompletion:(id)a4;
@end

@implementation ICAppendToNoteIntentHandler

- (ICAppendToNoteIntentHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICAppendToNoteIntentHandler;
  v2 = [(ICBaseIntentHandler *)&v5 init];
  v3 = [(ICBaseIntentHandler *)v2 noteContext];
  [v3 enableHTMLContextChangeLogging];

  return v2;
}

- (void)resolveTargetNoteForAppendToNote:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  v30 = (void (**)(id, void *))a4;
  v31 = v5;
  v6 = [v5 targetNote];
  v7 = [v6 title];
  v8 = [v7 spokenPhrase];

  v9 = [v5 targetNote];
  v29 = [v9 identifier];

  if ([v8 length] || objc_msgSend(v29, "length"))
  {
    v10 = [v5 targetNote];
    v11 = [(ICBaseIntentHandler *)self searchIndexableNoteForIntentNote:v10];

    v12 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v11];
    if (v12)
    {
      v13 = +[INNoteResolutionResult successWithResolvedNote:v12];
      v30[2](v30, v13);

      goto LABEL_31;
    }
  }
  v14 = [(ICBaseIntentHandler *)self notesWithTitle:v8];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10000CF24;
  v49 = sub_10000CF34;
  id v50 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v19 = [v18 managedObjectContext];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000CF3C;
        v38[3] = &unk_100020788;
        v38[4] = v18;
        id v39 = v8;
        v40 = &v45;
        [v19 performBlockAndWait:v38];
      }
      id v15 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v15);
  }

  if ([(id)v46[5] count] == (id)1)
  {
    v20 = [(id)v46[5] firstObject];
    id v21 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v20];

    v22 = +[INNoteResolutionResult successWithResolvedNote:v21];
    v30[2](v30, v22);
  }
  else if ([obj count] == (id)1)
  {
    v23 = [obj firstObject];
    id v21 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v23];

    v22 = +[INNoteResolutionResult confirmationRequiredWithNoteToConfirm:v21];
    v30[2](v30, v22);
  }
  else
  {
    id v21 = objc_alloc_init((Class)NSMutableArray);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = obj;
    id v25 = [v24 countByEnumeratingWithState:&v34 objects:v51 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v35;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:*(void *)(*((void *)&v34 + 1) + 8 * (void)j)];
          if (v28) {
            [v21 addObject:v28];
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v34 objects:v51 count:16];
      }
      while (v25);
    }

    if ([v21 count]) {
      +[INNoteResolutionResult disambiguationWithNotesToDisambiguate:v21];
    }
    else {
    v22 = +[INNoteResolutionResult unsupported];
    }
    v30[2](v30, v22);
  }

  _Block_object_dispose(&v45, 8);
LABEL_31:
}

- (void)resolveContentForAppendToNote:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  objc_opt_class();
  v7 = [v6 content];

  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [v10 text];
  if ([v8 length]) {
    +[INNoteContentResolutionResult successWithResolvedNoteContent:v10];
  }
  else {
  v9 = +[INNoteContentResolutionResult needsValue];
  }
  v5[2](v5, v9);
}

- (void)handleAppendToNote:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = [(ICAppendToNoteIntentHandler *)self findNoteForIntent:v14];
  objc_opt_class();
  v8 = ICDynamicCast();
  objc_opt_class();
  uint64_t v9 = ICDynamicCast();
  id v10 = (void *)v9;
  if (v8)
  {
    id v11 = [(ICAppendToNoteIntentHandler *)self updateModernNote:v8 withIntent:v14];
  }
  else if (v9)
  {
    id v11 = [(ICAppendToNoteIntentHandler *)self updateHTMLNote:v9 withIntent:v14];
  }
  else
  {
    id v11 = [objc_alloc((Class)INAppendToNoteIntentResponse) initWithCode:4 userActivity:0];
  }
  v12 = v11;
  if ([v11 code] == (id)3)
  {
    v13 = +[ICWidget sharedWidget];
    [v13 reloadTimelinesWithReason:@"Note was updated via Siri"];
  }
  v6[2](v6, v12);
}

- (id)findNoteForIntent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 targetNote];
  id v6 = [(ICBaseIntentHandler *)self searchIndexableNoteForIntentNote:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [v4 targetNote];
    uint64_t v9 = [v8 title];
    id v10 = [v9 spokenPhrase];
    id v11 = [(ICBaseIntentHandler *)self notesWithTitle:v10];

    if ([v11 count] == (id)1)
    {
      id v7 = [v11 firstObject];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)updateModernNote:(id)a3 withIntent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10000CF24;
  long long v34 = sub_10000CF34;
  id v35 = 0;
  objc_opt_class();
  v8 = [v7 content];
  uint64_t v9 = ICDynamicCast();

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_10000CF24;
  v28[4] = sub_10000CF34;
  id v29 = [v9 text];
  id v10 = [v6 managedObjectContext];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000D620;
  v24[3] = &unk_100020C20;
  uint64_t v26 = v28;
  id v11 = v6;
  id v25 = v11;
  v27 = &v30;
  [v10 performBlockAndWait:v24];

  v12 = (void *)v31[5];
  if (v12)
  {
    id v13 = [v12 code];
    id v14 = objc_alloc((Class)INAppendToNoteIntentResponse);
    if (v13 == (id)206) {
      uint64_t v15 = 6;
    }
    else {
      uint64_t v15 = 4;
    }
    id v16 = [v14 initWithCode:v15 userActivity:0];
    id v17 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v11 includeContent:0];
    [v16 setNote:v17];
  }
  else
  {
    id v18 = objc_alloc((Class)NSUserActivity);
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    id v17 = [v18 initWithActivityType:v20];

    id v16 = [objc_alloc((Class)INAppendToNoteIntentResponse) initWithCode:3 userActivity:v17];
    id v21 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v11 includeContent:1];
    [v16 setNote:v21];

    v22 = +[ICSharingExtensionAttachmentsManager sharedManager];
    [v22 completeExtensionRequestInBackground];
  }
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(&v30, 8);

  return v16;
}

- (id)updateHTMLNote:(id)a3 withIntent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10000CF24;
  uint64_t v32 = sub_10000CF34;
  id v33 = 0;
  objc_opt_class();
  v8 = [v7 content];
  uint64_t v9 = ICDynamicCast();

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10000CF24;
  v26[4] = sub_10000CF34;
  id v27 = [v9 text];
  id v10 = [v6 managedObjectContext];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000DA4C;
  v20[3] = &unk_100020C48;
  id v11 = v6;
  id v21 = v11;
  id v24 = v26;
  id v12 = v9;
  id v22 = v12;
  v23 = self;
  id v25 = &v28;
  [v10 performBlockAndWait:v20];

  if (v29[5])
  {
    id v13 = [objc_alloc((Class)INAppendToNoteIntentResponse) initWithCode:4 userActivity:0];
  }
  else
  {
    id v14 = objc_alloc((Class)NSUserActivity);
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = [v14 initWithActivityType:v16];

    id v13 = [objc_alloc((Class)INAppendToNoteIntentResponse) initWithCode:3 userActivity:v17];
    id v18 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v11 includeContent:1];
    [v13 setNote:v18];
  }
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);

  return v13;
}

@end
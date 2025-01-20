@interface GetMailIntentHandler
+ (id)log;
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (MSSearch)currentSearch;
- (NSMutableArray)results;
- (id)completionHandler;
- (void)confirmGetMail:(id)a3 completion:(id)a4;
- (void)handleGetMail:(id)a3 completion:(id)a4;
- (void)search:(id)a3 didFinishWithError:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentSearch:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation GetMailIntentHandler

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004410;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012348 != -1) {
    dispatch_once(&qword_100012348, block);
  }
  v2 = (void *)qword_100012340;

  return v2;
}

- (void)confirmGetMail:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, id))a4;
  id v4 = [objc_alloc((Class)MSGetMailIntentResponse) initWithCode:1 userActivity:0];
  v5[2](v5, v4);
}

- (void)handleGetMail:(id)a3 completion:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  if ([v41 readStatus])
  {
    id v8 = objc_alloc((Class)MSCriterion);
    id v9 = [v41 readStatus];
    v10 = &MSCriterionExpressionRead;
    if (v9 != (id)2) {
      v10 = &MSCriterionExpressionUnread;
    }
    id v11 = [v8 initWithType:MSCriterionTypeReadStatus qualifier:MSCriterionQualifierContains expression:*v10];
    [v7 addObject:v11];
  }
  v12 = [v41 sender];
  v13 = [v12 personHandle];
  v14 = [v13 value];
  if (v14)
  {
    v15 = [v41 sender];
    v16 = [v15 personHandle];
    id v17 = [v16 type];

    if (v17 != (id)1) {
      goto LABEL_9;
    }
    id v18 = objc_alloc((Class)MSCriterion);
    v12 = [v41 sender];
    v13 = [v12 personHandle];
    v19 = [v13 value];
    id v20 = [v18 initWithType:MSCriterionTypeSender qualifier:MSCriterionQualifierContains expression:v19];
    [v7 addObject:v20];
  }
LABEL_9:
  v21 = [v41 recipient];
  v22 = [v21 personHandle];
  v23 = [v22 value];
  if (v23)
  {
    v24 = [v41 recipient];
    v25 = [v24 personHandle];
    id v26 = [v25 type];

    if (v26 != (id)1) {
      goto LABEL_13;
    }
    id v27 = objc_alloc((Class)MSCriterion);
    v21 = [v41 recipient];
    v22 = [v21 personHandle];
    v28 = [v22 value];
    id v29 = [v27 initWithType:MSCriterionTypeAnyRecipient qualifier:MSCriterionQualifierContains expression:v28];
    [v7 addObject:v29];
  }
LABEL_13:
  v30 = [v41 subject];
  id v31 = [v30 length];

  if (v31)
  {
    id v32 = objc_alloc((Class)MSCriterion);
    v33 = [v41 subject];
    id v34 = [v32 initWithType:MSCriterionTypeSubject qualifier:MSCriterionQualifierContains expression:v33];
    [v7 addObject:v34];
  }
  if ([v7 count] == (id)1)
  {
    id v35 = [v7 firstObject];
  }
  else
  {
    id v35 = [objc_alloc((Class)MSCriterion) initWithCriteria:v7 allRequired:1];
  }
  v36 = v35;
  v37 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", MSResultsKeyMessageReference, MSResultsKeyDateSent, MSResultsKeySender, MSResultsKeyRecipientTo, MSResultsKeyRecipientCc, MSResultsKeyRecipientBcc, MSResultsKeySubject, MSResultsKeyBodySummary, 0);
  v38 = +[MSSearch findMessageData:v37 matchingCriterion:v36 options:4 delegate:self];

  if (v38)
  {
    objc_storeStrong((id *)&self->_currentSearch, v38);
    id v39 = objc_retainBlock(v6);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v39;
  }
  else
  {
    id completionHandler = [objc_alloc((Class)MSGetMailIntentResponse) initWithCode:5 userActivity:0];
    (*((void (**)(id, id))v6 + 2))(v6, completionHandler);
  }
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_results)
  {
    id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    results = self->_results;
    self->_results = v8;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        -[NSMutableArray ef_insertObject:usingComparator:allowDuplicates:](self->_results, "ef_insertObject:usingComparator:allowDuplicates:", *(void *)(*((void *)&v17 + 1) + 8 * i), &stru_10000C678, 1, (void)v17);
      }
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v14 = [(GetMailIntentHandler *)self results];
  BOOL v15 = (unint64_t)[v14 count] < 0x1A;

  return v15;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (v6)
  {
    id completionHandler = (void (**)(id, id))self->_completionHandler;
    id v8 = [objc_alloc((Class)MSGetMailIntentResponse) initWithCode:5 userActivity:0];
    completionHandler[2](completionHandler, v8);
  }
  else
  {
    id v8 = [objc_alloc((Class)MSGetMailIntentResponse) initWithCode:4 userActivity:0];
    id v9 = [(GetMailIntentHandler *)self results];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 ef_map:&stru_10000C6B8];
      [v8 setMails:v11];
    }
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  currentSearch = self->_currentSearch;
  self->_currentSearch = 0;

  id v13 = self->_completionHandler;
  self->_id completionHandler = 0;

  results = self->_results;
  self->_results = 0;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (MSSearch)currentSearch
{
  return self->_currentSearch;
}

- (void)setCurrentSearch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end
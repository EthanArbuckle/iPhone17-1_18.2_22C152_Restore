@interface NEKSourceChangeAggregator
- (EKEventStore)ekEventStore;
- (NEKSourceChangeAggregator)initWithNEKEventStore:(id)a3 eventChanges:(id)a4 reminderChanges:(id)a5;
- (NSSet)deletedSourcesIDs;
- (NSSet)insertedOrUpdatedSources;
@end

@implementation NEKSourceChangeAggregator

- (NEKSourceChangeAggregator)initWithNEKEventStore:(id)a3 eventChanges:(id)a4 reminderChanges:(id)a5
{
  id v8 = a3;
  id v42 = a4;
  id v9 = a5;
  v53.receiver = self;
  v53.super_class = (Class)NEKSourceChangeAggregator;
  v10 = [(NEKSourceChangeAggregator *)&v53 init];
  if (v10)
  {
    v11 = (EKEventStore *)objc_alloc_init((Class)EKEventStore);
    ekEventStore = v10->_ekEventStore;
    v10->_ekEventStore = v11;

    v13 = +[NSMutableSet set];
    v14 = +[NSMutableSet set];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10002F820;
    v50[3] = &unk_1000A94D8;
    id v51 = v8;
    v15 = v10;
    v52 = v15;
    v41 = v10;
    v16 = objc_retainBlock(v50);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10002FA14;
    v48[3] = &unk_1000A9528;
    v17 = v15;
    v49 = v17;
    v18 = objc_retainBlock(v48);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10002FC10;
    v46[3] = &unk_1000A9550;
    id v19 = v13;
    id v47 = v19;
    v20 = objc_retainBlock(v46);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10002FD28;
    v43[3] = &unk_1000A9578;
    id v44 = v19;
    id v45 = v14;
    id v40 = v14;
    id v39 = v19;
    v21 = objc_retainBlock(v43);
    v22 = [v42 inserts];
    v23 = ((void (*)(void *, void *))v16[2])(v16, v20);
    [v22 enumerateObjectsUsingBlock:v23];

    v24 = [v42 updates];
    v25 = ((void (*)(void *, void *))v16[2])(v16, v20);
    [v24 enumerateObjectsUsingBlock:v25];

    v26 = [v42 deletes];
    v27 = ((void (*)(void *, void *))v16[2])(v16, v21);
    [v26 enumerateObjectsUsingBlock:v27];

    v28 = [v9 inserts];
    v29 = ((void (*)(void *, void *))v18[2])(v18, v20);
    [v28 enumerateObjectsUsingBlock:v29];

    v30 = [v9 updates];
    v31 = ((void (*)(void *, void *))v18[2])(v18, v20);
    [v30 enumerateObjectsUsingBlock:v31];

    v32 = [v9 deletes];
    v33 = ((void (*)(void *, void *))v18[2])(v18, v21);
    [v32 enumerateObjectsUsingBlock:v33];

    v34 = (NSSet *)[v39 copy];
    insertedOrUpdatedSources = v17->_insertedOrUpdatedSources;
    v17->_insertedOrUpdatedSources = v34;

    v36 = (NSSet *)[v40 copy];
    deletedSourcesIDs = v17->_deletedSourcesIDs;
    v17->_deletedSourcesIDs = v36;

    v10 = v41;
  }

  return v10;
}

- (NSSet)insertedOrUpdatedSources
{
  return self->_insertedOrUpdatedSources;
}

- (NSSet)deletedSourcesIDs
{
  return self->_deletedSourcesIDs;
}

- (EKEventStore)ekEventStore
{
  return self->_ekEventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ekEventStore, 0);
  objc_storeStrong((id *)&self->_deletedSourcesIDs, 0);

  objc_storeStrong((id *)&self->_insertedOrUpdatedSources, 0);
}

@end
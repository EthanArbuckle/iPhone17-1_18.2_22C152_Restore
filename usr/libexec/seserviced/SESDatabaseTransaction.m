@interface SESDatabaseTransaction
- (id)stageEndPointEntityUpdates:(id)a3 fromEndPoint:(id)a4;
- (id)stageEndPointEntityWithIdentifier:(id)a3 endPointCAEntity:(id)a4 airInstanceEntity:(id)a5 clientName:(id)a6 error:(id *)a7;
- (void)dealloc;
@end

@implementation SESDatabaseTransaction

- (void)dealloc
{
  if (self->_state == 1)
  {
    v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unsigned int state = self->_state;
      *(_DWORD *)buf = 67109120;
      unsigned int v7 = state;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Transaction object deallocated in unexpected state %u", buf, 8u);
    }

    [(NSManagedObjectContext *)self->_managedObjectContext rollback];
  }
  v5.receiver = self;
  v5.super_class = (Class)SESDatabaseTransaction;
  [(SESDatabaseTransaction *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (id)stageEndPointEntityWithIdentifier:(id)a3 endPointCAEntity:(id)a4 airInstanceEntity:(id)a5 clientName:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v14 && v13 && v12 && v15)
  {
    v17 = sub_100014F20((uint64_t)self);
    id v26 = 0;
    v18 = sub_100040778((uint64_t)v17, v12, v16, &v26);
    id v19 = v26;

    if (v18)
    {
      if (a7)
      {
        v20 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!v19)
      {
        v24 = sub_100030AD8((uint64_t)self);
        v25 = +[NSEntityDescription insertNewObjectForEntityForName:@"SEEndPointEntity" inManagedObjectContext:v24];

        [v25 setIdentifier:v12];
        [v25 setClientName:v16];
        [v25 setAuthority:v13];
        [v25 setInstance:v14];
        if ([v25 validateForInsert:a7]) {
          id v21 = v25;
        }
        else {
          id v21 = 0;
        }

        goto LABEL_9;
      }
      if (a7)
      {
        id v21 = 0;
        *a7 = v19;
        goto LABEL_9;
      }
    }
    id v21 = 0;
LABEL_9:

    goto LABEL_13;
  }
  if (a7)
  {
    v22 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v21 = 0;
LABEL_13:

  return v21;
}

- (id)stageEndPointEntityUpdates:(id)a3 fromEndPoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v13 = 0;
  unsigned int v7 = [v6 encodeWithError:&v13];
  id v8 = v13;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    v10 = SESDefaultLogObject();
    v11 = SESCreateAndLogError();
  }
  else
  {
    [v5 setEndPointData:v7];
    v11 = 0;
  }

  return v11;
}

@end
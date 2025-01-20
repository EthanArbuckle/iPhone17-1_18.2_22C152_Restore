@interface CNContactStore
- (BOOL)ABSexecuteSaveRequest:(id)a3 error:(id *)a4;
- (void)ABSsetMeCardConditionally:(id)a3;
@end

@implementation CNContactStore

- (BOOL)ABSexecuteSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(NDTPerf);
  kdebug_trace();
  BOOL v8 = [(CNContactStore *)self executeSaveRequest:v6 error:a4];

  kdebug_trace();
  v9 = +[NDTPerf nowMinusPrevious:v7];
  v10 = *(NSObject **)(qword_100069D80 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Save #perf metrics: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  return v8;
}

- (void)ABSsetMeCardConditionally:(id)a3
{
  id v4 = a3;
  v22 = CNContactIdentifierKey;
  v5 = +[NSArray arrayWithObjects:&v22 count:1];
  id v19 = 0;
  id v6 = [(CNContactStore *)self _ios_meContactWithKeysToFetch:v5 error:&v19];
  v7 = v19;
  BOOL v8 = [v6 identifier];
  v9 = [v4 identifier];
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "Not setting me card, flat contact result matches.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = [v4 identifier];
  unsigned int v14 = [v6 isUnifiedWithContactWithIdentifier:v13];

  if (v14)
  {
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "Not setting me card, unified contact matches.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v18 = v7;
  [(CNContactStore *)self setMeContact:v4 error:&v18];
  v15 = v18;

  v16 = *(NSObject **)(qword_100069D78 + 8);
  if (!v15)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v7 = v16;
    v17 = [v4 identifier];
    *(_DWORD *)buf = 138543362;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Me card set to contact %{public}@", buf, 0xCu);

    goto LABEL_8;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000372F8((uint64_t)v15, v16);
  }

LABEL_9:
}

@end
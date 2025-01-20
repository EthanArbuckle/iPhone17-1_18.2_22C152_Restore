@interface ABSContactsResetSource
- (ABSContactsResetSource)initWithKeys:(id)a3 store:(id)a4;
- (BOOL)isReset;
- (BOOL)shouldRunPartialResetSync;
- (double)countRecip;
- (double)countSoFar;
- (double)progress;
- (void)enumerateContactsAdd:(id)a3 remove:(id)a4;
- (void)setCountRecip:(double)a3;
- (void)setCountSoFar:(double)a3;
- (void)setShouldRunPartialResetSync:(BOOL)a3;
@end

@implementation ABSContactsResetSource

- (ABSContactsResetSource)initWithKeys:(id)a3 store:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ABSContactsResetSource;
  v7 = [(ABSContactsSource *)&v10 initWithKeys:a3 store:v6];
  if (v7)
  {
    v8 = [v6 currentHistoryToken];
    [(ABSContactsSource *)v7 setHistoryAnchor:v8];
  }
  return v7;
}

- (void)enumerateContactsAdd:(id)a3 remove:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  v7 = [(ABSContactsSource *)self store];
  id v44 = 0;
  v8 = [v7 unifiedContactCountWithError:&v44];
  id v9 = v44;
  id v10 = [v8 integerValue];

  if ([(ABSContactsResetSource *)self shouldRunPartialResetSync]) {
    uint64_t v11 = 1000;
  }
  else {
    uint64_t v11 = (uint64_t)v10;
  }
  v12 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    unsigned int v14 = [(ABSContactsResetSource *)self shouldRunPartialResetSync];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Running partial reset sync = %d", buf, 8u);
  }
  if (v9)
  {
    v15 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000371C4((uint64_t)v9, v15);
    }
  }
  else
  {
    [(ABSContactsResetSource *)self setCountSoFar:0.0];
    if (v11)
    {
      [(ABSContactsResetSource *)self setCountRecip:1.0 / (double)v11];
      if (v11 >= 1)
      {
        *(void *)buf = 0;
        v51 = buf;
        uint64_t v52 = 0x2020000000;
        uint64_t v53 = 0;
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2020000000;
        char v43 = 0;
        do
        {
          if (*((unsigned char *)v41 + 24)) {
            break;
          }
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100009398;
          v37[3] = &unk_100054E48;
          id v38 = v6;
          v39 = &v40;
          v37[4] = self;
          v16 = objc_retainBlock(v37);
          [(ABSContactsSource *)self gtLogger];
          v17 = getCTGreenTeaOsLogHandle();
          v18 = v17;
          if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v47) = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Reading contacts", (uint8_t *)&v47, 2u);
          }

          if ([(ABSContactsResetSource *)self shouldRunPartialResetSync])
          {
            id v19 = objc_alloc_init((Class)_PSPredictionContext);
            id v20 = objc_alloc_init((Class)_PSSuggester);
            id v21 = [v20 suggestInteractionsFromContext:v19];
            *(void *)&long long v47 = 0;
            *((void *)&v47 + 1) = &v47;
            uint64_t v48 = 0x2020000000;
            uint64_t v49 = 0;
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100009590;
            v32[3] = &unk_100054E70;
            v33 = v16;
            v34 = &v47;
            v35 = buf;
            uint64_t v36 = v11;
            [v21 enumerateObjectsUsingBlock:v32];
            v22 = *(NSObject **)(qword_100069D78 + 8);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(void *)(*((void *)&v47 + 1) + 24);
              *(_DWORD *)v45 = 67109120;
              int v46 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ResetSource enqueued %d contacts for partial sync", v45, 8u);
            }
            *((void *)v51 + 3) = v11;

            _Block_object_dispose(&v47, 8);
          }
          else
          {
            +[CNContact predicateForPreferredNameInRange:](CNContact, "predicateForPreferredNameInRange:", *((void *)v51 + 3), 50);
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            id v24 = objc_alloc((Class)CNContactFetchRequest);
            v25 = [(ABSContactsSource *)self keysToFetch];
            id v21 = [v24 initWithKeysToFetch:v25];

            [v21 setSortOrder:3];
            [v21 setPredicate:v20];
            [v21 setUnifyResults:1];
            v26 = [(ABSContactsSource *)self store];
            id v31 = 0;
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_1000096FC;
            v29[3] = &unk_100054E98;
            v30 = v16;
            [v26 enumerateContactsAndMatchInfoWithFetchRequest:v21 error:&v31 usingBlock:v29];
            id v19 = v31;

            if (v19)
            {
              v27 = *(NSObject **)(qword_100069D78 + 8);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v47) = 138543362;
                *(void *)((char *)&v47 + 4) = v19;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "enumerateContactsAndMatchInfoWithFetchRequest call failed: %{public}@", (uint8_t *)&v47, 0xCu);
              }
            }
            *((void *)v51 + 3) += 50;
          }
        }
        while (*((void *)v51 + 3) < (unint64_t)v11);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      [(ABSContactsResetSource *)self setCountRecip:0.0];
    }
  }
}

- (double)progress
{
  [(ABSContactsResetSource *)self countSoFar];
  double v4 = v3;
  [(ABSContactsResetSource *)self countRecip];
  return v4 * v5;
}

- (BOOL)isReset
{
  return 1;
}

- (BOOL)shouldRunPartialResetSync
{
  return self->_shouldRunPartialResetSync;
}

- (void)setShouldRunPartialResetSync:(BOOL)a3
{
  self->_shouldRunPartialResetSync = a3;
}

- (double)countSoFar
{
  return self->_countSoFar;
}

- (void)setCountSoFar:(double)a3
{
  self->_countSoFar = a3;
}

- (double)countRecip
{
  return self->_countRecip;
}

- (void)setCountRecip:(double)a3
{
  self->_countRecip = a3;
}

@end
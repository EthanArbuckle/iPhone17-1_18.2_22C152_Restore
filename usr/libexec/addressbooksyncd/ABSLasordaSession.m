@interface ABSLasordaSession
- (ABSContactsSource)contactsSource;
- (unint64_t)delayUs;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)_batchSupplier;
- (void)dealloc;
- (void)lateSetupForSession:(id)a3;
- (void)setContactsSource:(id)a3;
- (void)setDelayUs:(unint64_t)a3;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
- (void)terminate;
@end

@implementation ABSLasordaSession

- (void)lateSetupForSession:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ABSLasordaSession;
  id v4 = a3;
  [(ABSSyncSession *)&v14 lateSetupForSession:v4];
  v5 = [(ABSSyncSession *)self options];
  v6 = [v5 objectForKeyedSubscript:off_100069A30];
  self->_sessionSupportsContactAccountIDs = [v6 BOOLValue];

  int64_t v7 = 3;
  if (self->_sessionSupportsContactAccountIDs) {
    int64_t v7 = 1;
  }
  self->_state = v7;
  v8 = [[NDTResultsFIFO alloc] initWithFIFOLength:50 name:@"com.apple.contactsPipe"];
  fifo = self->_fifo;
  self->_fifo = v8;

  +[ABSContactsSyncObject clearMeCardSet];
  self->_gtLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  unsigned __int8 v10 = [v4 isResetSync];

  self->_isReset = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002780C;
  v13[3] = &unk_100054DD0;
  v13[4] = self;
  v11 = (NSThread *)[objc_alloc((Class)NSThread) initWithBlock:v13];
  producerThread = self->_producerThread;
  self->_producerThread = v11;

  [(NSThread *)self->_producerThread start];
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v63.receiver = self;
  v63.super_class = (Class)ABSLasordaSession;
  [(ABSSyncSession *)&v63 syncSession:v8 enqueueChanges:v9 error:a5];
  id v10 = objc_retainBlock(v9);
  if ([(ABSLasordaSession *)self delayUs])
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000281C8;
    v61[3] = &unk_100055690;
    v61[4] = self;
    id v62 = v9;
    v11 = objc_retainBlock(v61);

    id v10 = v11;
  }
  v43 = (uint64_t (**)(void, void))v10;
  v13 = [v8 error];

  if (v13)
  {
    objc_super v14 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003819C(v14, v8);
    }
    [(NDTResultsFIFO *)self->_fifo terminate];
    producerThread = self->_producerThread;
    self->_producerThread = 0;

    fifo = self->_fifo;
    self->_fifo = 0;

    v17 = [v8 error];
    [(ABSSyncSession *)self setCapturedError:v17];
  }
  if (self->_fifo)
  {
    uint64_t v42 = 160;
    int64_t state = self->_state;
    if (state != 3)
    {
      if (state != 2)
      {
        if (state != 1)
        {
LABEL_35:
          if (state != 4) {
            goto LABEL_47;
          }
          v21 = objc_alloc_init(ABSFavoritesSyncObject);
          v26 = objc_alloc_init(ABSFavoritesDiffObject);
          v30 = [(ABSFavoritesSyncObject *)v21 sha];
          favsSha = self->_favsSha;
          self->_favsSha = v30;

          unsigned int v32 = [(ABSFavoritesDiffObject *)v26 matches:v21];
          v33 = *(NSObject **)(qword_100069D78 + 8);
          BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          if (v32)
          {
            if (v34)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Not enqueuing favorites", buf, 2u);
            }
LABEL_46:
            *(Class *)((char *)&self->super.super.isa + v42) = (Class)5;

            int64_t state = *(int64_t *)((char *)&self->super.super.isa + v42);
LABEL_47:
            if (state == 5 && self->_startCensus)
            {
              v35 = objc_alloc_init(ABSValidationSyncObject);
              unsigned int v36 = [(ABSValidationSyncObject *)v35 isEqual:self->_startCensus];
              v37 = *(NSObject **)(qword_100069D78 + 8);
              BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
              if (v36)
              {
                if (v38)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Enqueuing validation", buf, 2u);
                }
                v39 = objc_alloc_init(ABSValidationSyncObject);
                if ((((uint64_t (**)(void, ABSValidationSyncObject *))v43)[2](v43, v39) & 1) == 0
                  && os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
                {
                  sub_100038054();
                }
              }
              else if (v38)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Not enqueuing validation message.", buf, 2u);
              }
            }
            v40 = self->_fifo;
            self->_fifo = 0;

            unsigned int v24 = 2;
            goto LABEL_67;
          }
          if (v34)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Enqueuing favorites", buf, 2u);
          }
          -[ABSFavoritesSyncObject setChangeType:](v21, "setChangeType:", 2, 160);
          if (((uint64_t (**)(void, ABSFavoritesSyncObject *))v43)[2](v43, v21)) {
            goto LABEL_46;
          }
          if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
            sub_100038088();
          }
          goto LABEL_64;
        }
        v19 = +[ABSAccountsSyncObject sha];
        acctsSha = self->_acctsSha;
        self->_acctsSha = v19;

        v21 = objc_alloc_init(ABSAccountsDiffObject);
        if (([v8 isResetSync] & 1) != 0
          || ![(ABSSyncObject *)v21 matches:0])
        {
          v25 = *(NSObject **)(qword_100069D78 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Enqueuing accounts", buf, 2u);
          }
          v26 = objc_alloc_init(ABSAccountsSyncObject);
          [(ABSFavoritesDiffObject *)v26 setChangeType:2];
          if ((((uint64_t (**)(void, ABSFavoritesDiffObject *))v43)[2](v43, v26) & 1) == 0)
          {
            if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
              sub_100038168();
            }
LABEL_64:
            +[ABSSyncObject oops];

LABEL_65:
            goto LABEL_66;
          }
        }
        else
        {
          v22 = *(NSObject **)(qword_100069D78 + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Account data unchanged, skipping", buf, 2u);
          }
        }

        self->_int64_t state = 2;
      }
      v21 = objc_alloc_init(ABSContainerSyncObject);
      if ((((uint64_t (**)(void, ABSFavoritesSyncObject *))v43)[2](v43, v21) & 1) == 0)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
          sub_100038134();
        }
        +[ABSSyncObject oops];
        goto LABEL_65;
      }

      self->_int64_t state = 3;
    }
    v27 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Enqueuing contacts", buf, 2u);
    }
    *(void *)buf = 0;
    v58 = buf;
    uint64_t v59 = 0x2020000000;
    char v60 = 1;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    uint64_t v51 = 0x2020000000;
    int v52 = 50;
    uint64_t v49 = 0;
    v50 = (int *)&v49;
    do
    {
      if (v50[6] < 1) {
        break;
      }
      if ([(ABSSyncSession *)self abortAfter] >= 1)
      {
        if (+[NDTLog isInternalDevice])
        {
          [(ABSSyncSession *)self setAbortAfter:(char *)[(ABSSyncSession *)self abortAfter] - 1];
          if (![(ABSSyncSession *)self abortAfter])
          {
            sub_1000380BC();
            abort();
          }
        }
      }
      v28 = self->_fifo;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100028228;
      v44[3] = &unk_1000556B8;
      v46 = buf;
      v47 = &v53;
      v29 = v43;
      v48 = &v49;
      v44[4] = self;
      id v45 = v29;
      [(NDTResultsFIFO *)v28 conditionalPop:v44];
    }
    while (v58[24]);
    if (!*((unsigned char *)v54 + 24))
    {
      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(buf, 8);
LABEL_66:
      unsigned int v24 = 1;
      goto LABEL_67;
    }
    self->_int64_t state = 4;
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);
    int64_t state = self->_state;
    goto LABEL_35;
  }
  v23 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FIFO reference is nil. Canceling session.", buf, 2u);
  }
  unsigned int v24 = 3;
LABEL_67:

  return v24;
}

- (void)_batchSupplier
{
  v3 = objc_alloc_init(ABSContactsReality);
  [(ABSContactsReality *)v3 setIgnoreContactAccountIDs:!self->_sessionSupportsContactAccountIDs];
  id v4 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL sessionSupportsContactAccountIDs = self->_sessionSupportsContactAccountIDs;
    *(_DWORD *)buf = 67109120;
    BOOL v24 = sessionSupportsContactAccountIDs;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_batchSupplier:sessionSupportsContactAccountIds:%d", buf, 8u);
  }
  v6 = +[ABSContactsInterface sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100028578;
  v21[3] = &unk_100055170;
  int64_t v7 = v3;
  v22 = v7;
  [v6 accessSync:v21];

  id v8 = [(ABSLasordaSession *)self contactsSource];
  objc_super v14 = self;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100028584;
  v18 = &unk_1000556E0;
  v19 = self;
  v20 = v7;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_1000286A4;
  v13 = &unk_100055708;
  id v9 = v7;
  [v8 enumerateContactsAdd:&v15 remove:&v10];

  [(NDTResultsFIFO *)self->_fifo finish];
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "There was a session ending error (%{public}@). Setting exitNow flag on session", buf, 0xCu);
    }
    [(NDTResultsFIFO *)self->_fifo terminate];
  }
  else if ([v6 isSending])
  {
    id v9 = +[ABSyncInterface sharedInstance];
    id v10 = [v9 serverState];
    [v10 setStringValue:self->_favsSha forKey:@"com.apple.absd.favorites.sha"];

    uint64_t v11 = +[ABSyncInterface sharedInstance];
    v12 = [v11 serverState];
    [v12 setStringValue:self->_acctsSha forKey:@"com.apple.absd.accounts.sha"];
  }
  v13.receiver = self;
  v13.super_class = (Class)ABSLasordaSession;
  [(ABSSyncSession *)&v13 syncSession:v6 didEndWithError:v7];
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ABSLasordaSession;
  [(ABSLasordaSession *)&v3 dealloc];
}

- (void)terminate
{
  [(NDTResultsFIFO *)self->_fifo terminate];
  producerThread = self->_producerThread;
  self->_producerThread = 0;

  fifo = self->_fifo;
  self->_fifo = 0;
}

- (ABSContactsSource)contactsSource
{
  return self->_contactsSource;
}

- (void)setContactsSource:(id)a3
{
}

- (unint64_t)delayUs
{
  return self->_delayUs;
}

- (void)setDelayUs:(unint64_t)a3
{
  self->_delayUs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsSource, 0);
  objc_storeStrong((id *)&self->_acctsSha, 0);
  objc_storeStrong((id *)&self->_favsSha, 0);
  objc_storeStrong((id *)&self->_startCensus, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_fifo, 0);

  objc_storeStrong((id *)&self->_producerThread, 0);
}

@end
@interface PDApplicationMessageSink
- (BOOL)hasMessageWithIdentifier:(id)a3;
- (BOOL)registerMessageForIdentifier:(id)a3 withRequest:(id)a4;
- (BOOL)registerOrUpdateMessageForIdentifier:(id)a3 withRequest:(id)a4;
- (BOOL)updateMessageForIdentifier:(id)a3 withRequest:(id)a4;
- (NSArray)registrations;
- (PDApplicationMessageSink)init;
- (int64_t)source;
- (void)didUpdateMessageContentForIdentifier:(id)a3;
- (void)unregisterMessageForIdentifier:(id)a3;
@end

@implementation PDApplicationMessageSink

- (PDApplicationMessageSink)init
{
  return 0;
}

- (BOOL)registerMessageForIdentifier:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    +[NSException raise:NSInternalInconsistencyException, @"PDApplicationMessageSink (%ld): cannot insert a message with a nil identifier.", self->_source format];
  }
  id v8 = +[PKApplicationMessageKey createWithSource:self->_source identifier:v6];
  v9 = +[NSDate date];
  id v10 = +[PKApplicationMessageRegistration createWithKey:createdDate:priority:badge:](PKApplicationMessageRegistration, "createWithKey:createdDate:priority:badge:", v8, v9, [v7 priority], objc_msgSend(v7, "badge"));

  BOOL v11 = sub_10045AEDC((uint64_t)self->_databaseManager, v10);
  v12 = PKLogFacilityTypeGetObject();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int64_t source = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v18 = source;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDApplicationMessageSink (%ld): inserted message %@.", buf, 0x16u);
    }

    sub_10039FE6C((uint64_t)self->_manager);
  }
  else
  {
    if (v13)
    {
      int64_t v15 = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDApplicationMessageSink (%ld): failed to insert message %@ - already exists.", buf, 0x16u);
    }
  }
  return v11;
}

- (BOOL)updateMessageForIdentifier:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    +[NSException raise:NSInternalInconsistencyException, @"PDApplicationMessageSink (%ld): cannot update a message with a nil identifier.", self->_source format];
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  databaseManager = self->_databaseManager;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10039F8D4;
  v18[3] = &unk_100739CF0;
  v18[4] = self;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  v21 = &v22;
  [(PDDatabaseManager *)databaseManager performTransactionWithBlock:v18];
  int v11 = *((unsigned __int8 *)v23 + 24);
  v12 = PKLogFacilityTypeGetObject();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int64_t source = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v27 = source;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDApplicationMessageSink (%ld): updated message %@.", buf, 0x16u);
    }

    sub_10039FE6C((uint64_t)self->_manager);
  }
  else
  {
    if (v13)
    {
      int64_t v15 = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v27 = v15;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDApplicationMessageSink (%ld): failed to update message %@.", buf, 0x16u);
    }
  }
  BOOL v16 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (BOOL)registerOrUpdateMessageForIdentifier:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    +[NSException raise:NSInternalInconsistencyException, @"PDApplicationMessageSink (%ld): cannot update a message with a nil identifier.", self->_source format];
  }
  id v8 = +[PKApplicationMessageKey createWithSource:self->_source identifier:v6];
  id v9 = sub_10045AFBC((void **)&self->_databaseManager->super.isa, v8);
  if (v9) {
    unsigned __int8 v10 = [(PDApplicationMessageSink *)self updateMessageForIdentifier:v6 withRequest:v7];
  }
  else {
    unsigned __int8 v10 = [(PDApplicationMessageSink *)self registerMessageForIdentifier:v6 withRequest:v7];
  }
  BOOL v11 = v10;

  return v11;
}

- (void)unregisterMessageForIdentifier:(id)a3
{
}

- (BOOL)hasMessageWithIdentifier:(id)a3
{
  v3 = self;
  id v4 = +[PKApplicationMessageKey createWithSource:self->_source identifier:a3];
  v5 = sub_10045AFBC((void **)&v3->_databaseManager->super.isa, v4);
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (void)didUpdateMessageContentForIdentifier:(id)a3
{
  if (self) {
    sub_10039FE6C((uint64_t)self->_manager);
  }
}

- (int64_t)source
{
  return self->_source;
}

- (NSArray)registrations
{
  v2 = (void *)sub_10039FE40((uint64_t)self);
  return (NSArray *)v2;
}

@end
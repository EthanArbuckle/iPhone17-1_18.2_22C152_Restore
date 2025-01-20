@interface SPFeedbackProxy
+ (id)sharedProxy;
+ (void)initialize;
- (BOOL)clientID:(id)a3 supportsFeedbackListener:(id)a4;
- (SPFeedbackProxy)init;
- (void)_sendFeedbackType:(int64_t)a3 feedback:(id)a4 feedbackData:(id)a5 queryId:(unint64_t)a6 clientID:(id)a7;
- (void)sendCustomFeedback:(id)a3 clientID:(id)a4;
- (void)sendFeedbackType:(int64_t)a3 feedback:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6;
- (void)sendFeedbackType:(int64_t)a3 feedbackData:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6;
@end

@implementation SPFeedbackProxy

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = objc_alloc_init(SPFeedbackProxy);
    v5 = (void *)qword_1000A93C0;
    qword_1000A93C0 = (uint64_t)v4;

    if (qword_1000A90F8 != -1)
    {
      dispatch_once(&qword_1000A90F8, &stru_100093BA8);
    }
  }
}

- (SPFeedbackProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPFeedbackProxy;
  v2 = [(SPFeedbackProxy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SPFeedbackSender feedbackQueue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedProxy
{
  return (id)qword_1000A93C0;
}

- (void)_sendFeedbackType:(int64_t)a3 feedback:(id)a4 feedbackData:(id)a5 queryId:(unint64_t)a6 clientID:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B184;
  block[3] = &unk_100093C18;
  id v22 = v12;
  id v23 = v13;
  v24 = self;
  id v25 = v14;
  int64_t v27 = a3;
  unint64_t v28 = a6;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, block);
}

- (BOOL)clientID:(id)a3 supportsFeedbackListener:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  LODWORD(v5) = [v6 isEqualToString:@"com.apple.PeopleViewService"];
  return v5 & ~v8 & 1 | (((v5 | isKindOfClass) & 1) == 0);
}

- (void)sendFeedbackType:(int64_t)a3 feedback:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if ((unint64_t)(a3 - 1) > 0x19 || !v10)
  {
    v15 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100065F14();
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100065E70(a3, v10, v15);
    }
LABEL_11:

    goto LABEL_12;
  }
  id v12 = SPLogForSPLogCategoryDefault();
  os_log_type_t v13 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v12, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v14 = qword_1000A92C0[a3];
    int v16 = 136315138;
    uint64_t v17 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "send feedback (%s)", (uint8_t *)&v16, 0xCu);
  }

  [(SPFeedbackProxy *)self _sendFeedbackType:a3 feedback:v10 feedbackData:0 queryId:a5 clientID:v11];
LABEL_12:
}

- (void)sendFeedbackType:(int64_t)a3 feedbackData:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if ((unint64_t)(a3 - 1) <= 0x19 && v10)
  {
    id v12 = SPLogForSPLogCategoryDefault();
    os_log_type_t v13 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v12, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v14 = qword_1000A92C0[a3];
      int v16 = 136315138;
      uint64_t v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "send feedbackData (%s)", (uint8_t *)&v16, 0xCu);
    }

    [(SPFeedbackProxy *)self _sendFeedbackType:a3 feedback:0 feedbackData:v10 queryId:a5 clientID:v11];
  }
  else
  {
    v15 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100065F7C();
    }
  }
}

- (void)sendCustomFeedback:(id)a3 clientID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SPFeedbackProxy sendFeedbackType:feedback:queryId:clientID:](self, "sendFeedbackType:feedback:queryId:clientID:", 11, v7, [v7 queryId], v6);
}

- (void).cxx_destruct
{
}

@end
@interface TUCallHistoryManager
- (TUCallHistoryManager)init;
- (TUCallHistoryManager)initWithDataSource:(id)a3;
- (TUCallHistoryManagerDataSource)dataSource;
- (void)dealloc;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4;
@end

@implementation TUCallHistoryManager

- (TUCallHistoryManager)init
{
  v3 = objc_alloc_init(TUCallHistoryManagerXPCClient);
  v4 = [(TUCallHistoryManager *)self initWithDataSource:v3];

  return v4;
}

- (TUCallHistoryManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUCallHistoryManager;
  v6 = [(TUCallHistoryManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(TUCallHistoryManagerDataSource *)self->_dataSource invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUCallHistoryManager;
  [(TUCallHistoryManager *)&v3 dealloc];
}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUCallHistoryManager *)self dataSource];
  [v8 updateOutgoingLocalParticipantUUID:v7 forCallsWithOutgoingLocalParticipantUUID:v6];
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TUCallHistoryManager *)self dataSource];
  [v10 reportRecentCallForConversation:v9 withStartDate:v8 avMode:a5];
}

- (TUCallHistoryManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end
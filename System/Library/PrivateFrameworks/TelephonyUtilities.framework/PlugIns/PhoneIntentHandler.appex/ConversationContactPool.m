@interface ConversationContactPool
- (BOOL)callerPoolContainsOneOf:(id)a3;
- (BOOL)participantsPoolContainsOneOf:(id)a3;
- (ContactPool)callerPool;
- (ContactPool)participantsPool;
- (void)setCallerPool:(id)a3;
- (void)setParticipantsPool:(id)a3;
@end

@implementation ConversationContactPool

- (BOOL)callerPoolContainsOneOf:(id)a3
{
  id v4 = a3;
  v5 = [(ConversationContactPool *)self callerPool];
  v6 = [v5 allContactIds];

  v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ConversationContactPool: Searching for %@ in caller ContactPool: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = [(ConversationContactPool *)self callerPool];
  if (v8) {
    unsigned __int8 v9 = [v6 intersectsSet:v4];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)participantsPoolContainsOneOf:(id)a3
{
  id v4 = a3;
  v5 = [(ConversationContactPool *)self participantsPool];
  v6 = [v5 allContactIds];

  v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ConversationContactPool: Searching for %@ in participants ContactPool: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = [(ConversationContactPool *)self participantsPool];
  if (v8) {
    unsigned __int8 v9 = [v6 intersectsSet:v4];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (ContactPool)callerPool
{
  return self->_callerPool;
}

- (void)setCallerPool:(id)a3
{
}

- (ContactPool)participantsPool
{
  return self->_participantsPool;
}

- (void)setParticipantsPool:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsPool, 0);

  objc_storeStrong((id *)&self->_callerPool, 0);
}

@end
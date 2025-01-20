@interface TUConversation
- (BOOL)anyActiveParticipantHasAV;
- (BOOL)isEligibleForCall;
- (BOOL)shouldAdvertiseConversationHandoff;
- (CXCallFailureContext)failureContext;
- (NSSet)activeRemoteParticipantCXHandles;
@end

@implementation TUConversation

- (BOOL)isEligibleForCall
{
  id v3 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v3 avLessSharePlayEnabled]) {
    BOOL v4 = [(TUConversation *)self avMode] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)anyActiveParticipantHasAV
{
  id v3 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v3 avLessSharePlayEnabled])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v4 = [(TUConversation *)self activeRemoteParticipants];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * i) audioVideoMode])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

- (NSSet)activeRemoteParticipantCXHandles
{
  id v3 = [(TUConversation *)self activeRemoteParticipants];
  BOOL v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(TUConversation *)self activeRemoteParticipants];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) handle];
        long long v11 = +[CXHandle handleWithTUHandle:v10];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return (NSSet *)v12;
}

- (CXCallFailureContext)failureContext
{
  return (CXCallFailureContext *)[(TUConversation *)self conversationFailureContext];
}

- (BOOL)shouldAdvertiseConversationHandoff
{
  if ([(TUConversation *)self isScreening]) {
    return 0;
  }
  else {
    return [(TUConversation *)self isContinuitySession] ^ 1;
  }
}

@end
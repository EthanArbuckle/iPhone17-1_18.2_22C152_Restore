@interface TUMomentsProvider
- (BOOL)isEqualToProvider:(id)a3;
- (BOOL)isRemoteMomentsAvailable;
- (NSDictionary)remoteIDSDestinations;
- (NSString)requesterID;
- (TUMomentsProvider)initWithCall:(id)a3;
- (TUMomentsProvider)initWithConversation:(id)a3;
- (id)description;
- (int64_t)streamToken;
@end

@implementation TUMomentsProvider

- (TUMomentsProvider)initWithCall:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUMomentsProvider;
  v5 = [(TUMomentsProvider *)&v16 init];
  if (v5)
  {
    v6 = [v4 providerContext];
    v7 = [v6 objectForKeyedSubscript:@"TUCallFaceTimeRemoteIDSDestinationKey"];

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = v8;
    if (v7) {
      [(NSDictionary *)v8 setObject:v7 forKeyedSubscript:v7];
    }
    remoteIDSDestinations = v5->_remoteIDSDestinations;
    v5->_remoteIDSDestinations = v9;
    v11 = v9;

    v5->_streamToken = [v4 videoStreamToken];
    v12 = [v4 providerContext];
    v13 = [v12 objectForKeyedSubscript:@"TUCallFaceTimeRemoteMomentsAvailableKey"];
    v5->_remoteMomentsAvailable = [v13 BOOLValue];

    requesterID = v5->_requesterID;
    v5->_requesterID = 0;
  }
  return v5;
}

- (TUMomentsProvider)initWithConversation:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TUMomentsProvider;
  v5 = [(TUMomentsProvider *)&v32 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v7 = objc_msgSend(v4, "activeRemoteParticipants", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v13 = [v12 avcIdentifier];
          if (v13)
          {
            v14 = (void *)v13;
            v15 = [v12 activeIDSDestination];

            if (v15)
            {
              objc_super v16 = [v12 activeIDSDestination];
              v17 = [v12 avcIdentifier];
              [v6 setObject:v16 forKeyedSubscript:v17];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    if ([v4 isOneToOneModeEnabled]
      && ![v6 count]
      && ([v4 isBackedByGroupSession] & 1) == 0)
    {
      v18 = [v4 activeRemoteParticipants];
      v19 = [v18 allObjects];
      v20 = [v19 firstObject];
      v21 = [v20 activeIDSDestination];

      if (v21) {
        [v6 setObject:v21 forKeyedSubscript:v21];
      }
    }
    uint64_t v22 = [v6 copy];
    remoteIDSDestinations = v5->_remoteIDSDestinations;
    v5->_remoteIDSDestinations = (NSDictionary *)v22;

    v5->_streamToken = [v4 avcSessionToken];
    v5->_remoteMomentsAvailable = 1;
    v24 = [v4 avcSessionIdentifier];
    uint64_t v25 = [v24 copy];
    requesterID = v5->_requesterID;
    v5->_requesterID = (NSString *)v25;
  }
  return v5;
}

- (BOOL)isEqualToProvider:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUMomentsProvider *)self streamToken];
  if (v5 == [v4 streamToken])
  {
    id v6 = [(TUMomentsProvider *)self remoteIDSDestinations];
    v7 = [v4 remoteIDSDestinations];
    if ([v6 isEqualToDictionary:v7])
    {
      uint64_t v8 = [v4 requesterID];
      uint64_t v9 = [(TUMomentsProvider *)self requesterID];
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        uint64_t v10 = [(TUMomentsProvider *)self requesterID];
        v11 = [v4 requesterID];
        char v12 = [v10 isEqualToString:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" streamToken=%ld", -[TUMomentsProvider streamToken](self, "streamToken"));
  id v4 = [(TUMomentsProvider *)self remoteIDSDestinations];
  [v3 appendFormat:@" remoteIDSDestinations=%@", v4];

  int64_t v5 = [(TUMomentsProvider *)self requesterID];
  [v3 appendFormat:@" requesterID=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (NSString)requesterID
{
  return self->_requesterID;
}

- (NSDictionary)remoteIDSDestinations
{
  return self->_remoteIDSDestinations;
}

- (BOOL)isRemoteMomentsAvailable
{
  return self->_remoteMomentsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteIDSDestinations, 0);

  objc_storeStrong((id *)&self->_requesterID, 0);
}

@end
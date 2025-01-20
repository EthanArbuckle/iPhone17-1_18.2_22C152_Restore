@interface TUContinuitySessionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isDedicatedSession;
- (NSArray)activeConversations;
- (NSArray)calls;
- (NSArray)favorites;
- (NSArray)recentCalls;
- (NSDictionary)recentCallsContacts;
- (TUContinuitySessionInfo)initWithCoder:(id)a3;
- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 favorites:(id)a6;
- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 recentCalls:(id)a6 recentCallsContacts:(id)a7;
- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 recentCalls:(id)a6 recentCallsContacts:(id)a7 isDedicatedSession:(BOOL)a8 favorites:(id)a9 recentCallsInfos:(id)a10;
- (TUNearbyDeviceHandle)device;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuitySessionInfo

- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 recentCalls:(id)a6 recentCallsContacts:(id)a7 isDedicatedSession:(BOOL)a8 favorites:(id)a9 recentCallsInfos:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)TUContinuitySessionInfo;
  v22 = [(TUContinuitySessionInfo *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    device = v22->_device;
    v22->_device = (TUNearbyDeviceHandle *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v17];
    calls = v22->_calls;
    v22->_calls = (NSArray *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithArray:v18];
    activeConversations = v22->_activeConversations;
    v22->_activeConversations = (NSArray *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithArray:v19];
    recentCalls = v22->_recentCalls;
    v22->_recentCalls = (NSArray *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v20];
    recentCallsContacts = v22->_recentCallsContacts;
    v22->_recentCallsContacts = (NSDictionary *)v31;

    v22->_isDedicatedSession = a8;
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithArray:v21];
    favorites = v22->_favorites;
    v22->_favorites = (NSArray *)v33;
  }
  return v22;
}

- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 recentCalls:(id)a6 recentCallsContacts:(id)a7
{
  return [(TUContinuitySessionInfo *)self initWithDevice:a3 calls:a4 activeConversations:a5 recentCalls:a6 recentCallsContacts:a7 isDedicatedSession:0 favorites:MEMORY[0x1E4F1CBF0] recentCallsInfos:0];
}

- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 favorites:(id)a6
{
  return [(TUContinuitySessionInfo *)self initWithDevice:a3 calls:a4 activeConversations:a5 recentCalls:MEMORY[0x1E4F1CBF0] recentCallsContacts:MEMORY[0x1E4F1CC08] isDedicatedSession:1 favorites:a6 recentCallsInfos:0];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" device=%@", self->_device];
  objc_msgSend(v6, "appendFormat:", @" callsCount=%zd", -[NSArray count](self->_calls, "count"));
  objc_msgSend(v6, "appendFormat:", @" activeConversationsCount=%zd", -[NSArray count](self->_activeConversations, "count"));
  objc_msgSend(v6, "appendFormat:", @" recentCallsCount=%zd", -[NSArray count](self->_recentCalls, "count"));
  objc_msgSend(v6, "appendFormat:", @" recentCallsContactsCount=%zd", -[NSDictionary count](self->_recentCallsContacts, "count"));
  objc_msgSend(v6, "appendFormat:", @" isDedicatedSession=%d", self->_isDedicatedSession);
  objc_msgSend(v6, "appendFormat:", @" favoritesCount=%zd", -[NSArray count](self->_favorites, "count"));
  [v6 appendFormat:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[TUContinuitySessionInfo allocWithZone:](TUContinuitySessionInfo, "allocWithZone:");
  id v6 = [(TUNearbyDeviceHandle *)self->_device copyWithZone:a3];
  v7 = (void *)[(NSArray *)self->_calls copyWithZone:a3];
  v8 = (void *)[(NSArray *)self->_activeConversations copyWithZone:a3];
  v9 = (void *)[(NSArray *)self->_recentCalls copyWithZone:a3];
  v10 = (void *)[(NSDictionary *)self->_recentCallsContacts copyWithZone:a3];
  BOOL isDedicatedSession = self->_isDedicatedSession;
  v12 = (void *)[(NSArray *)self->_favorites copyWithZone:a3];
  v13 = [(TUContinuitySessionInfo *)v5 initWithDevice:v6 calls:v7 activeConversations:v8 recentCalls:v9 recentCallsContacts:v10 isDedicatedSession:isDedicatedSession favorites:v12 recentCallsInfos:0];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuitySessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_device);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_calls);
  v10 = [v4 decodeArrayOfObjectsOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_activeConversations);
  v13 = [v4 decodeArrayOfObjectsOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_recentCalls);
  id v16 = [v4 decodeArrayOfObjectsOfClass:v14 forKey:v15];

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  id v19 = NSStringFromSelector(sel_recentCallsContacts);
  id v20 = [v4 decodeDictionaryWithKeysOfClass:v17 objectsOfClass:v18 forKey:v19];

  id v21 = NSStringFromSelector(sel_isDedicatedSession);
  uint64_t v22 = [v4 decodeBoolForKey:v21];

  uint64_t v23 = objc_opt_class();
  v24 = NSStringFromSelector(sel_favorites);
  uint64_t v25 = [v4 decodeArrayOfObjectsOfClass:v23 forKey:v24];

  v26 = [(TUContinuitySessionInfo *)self initWithDevice:v7 calls:v10 activeConversations:v13 recentCalls:v16 recentCallsContacts:v20 isDedicatedSession:v22 favorites:v25 recentCallsInfos:0];
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  device = self->_device;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_device);
  [v5 encodeObject:device forKey:v6];

  calls = self->_calls;
  uint64_t v8 = NSStringFromSelector(sel_calls);
  [v5 encodeObject:calls forKey:v8];

  activeConversations = self->_activeConversations;
  v10 = NSStringFromSelector(sel_activeConversations);
  [v5 encodeObject:activeConversations forKey:v10];

  recentCalls = self->_recentCalls;
  v12 = NSStringFromSelector(sel_recentCalls);
  [v5 encodeObject:recentCalls forKey:v12];

  recentCallsContacts = self->_recentCallsContacts;
  uint64_t v14 = NSStringFromSelector(sel_recentCallsContacts);
  [v5 encodeObject:recentCallsContacts forKey:v14];

  BOOL isDedicatedSession = self->_isDedicatedSession;
  id v16 = NSStringFromSelector(sel_isDedicatedSession);
  [v5 encodeBool:isDedicatedSession forKey:v16];

  favorites = self->_favorites;
  NSStringFromSelector(sel_favorites);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:favorites forKey:v18];
}

- (TUNearbyDeviceHandle)device
{
  return self->_device;
}

- (NSArray)calls
{
  return self->_calls;
}

- (NSArray)activeConversations
{
  return self->_activeConversations;
}

- (NSArray)recentCalls
{
  return self->_recentCalls;
}

- (NSDictionary)recentCallsContacts
{
  return self->_recentCallsContacts;
}

- (BOOL)isDedicatedSession
{
  return self->_isDedicatedSession;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_recentCallsContacts, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_activeConversations, 0);
  objc_storeStrong((id *)&self->_calls, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
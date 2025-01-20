@interface TUConversationNotice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationNotice:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)item;
- (NSURL)actionURL;
- (NSUUID)UUID;
- (NSUUID)sessionUUID;
- (TUConversationActivitySession)session;
- (TUConversationNotice)initWithCoder:(id)a3;
- (TUConversationNotice)initWithUUID:(id)a3;
- (int64_t)queueItemType;
- (int64_t)sessionEventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setItem:(id)a3;
- (void)setQueueItemType:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSessionEventType:(int64_t)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation TUConversationNotice

- (TUConversationNotice)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUConversationNotice;
  v6 = [(TUConversationNotice *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v7->_queueItemType = 0;
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUConversationNotice *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  id v5 = [(TUConversationNotice *)self sessionUUID];
  [v3 appendFormat:@" sessionUUID=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" sessionEventType=%ld", -[TUConversationNotice sessionEventType](self, "sessionEventType"));
  v6 = [(TUConversationNotice *)self actionURL];
  [v3 appendFormat:@" actionURL=%@", v6];

  v7 = [(TUConversationNotice *)self bundleIdentifier];
  [v3 appendFormat:@" bundleIdentifier=%@", v7];

  v8 = [(TUConversationNotice *)self item];
  [v3 appendFormat:@" item=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" queueItemType=%ld", -[TUConversationNotice queueItemType](self, "queueItemType"));
  [v3 appendString:@">"];
  objc_super v9 = (void *)[v3 copy];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationNotice *)self isEqualToConversationNotice:v4];

  return v5;
}

- (BOOL)isEqualToConversationNotice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationNotice *)self UUID];
  v6 = [v4 UUID];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUConversationNotice *)self actionURL];
    v8 = [v4 actionURL];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8)
      && (int64_t v9 = [(TUConversationNotice *)self sessionEventType],
          v9 == [v4 sessionEventType]))
    {
      v10 = [(TUConversationNotice *)self sessionUUID];
      v11 = [v4 sessionUUID];
      if ([v10 isEqual:v11])
      {
        v12 = [(TUConversationNotice *)self bundleIdentifier];
        v13 = [v4 bundleIdentifier];
        if ([v12 isEqual:v13])
        {
          v21 = v12;
          v14 = [(TUConversationNotice *)self item];
          v22 = [v4 item];
          v23 = v14;
          if (objc_msgSend(v14, "isEqual:"))
          {
            int64_t v15 = [(TUConversationNotice *)self queueItemType];
            BOOL v16 = v15 == [v4 queueItemType];
            v12 = v21;
            if (v16)
            {
              v20 = [(TUConversationNotice *)self session];
              v19 = [v4 session];
              char v17 = TUObjectsAreEqualOrNil((unint64_t)v20, (uint64_t)v19);
            }
            else
            {
              char v17 = 0;
            }
          }
          else
          {
            char v17 = 0;
            v12 = v21;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = [(TUConversationNotice *)self sessionUUID];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(TUConversationNotice *)self sessionEventType] ^ v4;
  v6 = [(TUConversationNotice *)self actionURL];
  uint64_t v7 = [v6 hash];
  v8 = [(TUConversationNotice *)self UUID];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(TUConversationNotice *)self bundleIdentifier];
  uint64_t v11 = [v10 hash];
  v12 = [(TUConversationNotice *)self item];
  uint64_t v13 = v11 ^ [v12 hash];
  int64_t v14 = v9 ^ v13 ^ [(TUConversationNotice *)self queueItemType];
  int64_t v15 = [(TUConversationNotice *)self session];
  unint64_t v16 = v14 ^ [v15 hash];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationNotice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_UUID);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(TUConversationNotice *)self initWithUUID:v7];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_sessionUUID);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    sessionUUID = v8->_sessionUUID;
    v8->_sessionUUID = (NSUUID *)v11;

    uint64_t v13 = objc_opt_class();
    int64_t v14 = NSStringFromSelector(sel_actionURL);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    actionURL = v8->_actionURL;
    v8->_actionURL = (NSURL *)v15;

    char v17 = NSStringFromSelector(sel_sessionEventType);
    v8->_sessionEventType = [v4 decodeIntegerForKey:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_bundleIdentifier);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_item);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    item = v8->_item;
    v8->_item = (NSString *)v24;

    v26 = NSStringFromSelector(sel_queueItemType);
    v8->_queueItemType = [v4 decodeIntegerForKey:v26];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_session);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    session = v8->_session;
    v8->_session = (TUConversationActivitySession *)v29;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUConversationNotice *)self sessionEventType];
  v6 = NSStringFromSelector(sel_sessionEventType);
  [v4 encodeInteger:v5 forKey:v6];

  uint64_t v7 = [(TUConversationNotice *)self UUID];
  v8 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(TUConversationNotice *)self sessionUUID];
  v10 = NSStringFromSelector(sel_sessionUUID);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUConversationNotice *)self actionURL];
  v12 = NSStringFromSelector(sel_actionURL);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUConversationNotice *)self bundleIdentifier];
  int64_t v14 = NSStringFromSelector(sel_bundleIdentifier);
  [v4 encodeObject:v13 forKey:v14];

  uint64_t v15 = [(TUConversationNotice *)self item];
  unint64_t v16 = NSStringFromSelector(sel_item);
  [v4 encodeObject:v15 forKey:v16];

  int64_t v17 = [(TUConversationNotice *)self queueItemType];
  uint64_t v18 = NSStringFromSelector(sel_queueItemType);
  [v4 encodeInteger:v17 forKey:v18];

  id v20 = [(TUConversationNotice *)self session];
  v19 = NSStringFromSelector(sel_session);
  [v4 encodeObject:v20 forKey:v19];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (int64_t)sessionEventType
{
  return self->_sessionEventType;
}

- (void)setSessionEventType:(int64_t)a3
{
  self->_sessionEventType = a3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (int64_t)queueItemType
{
  return self->_queueItemType;
}

- (void)setQueueItemType:(int64_t)a3
{
  self->_queueItemType = a3;
}

- (TUConversationActivitySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
@interface TUConversationActivityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationActivityEvent:(id)a3;
- (NSString)item;
- (NSString)localizedDescription;
- (NSURL)url;
- (NSUUID)sessionUUID;
- (TUConversationActivityEvent)initWithCoder:(id)a3;
- (TUConversationActivityEvent)initWithSessionUUID:(id)a3 originator:(id)a4 type:(int64_t)a5;
- (TUConversationActivitySession)session;
- (TUConversationParticipant)originator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)queueItemType;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setQueueItemType:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation TUConversationActivityEvent

- (TUConversationActivityEvent)initWithSessionUUID:(id)a3 originator:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUConversationActivityEvent;
  v11 = [(TUConversationActivityEvent *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionUUID, a3);
    objc_storeStrong((id *)&v12->_originator, a4);
    v12->_type = a5;
    localizedDescription = v12->_localizedDescription;
    v12->_localizedDescription = (NSString *)&stru_1EECEA668;

    v12->_queueItemType = 0;
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUConversationActivityEvent *)self sessionUUID];
  [v3 appendFormat:@" sessionUUID=%@", v4];

  v5 = [(TUConversationActivityEvent *)self originator];
  [v3 appendFormat:@" originator=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" type=%ld", -[TUConversationActivityEvent type](self, "type"));
  v6 = [(TUConversationActivityEvent *)self item];
  [v3 appendFormat:@" item=%@", v6];

  objc_msgSend(v3, "appendFormat:", @" queueItemType=%d", -[TUConversationActivityEvent queueItemType](self, "queueItemType"));
  v7 = [(TUConversationActivityEvent *)self url];
  [v3 appendFormat:@" url=%@", v7];

  [v3 appendString:@">"];
  v8 = (void *)[v3 copy];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationActivityEvent *)self isEqualToConversationActivityEvent:v4];

  return v5;
}

- (BOOL)isEqualToConversationActivityEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivityEvent *)self sessionUUID];
  v6 = [v4 sessionUUID];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUConversationActivityEvent *)self originator];
    v8 = [v4 originator];
    if ([v7 isEqualToParticipant:v8]
      && (int64_t v9 = -[TUConversationActivityEvent type](self, "type"), v9 == [v4 type]))
    {
      id v10 = [(TUConversationActivityEvent *)self item];
      v11 = [v4 item];
      if (TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11)
        && (int64_t v12 = [(TUConversationActivityEvent *)self queueItemType],
            v12 == [v4 queueItemType]))
      {
        v13 = [(TUConversationActivityEvent *)self session];
        v14 = [v4 session];
        if (TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14))
        {
          v18 = [(TUConversationActivityEvent *)self url];
          [v4 url];
          objc_super v15 = v19 = v13;
          char v16 = TUObjectsAreEqualOrNil((unint64_t)v18, (uint64_t)v15);

          v13 = v19;
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = [(TUConversationActivityEvent *)self sessionUUID];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationActivityEvent *)self originator];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = [(TUConversationActivityEvent *)self type];
  v8 = [(TUConversationActivityEvent *)self item];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];
  int64_t v10 = [(TUConversationActivityEvent *)self queueItemType];
  v11 = [(TUConversationActivityEvent *)self session];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(TUConversationActivityEvent *)self url];
  unint64_t v14 = v9 ^ v12 ^ [v13 hash];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUConversationActivityEvent *)self sessionUUID];
  uint64_t v6 = [(TUConversationActivityEvent *)self originator];
  int64_t v7 = objc_msgSend(v4, "initWithSessionUUID:originator:type:", v5, v6, -[TUConversationActivityEvent type](self, "type"));

  v8 = [(TUConversationActivityEvent *)self item];
  [v7 setItem:v8];

  objc_msgSend(v7, "setQueueItemType:", -[TUConversationActivityEvent queueItemType](self, "queueItemType"));
  uint64_t v9 = [(TUConversationActivityEvent *)self session];
  [v7 setSession:v9];

  int64_t v10 = [(TUConversationActivityEvent *)self url];
  [v7 setUrl:v10];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivityEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_UUID);
  int64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(sel_originator);
  int64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = NSStringFromSelector(sel_type);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  uint64_t v13 = objc_opt_class();
  unint64_t v14 = NSStringFromSelector("url");
  objc_super v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  char v16 = [(TUConversationActivityEvent *)self initWithSessionUUID:v7 originator:v10 type:v12];
  uint64_t v17 = objc_opt_class();
  v18 = NSStringFromSelector(sel_item);
  v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
  [(TUConversationActivityEvent *)v16 setItem:v19];

  v20 = NSStringFromSelector(sel_queueItemType);
  -[TUConversationActivityEvent setQueueItemType:](v16, "setQueueItemType:", [v4 decodeIntegerForKey:v20]);

  uint64_t v21 = objc_opt_class();
  v22 = NSStringFromSelector(sel_session);
  v23 = [v4 decodeObjectOfClass:v21 forKey:v22];

  [(TUConversationActivityEvent *)v16 setSession:v23];
  [(TUConversationActivityEvent *)v16 setUrl:v15];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationActivityEvent *)self sessionUUID];
  uint64_t v6 = NSStringFromSelector(sel_sessionUUID);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(TUConversationActivityEvent *)self originator];
  uint64_t v8 = NSStringFromSelector(sel_originator);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(TUConversationActivityEvent *)self type];
  int64_t v10 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v9 forKey:v10];

  v11 = [(TUConversationActivityEvent *)self item];
  uint64_t v12 = NSStringFromSelector(sel_item);
  [v4 encodeObject:v11 forKey:v12];

  int64_t v13 = [(TUConversationActivityEvent *)self queueItemType];
  unint64_t v14 = NSStringFromSelector(sel_queueItemType);
  [v4 encodeInteger:v13 forKey:v14];

  objc_super v15 = [(TUConversationActivityEvent *)self session];
  char v16 = NSStringFromSelector(sel_session);
  [v4 encodeObject:v15 forKey:v16];

  id v18 = [(TUConversationActivityEvent *)self url];
  uint64_t v17 = NSStringFromSelector("url");
  [v4 encodeObject:v18 forKey:v17];
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (TUConversationParticipant)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)queueItemType
{
  return self->_queueItemType;
}

- (void)setQueueItemType:(int64_t)a3
{
  self->_queueItemType = a3;
}

- (NSString)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (TUConversationActivitySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_originator, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
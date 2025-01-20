@interface TUScreenSharingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (BOOL)isLocallyOriginated;
- (BOOL)shouldSendLegacyInvite;
- (NSUUID)UUID;
- (TUHandle)handle;
- (TUScreenSharingRequest)initWithCoder:(id)a3;
- (TUScreenSharingRequest)initWithHandle:(id)a3 shareMyScreen:(BOOL)a4 originType:(int64_t)a5 shouldSendLegacyInvite:(BOOL)a6;
- (TUScreenSharingRequest)initWithHandle:(id)a3 type:(int64_t)a4 originType:(int64_t)a5 UUID:(id)a6 participantIdentifier:(unint64_t)a7;
- (TUScreenSharingRequest)initWithHandle:(id)a3 type:(int64_t)a4 originType:(int64_t)a5 UUID:(id)a6 participantIdentifier:(unint64_t)a7 shouldSendLegacyInvite:(BOOL)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)originType;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)participantIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUScreenSharingRequest

- (TUScreenSharingRequest)initWithHandle:(id)a3 shareMyScreen:(BOOL)a4 originType:(int64_t)a5 shouldSendLegacyInvite:(BOOL)a6
{
  BOOL v6 = a6;
  if (a4) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a3;
  v12 = [v10 UUID];
  v13 = [(TUScreenSharingRequest *)self initWithHandle:v11 type:v9 originType:a5 UUID:v12 participantIdentifier:0 shouldSendLegacyInvite:v6];

  return v13;
}

- (TUScreenSharingRequest)initWithHandle:(id)a3 type:(int64_t)a4 originType:(int64_t)a5 UUID:(id)a6 participantIdentifier:(unint64_t)a7
{
  return [(TUScreenSharingRequest *)self initWithHandle:a3 type:a4 originType:a5 UUID:a6 participantIdentifier:a7 shouldSendLegacyInvite:0];
}

- (TUScreenSharingRequest)initWithHandle:(id)a3 type:(int64_t)a4 originType:(int64_t)a5 UUID:(id)a6 participantIdentifier:(unint64_t)a7 shouldSendLegacyInvite:(BOOL)a8
{
  id v15 = a3;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TUScreenSharingRequest;
  v17 = [(TUScreenSharingRequest *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_handle, a3);
    v18->_type = a4;
    v18->_originType = a5;
    objc_storeStrong((id *)&v18->_UUID, a6);
    v18->_participantIdentifier = a7;
    v18->_shouldSendLegacyInvite = a8;
  }

  return v18;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUScreenSharingRequest *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(TUScreenSharingRequest *)self handle];
  [v3 appendFormat:@" handle=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" type=%lu", -[TUScreenSharingRequest type](self, "type"));
  objc_msgSend(v3, "appendFormat:", @" originType=%lu", -[TUScreenSharingRequest originType](self, "originType"));
  if ([(TUScreenSharingRequest *)self isLocallyOriginated]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  [v3 appendFormat:@" locallyOriginated=%@", v6];
  objc_msgSend(v3, "appendFormat:", @" participantIdentifier=%llu", -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier"));
  if ([(TUScreenSharingRequest *)self shouldSendLegacyInvite]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@" shouldSendLegacyInvite=%@", v7];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isLocallyOriginated
{
  return [(TUScreenSharingRequest *)self type] == 2 || [(TUScreenSharingRequest *)self type] == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(TUScreenSharingRequest *)self handle];
  int64_t v6 = [(TUScreenSharingRequest *)self type];
  int64_t v7 = [(TUScreenSharingRequest *)self originType];
  v8 = [(TUScreenSharingRequest *)self UUID];
  uint64_t v9 = objc_msgSend(v4, "initWithHandle:type:originType:UUID:participantIdentifier:shouldSendLegacyInvite:", v5, v6, v7, v8, -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier"), -[TUScreenSharingRequest shouldSendLegacyInvite](self, "shouldSendLegacyInvite"));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUScreenSharingRequest *)self handle];
  int64_t v6 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(TUScreenSharingRequest *)self type];
  v8 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v7 forKey:v8];

  int64_t v9 = [(TUScreenSharingRequest *)self originType];
  v10 = NSStringFromSelector(sel_originType);
  [v4 encodeInteger:v9 forKey:v10];

  id v11 = [(TUScreenSharingRequest *)self UUID];
  v12 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v11 forKey:v12];

  unint64_t v13 = [(TUScreenSharingRequest *)self participantIdentifier];
  v14 = NSStringFromSelector(sel_participantIdentifier);
  [v4 encodeInteger:v13 forKey:v14];

  BOOL v15 = [(TUScreenSharingRequest *)self shouldSendLegacyInvite];
  NSStringFromSelector(sel_shouldSendLegacyInvite);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v15 forKey:v16];
}

- (TUScreenSharingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUScreenSharingRequest;
  v5 = [(TUScreenSharingRequest *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    int64_t v7 = NSStringFromSelector(sel_handle);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v8;

    v10 = NSStringFromSelector(sel_type);
    v5->_type = [v4 decodeIntegerForKey:v10];

    id v11 = NSStringFromSelector(sel_originType);
    v5->_originType = [v4 decodeIntegerForKey:v11];

    uint64_t v12 = objc_opt_class();
    unint64_t v13 = NSStringFromSelector(sel_UUID);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v14;

    id v16 = NSStringFromSelector(sel_participantIdentifier);
    v5->_participantIdentifier = [v4 decodeIntegerForKey:v16];

    v17 = NSStringFromSelector(sel_shouldSendLegacyInvite);
    v5->_shouldSendLegacyInvite = [v4 decodeBoolForKey:v17];
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [(TUScreenSharingRequest *)self handle];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(TUScreenSharingRequest *)self type];
  int64_t v6 = v5 ^ [(TUScreenSharingRequest *)self originType] ^ v4;
  int64_t v7 = [(TUScreenSharingRequest *)self UUID];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(TUScreenSharingRequest *)self participantIdentifier];
  unint64_t v10 = v9 ^ [(TUScreenSharingRequest *)self shouldSendLegacyInvite];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUScreenSharingRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUScreenSharingRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUScreenSharingRequest *)self handle];
  int64_t v6 = [v4 handle];
  if ([v5 isEqualToHandle:v6]
    && (int64_t v7 = -[TUScreenSharingRequest type](self, "type"), v7 == [v4 type])
    && (int64_t v8 = -[TUScreenSharingRequest originType](self, "originType"), v8 == [v4 originType]))
  {
    unint64_t v9 = [(TUScreenSharingRequest *)self UUID];
    unint64_t v10 = [v4 UUID];
    if ([v9 isEqual:v10]
      && (unint64_t v11 = [(TUScreenSharingRequest *)self participantIdentifier],
          v11 == [v4 participantIdentifier]))
    {
      BOOL v12 = [(TUScreenSharingRequest *)self shouldSendLegacyInvite];
      int v13 = v12 ^ [v4 shouldSendLegacyInvite] ^ 1;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)originType
{
  return self->_originType;
}

- (BOOL)shouldSendLegacyInvite
{
  return self->_shouldSendLegacyInvite;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end
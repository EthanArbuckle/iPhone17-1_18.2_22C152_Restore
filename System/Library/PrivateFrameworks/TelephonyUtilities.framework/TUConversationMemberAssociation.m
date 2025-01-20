@interface TUConversationMemberAssociation
+ (BOOL)supportsSecureCoding;
+ (id)associationForHandle:(id)a3 from:(id)a4;
+ (id)messagingDataWithType:(int64_t)a3 primaryHandle:(id)a4 primaryIdentifier:(unint64_t)a5 primaryAvcIdentifier:(id)a6 associatedPseudonym:(id)a7 conversationGroupUUIDString:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssociation:(id)a3;
- (BOOL)isPrimary;
- (NSData)messagingData;
- (NSString)avcIdentifier;
- (TUConversationMemberAssociation)initWithCoder:(id)a3;
- (TUConversationMemberAssociation)initWithHandle:(id)a3 type:(int64_t)a4 primary:(BOOL)a5;
- (TUConversationMemberAssociation)initWithMemberAssociation:(id)a3;
- (TUHandle)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAvcIdentifier:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation TUConversationMemberAssociation

- (TUConversationMemberAssociation)initWithMemberAssociation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUConversationMemberAssociation;
  v5 = [(TUConversationMemberAssociation *)&v12 init];
  if (v5)
  {
    v5->_type = [v4 type];
    uint64_t v6 = [v4 handle];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v6;

    v5->_primary = [v4 isPrimary];
    v5->_identifier = [v4 identifier];
    v8 = [v4 avcIdentifier];
    uint64_t v9 = [v8 copy];
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v9;
  }
  return v5;
}

- (TUConversationMemberAssociation)initWithHandle:(id)a3 type:(int64_t)a4 primary:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUConversationMemberAssociation;
  v10 = [(TUConversationMemberAssociation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a4;
    objc_storeStrong((id *)&v10->_handle, a3);
    v11->_primary = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationMemberAssociation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationMemberAssociation;
  v5 = [(TUConversationMemberAssociation *)&v18 init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_type);
    v5->_type = [v4 decodeIntegerForKey:v6];

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_handle);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v9;

    v11 = NSStringFromSelector(sel_isPrimary);
    v5->_primary = [v4 decodeBoolForKey:v11];

    objc_super v12 = NSStringFromSelector(sel_identifier);
    v5->_identifier = [v4 decodeInt64ForKey:v12];

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_avcIdentifier);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUConversationMemberAssociation *)self type];
  uint64_t v6 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v5 forKey:v6];

  uint64_t v7 = [(TUConversationMemberAssociation *)self handle];
  v8 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(TUConversationMemberAssociation *)self isPrimary];
  v10 = NSStringFromSelector(sel_isPrimary);
  [v4 encodeBool:v9 forKey:v10];

  unint64_t v11 = [(TUConversationMemberAssociation *)self identifier];
  objc_super v12 = NSStringFromSelector(sel_identifier);
  [v4 encodeInt64:v11 forKey:v12];

  id v14 = [(TUConversationMemberAssociation *)self avcIdentifier];
  uint64_t v13 = NSStringFromSelector(sel_avcIdentifier);
  [v4 encodeObject:v14 forKey:v13];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUConversationMemberAssociation allocWithZone:a3];

  return [(TUConversationMemberAssociation *)v4 initWithMemberAssociation:self];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" type=%zd", -[TUConversationMemberAssociation type](self, "type"));
  id v4 = [(TUConversationMemberAssociation *)self handle];
  [v3 appendFormat:@" handle=%@", v4];

  BOOL v5 = [(TUConversationMemberAssociation *)self isPrimary];
  uint64_t v6 = @"NO";
  if (v5) {
    uint64_t v6 = @"YES";
  }
  [v3 appendFormat:@" isPrimary=%@", v6];
  objc_msgSend(v3, "appendFormat:", @" identifier=%llu", -[TUConversationMemberAssociation identifier](self, "identifier"));
  uint64_t v7 = [(TUConversationMemberAssociation *)self avcIdentifier];

  if (v7)
  {
    v8 = [(TUConversationMemberAssociation *)self avcIdentifier];
    [v3 appendFormat:@" avcIdentifier=%@", v8];
  }
  [v3 appendFormat:@">"];
  BOOL v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[TUConversationMemberAssociation type](self, "type"));
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationMemberAssociation *)self handle];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TUConversationMemberAssociation isPrimary](self, "isPrimary"));
  uint64_t v8 = [v7 hash];
  BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[TUConversationMemberAssociation identifier](self, "identifier"));
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(TUConversationMemberAssociation *)self avcIdentifier];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

+ (id)messagingDataWithType:(int64_t)a3 primaryHandle:(id)a4 primaryIdentifier:(unint64_t)a5 primaryAvcIdentifier:(id)a6 associatedPseudonym:(id)a7 conversationGroupUUIDString:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  v17 = objc_alloc_init(CSDMessagingMemberAssociationClaim);
  [(CSDMessagingMemberAssociationClaim *)v17 setType:a3];
  objc_super v18 = +[CSDMessagingHandle handleWithTUHandle:v16];

  [(CSDMessagingMemberAssociationClaim *)v17 setPrimaryHandle:v18];
  [(CSDMessagingMemberAssociationClaim *)v17 setPrimaryIdentifier:a5];
  [(CSDMessagingMemberAssociationClaim *)v17 setPrimaryAvcIdentifier:v15];

  v19 = +[CSDMessagingHandle handleWithTUHandle:v14];

  [(CSDMessagingMemberAssociationClaim *)v17 setAssociatedPseudonym:v19];
  [(CSDMessagingMemberAssociationClaim *)v17 setConversationGroupUUIDString:v13];

  v20 = [(CSDMessagingMemberAssociationClaim *)v17 data];

  return v20;
}

+ (id)associationForHandle:(id)a3 from:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[CSDMessagingMemberAssociationClaim alloc] initWithData:v5];

  uint64_t v8 = [(CSDMessagingMemberAssociationClaim *)v7 tuAssociationForHandle:v6];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationMemberAssociation *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationMemberAssociation *)self isEqualToAssociation:v4];
  }

  return v5;
}

- (BOOL)isEqualToAssociation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUConversationMemberAssociation *)self type];
  if (v5 == [v4 type])
  {
    id v6 = [(TUConversationMemberAssociation *)self handle];
    uint64_t v7 = [v4 handle];
    if ([v6 isEqualToHandle:v7]
      && (int v8 = [(TUConversationMemberAssociation *)self isPrimary],
          v8 == [v4 isPrimary])
      && (unint64_t v9 = -[TUConversationMemberAssociation identifier](self, "identifier"), v9 == [v4 identifier]))
    {
      uint64_t v10 = [(TUConversationMemberAssociation *)self avcIdentifier];
      unint64_t v11 = [v4 avcIdentifier];
      char v12 = [v10 isEqualToString:v11];
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
}

- (NSData)messagingData
{
  return self->_messagingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingData, 0);
  objc_storeStrong((id *)&self->_avcIdentifier, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end
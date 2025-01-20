@interface MRCodableGroupSessionParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGuest;
- (BOOL)isHidden;
- (BOOL)isHost;
- (BOOL)isLocal;
- (BOOL)isPending;
- (MRCodableGroupSessionParticipant)initWithCoder:(id)a3;
- (MRCodableGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7;
- (MRUserIdentity)identity;
- (NSString)description;
- (NSString)identifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setGuest:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHost:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setLocal:(BOOL)a3;
- (void)setPending:(BOOL)a3;
@end

@implementation MRCodableGroupSessionParticipant

- (MRCodableGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRCodableGroupSessionParticipant;
  v15 = [(MRCodableGroupSessionParticipant *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_identity, a4);
    v16->_connected = a5;
    v16->_guest = a6;
    v16->_hidden = a7;
  }

  return v16;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v17 = objc_opt_class();
  v16 = [(MRCodableGroupSessionParticipant *)self identifier];
  id v14 = [(MRCodableGroupSessionParticipant *)self identity];
  objc_super v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MRCodableGroupSessionParticipant isLocal](self, "isLocal"));
  v4 = [v18 stringValue];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[MRCodableGroupSessionParticipant isPending](self, "isPending"));
  v5 = [v15 stringValue];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MRCodableGroupSessionParticipant isConnected](self, "isConnected"));
  v7 = [v6 stringValue];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MRCodableGroupSessionParticipant isGuest](self, "isGuest"));
  v9 = [v8 stringValue];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MRCodableGroupSessionParticipant isHidden](self, "isHidden"));
  v11 = [v10 stringValue];
  v12 = (void *)[v3 initWithFormat:@"<%@: identifier=%@, identity=%@, local=%@, pending=%@, connected=%@, guest=%@, hidden=%@>", v17, v16, v14, v4, v5, v7, v9, v11];

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRCodableGroupSessionParticipant *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      v7 = identifier;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_identity forKey:@"identity"];
  [v5 encodeBool:self->_host forKey:@"host"];
  [v5 encodeBool:self->_local forKey:@"local"];
  [v5 encodeBool:self->_pending forKey:@"pending"];
  [v5 encodeBool:self->_connected forKey:@"connected"];
  [v5 encodeBool:self->_guest forKey:@"guest"];
  [v5 encodeBool:self->_hidden forKey:@"hidden"];
}

- (MRCodableGroupSessionParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRCodableGroupSessionParticipant;
  id v5 = [(MRCodableGroupSessionParticipant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (MRUserIdentity *)v8;

    v5->_host = [v4 decodeBoolForKey:@"host"];
    v5->_local = [v4 decodeBoolForKey:@"local"];
    v5->_pending = [v4 decodeBoolForKey:@"pending"];
    v5->_connected = [v4 decodeBoolForKey:@"connected"];
    v5->_guest = [v4 decodeBoolForKey:@"guest"];
    v5->_hidden = [v4 decodeBoolForKey:@"hidden"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isGuest
{
  return self->_guest;
}

- (void)setGuest:(BOOL)a3
{
  self->_guest = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (BOOL)isHost
{
  return self->_host;
}

- (void)setHost:(BOOL)a3
{
  self->_host = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
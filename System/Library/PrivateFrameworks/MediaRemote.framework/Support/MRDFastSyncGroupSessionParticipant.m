@interface MRDFastSyncGroupSessionParticipant
- (BOOL)connected;
- (BOOL)guest;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6;
- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7;
- (MRUserIdentity)identity;
- (NSString)description;
- (NSString)identifier;
- (unint64_t)hash;
@end

@implementation MRDFastSyncGroupSessionParticipant

- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRDFastSyncGroupSessionParticipant;
  v15 = [(MRDFastSyncGroupSessionParticipant *)&v18 init];
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

- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6
{
  return [(MRDFastSyncGroupSessionParticipant *)self initWithIdentifier:a3 identity:a4 connected:a5 guest:a6 hidden:0];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MRDFastSyncGroupSessionParticipant *)self identifier];
  v6 = [(MRDFastSyncGroupSessionParticipant *)self identity];
  v7 = +[NSNumber numberWithBool:[(MRDFastSyncGroupSessionParticipant *)self connected]];
  v8 = [v7 stringValue];
  v9 = +[NSNumber numberWithBool:[(MRDFastSyncGroupSessionParticipant *)self guest]];
  v10 = [v9 stringValue];
  v11 = +[NSNumber numberWithBool:[(MRDFastSyncGroupSessionParticipant *)self hidden]];
  v12 = [v11 stringValue];
  id v13 = [v3 initWithFormat:@"<%@: identifier=%@, identity=%@, connected=%@, guest=%@, hidden=%@>", v4, v5, v6, v8, v10, v12];

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRDFastSyncGroupSessionParticipant *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
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
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)guest
{
  return self->_guest;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
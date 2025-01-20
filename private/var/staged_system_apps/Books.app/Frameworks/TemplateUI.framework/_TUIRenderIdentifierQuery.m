@interface _TUIRenderIdentifierQuery
- (BOOL)matchedUUID;
- (BOOL)matchesRefId:(id)a3 refInstance:(id)a4 identifier:(id)a5;
- (BOOL)matchesUUID:(id)a3 uid:(id)a4;
- (NSString)refId;
- (NSString)refInstance;
- (NSString)uid;
- (NSUUID)UUID;
- (TUIIdentifier)identifier;
- (id)queryMatchedWithUUID:(id)a3 uid:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setMatchedUUID:(BOOL)a3;
- (void)setUUID:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation _TUIRenderIdentifierQuery

- (NSString)refId
{
  return 0;
}

- (NSString)refInstance
{
  return 0;
}

- (BOOL)matchesUUID:(id)a3 uid:(id)a4
{
  v6 = (NSUUID *)a3;
  v7 = (NSString *)a4;
  if (self->_matchedUUID)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    UUID = self->_UUID;
    if (UUID) {
      BOOL v11 = UUID == v6;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11 || [(NSUUID *)UUID isEqual:v6])
    {
      uid = self->_uid;
      unsigned __int8 v8 = 1;
      if (uid && uid != v7) {
        unsigned __int8 v8 = [(NSString *)uid isEqualToString:v7];
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (BOOL)matchesRefId:(id)a3 refInstance:(id)a4 identifier:(id)a5
{
  return -[TUIIdentifier isEqual:](self->_identifier, "isEqual:", a5, a4);
}

- (id)queryMatchedWithUUID:(id)a3 uid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = objc_alloc_init(_TUIRenderIdentifierQuery);
  [(_TUIRenderIdentifierQuery *)v8 setIdentifier:self->_identifier];
  [(_TUIRenderIdentifierQuery *)v8 setUUID:v7];

  [(_TUIRenderIdentifierQuery *)v8 setUid:v6];
  [(_TUIRenderIdentifierQuery *)v8 setMatchedUUID:1];

  return v8;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)matchedUUID
{
  return self->_matchedUUID;
}

- (void)setMatchedUUID:(BOOL)a3
{
  self->_matchedUUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uid, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
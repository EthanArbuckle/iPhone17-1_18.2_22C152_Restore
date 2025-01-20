@interface TUIRenderReferenceIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)refId;
- (NSString)refInstance;
- (NSString)uid;
- (NSUUID)UUID;
- (TUIRenderReferenceIdentifier)initWithUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6;
- (unint64_t)hash;
@end

@implementation TUIRenderReferenceIdentifier

- (TUIRenderReferenceIdentifier)initWithUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TUIRenderReferenceIdentifier;
  v14 = [(TUIRenderReferenceIdentifier *)&v24 init];
  if (v14)
  {
    v15 = (NSUUID *)[v10 copy];
    UUID = v14->_UUID;
    v14->_UUID = v15;

    v17 = (NSString *)[v11 copy];
    uid = v14->_uid;
    v14->_uid = v17;

    v19 = (NSString *)[v12 copy];
    refId = v14->_refId;
    v14->_refId = v19;

    v21 = (NSString *)[v13 copy];
    refInstance = v14->_refInstance;
    v14->_refInstance = v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      v7 = TUIDynamicCast(v6, v4);
      if (!v7) {
        goto LABEL_15;
      }
    }
    UUID = self->_UUID;
    if (UUID == (NSUUID *)v7[1] || -[NSUUID isEqual:](UUID, "isEqual:"))
    {
      uid = self->_uid;
      if (uid == (NSString *)v7[2] || -[NSString isEqualToString:](uid, "isEqualToString:"))
      {
        refId = self->_refId;
        if (refId == (NSString *)v7[3] || -[NSString isEqualToString:](refId, "isEqualToString:"))
        {
          refInstance = self->_refInstance;
          if (refInstance == (NSString *)v7[4]) {
            unsigned __int8 v8 = 1;
          }
          else {
            unsigned __int8 v8 = -[NSString isEqualToString:](refInstance, "isEqualToString:");
          }
          goto LABEL_16;
        }
      }
    }
LABEL_15:
    unsigned __int8 v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  unsigned __int8 v8 = 0;
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSUUID *)self->_UUID hash];
  unint64_t v4 = [(NSString *)self->_uid hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_refId hash];
  return v4 ^ v5 ^ [(NSString *)self->_refInstance hash];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_uid, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
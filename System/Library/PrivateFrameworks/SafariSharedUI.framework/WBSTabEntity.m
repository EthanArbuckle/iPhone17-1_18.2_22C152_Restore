@interface WBSTabEntity
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (NSString)address;
- (NSString)title;
- (NSUUID)uuid;
- (WBSTabEntity)initWithUUID:(id)a3 title:(id)a4 address:(id)a5 isPrivate:(BOOL)a6;
- (unint64_t)hash;
@end

@implementation WBSTabEntity

- (WBSTabEntity)initWithUUID:(id)a3 title:(id)a4 address:(id)a5 isPrivate:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WBSTabEntity;
  v13 = [(WBSTabEntity *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v14;

    uint64_t v16 = [v11 copy];
    title = v13->_title;
    v13->_title = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    address = v13->_address;
    v13->_address = (NSString *)v18;

    v13->_isPrivate = a6;
    v20 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    BOOL v6 = WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && v5[8] == self->_isPrivate;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
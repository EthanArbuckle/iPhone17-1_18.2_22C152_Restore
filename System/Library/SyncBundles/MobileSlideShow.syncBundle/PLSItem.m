@interface PLSItem
+ (BOOL)supportsSecureCoding;
- (NSDictionary)hostInfo;
- (NSString)uuid;
- (PLSItem)init;
- (PLSItem)initWithCoder:(id)a3;
- (PLSItem)initWithUUID:(id)a3;
- (id)_itemType;
- (id)description;
- (id)initFromPropertyList:(id)a3;
- (id)propertyList;
- (id)userInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setHostInfo:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLSItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_hostInfo, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setHostInfo:(id)a3
{
}

- (NSDictionary)hostInfo
{
  return self->_hostInfo;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)_itemType
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Method not implemented on base class" userInfo:0];
  objc_exception_throw(v2);
}

- (id)propertyList
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(PLSItem *)self uuid];

  if (v4)
  {
    v5 = [(PLSItem *)self uuid];
    [v3 setObject:v5 forKey:kPLSItemUUIDKey];
  }
  v6 = [(PLSItem *)self _itemType];

  if (v6)
  {
    v7 = [(PLSItem *)self _itemType];
    [v3 setObject:v7 forKey:kPLSTransportItemTypeKey];
  }
  v8 = [(PLSItem *)self userInfo];

  if (v8)
  {
    v9 = [(PLSItem *)self userInfo];
    [v3 setObject:v9 forKey:kPLSTransportUserInfoKey];
  }

  return v3;
}

- (id)initFromPropertyList:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSItem;
  v5 = [(PLSItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:kPLSItemUUIDKey];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:kPLSTransportUserInfoKey];
    id userInfo = v5->_userInfo;
    v5->_id userInfo = (id)v8;

    v10 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLSItem *)self uuid];
  [v4 encodeObject:v5 forKey:kPLSItemUUIDKey];

  id v6 = [(PLSItem *)self userInfo];
  [v4 encodeObject:v6 forKey:kPLSTransportUserInfoKey];
}

- (PLSItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSItem;
  v5 = [(PLSItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSItemUUIDKey];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 decodePropertyListForKey:kPLSTransportUserInfoKey];
    id userInfo = v5->_userInfo;
    v5->_id userInfo = (id)v8;

    v10 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = v10;
  }
  return v5;
}

- (id)description
{
  id v2 = [(PLSItem *)self uuid];
  v3 = +[NSString stringWithFormat:@"(%@)", v2];

  return v3;
}

- (PLSItem)initWithUUID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLSItem;
  uint64_t v6 = [(PLSItem *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    uint64_t v8 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    hostInfo = v7->_hostInfo;
    v7->_hostInfo = v8;
  }
  return v7;
}

- (PLSItem)init
{
  v3 = +[PLUUIDString UUIDString];
  id v4 = [(PLSItem *)self initWithUUID:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
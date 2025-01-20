@interface STStatusRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithUDID:(id)a3 withUserShortName:(id)a4 withMessages:(id)a5;
- (BOOL)loadStatusFromDictionary:(id)a3 error:(id *)a4;
- (NSArray)messages;
- (NSString)UDID;
- (NSString)requestType;
- (NSString)userShortName;
- (STStatusRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
- (void)setMessages:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setUDID:(id)a3;
- (void)setUserShortName:(id)a3;
@end

@implementation STStatusRequest

+ (id)requestWithUDID:(id)a3 withUserShortName:(id)a4 withMessages:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setRequestType:@"Status"];
  [v10 setUDID:v9];

  [v10 setUserShortName:v8];
  [v10 setMessages:v7];

  return v10;
}

- (BOOL)loadStatusFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v20 = 0;
  id v7 = [(STStatusRequest *)self loadStringFromDictionary:v6 withKey:@"RequestType" isRequired:1 defaultValue:0 error:&v20];
  id v8 = v20;
  requestType = self->_requestType;
  self->_requestType = v7;

  if (!v8)
  {
    id v19 = 0;
    v10 = [(STStatusRequest *)self loadStringFromDictionary:v6 withKey:@"UDID" isRequired:0 defaultValue:0 error:&v19];
    id v8 = v19;
    UDID = self->_UDID;
    self->_UDID = v10;

    if (!v8)
    {
      id v18 = 0;
      v12 = [(STStatusRequest *)self loadStringFromDictionary:v6 withKey:@"UserShortName" isRequired:0 defaultValue:0 error:&v18];
      id v8 = v18;
      userShortName = self->_userShortName;
      self->_userShortName = v12;

      if (!v8)
      {
        id v17 = 0;
        v14 = [(STStatusRequest *)self loadArrayFromDictionary:v6 withKey:@"Messages" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v17];
        id v8 = v17;
        messages = self->_messages;
        self->_messages = v14;
      }
    }
  }
  if (a4 && v8) {
    *a4 = v8;
  }

  return v8 == 0;
}

- (id)serialize
{
  v3 = +[NSMutableDictionary dictionary];
  [(STStatusRequest *)self serializeStringIntoDictionary:v3 withKey:@"RequestType" withValue:self->_requestType isRequired:1 defaultValue:0];
  [(STStatusRequest *)self serializeStringIntoDictionary:v3 withKey:@"UDID" withValue:self->_UDID isRequired:0 defaultValue:0];
  [(STStatusRequest *)self serializeStringIntoDictionary:v3 withKey:@"UserShortName" withValue:self->_userShortName isRequired:0 defaultValue:0];
  [(STStatusRequest *)self serializeArrayIntoDictionary:v3 withKey:@"Messages" withValue:self->_messages itemSerializer:&stru_1002FE498 isRequired:1 defaultValue:0];
  id v4 = [v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STStatusRequest *)self serialize];
  [v4 encodeObject:v5 forKey:@"payload"];
}

- (STStatusRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STStatusRequest;
  id v5 = [(STStatusRequest *)&v24 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  id v6 = v4;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v20 = v7;
  id v4 = v6;
  v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, v21, v20, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v16 = [v6 decodeObjectOfClasses:v15 forKey:@"payload"];
  id v23 = 0;
  LOBYTE(v6) = [(STStatusRequest *)v5 loadStatusFromDictionary:v16 error:&v23];
  id v17 = v23;

  if (v6)
  {

LABEL_4:
    id v18 = v5;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100268038((uint64_t)v17);
  }

  id v18 = 0;
LABEL_8:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)STStatusRequest;
  id v4 = [(STStatusRequest *)&v14 copyWithZone:a3];
  id v5 = [(NSString *)self->_requestType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSString *)self->_UDID copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  id v9 = [(NSString *)self->_userShortName copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  id v11 = [(NSArray *)self->_messages copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
}

- (NSString)UDID
{
  return self->_UDID;
}

- (void)setUDID:(id)a3
{
}

- (NSString)userShortName
{
  return self->_userShortName;
}

- (void)setUserShortName:(id)a3
{
}

- (NSArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_userShortName, 0);
  objc_storeStrong((id *)&self->_UDID, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
}

@end
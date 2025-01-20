@interface STRemoteManagementRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestForPayload:(id)a3 error:(id *)a4;
- (BOOL)loadRequestFromDictionary:(id)a3 error:(id *)a4;
- (NSString)requestType;
- (NSString)requestUUID;
- (STRemoteManagementRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation STRemoteManagementRequest

+ (id)requestForPayload:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"RequestType"];
  if (objc_opt_class())
  {
    id v7 = (id)objc_opt_new();
    id v13 = 0;
    [v7 loadRequestFromDictionary:v5 error:&v13];
    id v8 = v13;
    v9 = v8;
    if (!v8)
    {
      id v7 = v7;
      v11 = v7;
      goto LABEL_10;
    }
    if (!a4)
    {
      v11 = 0;
      goto LABEL_10;
    }
    id v10 = v8;
    v9 = v10;
LABEL_7:
    v11 = 0;
    *a4 = v10;
LABEL_10:

    goto LABEL_11;
  }
  if (a4)
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v9 = +[NSString stringWithFormat:@"Could not match request type: %@", v6];
    v15 = v9;
    id v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v10 = +[NSError errorWithDomain:@"error" code:1 userInfo:v7];
    goto LABEL_7;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)loadRequestFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0;
  id v7 = [(STRemoteManagementRequest *)self loadStringFromDictionary:v6 withKey:@"RequestUUID" isRequired:1 defaultValue:0 error:&v14];
  id v8 = v14;
  requestUUID = self->_requestUUID;
  self->_requestUUID = v7;

  if (!v8)
  {
    id v13 = 0;
    id v10 = [(STRemoteManagementRequest *)self loadStringFromDictionary:v6 withKey:@"RequestType" isRequired:1 defaultValue:0 error:&v13];
    id v8 = v13;
    requestType = self->_requestType;
    self->_requestType = v10;
  }
  if (a4 && v8) {
    *a4 = v8;
  }

  return v8 == 0;
}

- (id)serialize
{
  v3 = +[NSMutableDictionary dictionary];
  [(STRemoteManagementRequest *)self serializeStringIntoDictionary:v3 withKey:@"RequestUUID" withValue:self->_requestUUID isRequired:1 defaultValue:0];
  [(STRemoteManagementRequest *)self serializeStringIntoDictionary:v3 withKey:@"RequestType" withValue:self->_requestType isRequired:1 defaultValue:0];
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
  id v5 = [(STRemoteManagementRequest *)self serialize];
  [v4 encodeObject:v5 forKey:@"payload"];
}

- (STRemoteManagementRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STRemoteManagementRequest;
  id v5 = [(STRemoteManagementRequest *)&v24 init];
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
  LOBYTE(v6) = [(STRemoteManagementRequest *)v5 loadRequestFromDictionary:v16 error:&v23];
  id v17 = v23;

  if (v6)
  {

LABEL_4:
    v18 = v5;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100267D48((uint64_t)v17);
  }

  v18 = 0;
LABEL_8:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STRemoteManagementRequest;
  id v4 = [(STRemoteManagementRequest *)&v10 copyWithZone:a3];
  id v5 = [(NSString *)self->_requestUUID copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSString *)self->_requestType copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
@interface STRemoteViewServiceDescription
+ (id)sharedDescriptionWithServiceName:(id)a3 viewControllerClassName:(id)a4 configurationContextUserInfo:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServiceDescription:(id)a3;
- (NSDictionary)configurationContextUserInfo;
- (NSString)serviceName;
- (NSString)viewControllerClassName;
- (id)_initWithServiceName:(id)a3 viewControllerClassName:(id)a4 configurationContextUserInfo:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation STRemoteViewServiceDescription

- (id)_initWithServiceName:(id)a3 viewControllerClassName:(id)a4 configurationContextUserInfo:(id)a5
{
  v8 = (NSString *)a4;
  v9 = (NSDictionary *)a5;
  v18.receiver = self;
  v18.super_class = (Class)STRemoteViewServiceDescription;
  id v10 = a3;
  v11 = [(STRemoteViewServiceDescription *)&v18 init];
  v12 = (NSString *)objc_msgSend(v10, "copy", v18.receiver, v18.super_class);

  serviceName = v11->_serviceName;
  v11->_serviceName = v12;

  viewControllerClassName = v11->_viewControllerClassName;
  v11->_viewControllerClassName = v8;
  v15 = v8;

  configurationContextUserInfo = v11->_configurationContextUserInfo;
  v11->_configurationContextUserInfo = v9;

  return v11;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STRemoteViewServiceDescription *)self serviceName];
  v5 = +[NSString stringWithFormat:@"<%@ { ServiceName: %@ }>", v3, v4];

  return v5;
}

+ (id)sharedDescriptionWithServiceName:(id)a3 viewControllerClassName:(id)a4 configurationContextUserInfo:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E270;
  block[3] = &unk_1002FCB20;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v7 = qword_100346990;
  id v8 = v16;
  id v9 = v15;
  id v10 = v14;
  if (v7 != -1) {
    dispatch_once(&qword_100346990, block);
  }
  id v11 = (id)qword_100346998;

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  serviceName = self->_serviceName;
  viewControllerClassName = self->_viewControllerClassName;
  configurationContextUserInfo = self->_configurationContextUserInfo;
  return [v4 _initWithServiceName:serviceName viewControllerClassName:viewControllerClassName configurationContextUserInfo:configurationContextUserInfo];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STRemoteViewServiceDescription *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STRemoteViewServiceDescription *)self isEqualToServiceDescription:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToServiceDescription:(id)a3
{
  id v4 = (STRemoteViewServiceDescription *)a3;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    BOOL v5 = [(STRemoteViewServiceDescription *)self serviceName];
    v6 = [(STRemoteViewServiceDescription *)v4 serviceName];
    if ([v5 isEqualToString:v6])
    {
      uint64_t v7 = [(STRemoteViewServiceDescription *)self viewControllerClassName];
      id v8 = [(STRemoteViewServiceDescription *)v4 viewControllerClassName];
      if ([v7 isEqualToString:v8])
      {
        id v9 = [(STRemoteViewServiceDescription *)self configurationContextUserInfo];
        id v10 = [(STRemoteViewServiceDescription *)v4 configurationContextUserInfo];
        if (v9 == v10)
        {
          unsigned __int8 v13 = 1;
        }
        else
        {
          id v11 = [(STRemoteViewServiceDescription *)self configurationContextUserInfo];
          v12 = [(STRemoteViewServiceDescription *)v4 configurationContextUserInfo];
          unsigned __int8 v13 = [v11 isEqualToDictionary:v12];
        }
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STRemoteViewServiceDescription *)self serviceName];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STRemoteViewServiceDescription *)self viewControllerClassName];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  uint64_t v7 = [(STRemoteViewServiceDescription *)self configurationContextUserInfo];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)viewControllerClassName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)configurationContextUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationContextUserInfo, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
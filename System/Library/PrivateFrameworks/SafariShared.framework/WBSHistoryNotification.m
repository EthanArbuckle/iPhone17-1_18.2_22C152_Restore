@interface WBSHistoryNotification
+ (BOOL)supportsSecureCoding;
- (NSDictionary)userInfo;
- (NSString)name;
- (WBSHistoryNotification)init;
- (WBSHistoryNotification)initWithCoder:(id)a3;
- (WBSHistoryNotification)initWithName:(id)a3 userInfo:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryNotification

- (WBSHistoryNotification)init
{
  return 0;
}

- (WBSHistoryNotification)initWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryNotification;
  v8 = [(WBSHistoryNotification *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = %@; userInfo = %@>",
    v5,
    self,
    self->_name,
  id v6 = self->_userInfo);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodePropertyListForKey:@"userInfo"];

  id v7 = [(WBSHistoryNotification *)self initWithName:v5 userInfo:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
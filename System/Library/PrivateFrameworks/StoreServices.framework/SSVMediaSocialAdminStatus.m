@interface SSVMediaSocialAdminStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isAdmin;
- (NSDate)dateUpdated;
- (SSVMediaSocialAdminStatus)initWithAdminStatus:(BOOL)a3 dateUpdated:(id)a4;
- (SSVMediaSocialAdminStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSVMediaSocialAdminStatus

- (SSVMediaSocialAdminStatus)initWithAdminStatus:(BOOL)a3 dateUpdated:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVMediaSocialAdminStatus;
  v7 = [(SSVMediaSocialAdminStatus *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_admin = a3;
    if (v6)
    {
      v9 = (NSDate *)v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1C9C8] date];
    }
    dateUpdated = v8->_dateUpdated;
    v8->_dateUpdated = v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSVMediaSocialAdminStatus *)self dateUpdated];
  id v6 = NSStringFromSelector(sel_dateUpdated);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(SSVMediaSocialAdminStatus *)self isAdmin];
  NSStringFromSelector(sel_isAdmin);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v7 forKey:v8];
}

- (SSVMediaSocialAdminStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSVMediaSocialAdminStatus;
  v5 = [(SSVMediaSocialAdminStatus *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    BOOL v7 = NSStringFromSelector(sel_dateUpdated);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    dateUpdated = v5->_dateUpdated;
    v5->_dateUpdated = (NSDate *)v8;

    v10 = NSStringFromSelector(sel_isAdmin);
    v5->_admin = [v4 decodeBoolForKey:v10];
  }
  return v5;
}

- (NSDate)dateUpdated
{
  return self->_dateUpdated;
}

- (BOOL)isAdmin
{
  return self->_admin;
}

- (void).cxx_destruct
{
}

@end
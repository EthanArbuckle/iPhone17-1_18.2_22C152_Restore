@interface _MBUser
+ (_MBUser)currentUser;
- (BOOL)isPrimaryUser;
- (_MBUser)initWithUser:(id)a3;
- (id)description;
@end

@implementation _MBUser

- (_MBUser)initWithUser:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[_MBUser initWithUser:]();
  }
  v5 = v4;
  v9.receiver = self;
  v9.super_class = (Class)_MBUser;
  v6 = [(_MBUser *)&v9 init];
  v7 = v6;
  if (v6) {
    v6->_isPrimaryUser = 1;
  }

  return v7;
}

+ (_MBUser)currentUser
{
  v2 = [_MBUser alloc];
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v4 = [v3 currentUser];
  v5 = [(_MBUser *)v2 initWithUser:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; isPrimaryUser=%d>",
               class_getName(v4),
               self,
               self->_isPrimaryUser);
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (void)initWithUser:.cold.1()
{
}

@end
@interface DMFUser
- (id)initWithUser:(id)a3 isCurrentUser:(BOOL)a4;
@end

@implementation DMFUser

- (id)initWithUser:(id)a3 isCurrentUser:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 username];
  id v8 = [v6 dataQuota];
  id v9 = [v6 dataUsed];
  id v10 = [v6 hasDataToSync];

  v11 = [(DMFUser *)self initWithUsername:v7 dataQuota:v8 dataUsed:v9 hasDataToSync:v10 isCurrentUser:v4];
  return v11;
}

@end
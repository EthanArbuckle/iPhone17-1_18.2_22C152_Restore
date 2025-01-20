@interface PDSCDUser
+ (id)fetchRequest;
+ (id)insertIntoManagedObjectContext:(id)a3;
+ (id)predicateForUserID:(id)a3 userType:(signed __int16)a4;
+ (id)userFromUser:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)user;
@end

@implementation PDSCDUser

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PDSCDUser"];
}

+ (id)predicateForUserID:(id)a3 userType:(signed __int16)a4
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"userID == %@ && userType == %d", a3, a4];
}

+ (id)insertIntoManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v6 = [v4 entityForName:@"PDSCDUser" inManagedObjectContext:v5];
  v7 = (void *)[objc_alloc((Class)a1) initWithEntity:v6 insertIntoManagedObjectContext:v5];

  return v7;
}

+ (id)userFromUser:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v6 = a3;
  v7 = [a1 insertIntoManagedObjectContext:a4];
  v8 = [v6 userID];
  [v7 setUserID:v8];

  uint64_t v9 = [v6 userType];
  [v7 setUserType:v9];
  return v7;
}

- (id)user
{
  if ([(PDSCDUser *)self userType] == 1)
  {
    id v3 = objc_alloc(MEMORY[0x263F5B9E0]);
    v4 = [(PDSCDUser *)self userID];
    id v5 = objc_msgSend(v3, "initWithUserID:userType:", v4, (char)-[PDSCDUser userType](self, "userType"));
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end
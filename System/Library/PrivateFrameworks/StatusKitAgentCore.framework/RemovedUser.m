@interface RemovedUser
+ (id)dateRemovedKeyPath;
+ (id)fetchRequest;
+ (id)handleKeyPath;
+ (id)predicateForHandle:(id)a3;
+ (id)predicateForHandleString:(id)a3;
+ (id)predicateForPresenceIdentifier:(id)a3;
+ (id)predicateForStatusTypeIdentifier:(id)a3;
+ (id)presenceIdentifierKeyPath;
+ (id)statusTypeIdentifierKeyPath;
@end

@implementation RemovedUser

+ (id)dateRemovedKeyPath
{
  return @"dateRemoved";
}

+ (id)handleKeyPath
{
  return @"removedHandle";
}

+ (id)statusTypeIdentifierKeyPath
{
  return @"statusTypeIdentifier";
}

+ (id)presenceIdentifierKeyPath
{
  return @"presenceIdentifier";
}

+ (id)predicateForHandle:(id)a3
{
  v4 = [a3 normalizedHandleString];
  v5 = [a1 predicateForHandleString:v4];

  return v5;
}

+ (id)predicateForHandleString:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[RemovedUser handleKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[RemovedUser statusTypeIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForPresenceIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[RemovedUser presenceIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RemovedUser"];
}

@end
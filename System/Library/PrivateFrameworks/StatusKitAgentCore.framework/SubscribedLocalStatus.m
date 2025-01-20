@interface SubscribedLocalStatus
+ (NSString)identifierKeyPath;
+ (NSString)idsIdentifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForSubscribedLocalStatusIDSIdentifier:(id)a3;
+ (id)predicateForSubscribedLocalStatusIdentifier:(id)a3;
+ (id)predicateForSubscribedLocalStatusIdentifier:(id)a3 idsIdentifier:(id)a4;
@end

@implementation SubscribedLocalStatus

+ (NSString)idsIdentifierKeyPath
{
  return (NSString *)@"idsIdentifier";
}

+ (NSString)identifierKeyPath
{
  return (NSString *)@"identifier";
}

+ (id)predicateForSubscribedLocalStatusIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[SubscribedLocalStatus identifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForSubscribedLocalStatusIDSIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[SubscribedLocalStatus idsIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForSubscribedLocalStatusIdentifier:(id)a3 idsIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x263F08A98];
  id v6 = a4;
  id v7 = a3;
  v8 = +[SubscribedLocalStatus idsIdentifierKeyPath];
  v9 = +[SubscribedLocalStatus identifierKeyPath];
  v10 = [v5 predicateWithFormat:@"%K == %@ AND %K == %@", v8, v6, v9, v7];

  return v10;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"SubscribedLocalStatus"];
}

@end
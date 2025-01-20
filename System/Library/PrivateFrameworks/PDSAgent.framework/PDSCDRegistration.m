@interface PDSCDRegistration
+ (id)activeRegistrations;
+ (id)activeRegistrationsForClientID:(id)a3;
+ (id)fetchRequest;
+ (id)insertIntoManagedObjectContext:(id)a3;
+ (id)pendingRegistrations;
+ (id)registrationFromEntry:(id)a3 insertIntoManagedObjectContext:(id)a4;
+ (id)registrationsForClientID:(id)a3;
+ (id)registrationsWithState:(unsigned __int8)a3;
+ (id)uniquenessPredicateForEntry:(id)a3;
- (id)entryWithUserCache:(id)a3;
@end

@implementation PDSCDRegistration

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PDSCDRegistration"];
}

+ (id)insertIntoManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v6 = [v4 entityForName:@"PDSCDRegistration" inManagedObjectContext:v5];
  v7 = (void *)[objc_alloc((Class)a1) initWithEntity:v6 insertIntoManagedObjectContext:v5];

  return v7;
}

+ (id)registrationFromEntry:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  v6 = +[PDSCDRegistration insertIntoManagedObjectContext:a4];
  objc_msgSend(v6, "setEntryState:", objc_msgSend(v5, "state"));
  v7 = [v5 registration];
  objc_msgSend(v6, "setEnvironment:", objc_msgSend(v7, "pushEnvironment"));

  v8 = [v5 registration];
  v9 = [v8 topicString];
  [v6 setTopic:v9];

  v10 = [v5 registration];
  v11 = [v10 qualifierString];
  [v6 setQualifier:v11];

  v12 = [v5 clientID];

  [v6 setClientID:v12];
  return v6;
}

+ (id)pendingRegistrations
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"entryState != %d", 3);
}

+ (id)activeRegistrations
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"entryState != %d", 2);
}

+ (id)activeRegistrationsForClientID:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"clientID == %@ && entryState != %d", a3, 2];
}

+ (id)registrationsForClientID:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"clientID == %@", a3];
}

+ (id)registrationsWithState:(unsigned __int8)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"entryState == %d", a3);
}

+ (id)uniquenessPredicateForEntry:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  id v5 = [v4 registration];
  v6 = [v5 qualifierString];
  v7 = [v4 registration];
  v8 = [v7 topicString];
  v9 = [v4 registration];

  v10 = [v3 predicateWithFormat:@"qualifier == %@ && topic == %@ && environment == %d", v6, v8, (int)objc_msgSend(v9, "pushEnvironment")];

  return v10;
}

- (id)entryWithUserCache:(id)a3
{
  id v4 = a3;
  id v5 = [(PDSCDRegistration *)self user];
  v6 = [v5 userID];
  v7 = [v4 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = [(PDSCDRegistration *)self user];
    v7 = [v8 user];

    if (!v7)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_9;
    }
    v9 = [v7 userID];
    [v4 setObject:v7 forKeyedSubscript:v9];
  }
  if ([(PDSCDRegistration *)self environment] != 1
    && [(PDSCDRegistration *)self environment]
    || ([(PDSCDRegistration *)self entryState] & 0x80000000) != 0
    || (int)[(PDSCDRegistration *)self entryState] > 3)
  {
    goto LABEL_8;
  }
  id v12 = objc_alloc(MEMORY[0x263F5B9D0]);
  v13 = [(PDSCDRegistration *)self topic];
  v14 = [(PDSCDRegistration *)self qualifier];
  v15 = objc_msgSend(v12, "initWithTopic:qualifier:pushEnvironment:", v13, v14, (char)-[PDSCDRegistration environment](self, "environment"));

  id v16 = objc_alloc(MEMORY[0x263F5B9C8]);
  v17 = [(PDSCDRegistration *)self clientID];
  v10 = (void *)[v16 initWithUser:v7 registration:v15 clientID:v17];

  LODWORD(v17) = [v10 state];
  if (v17 != [(PDSCDRegistration *)self entryState])
  {
    uint64_t v18 = objc_msgSend(v10, "entryWithUpdatedState:", -[PDSCDRegistration entryState](self, "entryState"));

    v10 = (void *)v18;
  }

LABEL_9:
  return v10;
}

@end
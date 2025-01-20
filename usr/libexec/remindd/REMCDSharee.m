@interface REMCDSharee
+ (BOOL)isAbstract;
+ (BOOL)shouldSyncToCloud;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (void)debug_lowLevelRemoveFromParent;
@end

@implementation REMCDSharee

+ (BOOL)shouldSyncToCloud
{
  return 0;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMSharee cdEntityName];
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = [(REMCDSharee *)self list];
  unsigned __int8 v6 = [v5 isConnectedToAccountObject:v4];

  return v6;
}

- (void)debug_lowLevelRemoveFromParent
{
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDSharee"];
}

@end
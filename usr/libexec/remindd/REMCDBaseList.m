@interface REMCDBaseList
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDBaseList

+ (BOOL)isAbstract
{
  return 1;
}

+ (id)cdEntityName
{
  return @"REMCDBaseList";
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDBaseList"];
}

@end
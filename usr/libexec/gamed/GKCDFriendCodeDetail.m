@interface GKCDFriendCodeDetail
+ (id)fetchRequest;
@end

@implementation GKCDFriendCodeDetail

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDFriendCodeDetail"];
}

@end
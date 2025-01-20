@interface KTSMTFailure
+ (id)fetchRequest;
@end

@implementation KTSMTFailure

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTSMTFailure"];
}

@end
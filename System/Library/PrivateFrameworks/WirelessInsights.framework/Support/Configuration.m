@interface Configuration
+ (id)fetchRequest;
@end

@implementation Configuration

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"Configuration"];
}

@end
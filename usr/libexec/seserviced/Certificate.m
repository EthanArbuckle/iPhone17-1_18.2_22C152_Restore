@interface Certificate
+ (id)fetchRequest;
@end

@implementation Certificate

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"Certificate"];
}

@end
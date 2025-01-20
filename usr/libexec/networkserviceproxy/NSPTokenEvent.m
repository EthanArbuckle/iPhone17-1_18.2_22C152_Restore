@interface NSPTokenEvent
+ (id)fetchRequest;
@end

@implementation NSPTokenEvent

+ (id)fetchRequest
{
  id v2 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"NSPTokenEvent"];

  return v2;
}

@end
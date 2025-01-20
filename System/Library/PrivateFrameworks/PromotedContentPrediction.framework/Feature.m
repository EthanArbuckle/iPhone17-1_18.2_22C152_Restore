@interface Feature
+ (id)fetchRequest;
@end

@implementation Feature

+ (id)fetchRequest
{
  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x1E4F1C0D0], a2, @"Feature");
}

@end
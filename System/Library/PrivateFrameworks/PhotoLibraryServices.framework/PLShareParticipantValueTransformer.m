@interface PLShareParticipantValueTransformer
+ (NSArray)allowedTopLevelClasses;
@end

@implementation PLShareParticipantValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PLShareParticipantValueTransformer;
  v4 = objc_msgSendSuper2(&v7, sel_allowedTopLevelClasses);
  v5 = (void *)[v3 initWithArray:v4];

  [v5 addObject:objc_opt_class()];
  return (NSArray *)v5;
}

@end
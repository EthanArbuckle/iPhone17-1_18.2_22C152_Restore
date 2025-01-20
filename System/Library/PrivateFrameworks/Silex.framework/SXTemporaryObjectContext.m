@interface SXTemporaryObjectContext
+ (id)temporaryObjectContext;
@end

@implementation SXTemporaryObjectContext

+ (id)temporaryObjectContext
{
  id v2 = objc_alloc_init(MEMORY[0x263F7C708]);
  v3 = [(TSPObjectContext *)[SXTemporaryObjectContext alloc] initWithDelegate:v2];

  return v3;
}

@end
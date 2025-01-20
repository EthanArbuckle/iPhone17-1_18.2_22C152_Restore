@interface CUIShapeEffectStack
+ (void)ic_initializeInBackground;
@end

@implementation CUIShapeEffectStack

+ (void)ic_initializeInBackground
{
  v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &stru_1006268B0);
}

@end
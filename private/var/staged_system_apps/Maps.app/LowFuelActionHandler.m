@interface LowFuelActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation LowFuelActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[SearchSession performSearchForEngineType:withObserver:](SearchSession, "performSearchForEngineType:withObserver:", [v4 engineType], 0);
  }
}

@end
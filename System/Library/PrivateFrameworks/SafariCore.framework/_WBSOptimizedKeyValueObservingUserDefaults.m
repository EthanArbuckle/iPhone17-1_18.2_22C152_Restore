@interface _WBSOptimizedKeyValueObservingUserDefaults
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
@end

@implementation _WBSOptimizedKeyValueObservingUserDefaults

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

@end
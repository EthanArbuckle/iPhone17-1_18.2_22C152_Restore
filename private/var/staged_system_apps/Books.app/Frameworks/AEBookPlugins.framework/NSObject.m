@interface NSObject
+ (void)replaceClassSelector:(SEL)a3 withSelector:(SEL)a4;
+ (void)replaceInstanceSelector:(SEL)a3 withSelector:(SEL)a4;
- (id)_axAssociatedObjectForKey:(id)a3;
- (void)_axSetAssociatedObject:(id)a3 forKey:(id)a4;
@end

@implementation NSObject

+ (void)replaceClassSelector:(SEL)a3 withSelector:(SEL)a4
{
}

+ (void)replaceInstanceSelector:(SEL)a3 withSelector:(SEL)a4
{
}

- (id)_axAssociatedObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(self, [v4 hash]);

  return v5;
}

- (void)_axSetAssociatedObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id value = a3;
  objc_setAssociatedObject(self, [v6 hash], value, (char *)&dword_0 + 1);
}

@end
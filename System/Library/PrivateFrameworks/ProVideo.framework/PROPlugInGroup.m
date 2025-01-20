@interface PROPlugInGroup
+ (id)allocWithZone:(_NSZone *)a3;
- (PROPlugInGroup)initWithUUID:(__CFUUID *)a3 name:(id)a4 bundle:(id)a5;
- (__CFUUID)uuid;
- (id)displayName;
- (id)name;
- (id)plugIns;
- (id)plugInsForProtocols:(id)a3;
- (void)addPlugIn:(id)a3;
- (void)removePlugIn:(id)a3;
@end

@implementation PROPlugInGroup

+ (id)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1) {
    v4 = (objc_class *)objc_opt_class();
  }

  return NSAllocateObject(v4, 0, a3);
}

- (PROPlugInGroup)initWithUUID:(__CFUUID *)a3 name:(id)a4 bundle:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"*** Bad news! %@ send to abstract class %@!", v8, objc_opt_class() format];
  v9 = self;
  return 0;
}

- (void)addPlugIn:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (void)removePlugIn:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (id)name
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)displayName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)plugIns
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (__CFUUID)uuid
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)plugInsForProtocols:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

@end
@interface PROPlugIn
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)is3rdParty;
- (BOOL)isBlocked;
- (BOOL)isEqualToPlugIn:(id)a3;
- (Class)plugInClass;
- (PROPlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5;
- (__CFUUID)uuid;
- (id)apiUsedByPlugInForProtocol:(id)a3;
- (id)blockedLookupKey;
- (id)bundle;
- (id)className;
- (id)delegate;
- (id)displayName;
- (id)group;
- (id)helpURL;
- (id)implementedProtocols;
- (id)infoDictionary;
- (id)infoString;
- (id)plugInInstance;
- (id)pluginKitPlug;
- (id)sharedPlugInInstance;
- (id)version;
- (void)setBlockedLookupKey:(id)a3 pluginName:(id)a4 version:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setIsBlocked:(BOOL)a3;
@end

@implementation PROPlugIn

+ (id)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1) {
    v4 = (objc_class *)objc_opt_class();
  }

  return NSAllocateObject(v4, 0, a3);
}

- (PROPlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"*** Bad news! %@ send to abstract class %@!", v7, objc_opt_class() format];
  return 0;
}

- (id)bundle
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)infoDictionary
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)delegate
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)plugInInstance
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)sharedPlugInInstance
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (Class)plugInClass
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)className
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (__CFUUID)uuid
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)group
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)displayName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)helpURL
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)version
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)infoString
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)implementedProtocols
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)pluginKitPlug
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (BOOL)isBlocked
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)blockedLookupKey
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)apiUsedByPlugInForProtocol:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (void)setDelegate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (BOOL)isEqualToPlugIn:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (BOOL)is3rdParty
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (void)setIsBlocked:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (void)setBlockedLookupKey:(id)a3 pluginName:(id)a4 version:(id)a5
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"*** Bad news! %@ send to abstract class %@!", v7, objc_opt_class() format];
}

@end
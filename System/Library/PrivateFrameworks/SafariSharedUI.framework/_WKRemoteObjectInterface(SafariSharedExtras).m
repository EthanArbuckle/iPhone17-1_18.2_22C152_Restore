@interface _WKRemoteObjectInterface(SafariSharedExtras)
+ (uint64_t)safari_javaScriptClasses;
@end

@implementation _WKRemoteObjectInterface(SafariSharedExtras)

+ (uint64_t)safari_javaScriptClasses
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
}

@end
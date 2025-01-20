@interface _SFSavedAccountTouchIconRequest
+ (id)requestWithURL:(id)a3 minimumIconSize:(CGSize)a4 maximumIconSize:(CGSize)a5 options:(unint64_t)a6;
@end

@implementation _SFSavedAccountTouchIconRequest

+ (id)requestWithURL:(id)a3 minimumIconSize:(CGSize)a4 maximumIconSize:(CGSize)a5 options:(unint64_t)a6
{
  return (id)objc_msgSend(a1, "requestWithTitle:url:minimumIconSize:maximumIconSize:options:", 0, a3, a6, a4.width, a4.height, a5.width, a5.height);
}

@end
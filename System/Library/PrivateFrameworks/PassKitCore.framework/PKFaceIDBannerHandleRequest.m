@interface PKFaceIDBannerHandleRequest
+ (BOOL)supportsSecureCoding;
+ (id)create;
@end

@implementation PKFaceIDBannerHandleRequest

+ (id)create
{
  id result = [PKFaceIDBannerHandleRequest alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PKBannerHandleRequest;
    id result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      *((void *)result + 1) = 1;
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
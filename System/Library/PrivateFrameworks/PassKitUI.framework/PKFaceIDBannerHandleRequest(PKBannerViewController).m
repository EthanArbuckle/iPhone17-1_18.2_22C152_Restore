@interface PKFaceIDBannerHandleRequest(PKBannerViewController)
- (void)createBannerViewController;
@end

@implementation PKFaceIDBannerHandleRequest(PKBannerViewController)

- (void)createBannerViewController
{
  self;
  v0 = [PKFaceIDBannerViewController alloc];
  if (!v0) {
    return 0;
  }
  v5.receiver = v0;
  v5.super_class = (Class)PKFaceIDBannerViewController;
  v1 = objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.192 green:0.82 blue:0.345 alpha:1.0];
    v3 = (void *)v1[132];
    v1[132] = v2;

    v1[128] = 0;
    v1[125] = *MEMORY[0x1E4FB2748];
  }
  return v1;
}

@end
@interface VUIAppStoreReviewWrapper
+ (void)requestReview:(id)a3;
- (VUIAppStoreReviewWrapper)init;
@end

@implementation VUIAppStoreReviewWrapper

+ (void)requestReview:(id)a3
{
  id v3 = a3;
  static AppStoreReviewWrapper.requestReview(_:)();
}

- (VUIAppStoreReviewWrapper)init
{
  return (VUIAppStoreReviewWrapper *)AppStoreReviewWrapper.init()();
}

@end
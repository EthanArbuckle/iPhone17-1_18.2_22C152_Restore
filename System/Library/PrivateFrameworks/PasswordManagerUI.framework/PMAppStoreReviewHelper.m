@interface PMAppStoreReviewHelper
- (void)attemptToRequestReview:(id)a3;
@end

@implementation PMAppStoreReviewHelper

- (void)attemptToRequestReview:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v4 = (void *)getSKStoreReviewControllerClass_softClass;
  uint64_t v10 = getSKStoreReviewControllerClass_softClass;
  if (!getSKStoreReviewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getSKStoreReviewControllerClass_block_invoke;
    v6[3] = &unk_265439EF8;
    v6[4] = &v7;
    __getSKStoreReviewControllerClass_block_invoke((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v7, 8);
  [v5 requestReviewInScene:v3];
}

@end
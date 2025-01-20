@interface UIFeedbackPreferences
@end

@implementation UIFeedbackPreferences

void __43___UIFeedbackPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB2604A8;
  qword_1EB2604A8 = (uint64_t)v1;
}

void __49___UIFeedbackPreferences__startObservingDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) _defaultKeyForCategoryKey:a2 type:a3];
  [*(id *)(*(void *)(a1 + 32) + 24) addObserver:*(void *)(a1 + 32) forKeyPath:v4 options:0 context:0];
}

@end
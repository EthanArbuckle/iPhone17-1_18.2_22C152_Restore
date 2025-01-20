@interface FCHeadlineFeatureArticleTypeFlint
+ (id)articleTypeFlintFeature;
- (FCHeadlineFeatureArticleTypeFlint)init;
@end

@implementation FCHeadlineFeatureArticleTypeFlint

+ (id)articleTypeFlintFeature
{
  if (qword_1EB5D06B8 != -1) {
    dispatch_once(&qword_1EB5D06B8, &__block_literal_global_234);
  }
  v2 = (void *)qword_1EB5D06B0;
  return v2;
}

uint64_t __60__FCHeadlineFeatureArticleTypeFlint_articleTypeFlintFeature__block_invoke()
{
  v0 = objc_alloc_init(FCHeadlineFeatureArticleTypeFlint);
  uint64_t v1 = qword_1EB5D06B0;
  qword_1EB5D06B0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCHeadlineFeatureArticleTypeFlint)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCHeadlineFeatureArticleTypeFlint;
  v2 = [(FCPersonalizationFeature *)&v6 init];
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)@"f1";
  }
  return v3;
}

@end
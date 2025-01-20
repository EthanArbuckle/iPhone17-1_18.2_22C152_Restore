@interface FCHeadlineFeatureArticleTypeNonFlint
+ (id)articleTypeNonFlintFeature;
- (FCHeadlineFeatureArticleTypeNonFlint)init;
@end

@implementation FCHeadlineFeatureArticleTypeNonFlint

+ (id)articleTypeNonFlintFeature
{
  if (qword_1EB5D06C8[0] != -1) {
    dispatch_once(qword_1EB5D06C8, &__block_literal_global_245);
  }
  v2 = (void *)qword_1EB5D06C0;
  return v2;
}

uint64_t __66__FCHeadlineFeatureArticleTypeNonFlint_articleTypeNonFlintFeature__block_invoke()
{
  v0 = objc_alloc_init(FCHeadlineFeatureArticleTypeNonFlint);
  uint64_t v1 = qword_1EB5D06C0;
  qword_1EB5D06C0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCHeadlineFeatureArticleTypeNonFlint)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCHeadlineFeatureArticleTypeNonFlint;
  v2 = [(FCPersonalizationFeature *)&v6 init];
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)@"f2";
  }
  return v3;
}

@end
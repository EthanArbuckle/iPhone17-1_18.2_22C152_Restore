@interface FCHeadlineFeatureArticleWithVideoContent
+ (id)articleWithVideoContentFeature;
- (FCHeadlineFeatureArticleWithVideoContent)init;
@end

@implementation FCHeadlineFeatureArticleWithVideoContent

+ (id)articleWithVideoContentFeature
{
  if (qword_1EB5D0678 != -1) {
    dispatch_once(&qword_1EB5D0678, &__block_literal_global_162);
  }
  v2 = (void *)qword_1EB5D0670;
  return v2;
}

uint64_t __74__FCHeadlineFeatureArticleWithVideoContent_articleWithVideoContentFeature__block_invoke()
{
  v0 = objc_alloc_init(FCHeadlineFeatureArticleWithVideoContent);
  uint64_t v1 = qword_1EB5D0670;
  qword_1EB5D0670 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCHeadlineFeatureArticleWithVideoContent)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCHeadlineFeatureArticleWithVideoContent;
  v2 = [(FCPersonalizationFeature *)&v6 init];
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)@"f7";
  }
  return v3;
}

@end
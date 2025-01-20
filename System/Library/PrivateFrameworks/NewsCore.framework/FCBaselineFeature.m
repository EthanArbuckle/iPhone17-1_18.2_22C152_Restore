@interface FCBaselineFeature
+ (id)baselineFeature;
- (FCBaselineFeature)init;
@end

@implementation FCBaselineFeature

+ (id)baselineFeature
{
  if (qword_1EB5D0668 != -1) {
    dispatch_once(&qword_1EB5D0668, &__block_literal_global_152);
  }
  v2 = (void *)qword_1EB5D0660;
  return v2;
}

uint64_t __36__FCBaselineFeature_baselineFeature__block_invoke()
{
  v0 = objc_alloc_init(FCBaselineFeature);
  uint64_t v1 = qword_1EB5D0660;
  qword_1EB5D0660 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCBaselineFeature)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCBaselineFeature;
  v2 = [(FCPersonalizationFeature *)&v6 init];
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)@"f0";
  }
  return v3;
}

@end
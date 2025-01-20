@interface NTKUpNextNewsSampleDataSource
+ (id)_newCircularTemplate;
+ (id)bundleIdentifier;
+ (id)sampleContent;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NTKUpNextNewsSampleDataSource

+ (id)_newCircularTemplate
{
  if (_newCircularTemplate_onceToken != -1) {
    dispatch_once(&_newCircularTemplate_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)_newCircularTemplate_template;
  return (id)[v2 copy];
}

void __53__NTKUpNextNewsSampleDataSource__newCircularTemplate__block_invoke()
{
  if (NewsServicesLibraryCore_0())
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2050000000;
    v0 = (void *)getNSSComplicationDataSourceClass_softClass_0;
    uint64_t v8 = getNSSComplicationDataSourceClass_softClass_0;
    if (!getNSSComplicationDataSourceClass_softClass_0)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __getNSSComplicationDataSourceClass_block_invoke_0;
      v4[3] = &unk_1E62C16C0;
      v4[4] = &v5;
      __getNSSComplicationDataSourceClass_block_invoke_0((uint64_t)v4);
      v0 = (void *)v6[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v5, 8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v2 = objc_msgSend(v1, "nss_newsComplicationTemplateForFamily:compact:", 10, 0);
      v3 = (void *)_newCircularTemplate_template;
      _newCircularTemplate_template = v2;
    }
  }
}

+ (id)bundleIdentifier
{
  return +[NTKUpNextNewsDataSource bundleIdentifier];
}

- (id)supportedSections
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F94A10];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)sampleContent
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F94910]);
  NTKImageNamed(@"SG_news");
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a4;
  uint64_t v5 = REUISampleRelevanceProviderForSamplePosition();
  id v6 = objc_alloc(MEMORY[0x1E4F94920]);
  uint64_t v7 = +[NTKUpNextNewsSampleDataSource sampleContent];
  v12[0] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9 = (void *)[v6 initWithIdentifier:@"news.sample" content:v7 action:0 relevanceProviders:v8];

  v11 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v4[2](v4, v10);
}

@end
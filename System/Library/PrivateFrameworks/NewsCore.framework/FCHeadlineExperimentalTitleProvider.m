@interface FCHeadlineExperimentalTitleProvider
+ (BOOL)isDebugModeEnabled;
- (BOOL)shouldShowAlternateHeadlines;
- (FCHeadlineExperimentalTitleProvider)initWithShouldShowAlternateHeadlines:(BOOL)a3;
- (NSString)feldsparID;
- (id)_debugHeadlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5;
- (id)_headlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5;
- (id)headlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5;
- (id)metadataForDefaultHeadlineWithTitle:(id)a3;
- (void)setShouldShowAlternateHeadlines:(BOOL)a3;
@end

@implementation FCHeadlineExperimentalTitleProvider

- (id)headlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (+[FCHeadlineExperimentalTitleProvider isDebugModeEnabled])
  {
    [(FCHeadlineExperimentalTitleProvider *)self _debugHeadlineMetadataFromTitle:v10 fromExperimentalTitles:v9 forArticleID:v8];
  }
  else
  {
    [(FCHeadlineExperimentalTitleProvider *)self _headlineMetadataFromTitle:v10 fromExperimentalTitles:v9 forArticleID:v8];
  v11 = };

  return v11;
}

+ (BOOL)isDebugModeEnabled
{
  if (qword_1EB5D1B10 != -1) {
    dispatch_once(&qword_1EB5D1B10, &__block_literal_global_168);
  }
  return _MergedGlobals_218;
}

- (id)_headlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(FCHeadlineExperimentalTitleProvider *)self shouldShowAlternateHeadlines]
    || ![v9 count]
    || ([(FCHeadlineExperimentalTitleProvider *)self feldsparID],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    id v24 = v8;
    v20 = -[FCHeadlineExperimentalTitleProvider metadataForDefaultHeadlineWithTitle:](self, "metadataForDefaultHeadlineWithTitle:", v24, v23, 3221225472, __102__FCHeadlineExperimentalTitleProvider__headlineMetadataFromTitle_fromExperimentalTitles_forArticleID___block_invoke, &unk_1E5B5AEC0, self);

    goto LABEL_8;
  }
  id v12 = v8;
  uint64_t v13 = [v9 count];
  if (v13 == 1)
  {
    uint64_t v18 = [v9 objectAtIndexedSubscript:0];

    unint64_t v17 = 0;
    if ([v12 isEqualToString:v18]) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = 6;
    }
  }
  else
  {
    if ((unint64_t)[v9 count] < 2)
    {
      v22 = [(FCHeadlineExperimentalTitleProvider *)self metadataForDefaultHeadlineWithTitle:v12];
      goto LABEL_16;
    }
    v14 = [(FCHeadlineExperimentalTitleProvider *)self feldsparID];
    uint64_t v15 = [v14 hash];
    unint64_t v16 = [v10 hash] ^ v15;
    unint64_t v17 = v16 % [v9 count];

    uint64_t v18 = [v9 objectAtIndexedSubscript:v17];

    uint64_t v19 = 3;
  }
  id v12 = (id)v18;
  v22 = [[FCHeadlineExperimentalTitleMetadata alloc] initWithChosenTitle:v18 isTitleExperimental:v13 != 1 arrayIndexUsedforTitle:v17 treatmentState:v19];
LABEL_16:
  v20 = v22;

LABEL_8:
  return v20;
}

- (BOOL)shouldShowAlternateHeadlines
{
  return self->_shouldShowAlternateHeadlines;
}

- (id)metadataForDefaultHeadlineWithTitle:(id)a3
{
  id v3 = a3;
  v4 = [[FCHeadlineExperimentalTitleMetadata alloc] initWithChosenTitle:v3 isTitleExperimental:0 arrayIndexUsedforTitle:0 treatmentState:1];

  return v4;
}

- (void).cxx_destruct
{
}

void __57__FCHeadlineExperimentalTitleProvider_isDebugModeEnabled__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_218 = [v0 BOOLForKey:@"debug_alternate_headline_preference_key"];
  }
  else
  {
    _MergedGlobals_218 = 0;
  }
}

- (FCHeadlineExperimentalTitleProvider)initWithShouldShowAlternateHeadlines:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FCHeadlineExperimentalTitleProvider;
  v4 = [(FCHeadlineExperimentalTitleProvider *)&v10 init];
  if (v4)
  {
    v5 = +[FCFeldsparIDProvider sharedInstance];
    v6 = [v5 feldsparID];
    uint64_t v7 = [v6 copy];
    feldsparID = v4->_feldsparID;
    v4->_feldsparID = (NSString *)v7;

    v4->_shouldShowAlternateHeadlines = +[FCHeadlineExperimentalTitleProvider isDebugModeEnabled]|| a3;
  }
  return v4;
}

uint64_t __102__FCHeadlineExperimentalTitleProvider__headlineMetadataFromTitle_fromExperimentalTitles_forArticleID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) metadataForDefaultHeadlineWithTitle:*(void *)(a1 + 40)];
}

- (id)_debugHeadlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9)
  {
    id v22 = v10;
    uint64_t v23 = self;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = [NSString stringWithFormat:@"*%@", *(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    id v10 = v22;
    self = v23;
  }
  else
  {
    uint64_t v18 = 1;
    do
    {
      uint64_t v19 = [NSString stringWithFormat:@"%d %@", v18, v8];
      [v11 addObject:v19];

      uint64_t v18 = (v18 + 1);
    }
    while (v18 != 8);
  }
  v20 = [(FCHeadlineExperimentalTitleProvider *)self _headlineMetadataFromTitle:v8 fromExperimentalTitles:v11 forArticleID:v10];

  return v20;
}

- (NSString)feldsparID
{
  return self->_feldsparID;
}

- (void)setShouldShowAlternateHeadlines:(BOOL)a3
{
  self->_shouldShowAlternateHeadlines = a3;
}

@end
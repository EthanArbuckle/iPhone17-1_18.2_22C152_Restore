@interface SBIconLabelViewDefaultFactory
+ (id)sharedInstance;
+ (void)configureLabelImageParametersBuilder:(id)a3;
- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6;
- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5;
- (SBIconLabelViewDefaultFactory)initWithFactoryIdentifier:(id)a3;
- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5;
- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6;
@end

@implementation SBIconLabelViewDefaultFactory

- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_defaultIconLabelViewFactory;
  return v2;
}

- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6
{
  id v10 = a3;
  [(SBIconLabelViewDefaultFactory *)self canUseIconSimpleLabelViewToDisplayLabelWithSettings:a4 imageParameters:a5 forIconView:a6];
  v11 = self;
  LOBYTE(a5) = objc_opt_isKindOfClass();

  return a5 & 1;
}

- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v6 = a4;
  if ([a3 style]) {
    LOBYTE(v7) = 0;
  }
  else {
    BOOL v7 = !+[SBIconLabelImage needsLegibilityImageForParameters:v6];
  }

  return v7;
}

void __47__SBIconLabelViewDefaultFactory_sharedInstance__block_invoke()
{
  v0 = [[SBIconLabelViewDefaultFactory alloc] initWithFactoryIdentifier:@"Default SBIconLabelViewDefaultFactory"];
  v1 = (void *)sharedInstance_defaultIconLabelViewFactory;
  sharedInstance_defaultIconLabelViewFactory = (uint64_t)v0;
}

- (SBIconLabelViewDefaultFactory)initWithFactoryIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBIconLabelViewDefaultFactory;
  v5 = [(SBIconLabelViewDefaultFactory *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    BOOL v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"(SBIconLabelViewDefaultFactory no identifier specified!)";
    }
    objc_storeStrong((id *)&v5->_factoryIdentifier, v8);

    id v9 = objc_alloc(MEMORY[0x1E4FA7C98]);
    id v10 = [v4 stringByAppendingString:@"-LegibilityEngine"];
    uint64_t v11 = [v9 initWithEngineIdentifier:v10];
    engine = v5->_engine;
    v5->_engine = (SBUILegibilityEngine *)v11;

    [(SBUILegibilityEngine *)v5->_engine setUseMinFillHeightForTemplateGeneration:1];
  }

  return v5;
}

- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([(SBIconLabelViewDefaultFactory *)self canUseIconSimpleLabelViewToDisplayLabelWithSettings:v8 imageParameters:v10 forIconView:v9])
  {
    uint64_t v11 = [[SBIconSimpleLabelView alloc] initWithSettings:v8];
  }
  else
  {
    uint64_t v11 = [[SBIconLegibilityLabelView alloc] initWithSettings:v8 legibilityEngine:self->_engine];
    [(SBIconSimpleLabelView *)v11 setBackfillTemplateResults:1];
  }
  [(SBIconSimpleLabelView *)v11 setUserInteractionEnabled:0];
  [(SBIconSimpleLabelView *)v11 setIconView:v9];

  [(SBIconSimpleLabelView *)v11 updateIconLabelWithSettings:v8 imageParameters:v10];
  return v11;
}

+ (void)configureLabelImageParametersBuilder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v5 = [v3 whiteColor];
  [v4 setFallbackTextColor:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoryIdentifier, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
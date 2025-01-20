@interface SBIconLabelViewSimpleFactory
+ (id)sharedInstance;
- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6;
- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5;
- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5;
@end

@implementation SBIconLabelViewSimpleFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_81 != -1) {
    dispatch_once(&sharedInstance_onceToken_81, &__block_literal_global_83);
  }
  v2 = (void *)sharedInstance_simpleIconLabelViewFactory;
  return v2;
}

void __46__SBIconLabelViewSimpleFactory_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_simpleIconLabelViewFactory;
  sharedInstance_simpleIconLabelViewFactory = v0;
}

- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[SBIconSimpleLabelView alloc] initWithSettings:v9];
  [(SBIconSimpleLabelView *)v10 setUserInteractionEnabled:0];
  [(SBIconSimpleLabelView *)v10 setIconView:v7];

  [(SBIconSimpleLabelView *)v10 updateIconLabelWithSettings:v9 imageParameters:v8];
  return v10;
}

- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6
{
  id v6 = a3;
  id v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  return 1;
}

@end
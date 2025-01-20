@interface SBIconLabelViewPrewarmFactory
+ (id)sharedInstance;
- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6;
- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5;
- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5;
@end

@implementation SBIconLabelViewPrewarmFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_90 != -1) {
    dispatch_once(&sharedInstance_onceToken_90, &__block_literal_global_92);
  }
  v2 = (void *)sharedInstance_simpleIconLabelViewFactory_89;
  return v2;
}

void __47__SBIconLabelViewPrewarmFactory_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_simpleIconLabelViewFactory_89;
  sharedInstance_simpleIconLabelViewFactory_89 = v0;
}

- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  prewarmSimpleLabelView = self->_prewarmSimpleLabelView;
  if (!prewarmSimpleLabelView)
  {
    v12 = [[SBIconSimpleLabelView alloc] initWithSettings:v8];
    v13 = self->_prewarmSimpleLabelView;
    self->_prewarmSimpleLabelView = v12;

    [(SBIconSimpleLabelView *)self->_prewarmSimpleLabelView setUserInteractionEnabled:0];
    prewarmSimpleLabelView = self->_prewarmSimpleLabelView;
  }
  [(SBIconSimpleLabelView *)prewarmSimpleLabelView setIconView:v10];
  [(SBIconSimpleLabelView *)self->_prewarmSimpleLabelView updateIconLabelWithSettings:v8 imageParameters:v9];
  v14 = self->_prewarmSimpleLabelView;

  return v14;
}

- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6
{
  return self->_prewarmSimpleLabelView == a3;
}

- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
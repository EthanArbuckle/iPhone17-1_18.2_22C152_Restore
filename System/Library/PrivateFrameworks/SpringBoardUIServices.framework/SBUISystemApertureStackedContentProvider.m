@interface SBUISystemApertureStackedContentProvider
- (SBUISystemApertureContentViewContaining)contentContainer;
- (SBUISystemApertureStackedContentProvider)initWithContentViewProviders:(id)a3;
- (UIView)providedView;
- (double)contentSpacing;
- (id)_providedView;
- (int64_t)contentAxis;
- (int64_t)contentDistribution;
- (void)setContentAxis:(int64_t)a3;
- (void)setContentContainer:(id)a3;
- (void)setContentDistribution:(int64_t)a3;
- (void)setContentSpacing:(double)a3;
@end

@implementation SBUISystemApertureStackedContentProvider

- (SBUISystemApertureStackedContentProvider)initWithContentViewProviders:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBUISystemApertureStackedContentProvider.m", 22, @"Invalid parameter not satisfying: %@", @"contentViewProviders" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureStackedContentProvider;
  v6 = [(SBUISystemApertureStackedContentProvider *)&v12 init];
  if (v6)
  {
    v7 = objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_29);
    v8 = [[_SBUISystemApertureStackView alloc] initWithArrangedSubviews:v7];
    [(_SBUISystemApertureStackView *)v8 setDistribution:1];
    [(_SBUISystemApertureStackView *)v8 setAlignment:0];
    [(_SBUISystemApertureStackView *)v8 setAxis:0];
    [(_SBUISystemApertureStackView *)v8 setSpacing:SBUISystemApertureInterItemSpacing()];
    providedView = v6->_providedView;
    v6->_providedView = &v8->super.super;
  }
  return v6;
}

uint64_t __73__SBUISystemApertureStackedContentProvider_initWithContentViewProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 providedView];
}

- (int64_t)contentDistribution
{
  v2 = [(SBUISystemApertureStackedContentProvider *)self _providedView];
  int64_t v3 = [v2 distribution];

  return v3;
}

- (void)setContentDistribution:(int64_t)a3
{
  id v4 = [(SBUISystemApertureStackedContentProvider *)self _providedView];
  [v4 setDistribution:a3];
}

- (int64_t)contentAxis
{
  v2 = [(SBUISystemApertureStackedContentProvider *)self _providedView];
  int64_t v3 = [v2 axis];

  return v3;
}

- (void)setContentAxis:(int64_t)a3
{
  id v4 = [(SBUISystemApertureStackedContentProvider *)self _providedView];
  [v4 setAxis:a3];
}

- (double)contentSpacing
{
  v2 = [(SBUISystemApertureStackedContentProvider *)self _providedView];
  [v2 spacing];
  double v4 = v3;

  return v4;
}

- (void)setContentSpacing:(double)a3
{
  id v4 = [(SBUISystemApertureStackedContentProvider *)self _providedView];
  [v4 setSpacing:a3];
}

- (id)_providedView
{
  return self->_providedView;
}

- (UIView)providedView
{
  return self->_providedView;
}

- (SBUISystemApertureContentViewContaining)contentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  return (SBUISystemApertureContentViewContaining *)WeakRetained;
}

- (void)setContentContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_providedView, 0);
}

@end
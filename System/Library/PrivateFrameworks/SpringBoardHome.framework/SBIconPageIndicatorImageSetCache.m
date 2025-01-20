@interface SBIconPageIndicatorImageSetCache
- (_UILegibilitySettings)legibilitySettings;
- (id)_emptyPageIndicatorSet;
- (id)cameraIndicatorImageSetForLegibilitySettings:(id)a3;
- (id)pageIndicatorImageSetForLegibilitySettings:(id)a3;
- (id)searchIndicatorImageSetForLegibilitySettings:(id)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation SBIconPageIndicatorImageSetCache

- (void)setLegibilitySettings:(id)a3
{
  id v11 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v5 = [(SBIconPageIndicatorImageSetCache *)self _emptyPageIndicatorSet];
    indicatorImageSetResults = self->_indicatorImageSetResults;
    self->_indicatorImageSetResults = v5;

    v7 = [(SBIconPageIndicatorImageSetCache *)self _emptyPageIndicatorSet];
    searchImageSetResults = self->_searchImageSetResults;
    self->_searchImageSetResults = v7;

    v9 = [(SBIconPageIndicatorImageSetCache *)self _emptyPageIndicatorSet];
    cameraImageSetResults = self->_cameraImageSetResults;
    self->_cameraImageSetResults = v9;
  }
}

- (id)pageIndicatorImageSetForLegibilitySettings:(id)a3
{
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings != a3 || legibilitySettings == 0)
  {
    v5 = [(SBIconPageIndicatorImageSetCache *)self _emptyPageIndicatorSet];
  }
  else
  {
    v5 = self->_indicatorImageSetResults;
  }
  return v5;
}

- (id)searchIndicatorImageSetForLegibilitySettings:(id)a3
{
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings != a3 || legibilitySettings == 0)
  {
    v5 = [(SBIconPageIndicatorImageSetCache *)self _emptyPageIndicatorSet];
  }
  else
  {
    v5 = self->_searchImageSetResults;
  }
  return v5;
}

- (id)cameraIndicatorImageSetForLegibilitySettings:(id)a3
{
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings != a3 || legibilitySettings == 0)
  {
    v5 = [(SBIconPageIndicatorImageSetCache *)self _emptyPageIndicatorSet];
  }
  else
  {
    v5 = self->_cameraImageSetResults;
  }
  return v5;
}

- (id)_emptyPageIndicatorSet
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB21D8]) initWithImage:0 shadowImage:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB21D8]) initWithImage:0 shadowImage:0];
  v4 = [[SBIconPageIndicatorImageSetResult alloc] initWithIndicatorSet:v2 enabledIndicatorSet:v3];

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraImageSetResults, 0);
  objc_storeStrong((id *)&self->_searchImageSetResults, 0);
  objc_storeStrong((id *)&self->_indicatorImageSetResults, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
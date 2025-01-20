@interface SBIconPageIndicatorImageSetResult
- (SBIconPageIndicatorImageSetResult)initWithIndicatorSet:(id)a3 enabledIndicatorSet:(id)a4;
- (_UILegibilityImageSet)enabledPageIndicatorSet;
- (_UILegibilityImageSet)pageIndicatorSet;
@end

@implementation SBIconPageIndicatorImageSetResult

- (SBIconPageIndicatorImageSetResult)initWithIndicatorSet:(id)a3 enabledIndicatorSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBIconPageIndicatorImageSetResult;
  v9 = [(SBIconPageIndicatorImageSetResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pageIndicatorSet, a3);
    objc_storeStrong((id *)&v10->_enabledPageIndicatorSet, a4);
  }

  return v10;
}

- (_UILegibilityImageSet)pageIndicatorSet
{
  return self->_pageIndicatorSet;
}

- (_UILegibilityImageSet)enabledPageIndicatorSet
{
  return self->_enabledPageIndicatorSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledPageIndicatorSet, 0);
  objc_storeStrong((id *)&self->_pageIndicatorSet, 0);
}

@end
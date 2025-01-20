@interface SBCoverSheetSpotlightBackgroundView
- (SBCoverSheetSpotlightBackgroundView)init;
- (SBSearchBackdropView)searchBlurBackdropView;
- (double)spotlightBackgroundWeighting;
- (void)setSpotlightBackgroundWeighting:(double)a3;
@end

@implementation SBCoverSheetSpotlightBackgroundView

- (SBCoverSheetSpotlightBackgroundView)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBCoverSheetSpotlightBackgroundView;
  v2 = [(SBCoverSheetSpotlightBackgroundView *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA6470]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:style:", 3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    searchBlurBackdropView = v2->_searchBlurBackdropView;
    v2->_searchBlurBackdropView = (SBSearchBackdropView *)v4;

    [(SBSearchBackdropView *)v2->_searchBlurBackdropView bs_setHitTestingDisabled:1];
    [(SBSearchBackdropView *)v2->_searchBlurBackdropView setAutoresizingMask:18];
    [(SBSearchBackdropView *)v2->_searchBlurBackdropView prepareForTransitionToBlurred:1];
    [(SBCoverSheetSpotlightBackgroundView *)v2 addSubview:v2->_searchBlurBackdropView];
  }
  return v2;
}

- (double)spotlightBackgroundWeighting
{
  [(SBSearchBackdropView *)self->_searchBlurBackdropView transitionProgress];
  return result;
}

- (void)setSpotlightBackgroundWeighting:(double)a3
{
}

- (SBSearchBackdropView)searchBlurBackdropView
{
  return self->_searchBlurBackdropView;
}

- (void).cxx_destruct
{
}

@end
@interface SBSpotlightTransientOverlaySpotlightViewController
- (BOOL)_canShowWhileLocked;
- (unint64_t)level;
- (unint64_t)presentationSource;
- (unint64_t)remoteSearchViewPresentationSource;
- (void)setPresentationSource:(unint64_t)a3;
@end

@implementation SBSpotlightTransientOverlaySpotlightViewController

- (unint64_t)level
{
  return 2;
}

- (unint64_t)remoteSearchViewPresentationSource
{
  return self->_presentationSource;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

@end
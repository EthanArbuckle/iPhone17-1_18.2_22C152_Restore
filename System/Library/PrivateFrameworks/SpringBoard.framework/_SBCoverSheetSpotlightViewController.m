@interface _SBCoverSheetSpotlightViewController
- (BOOL)_canShowWhileLocked;
- (unint64_t)level;
- (unint64_t)remoteSearchViewPresentationSource;
@end

@implementation _SBCoverSheetSpotlightViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)level
{
  return 3;
}

- (unint64_t)remoteSearchViewPresentationSource
{
  return 7;
}

@end
@interface PULoadingIndicatorController
- (BOOL)shouldInvalidateLoadingIndicatorForAssetViewModelChange:(id)a3;
- (int64_t)loadingIndicatorStyleForAssetViewModel:(id)a3;
@end

@implementation PULoadingIndicatorController

- (BOOL)shouldInvalidateLoadingIndicatorForAssetViewModelChange:(id)a3
{
  id v3 = a3;
  v4 = +[PUOneUpSettings sharedInstance];
  int v5 = [v4 showLoadingIndicatorDuringDownload];

  if (v5 && ([v3 loadingStatusChanged] & 1) != 0 || (objc_msgSend(v3, "assetChanged") & 1) != 0) {
    char v6 = 1;
  }
  else {
    char v6 = [v3 isUpdatingDisplayedContentChanged];
  }

  return v6;
}

- (int64_t)loadingIndicatorStyleForAssetViewModel:(id)a3
{
  id v3 = a3;
  v4 = +[PUOneUpSettings sharedInstance];
  if ([v4 showLoadingIndicatorDuringDownload])
  {
    int v5 = [v3 loadingStatus];
    BOOL v6 = [v5 state] == 1;
  }
  else
  {

    BOOL v6 = 0;
  }
  v7 = [v3 asset];
  int v8 = [v7 isTemporaryPlaceholder];

  if (v8) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = v6;
  }
  if ([v3 isUpdatingDisplayedContent]) {
    int64_t v9 = 3;
  }

  return v9;
}

@end
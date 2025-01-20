@interface WFCompactThumbnailViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)contentHeightLikelyToChange;
- (WFCompactThumbnailViewControllerDelegate)delegate;
- (double)contentHeightForWidth:(double)a3;
- (unint64_t)preferredContentMode;
- (void)invalidateContentSize;
- (void)setDelegate:(id)a3;
@end

@implementation WFCompactThumbnailViewController

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (WFCompactThumbnailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFCompactThumbnailViewControllerDelegate *)WeakRetained;
}

- (BOOL)contentHeightLikelyToChange
{
  return self->_contentHeightLikelyToChange;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidateContentSize
{
  id v3 = [(WFCompactThumbnailViewController *)self delegate];
  [v3 thumbnailViewControllerDidInvalidateSize:self];
}

- (double)contentHeightForWidth:(double)a3
{
  return 0.0;
}

- (unint64_t)preferredContentMode
{
  return 0;
}

@end
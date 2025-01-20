@interface SearchUISnippetUIButtonViewController
- (BOOL)_canShowWhileLocked;
- (SearchUIButtonItemViewController)buttonViewController;
- (void)setButtonViewController:(id)a3;
@end

@implementation SearchUISnippetUIButtonViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SearchUIButtonItemViewController)buttonViewController
{
  return (SearchUIButtonItemViewController *)objc_getProperty(self, a2, 976, 1);
}

- (void)setButtonViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
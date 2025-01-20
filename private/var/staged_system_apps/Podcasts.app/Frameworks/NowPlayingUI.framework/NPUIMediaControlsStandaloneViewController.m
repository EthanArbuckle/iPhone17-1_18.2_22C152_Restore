@interface NPUIMediaControlsStandaloneViewController
- (NPUIMediaControlsStandaloneViewControllerDelegate)standaloneControlsDelegate;
- (void)mediaControlsViewController:(id)a3 didSelectRoute:(id)a4;
- (void)setStandaloneControlsDelegate:(id)a3;
@end

@implementation NPUIMediaControlsStandaloneViewController

- (void)setStandaloneControlsDelegate:(id)a3
{
  id obj = a3;
  id v4 = [(NPUIMediaControlsStandaloneViewController *)self standaloneControlsDelegate];

  if (v4 != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_standaloneControlsDelegate, obj);
    if (obj) {
      v6 = self;
    }
    else {
      v6 = 0;
    }
    [(NPUIMediaControlsStandaloneViewController *)self setDelegate:v6];
  }
}

- (void)mediaControlsViewController:(id)a3 didSelectRoute:(id)a4
{
  id v5 = a4;
  id v6 = [(NPUIMediaControlsStandaloneViewController *)self standaloneControlsDelegate];
  [v6 standaloneMediaControlsViewController:self didSelectRoute:v5];
}

- (NPUIMediaControlsStandaloneViewControllerDelegate)standaloneControlsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_standaloneControlsDelegate);

  return (NPUIMediaControlsStandaloneViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
@interface TSWPReferenceLibraryViewController
- (BOOL)shouldAutorotate;
- (TSWPReferenceLibraryViewControllerDelegate)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation TSWPReferenceLibraryViewController

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPReferenceLibraryViewController;
  [(TSWPReferenceLibraryViewController *)&v4 viewDidDisappear:a3];
  [(TSWPReferenceLibraryViewControllerDelegate *)self->_delegate referenceLibrarayViewControllerWasDismissed:self];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = (void *)[(TSWPReferenceLibraryViewController *)self presentingViewController];

  return [v2 supportedInterfaceOrientations];
}

- (TSWPReferenceLibraryViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPReferenceLibraryViewControllerDelegate *)a3;
}

@end
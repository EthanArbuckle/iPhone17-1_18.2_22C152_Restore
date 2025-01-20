@interface CACCorrectionsPresentationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (CACCorrectionsCandidatesViewController)correctionViewController;
- (CACCorrectionsPresentationDelegate)delegate;
- (CACCorrectionsPresentationViewController)init;
- (CACPopoverPresentingViewController)popoverPresentingViewController;
- (CGRect)portraitUpSourceRect;
- (NSArray)alternatives;
- (NSArray)emojis;
- (NSString)text;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)zOrder;
- (void)correctionsCandidatesViewController:(id)a3 didSelectItemWithText:(id)a4;
- (void)dismissCorrectionsCandidatesViewController:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setCorrectionViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojis:(id)a3;
- (void)setPopoverPresentingViewController:(id)a3;
- (void)setPortraitUpSourceRect:(CGRect)a3;
- (void)setText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CACCorrectionsPresentationViewController

- (CACCorrectionsPresentationViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CACCorrectionsPresentationViewController;
  v2 = [(CACCorrectionsPresentationViewController *)&v11 init];
  if (v2)
  {
    v3 = (CACCorrectionsCandidatesViewController *)objc_opt_new();
    [(CACCorrectionsCandidatesViewController *)v3 setDelegate:v2];
    v4 = (CACPopoverPresentingViewController *)objc_opt_new();
    [(CACPopoverPresentingViewController *)v4 setPopoverPresentationDelegate:v2];
    v5 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
    [v5 setNavigationBarHidden:1];
    [(CACPopoverPresentingViewController *)v4 setViewControllerInPopover:v5];
    [(CACPopoverPresentingViewController *)v4 setPermittedArrowDirections:3];
    correctionViewController = v2->_correctionViewController;
    v2->_correctionViewController = v3;
    v7 = v3;

    popoverPresentingViewController = v2->_popoverPresentingViewController;
    v2->_popoverPresentingViewController = v4;
    v9 = v4;

    [(CACCorrectionsPresentationViewController *)v2 addChildViewController:v9];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CACCorrectionsPresentationViewController;
  [(CACCorrectionsPresentationViewController *)&v8 viewDidAppear:a3];
  v4 = [(CACCorrectionsPresentationViewController *)self view];
  v5 = [(CACCorrectionsPresentationViewController *)self popoverPresentingViewController];
  v6 = [v5 view];
  [v4 addSubview:v6];

  v7 = [(CACCorrectionsPresentationViewController *)self popoverPresentingViewController];
  [v7 didMoveToParentViewController:self];
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(CACCorrectionsPresentationViewController *)self correctionViewController];
  [v5 setText:v4];
}

- (NSArray)alternatives
{
  v2 = [(CACCorrectionsPresentationViewController *)self correctionViewController];
  v3 = [v2 alternatives];

  return (NSArray *)v3;
}

- (void)setAlternatives:(id)a3
{
  id v4 = a3;
  id v5 = [(CACCorrectionsPresentationViewController *)self correctionViewController];
  [v5 setAlternatives:v4];
}

- (NSArray)emojis
{
  v2 = [(CACCorrectionsPresentationViewController *)self correctionViewController];
  v3 = [v2 emojis];

  return (NSArray *)v3;
}

- (void)setEmojis:(id)a3
{
  id v4 = a3;
  id v5 = [(CACCorrectionsPresentationViewController *)self correctionViewController];
  [v5 setEmojis:v4];
}

- (void)setPortraitUpSourceRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(CACCorrectionsPresentationViewController *)self popoverPresentingViewController];
  objc_msgSend(v7, "setPortraitUpSourceRect:", x, y, width, height);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSLog(&cfstr_TigerPopoverDi.isa, a2, a3);
  id v4 = [(CACCorrectionsPresentationViewController *)self delegate];
  [v4 dismissCorrectionsPresentationViewController:self];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 7;
}

- (void)correctionsCandidatesViewController:(id)a3 didSelectItemWithText:(id)a4
{
  id v5 = a4;
  id v6 = [(CACCorrectionsPresentationViewController *)self delegate];
  [v6 correctionsPresentationViewController:self didSelectItemWithText:v5];
}

- (void)dismissCorrectionsCandidatesViewController:(id)a3
{
  id v4 = [(CACCorrectionsPresentationViewController *)self popoverPresentingViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__CACCorrectionsPresentationViewController_dismissCorrectionsCandidatesViewController___block_invoke;
  v5[3] = &unk_264D115D0;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __87__CACCorrectionsPresentationViewController_dismissCorrectionsCandidatesViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissCorrectionsPresentationViewController:*(void *)(a1 + 32)];
}

- (int64_t)zOrder
{
  return 5;
}

- (BOOL)isOverlay
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCorrectionsPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACCorrectionsPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (CGRect)portraitUpSourceRect
{
  double x = self->_portraitUpSourceRect.origin.x;
  double y = self->_portraitUpSourceRect.origin.y;
  double width = self->_portraitUpSourceRect.size.width;
  double height = self->_portraitUpSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CACPopoverPresentingViewController)popoverPresentingViewController
{
  return self->_popoverPresentingViewController;
}

- (void)setPopoverPresentingViewController:(id)a3
{
}

- (CACCorrectionsCandidatesViewController)correctionViewController
{
  return self->_correctionViewController;
}

- (void)setCorrectionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionViewController, 0);
  objc_storeStrong((id *)&self->_popoverPresentingViewController, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
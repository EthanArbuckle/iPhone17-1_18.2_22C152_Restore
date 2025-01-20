@interface ICAlertController
- (BOOL)_canShowWhileLocked;
- (BOOL)canAppearAbovePasswordEntryView;
- (BOOL)didDismissWithDismissWithoutActionBlock;
- (BOOL)didPerformAction;
- (BOOL)shouldDismissWhenShowingNote;
- (ICAlertController)initWithCoder:(id)a3;
- (ICAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIAlertAction)dismissAction;
- (id)dismissWithoutActionBlock;
- (void)commonInit;
- (void)dealloc;
- (void)dismissWhenPossible;
- (void)setCanAppearAbovePasswordEntryView:(BOOL)a3;
- (void)setDidDismissWithDismissWithoutActionBlock:(BOOL)a3;
- (void)setDidPerformAction:(BOOL)a3;
- (void)setDismissAction:(id)a3;
- (void)setDismissWithoutActionBlock:(id)a3;
- (void)setShouldDismissWhenShowingNote:(BOOL)a3;
@end

@implementation ICAlertController

- (ICAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICAlertController;
  v4 = [(ICAlertController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(ICAlertController *)v4 commonInit];
  }
  return v5;
}

- (ICAlertController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICAlertController;
  v3 = [(ICAlertController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICAlertController *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_shouldDismissWhenShowingNote = 1;
}

- (void)dealloc
{
  id dismissWithoutActionBlock = self->_dismissWithoutActionBlock;
  if (dismissWithoutActionBlock && !self->_didPerformAction)
  {
    v4 = (void *)[dismissWithoutActionBlock copy];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __28__ICAlertController_dealloc__block_invoke;
    v10 = &unk_1E5FD9320;
    id v11 = v4;
    id v5 = v4;
    dispatchMainAfterDelay();
  }
  v6.receiver = self;
  v6.super_class = (Class)ICAlertController;
  [(ICAlertController *)&v6 dealloc];
}

uint64_t __28__ICAlertController_dealloc__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissWhenPossible
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__ICAlertController_dismissWhenPossible__block_invoke;
  v2[3] = &unk_1E5FDAAE0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__ICAlertController_dismissWhenPossible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained dismissWithoutActionBlock];
  if (v1) {
    int v2 = [WeakRetained didDismissWithDismissWithoutActionBlock] ^ 1;
  }
  else {
    int v2 = 0;
  }

  id v3 = [WeakRetained dismissAction];

  if (v3 || v2)
  {
    [WeakRetained setDidDismissWithDismissWithoutActionBlock:1];
    uint64_t v8 = [WeakRetained presentingViewController];

    if (v8)
    {
      if (v2)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4FB1410]);
      }
      else
      {
        id v9 = [WeakRetained dismissAction];
      }
      v10 = v9;
      [WeakRetained _dismissWithAction:v9];
    }
    [WeakRetained setDismissAction:0];
  }
  else
  {
    v4 = [WeakRetained presentedViewController];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    objc_super v6 = WeakRetained;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_15;
    }
    uint64_t v7 = [WeakRetained presentedViewController];
    [v7 dismissViewControllerAnimated:0 completion:0];
  }
  objc_super v6 = WeakRetained;
LABEL_15:
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)didPerformAction
{
  return self->_didPerformAction;
}

- (void)setDidPerformAction:(BOOL)a3
{
  self->_didPerformAction = a3;
}

- (id)dismissWithoutActionBlock
{
  return self->_dismissWithoutActionBlock;
}

- (void)setDismissWithoutActionBlock:(id)a3
{
}

- (UIAlertAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (BOOL)shouldDismissWhenShowingNote
{
  return self->_shouldDismissWhenShowingNote;
}

- (void)setShouldDismissWhenShowingNote:(BOOL)a3
{
  self->_shouldDismissWhenShowingNote = a3;
}

- (BOOL)canAppearAbovePasswordEntryView
{
  return self->_canAppearAbovePasswordEntryView;
}

- (void)setCanAppearAbovePasswordEntryView:(BOOL)a3
{
  self->_canAppearAbovePasswordEntryView = a3;
}

- (BOOL)didDismissWithDismissWithoutActionBlock
{
  return self->_didDismissWithDismissWithoutActionBlock;
}

- (void)setDidDismissWithDismissWithoutActionBlock:(BOOL)a3
{
  self->_didDismissWithDismissWithoutActionBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong(&self->_dismissWithoutActionBlock, 0);
}

@end
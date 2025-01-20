@interface UIActionSheet
- (BOOL)_prepareToDismissForTappedIndex:(int64_t)a3;
- (BOOL)isVisible;
- (NSInteger)addButtonWithTitle:(NSString *)title;
- (NSInteger)cancelButtonIndex;
- (NSInteger)destructiveButtonIndex;
- (NSInteger)firstOtherButtonIndex;
- (NSInteger)numberOfButtons;
- (NSString)buttonTitleAtIndex:(NSInteger)buttonIndex;
- (NSString)title;
- (UIActionSheet)initWithFrame:(CGRect)a3;
- (UIActionSheet)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;
- (UIActionSheet)initWithTitle:(id)a3 delegate:(id)a4 cancelButtonTitle:(id)a5 destructiveButtonTitle:(id)a6;
- (UIActionSheetStyle)actionSheetStyle;
- (id)_alertController;
- (id)_preparedAlertActionAtIndex:(unint64_t)a3;
- (id)_titleLabel;
- (id)addButtonWithTitle:(id)a3 label:(id)a4;
- (id)context;
- (id)delegate;
- (id)message;
- (void)_didPresent;
- (void)_dismissForTappedIndex:(int64_t)a3;
- (void)_performPresentationDismissalWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_prepareAlertActions;
- (void)_setAttributedTitleString:(id)a3;
- (void)_setFirstOtherButtonIndex:(int64_t)a3;
- (void)_setIsPresented:(BOOL)a3;
- (void)_showFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6;
- (void)dealloc;
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 allowInteractionWithViews:(id)a6 backgroundStyle:(int64_t)a7 animated:(BOOL)a8;
- (void)setActionSheetStyle:(UIActionSheetStyle)actionSheetStyle;
- (void)setCancelButtonIndex:(NSInteger)cancelButtonIndex;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDestructiveButtonIndex:(NSInteger)destructiveButtonIndex;
- (void)setMessage:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
- (void)showInView:(UIView *)view;
@end

@implementation UIActionSheet

- (UIActionSheet)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIActionSheet;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIAlertController);
    alertController = v3->_alertController;
    v3->_alertController = v4;

    [(UIAlertController *)v3->_alertController setPreferredStyle:0];
    [(UIAlertController *)v3->_alertController _setShouldAllowNilParameters:1];
    v6 = objc_alloc_init(_UIAlertControllerShimPresenter);
    presenter = v3->_presenter;
    v3->_presenter = v6;

    [(_UIAlertControllerShimPresenter *)v3->_presenter setAlertController:v3->_alertController];
    [(_UIAlertControllerShimPresenter *)v3->_presenter setPopoverDelegate:v3];
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v3->_actions;
    v3->_actions = v8;

    v3->_cancelIndex = -1;
    v3->_firstOtherButtonIndex = -1;
    v3->_destructiveButtonIndex = -1;
  }
  return v3;
}

- (UIActionSheet)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
  va_start(va, otherButtonTitles);
  v12 = title;
  id v13 = delegate;
  v14 = cancelButtonTitle;
  v15 = destructiveButtonTitle;
  v16 = otherButtonTitles;
  v17 = -[UIActionSheet initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v18 = v17;
  if (v17)
  {
    [(UIActionSheet *)v17 setTitle:v12];
    [(UIActionSheet *)v18 setDelegate:v13];
    if (v15) {
      [(UIActionSheet *)v18 setDestructiveButtonIndex:[(UIActionSheet *)v18 addButtonWithTitle:v15]];
    }
    if (v16)
    {
      va_copy(v23, va);
      do
      {
        uint64_t v19 = [(UIActionSheet *)v18 addButtonWithTitle:v16];
        if ([(UIActionSheet *)v18 firstOtherButtonIndex] == -1) {
          [(UIActionSheet *)v18 _setFirstOtherButtonIndex:v19];
        }
        v20 = va_arg(v23, void *);
        v21 = v20;

        v16 = v21;
      }
      while (v21);
    }
    if (v14) {
      [(UIActionSheet *)v18 setCancelButtonIndex:[(UIActionSheet *)v18 addButtonWithTitle:v14]];
    }
    v16 = 0;
  }

  return v18;
}

- (void)dealloc
{
  [(_UIAlertControllerShimPresenter *)self->_presenter setAlertController:0];
  [(_UIAlertControllerShimPresenter *)self->_presenter setPopoverDelegate:0];
  presenter = self->_presenter;
  self->_presenter = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIActionSheet;
  [(UIView *)&v4 dealloc];
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)title
{
  return [(UIViewController *)self->_alertController title];
}

- (void)setActionSheetStyle:(UIActionSheetStyle)actionSheetStyle
{
  self->_actionSheetStyle = actionSheetStyle;
}

- (UIActionSheetStyle)actionSheetStyle
{
  return self->_actionSheetStyle;
}

- (NSInteger)addButtonWithTitle:(NSString *)title
{
  v5 = title;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIActionSheet.m" lineNumber:125 description:@"UIActionSheet: Buttons added must have a title."];
  }
  NSInteger v6 = [(NSMutableArray *)self->_actions count];
  [(NSMutableArray *)self->_actions addObject:v5];

  return v6;
}

- (NSString)buttonTitleAtIndex:(NSInteger)buttonIndex
{
  return (NSString *)[(NSMutableArray *)self->_actions objectAtIndex:buttonIndex];
}

- (NSInteger)numberOfButtons
{
  return [(NSMutableArray *)self->_actions count];
}

- (void)setCancelButtonIndex:(NSInteger)cancelButtonIndex
{
  self->_cancelIndex = cancelButtonIndex;
}

- (NSInteger)cancelButtonIndex
{
  return self->_cancelIndex;
}

- (void)setDestructiveButtonIndex:(NSInteger)destructiveButtonIndex
{
  self->_destructiveButtonIndex = destructiveButtonIndex;
}

- (NSInteger)destructiveButtonIndex
{
  return self->_destructiveButtonIndex;
}

- (void)_setFirstOtherButtonIndex:(int64_t)a3
{
  self->_firstOtherButtonIndex = a3;
}

- (NSInteger)firstOtherButtonIndex
{
  return self->_firstOtherButtonIndex;
}

- (BOOL)isVisible
{
  if (self->_isPresented)
  {
    v2 = [(UIView *)self window];
    int v3 = [v2 isHidden] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  BOOL v4 = animated;
  NSInteger v6 = item;
  [(UIActionSheet *)self _setIsPresented:1];
  presenter = self->_presenter;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__UIActionSheet_showFromBarButtonItem_animated___block_invoke;
  v8[3] = &unk_1E52D9F70;
  v8[4] = self;
  [(_UIAlertControllerShimPresenter *)presenter _presentAlertControllerFromBarButtonItem:v6 animated:v4 completion:v8];
}

uint64_t __48__UIActionSheet_showFromBarButtonItem_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPresent];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
}

- (void)_showFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  [(UIActionSheet *)self _setIsPresented:1];
  presenter = self->_presenter;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__UIActionSheet__showFromRect_inView_direction_animated___block_invoke;
  v15[3] = &unk_1E52D9F70;
  v15[4] = self;
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromRect:inView:direction:animated:completion:](presenter, "_presentAlertControllerFromRect:inView:direction:animated:completion:", v13, a5, v6, v15, x, y, width, height);
}

uint64_t __57__UIActionSheet__showFromRect_inView_direction_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPresent];
}

- (void)showInView:(UIView *)view
{
  BOOL v4 = view;
  [(UIActionSheet *)self _setIsPresented:1];
  [(UIView *)v4 bounds];
  presenter = self->_presenter;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__UIActionSheet_showInView___block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromRect:inView:direction:animated:completion:](presenter, "_presentAlertControllerFromRect:inView:direction:animated:completion:", v4, 0, 1, v10, v6 + floor(v5 * 0.5), v8 + floor(v7 * 0.5), 1.0, 1.0);
}

uint64_t __28__UIActionSheet_showInView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPresent];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
  if (!self->_dismissingAlertController)
  {
    BOOL v4 = animated;
    uint64_t v7 = [(UIActionSheet *)self delegate];
    self->_alertControllerShouldDismiss = 1;
    self->_dismissingAlertController = 1;
    id v8 = (id)v7;
    if (objc_opt_respondsToSelector()) {
      [v8 actionSheet:self willDismissWithButtonIndex:buttonIndex];
    }
    if (!self->_handlingAlertActionShouldDismiss) {
      [(UIActionSheet *)self _performPresentationDismissalWithClickedButtonIndex:buttonIndex animated:v4];
    }
  }
}

- (void)_performPresentationDismissalWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_alertControllerShouldDismiss)
  {
    double v6 = [(UIActionSheet *)self delegate];
    presenter = self->_presenter;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__UIActionSheet__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke;
    v9[3] = &unk_1E52DA070;
    id v10 = v6;
    objc_super v11 = self;
    int64_t v12 = a3;
    id v8 = v6;
    [(_UIAlertControllerShimPresenter *)presenter _dismissAlertControllerAnimated:1 completion:v9];
    self->_dismissingAlertController = 0;
  }
}

uint64_t __78__UIActionSheet__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) actionSheet:*(void *)(a1 + 40) didDismissWithButtonIndex:*(void *)(a1 + 48)];
  }
  v2 = *(void **)(a1 + 40);
  return [v2 _setIsPresented:0];
}

- (id)_preparedAlertActionAtIndex:(unint64_t)a3
{
  BOOL v4 = [(UIAlertController *)self->_alertController _actions];
  if ([v4 count] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)_prepareAlertActions
{
  if (!self->_hasPreparedAlertActions)
  {
    objc_initWeak(&location, self);
    for (i = 0; (unint64_t)i < [(NSMutableArray *)self->_actions count]; ++i)
    {
      BOOL v4 = [(NSMutableArray *)self->_actions objectAtIndex:i];
      if (i == (char *)self->_destructiveButtonIndex) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = i == (char *)self->_cancelIndex;
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __37__UIActionSheet__prepareAlertActions__block_invoke;
      v9[3] = &unk_1E52DA098;
      objc_copyWeak(v10, &location);
      v10[1] = i;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __37__UIActionSheet__prepareAlertActions__block_invoke_2;
      v7[3] = &unk_1E52DA0C0;
      objc_copyWeak(v8, &location);
      v8[1] = i;
      double v6 = +[UIAlertAction _actionWithTitle:v4 image:0 style:v5 handler:v9 shouldDismissHandler:v7];
      [(UIAlertController *)self->_alertController addAction:v6];

      objc_destroyWeak(v8);
      objc_destroyWeak(v10);
    }
    self->_hasPreparedAlertActions = 1;
    objc_destroyWeak(&location);
  }
}

void __37__UIActionSheet__prepareAlertActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _dismissForTappedIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

uint64_t __37__UIActionSheet__prepareAlertActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained) {
    uint64_t v4 = [WeakRetained _prepareToDismissForTappedIndex:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)_prepareToDismissForTappedIndex:(int64_t)a3
{
  self->_handlingAlertActionShouldDismiss = 1;
  id v5 = [(UIActionSheet *)self delegate];
  double v6 = self;
  v6->_alertControllerShouldDismiss = 0;
  if (objc_opt_respondsToSelector()) {
    [v5 actionSheet:v6 clickedButtonAtIndex:a3];
  }
  [(UIActionSheet *)v6 dismissWithClickedButtonIndex:a3 animated:1];
  self->_handlingAlertActionShouldDismiss = 0;
  return v6->_alertControllerShouldDismiss;
}

- (void)_dismissForTappedIndex:(int64_t)a3
{
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(UIActionSheet *)self _prepareToDismissForTappedIndex:[(UIActionSheet *)self cancelButtonIndex]];
  NSInteger v4 = [(UIActionSheet *)self cancelButtonIndex];
  [(UIActionSheet *)self _dismissForTappedIndex:v4];
}

- (void)_setIsPresented:(BOOL)a3
{
  if (self->_isPresented != a3)
  {
    self->_isPresented = a3;
    if (a3)
    {
      double v6 = [(UIActionSheet *)self delegate];
      objc_storeStrong((id *)&self->_retainedSelf, self);
      [(UIActionSheet *)self _prepareAlertActions];
      char v4 = objc_opt_respondsToSelector();
      retainedSelf = v6;
      if (v4)
      {
        [(UIActionSheet *)v6 willPresentActionSheet:self];
        retainedSelf = v6;
      }
    }
    else
    {
      retainedSelf = self->_retainedSelf;
      self->_retainedSelf = 0;
    }
  }
}

- (void)_didPresent
{
  id v3 = [(UIActionSheet *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 didPresentActionSheet:self];
  }
}

- (void)setMessage:(id)a3
{
}

- (id)message
{
  return [(UIAlertController *)self->_alertController message];
}

- (void)presentFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 allowInteractionWithViews:(id)a6 backgroundStyle:(int64_t)a7 animated:(BOOL)a8
{
}

- (void)_setAttributedTitleString:(id)a3
{
  id v4 = a3;
  id v5 = [(UIActionSheet *)self _alertController];
  [v5 _setAttributedTitle:v4];
}

- (id)addButtonWithTitle:(id)a3 label:(id)a4
{
  return 0;
}

- (id)_alertController
{
  return self->_alertController;
}

- (id)_titleLabel
{
  return 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (UIActionSheet)initWithTitle:(id)a3 delegate:(id)a4 cancelButtonTitle:(id)a5 destructiveButtonTitle:(id)a6
{
  return [(UIActionSheet *)self initWithTitle:a3 delegate:a4 cancelButtonTitle:a5 destructiveButtonTitle:a6 otherButtonTitles:0];
}

@end
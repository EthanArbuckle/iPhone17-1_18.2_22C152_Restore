@interface PXPhotosFilterToggleButtonController
- (PXPhotosFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4;
- (PXPhotosFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4;
- (PXPhotosFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4 actionPerformer:(id)a5;
- (PXPhotosGridActionPerformer)actionPerformer;
- (PXPhotosViewModel)viewModel;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (id)allMenuItems;
- (id)filterInlineMenuItems;
- (id)filterMenuItems;
- (id)filterMenuSubtitle;
- (id)viewOptionsMenuItems;
- (id)viewOptionsMenuSubtitle;
- (void)_updateContentFilterState;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setActionPerformer:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setForegroundColor:(id)a3;
@end

@implementation PXPhotosFilterToggleButtonController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

- (void)setActionPerformer:(id)a3
{
}

- (PXPhotosGridActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v10 = a3;
  if ((void *)PXPhotosViewModelObserverContext != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXPhotosFilterToggleButtonController.m" lineNumber:156 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x2000000) != 0) {
    [(PXPhotosFilterToggleButtonController *)self _updateContentFilterState];
  }
  if ((*(void *)&v6 & 0x9C000) != 0) {
    [(PXContentFilterToggleButtonController *)self invalidateButtonMenu];
  }
}

- (id)allMenuItems
{
  v4 = [(PXPhotosFilterToggleButtonController *)self viewModel];

  if (v4)
  {
    v5 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];

    if (!v5)
    {
      int v6 = [PXPhotosGridShowFiltersMenuActionPerformer alloc];
      v7 = [(PXPhotosFilterToggleButtonController *)self viewModel];
      v8 = [(PXPhotosGridActionPerformer *)v6 initWithViewModel:v7 actionType:@"PXPhotosGridActionShowFiltersMenu"];
      [(PXPhotosFilterToggleButtonController *)self setActionPerformer:v8];
    }
    v9 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(PXContentFilterToggleButtonController *)self button];
      v12 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
      [v12 setSender:v11];

      v13 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
      v14 = [v13 performSelector:sel_menuElement];

      id v15 = v14;
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_7:
          v16 = [v15 children];
          v17 = (void *)[v16 mutableCopy];

          goto LABEL_9;
        }
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v22 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v22);
        v23 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
        [v19 handleFailureInMethod:a2, self, @"PXPhotosFilterToggleButtonController.m", 136, @"%@ should be an instance inheriting from %@, but it is %@", @"filterMenuElement", v21, v23 object file lineNumber description];
      }
      else
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        [v19 handleFailureInMethod:a2, self, @"PXPhotosFilterToggleButtonController.m", 136, @"%@ should be an instance inheriting from %@, but it is nil", @"filterMenuElement", v21 object file lineNumber description];
      }

      goto LABEL_7;
    }
  }
  v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:
  return v17;
}

- (id)viewOptionsMenuSubtitle
{
  v3 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
    int v6 = [v5 performSelector:sel_viewOptionsMenuSubtitle];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)viewOptionsMenuItems
{
  v3 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];

  if (!v3)
  {
    char v4 = [PXPhotosGridShowFiltersMenuActionPerformer alloc];
    v5 = [(PXPhotosFilterToggleButtonController *)self viewModel];
    int v6 = [(PXPhotosGridActionPerformer *)v4 initWithViewModel:v5 actionType:@"PXPhotosGridActionShowFiltersMenu"];
    [(PXPhotosFilterToggleButtonController *)self setActionPerformer:v6];
  }
  v7 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
    char v10 = [v9 performSelector:sel_viewOptionsMenuItems];
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

- (id)filterInlineMenuItems
{
  return 0;
}

- (id)filterMenuSubtitle
{
  v3 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
    int v6 = [v5 performSelector:sel_filterMenuSubtitle];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)filterMenuItems
{
  v3 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];

  if (!v3)
  {
    char v4 = [PXPhotosGridShowFiltersMenuActionPerformer alloc];
    v5 = [(PXPhotosFilterToggleButtonController *)self viewModel];
    int v6 = [(PXPhotosGridActionPerformer *)v4 initWithViewModel:v5 actionType:@"PXPhotosGridActionShowFiltersMenu"];
    [(PXPhotosFilterToggleButtonController *)self setActionPerformer:v6];
  }
  v7 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(PXPhotosFilterToggleButtonController *)self actionPerformer];
    char v10 = [v9 performSelector:sel_filterMenuItems];
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

- (void)_updateContentFilterState
{
  id v3 = [(PXPhotosViewModel *)self->_viewModel contentFilterState];
  [(PXContentFilterToggleButtonController *)self setContentFilterState:v3];
}

- (void)setBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  int v6 = self->_backgroundColor;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(UIColor *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__PXPhotosFilterToggleButtonController_setBackgroundColor___block_invoke;
      v9[3] = &unk_1E5DC27B0;
      char v10 = v5;
      [(PXContentFilterToggleButtonController *)self performChanges:v9];
    }
  }
}

uint64_t __59__PXPhotosFilterToggleButtonController_setBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBaseBackgroundColor:*(void *)(a1 + 32)];
}

- (void)setForegroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  int v6 = self->_foregroundColor;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(UIColor *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_foregroundColor, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__PXPhotosFilterToggleButtonController_setForegroundColor___block_invoke;
      v9[3] = &unk_1E5DC27B0;
      char v10 = v5;
      [(PXContentFilterToggleButtonController *)self performChanges:v9];
    }
  }
}

uint64_t __59__PXPhotosFilterToggleButtonController_setForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSecondaryTintColor:*(void *)(a1 + 32)];
}

- (PXPhotosFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosFilterToggleButtonController.m", 49, @"%s is not available as initializer", "-[PXPhotosFilterToggleButtonController initWithButtonConfiguration:roundedButton:]");

  abort();
}

- (PXPhotosFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4 actionPerformer:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosFilterToggleButtonController;
  v11 = [(PXContentFilterToggleButtonController *)&v14 initWithButtonConfiguration:a4 roundedButton:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    objc_storeStrong((id *)&v12->_actionPerformer, a5);
    [(PXPhotosViewModel *)v12->_viewModel registerChangeObserver:v12 context:PXPhotosViewModelObserverContext];
    [(PXPhotosFilterToggleButtonController *)v12 _updateContentFilterState];
  }

  return v12;
}

- (PXPhotosFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4
{
  return [(PXPhotosFilterToggleButtonController *)self initWithViewModel:a3 buttonConfiguration:a4 actionPerformer:0];
}

@end
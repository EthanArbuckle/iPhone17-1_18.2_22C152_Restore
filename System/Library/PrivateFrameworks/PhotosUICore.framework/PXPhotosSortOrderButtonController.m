@interface PXPhotosSortOrderButtonController
- (PXPhotosSortOrderButtonController)initWithModel:(id)a3;
- (UIButton)button;
- (void)_updateButtonMenu;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXPhotosSortOrderButtonController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (UIButton)button
{
  return self->_button;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXPhotosViewOptionsModelObserverContext_212915 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosSortOrderButtonController.m" lineNumber:59 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x12) != 0)
  {
    id v11 = v9;
    [(PXPhotosSortOrderButtonController *)self _updateButtonMenu];
    id v9 = v11;
  }
}

- (void)_updateButtonMenu
{
  v3 = [(PXPhotosViewOptionsModel *)self->_model sortOrderMenu];
  [(UIButton *)self->_button setMenu:v3];

  button = self->_button;
  [(UIButton *)button setShowsMenuAsPrimaryAction:1];
}

- (PXPhotosSortOrderButtonController)initWithModel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosSortOrderButtonController;
  char v6 = [(PXPhotosSortOrderButtonController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:14.0];
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down" withConfiguration:v8];
    v10 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    [v10 setImage:v9];
    uint64_t v11 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:0];
    button = v7->_button;
    v7->_button = (UIButton *)v11;

    [(PXPhotosSortOrderButtonController *)v7 _updateButtonMenu];
    [(PXPhotosViewOptionsModel *)v7->_model registerChangeObserver:v7 context:PXPhotosViewOptionsModelObserverContext_212915];
  }
  return v7;
}

@end
@interface PXPhotosCloseButtonController
- (PXPhotosCloseButtonController)initWithButtonConfiguration:(id)a3;
- (PXPhotosCloseButtonControllerDelegate)delegate;
- (UIButton)button;
- (UIColor)foregroundColor;
- (void)_handleButtonAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForegroundColor:(id)a3;
@end

@implementation PXPhotosCloseButtonController

- (void)setForegroundColor:(id)a3
{
  v10 = (UIColor *)a3;
  v5 = self->_foregroundColor;
  v6 = v10;
  if (v5 != v10)
  {
    v7 = v5;
    char v8 = [(UIColor *)v5 isEqual:v10];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    v9 = [(UIButton *)self->_button configuration];
    v6 = (UIColor *)[v9 copy];

    [(UIColor *)v6 setBaseForegroundColor:v10];
    [(UIButton *)self->_button setConfiguration:v6];
  }

LABEL_5:
}

- (UIButton)button
{
  return self->_button;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosCloseButtonController)initWithButtonConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPhotosCloseButtonController.m", 28, @"Invalid parameter not satisfying: %@", @"buttonConfiguration" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosCloseButtonController;
  v6 = [(PXPhotosCloseButtonController *)&v13 init];
  if (v6)
  {
    uint64_t v7 = +[PXPhotosViewRoundedAccessoryButton buttonWithConfiguration:v5 primaryAction:0];
    button = v6->_button;
    v6->_button = (UIButton *)v7;

    [(UIButton *)v6->_button addTarget:v6 action:sel__handleButtonAction_ forControlEvents:0x2000];
    uint64_t v9 = [v5 baseForegroundColor];
    foregroundColor = v6->_foregroundColor;
    v6->_foregroundColor = (UIColor *)v9;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (PXPhotosCloseButtonControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosCloseButtonControllerDelegate *)WeakRetained;
}

- (void)_handleButtonAction:(id)a3
{
  id v4 = [(PXPhotosCloseButtonController *)self delegate];
  [v4 photosCloseButtonControllerHandleAction:self];
}

@end
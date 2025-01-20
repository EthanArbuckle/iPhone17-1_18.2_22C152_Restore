@interface PUPhotoEditAutoAdjustmentCell
- (PUPhotoEditAutoAdjustmentCell)initWithCoder:(id)a3;
- (PUPhotoEditAutoAdjustmentCell)initWithFrame:(CGRect)a3;
- (PUPhotoEditBaseAdjustmentCellDelegate)delegate;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (void)_configureContainerButton;
- (void)handleButton:(id)a3;
- (void)performPrimaryAction;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
@end

@implementation PUPhotoEditAutoAdjustmentCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditBaseAdjustmentCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditBaseAdjustmentCellDelegate *)WeakRetained;
}

- (void)performPrimaryAction
{
  id v3 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [(PUPhotoEditAutoAdjustmentCell *)self handleButton:v3];
}

- (void)handleButton:(id)a3
{
  id v7 = a3;
  v4 = [(PUPhotoEditAutoAdjustmentCell *)self delegate];
  int v5 = [v4 canToggleCell:self];

  if (v5)
  {
    objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    -[PUPhotoEditAutoAdjustmentCell setEnabled:](self, "setEnabled:", [v7 isSelected]);
    v6 = [(PUPhotoEditAutoAdjustmentCell *)self delegate];
    [v6 didToggleCell:self];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setEnabled:](&v6, sel_setEnabled_);
  int v5 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setSelected:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setSelected:](&v6, sel_setSelected_);
  int v5 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setUserInteractionEnabled:v3];
}

- (void)setImageName:(id)a3
{
  int v5 = (NSString *)a3;
  p_imageName = &self->super._imageName;
  if (self->super._imageName != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)p_imageName, a3);
    id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", v19);
    v8 = (void *)MEMORY[0x1E4FB1818];
    v9 = [NSString stringWithFormat:@"%@-Selected", v19];
    v10 = objc_msgSend(v8, "pu_PhotosUIImageNamed:", v9);

    v11 = [(PUPhotoEditAutoAdjustmentCell *)self traitCollection];
    uint64_t v12 = [v11 userInterfaceStyle];

    v13 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
    v14 = v13;
    if (v12 == 2) {
      v15 = v7;
    }
    else {
      v15 = v10;
    }
    [v13 setImage:v15 forState:0];

    if (v10)
    {
      v16 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
      v17 = v16;
      if (v12 == 2) {
        v18 = v10;
      }
      else {
        v18 = v7;
      }
      [v16 setImage:v18 forState:4];
    }
  }
  MEMORY[0x1F4181820](p_imageName);
}

- (void)_configureContainerButton
{
  BOOL v3 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v3 setShouldShowValueLabel:0];

  v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setShouldShowCircularRing:0];

  int v5 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setShouldScaleDownImage:0];

  objc_super v6 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v6 setEnabled:1];

  id v7 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v7 addTarget:self action:sel_handleButton_ forControlEvents:64];
}

- (PUPhotoEditAutoAdjustmentCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  BOOL v3 = [(PUPhotoEditBaseAdjustmentCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PUPhotoEditAutoAdjustmentCell *)v3 _configureContainerButton];
  }
  return v4;
}

- (PUPhotoEditAutoAdjustmentCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  BOOL v3 = -[PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PUPhotoEditAutoAdjustmentCell *)v3 _configureContainerButton];
  }
  return v4;
}

@end
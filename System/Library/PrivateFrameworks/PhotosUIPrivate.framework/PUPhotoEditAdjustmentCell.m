@interface PUPhotoEditAdjustmentCell
- (BOOL)displayMappedValue;
- (BOOL)shouldDisplayValueLabel;
- (PUPhotoEditAdjustmentCell)initWithCoder:(id)a3;
- (PUPhotoEditAdjustmentCell)initWithFrame:(CGRect)a3;
- (PUPhotoEditBaseAdjustmentCellDelegate)delegate;
- (void)_setupEventHandler;
- (void)_updateValueLabelVisibility;
- (void)handleButton:(id)a3;
- (void)reloadImage;
- (void)setDelegate:(id)a3;
- (void)setDisplayMappedValue:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImageIsColor:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setImageTransformBlock:(id)a3;
- (void)setIsUserModifying:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldDisplayValueLabel:(BOOL)a3;
@end

@implementation PUPhotoEditAdjustmentCell

- (void).cxx_destruct
{
}

- (void)setShouldDisplayValueLabel:(BOOL)a3
{
  self->_shouldDisplayValueLabel = a3;
}

- (BOOL)shouldDisplayValueLabel
{
  return self->_shouldDisplayValueLabel;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditBaseAdjustmentCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditBaseAdjustmentCellDelegate *)WeakRetained;
}

- (void)handleButton:(id)a3
{
  id v7 = a3;
  v4 = [(PUPhotoEditAdjustmentCell *)self delegate];
  int v5 = [v4 canToggleCell:self];

  if (v5)
  {
    objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    -[PUPhotoEditAdjustmentCell setEnabled:](self, "setEnabled:", [v7 isSelected]);
    v6 = [(PUPhotoEditAdjustmentCell *)self delegate];
    [v6 didToggleCell:self];
  }
}

- (BOOL)displayMappedValue
{
  v2 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  char v3 = [v2 displayMappedValue];

  return v3;
}

- (void)setDisplayMappedValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setDisplayMappedValue:v3];
}

- (void)_updateValueLabelVisibility
{
  if ([(PUPhotoEditBaseAdjustmentCell *)self isUserModifying]) {
    BOOL v3 = [(PUPhotoEditAdjustmentCell *)self shouldDisplayValueLabel];
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v4 setShouldShowValueLabel:v3];
}

- (void)setIsUserModifying:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditAdjustmentCell;
  [(PUPhotoEditBaseAdjustmentCell *)&v4 setIsUserModifying:a3];
  [(PUPhotoEditAdjustmentCell *)self _updateValueLabelVisibility];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setEnabled:](&v8, sel_setEnabled_);
  int v5 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setSelected:v3];

  if (v3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.3;
  }
  id v7 = [(PUPhotoEditAdjustmentCell *)self contentView];
  [v7 setAlpha:v6];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setSelected:](&v7, sel_setSelected_);
  int v5 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v5 setEnabled:v3];

  double v6 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v6 setUserInteractionEnabled:v3];
}

- (void)reloadImage
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1818];
  objc_super v4 = [(PUPhotoEditBaseAdjustmentCell *)self imageName];
  objc_msgSend(v3, "pu_PhotosUIImageNamed:", v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (![(PUPhotoEditBaseAdjustmentCell *)self imageIsColor])
  {
    int v5 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v6 = [v11 imageWithTintColor:v5];

    id v11 = (id)v6;
  }
  objc_super v7 = [(PUPhotoEditBaseAdjustmentCell *)self imageTransformBlock];

  if (v7)
  {
    objc_super v8 = [(PUPhotoEditBaseAdjustmentCell *)self imageTransformBlock];
    uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v11);

    id v11 = (id)v9;
  }
  v10 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v10 setImage:v11 forState:0];
}

- (void)setImageTransformBlock:(id)a3
{
  objc_super v4 = _Block_copy(a3);
  id imageTransformBlock = self->super._imageTransformBlock;
  self->super._id imageTransformBlock = v4;

  [(PUPhotoEditAdjustmentCell *)self reloadImage];
}

- (void)setImageIsColor:(BOOL)a3
{
  if (self->super._imageIsColor != a3)
  {
    self->super._imageIsColor = a3;
    [(PUPhotoEditAdjustmentCell *)self reloadImage];
  }
}

- (void)setImageName:(id)a3
{
  int v5 = (NSString *)a3;
  if (self->super._imageName != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->super._imageName, a3);
    [(PUPhotoEditAdjustmentCell *)self reloadImage];
    int v5 = v6;
  }
}

- (void)_setupEventHandler
{
  id v3 = [(PUPhotoEditBaseAdjustmentCell *)self containerButton];
  [v3 addTarget:self action:sel_handleButton_ forControlEvents:64];
}

- (PUPhotoEditAdjustmentCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAdjustmentCell;
  id v3 = [(PUPhotoEditBaseAdjustmentCell *)&v6 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3) {
    [(PUPhotoEditAdjustmentCell *)v3 _setupEventHandler];
  }
  return v4;
}

- (PUPhotoEditAdjustmentCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAdjustmentCell;
  id v3 = -[PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(PUPhotoEditAdjustmentCell *)v3 _setupEventHandler];
  }
  return v4;
}

@end
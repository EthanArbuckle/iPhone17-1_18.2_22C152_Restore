@interface _NTKCFaceDetailPigmentAddCell
+ (id)reuseIdentifier;
- (_NTKCFaceDetailPigmentAddCell)initWithFrame:(CGRect)a3;
- (_NTKCFaceDetailPigmentAddCellDelegate)delegate;
- (void)_tapped;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation _NTKCFaceDetailPigmentAddCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKCFaceDetailPigmentAddCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_NTKCFaceDetailPigmentAddCell;
  v3 = -[_NTKCFaceDetailCollectionCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button addTarget:v3 action:sel__tapped forControlEvents:64];
    v6 = [(_NTKCFaceDetailPigmentAddCell *)v3 contentView];
    [v6 addSubview:v3->_button];
  }
  return v3;
}

- (void)setImage:(id)a3
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_NTKCFaceDetailPigmentAddCell;
  [(_NTKCFaceDetailCollectionCell *)&v3 layoutSubviews];
  [(_NTKCFaceDetailCollectionCell *)self swatchFrame];
  -[UIButton setFrame:](self->_button, "setFrame:");
}

- (void)_tapped
{
  id v3 = [(_NTKCFaceDetailPigmentAddCell *)self delegate];
  [v3 addCellTapped:self];
}

- (_NTKCFaceDetailPigmentAddCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_NTKCFaceDetailPigmentAddCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
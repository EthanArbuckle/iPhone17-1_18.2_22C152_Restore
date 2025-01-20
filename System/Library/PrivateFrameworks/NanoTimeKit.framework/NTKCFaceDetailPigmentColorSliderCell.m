@interface NTKCFaceDetailPigmentColorSliderCell
+ (id)reuseIdentifier;
- (NTKCFaceDetailPigmentColorSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NTKCFaceDetailPigmentColorSliderCellDelegate)delegate;
- (double)rowHeight;
- (void)colorSlider:(id)a3 valueChanged:(double)a4 phase:(int64_t)a5;
- (void)layoutSubviews;
- (void)setColorFraction:(double)a3 animated:(BOOL)a4;
- (void)setColors:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NTKCFaceDetailPigmentColorSliderCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailPigmentColorSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailPigmentColorSliderCell;
  v4 = [(NTKCFaceDetailRowActionCell *)&v11 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(NTKCDetailTableViewCell *)v4 setShowsSeparator:0];
    v6 = [NTKColorSlider alloc];
    uint64_t v7 = -[NTKColorSlider initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    slider = v5->_slider;
    v5->_slider = (NTKColorSlider *)v7;

    [(NTKColorSlider *)v5->_slider setDelegate:v5];
    v9 = [(NTKCFaceDetailPigmentColorSliderCell *)v5 contentView];
    [v9 addSubview:v5->_slider];
  }
  return v5;
}

- (double)rowHeight
{
  +[NTKColorSlider frameForTrackFrame:](NTKColorSlider, "frameForTrackFrame:", 0.0, 0.0, 0.0, 40.0);
  return v2;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKCFaceDetailPigmentColorSliderCell;
  [(NTKCFaceDetailRowActionCell *)&v13 layoutSubviews];
  [(NTKCFaceDetailPigmentColorSliderCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  +[NTKCFaceDetailEditOptionCell insetSpacingForStyle:0];
  CGFloat v12 = v11;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGRect v15 = CGRectInset(v14, v12, 0.0);
  -[NTKColorSlider setFrame:](self->_slider, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
}

- (void)setColors:(id)a3 animated:(BOOL)a4
{
}

- (void)setColorFraction:(double)a3 animated:(BOOL)a4
{
  *(float *)&a3 = a3;
  [(NTKColorSlider *)self->_slider setValue:a4 animated:a3];
}

- (void)colorSlider:(id)a3 valueChanged:(double)a4 phase:(int64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pigmentColorSliderCell:self colorFractionChanged:a5 != 2 transiently:a5 == 3 canceled:a4];
}

- (NTKCFaceDetailPigmentColorSliderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailPigmentColorSliderCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
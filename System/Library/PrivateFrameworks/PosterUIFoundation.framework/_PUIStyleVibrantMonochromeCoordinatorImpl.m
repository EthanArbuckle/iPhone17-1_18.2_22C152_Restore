@interface _PUIStyleVibrantMonochromeCoordinatorImpl
- (double)itemViewLuminance;
- (id)itemView;
- (void)setContentsLuminance:(double)a3;
@end

@implementation _PUIStyleVibrantMonochromeCoordinatorImpl

- (void)setContentsLuminance:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PUIStyleVibrantMonochromeCoordinatorImpl;
  -[PUIStyleUICoordinatorImpl setContentsLuminance:](&v8, sel_setContentsLuminance_);
  v5 = [[PUIStyleVibrantMonochrome alloc] initWithBackgroundType:a3 <= 0.9];
  [(PUIStyleUICoordinatorImpl *)self setStyle:v5];
  itemView = self->_itemView;
  v7 = [(PUIStyleVibrantMonochrome *)v5 effectiveColor];
  [(UIView *)itemView setBackgroundColor:v7];
}

- (double)itemViewLuminance
{
  v2 = [(PUIStyleUICoordinatorImpl *)self style];
  if ([v2 backgroundType]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

- (id)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = [(PUIStyleUICoordinatorImpl *)self style];
    v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v6 = [v4 effectiveColor];
    [(UIView *)v5 setBackgroundColor:v6];
    v7 = self->_itemView;
    self->_itemView = v5;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void).cxx_destruct
{
}

@end
@interface _PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl
- (double)itemViewLuminance;
- (id)itemView;
- (void)setContentsLuminance:(double)a3;
@end

@implementation _PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl

- (void)setContentsLuminance:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl;
  -[_PREditingPosterContentStyleCoordinatorImpl setContentsLuminance:](&v8, sel_setContentsLuminance_);
  v5 = [[PRPosterContentVibrantMonochromeStyle alloc] initWithBackgroundType:a3 <= 0.9];
  [(_PREditingPosterContentStyleCoordinatorImpl *)self setStyle:v5];
  itemView = self->_itemView;
  v7 = [(PRPosterContentVibrantMonochromeStyle *)v5 effectiveColor];
  [(UIView *)itemView setBackgroundColor:v7];
}

- (double)itemViewLuminance
{
  v2 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
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
    v4 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
    v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
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
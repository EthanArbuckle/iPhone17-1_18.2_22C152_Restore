@interface _PREditingPosterContentStyleCoordinatorImpl
- (PRPosterContentStyle)style;
- (UIView)itemView;
- (UIView)variationSliderThumbView;
- (UIView)variationSliderTrackView;
- (_PREditingPosterContentStyleCoordinatorImpl)initWithStyle:(id)a3;
- (double)contentsLuminance;
- (double)itemViewLuminance;
- (double)variation;
- (id)variationSupportingStyle;
- (void)setContentsLuminance:(double)a3;
- (void)setStyle:(id)a3;
- (void)setVariation:(double)a3;
@end

@implementation _PREditingPosterContentStyleCoordinatorImpl

- (_PREditingPosterContentStyleCoordinatorImpl)initWithStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PREditingPosterContentStyleCoordinatorImpl;
  v6 = [(_PREditingPosterContentStyleCoordinatorImpl *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_style, a3);
    if ([v5 allowsVariation])
    {
      [v5 variation];
      v7->_variation = v8;
    }
  }

  return v7;
}

- (id)variationSupportingStyle
{
  v3 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
  int v4 = [v3 allowsVariation];

  if (v4)
  {
    id v5 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setVariation:(double)a3
{
  id v5 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
  int v6 = [v5 allowsVariation];

  if (v6 && self->_variation != a3)
  {
    self->_variation = a3;
    id v8 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
    v7 = (void *)[v8 copyWithVariation:a3];
    [(_PREditingPosterContentStyleCoordinatorImpl *)self setStyle:v7];
  }
}

- (double)itemViewLuminance
{
  return 0.5;
}

- (UIView)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    int v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    id v5 = self->_itemView;
    self->_itemView = v4;

    itemView = self->_itemView;
  }
  return itemView;
}

- (UIView)variationSliderThumbView
{
  return 0;
}

- (UIView)variationSliderTrackView
{
  return 0;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
}

- (double)variation
{
  return self->_variation;
}

- (PRPosterContentStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
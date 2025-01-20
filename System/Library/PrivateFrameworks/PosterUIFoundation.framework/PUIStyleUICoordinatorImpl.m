@interface PUIStyleUICoordinatorImpl
- (PUIStyle)style;
- (PUIStyleUICoordinatorImpl)initWithStyle:(id)a3;
- (UIView)itemView;
- (UIView)variationSliderThumbView;
- (UIView)variationSliderTrackView;
- (double)contentsLuminance;
- (double)itemViewLuminance;
- (double)variation;
- (id)variationSupportingStyle;
- (void)setContentsLuminance:(double)a3;
- (void)setStyle:(id)a3;
- (void)setVariation:(double)a3;
- (void)setVariation:(double)a3 updateStyle:(BOOL)a4;
@end

@implementation PUIStyleUICoordinatorImpl

- (PUIStyleUICoordinatorImpl)initWithStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUIStyleUICoordinatorImpl;
  v6 = [(PUIStyleUICoordinatorImpl *)&v10 init];
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
  v3 = [(PUIStyleUICoordinatorImpl *)self style];
  int v4 = [v3 allowsVariation];

  if (v4)
  {
    id v5 = [(PUIStyleUICoordinatorImpl *)self style];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setVariation:(double)a3
{
}

- (void)setVariation:(double)a3 updateStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(PUIStyleUICoordinatorImpl *)self style];
  int v8 = [v7 allowsVariation];

  if (v8)
  {
    if (self->_variation != a3)
    {
      self->_variation = a3;
      if (v4)
      {
        id v10 = [(PUIStyleUICoordinatorImpl *)self style];
        v9 = (void *)[v10 copyWithVariation:a3];
        [(PUIStyleUICoordinatorImpl *)self setStyle:v9];
      }
    }
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
    BOOL v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
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

- (PUIStyle)style
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
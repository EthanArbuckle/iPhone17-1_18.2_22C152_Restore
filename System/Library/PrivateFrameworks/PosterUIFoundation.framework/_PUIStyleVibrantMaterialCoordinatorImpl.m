@interface _PUIStyleVibrantMaterialCoordinatorImpl
- (id)itemView;
@end

@implementation _PUIStyleVibrantMaterialCoordinatorImpl

- (id)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    v6 = [MEMORY[0x263F1C6B0] imageNamed:@"material" inBundle:v4 compatibleWithTraitCollection:0];
    v7 = (UIView *)[v5 initWithImage:v6];

    [(UIView *)v7 setContentMode:1];
    v8 = self->_itemView;
    self->_itemView = v7;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void).cxx_destruct
{
}

@end
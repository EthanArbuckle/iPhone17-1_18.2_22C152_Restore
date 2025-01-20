@interface _PREditingPosterContentVibrantMaterialStyleCoordinatorImpl
- (id)itemView;
@end

@implementation _PREditingPosterContentVibrantMaterialStyleCoordinatorImpl

- (id)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    v6 = [MEMORY[0x1E4FB1818] imageNamed:@"material" inBundle:v4 compatibleWithTraitCollection:0];
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
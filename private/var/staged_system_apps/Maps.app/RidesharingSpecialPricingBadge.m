@interface RidesharingSpecialPricingBadge
- (RidesharingSpecialPricingBadge)initWithTemplateImage:(id)a3;
- (id)badgeImageWithMaximumDimension:(double)a3;
@end

@implementation RidesharingSpecialPricingBadge

- (RidesharingSpecialPricingBadge)initWithTemplateImage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RidesharingSpecialPricingBadge;
  v5 = [(RidesharingSpecialPricingBadge *)&v10 init];
  if (v5)
  {
    v6 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    uint64_t v7 = [v4 _flatImageWithColor:v6];
    image = v5->_image;
    v5->_image = (UIImage *)v7;
  }
  return v5;
}

- (id)badgeImageWithMaximumDimension:(double)a3
{
  return [(UIImage *)self->_image _maps_imageWithAspectFitScalingForMaximumDimension:a3];
}

- (void).cxx_destruct
{
}

@end
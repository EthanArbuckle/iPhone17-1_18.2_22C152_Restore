@interface PXLemonadeDetailsViewFactory
+ (id)makeDetailsViewControllerWithPhotosViewConfiguration:(id)a3;
- (PXLemonadeDetailsViewFactory)init;
@end

@implementation PXLemonadeDetailsViewFactory

+ (id)makeDetailsViewControllerWithPhotosViewConfiguration:(id)a3
{
  id v3 = a3;
  _s12PhotosUICore26LemonadeDetailsViewFactoryC04makedE10Controller06photosE13ConfigurationSo06UIViewH0CSo08PXPhotoseJ0C_tFZ_0();
}

- (PXLemonadeDetailsViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LemonadeDetailsViewFactory();
  return [(PXLemonadeDetailsViewFactory *)&v3 init];
}

@end
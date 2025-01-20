@interface PXLemonadeCollectionCustomizationAlbumsFactory
+ (id)albumsCustomizationViewControllerWithRootCollectionList:(id)a3 preselectedAssets:(id)a4 completion:(id)a5;
- (PXLemonadeCollectionCustomizationAlbumsFactory)init;
@end

@implementation PXLemonadeCollectionCustomizationAlbumsFactory

- (PXLemonadeCollectionCustomizationAlbumsFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LemonadeCollectionCustomizationAlbumsFactory();
  return [(PXLemonadeCollectionCustomizationAlbumsFactory *)&v3 init];
}

+ (id)albumsCustomizationViewControllerWithRootCollectionList:(id)a3 preselectedAssets:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (a4)
  {
    sub_1A9B21070(0, (unint64_t *)&qword_1E981C730);
    sub_1AB23AADC();
  }
  if (v7) {
    *(void *)(swift_allocObject() + 16) = v7;
  }
  id v8 = a3;
  sub_1AA257F9C();
}

@end
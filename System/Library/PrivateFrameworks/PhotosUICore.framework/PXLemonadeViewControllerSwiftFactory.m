@interface PXLemonadeViewControllerSwiftFactory
+ (id)viewControllerForSidebarNavigationDestination:(id)a3 photoLibrary:(id)a4 sidebarVisible:(BOOL)a5;
+ (id)viewControllerWithPhotoLibrary:(id)a3;
+ (unint64_t)sidebarRoutingOptionsForDestination:(id)a3;
- (PXLemonadeViewControllerSwiftFactory)init;
@end

@implementation PXLemonadeViewControllerSwiftFactory

+ (id)viewControllerWithPhotoLibrary:(id)a3
{
  type metadata accessor for RootViewControllerFactory();
  v4 = self;
  sub_1A9D01FD8(a3, objc_msgSend(v4, sel_defaultManager));
}

+ (unint64_t)sidebarRoutingOptionsForDestination:(id)a3
{
  id v3 = a3;
  unint64_t v4 = _s12PhotosUICore29LemonadeViewControllerFactoryC21sidebarRoutingOptions3forSo024PXProgrammaticNavigationhI0VSo0kL11DestinationC_tFZ_0(v3);

  return v4;
}

+ (id)viewControllerForSidebarNavigationDestination:(id)a3 photoLibrary:(id)a4 sidebarVisible:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)_s12PhotosUICore29LemonadeViewControllerFactoryC04rootdE031forSidebarNavigationDestination12photoLibrary17selectionDelegate19pickerConfiguration14sidebarVisibleSo06UIViewE0CSo014PXProgrammaticjK0C_So07PHPhotoM0CAA0c6Pickera9SelectionO0_pSgAA0wQ0CSgSbtFZ_0(v7, v8, 0, 0, 0, v5);

  return v9;
}

- (PXLemonadeViewControllerSwiftFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LemonadeViewControllerFactory();
  return [(PXLemonadeViewControllerSwiftFactory *)&v3 init];
}

@end
@interface PXPlacesUtils
- (id)pkExtendedTraitCollectionFromPXExtendedTraitCollection:(id)a3;
@end

@implementation PXPlacesUtils

- (id)pkExtendedTraitCollectionFromPXExtendedTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKExtendedTraitCollection);
  -[PKExtendedTraitCollection setLayoutSizeClass:](v4, "setLayoutSizeClass:", [v3 layoutSizeClass]);
  -[PKExtendedTraitCollection setLayoutSizeSubclass:](v4, "setLayoutSizeSubclass:", [v3 layoutSizeSubclass]);
  -[PKExtendedTraitCollection setUserInterfaceIdiom:](v4, "setUserInterfaceIdiom:", [v3 userInterfaceIdiom]);
  -[PKExtendedTraitCollection setUserInterfaceStyle:](v4, "setUserInterfaceStyle:", [v3 userInterfaceStyle]);
  [v3 displayScale];
  double v6 = v5;

  [(PKExtendedTraitCollection *)v4 setDisplayScale:v6];
  return v4;
}

@end
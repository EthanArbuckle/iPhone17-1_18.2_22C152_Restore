@interface PXCuratedLibraryDaysTopHeaderSpec
- (PXCuratedLibraryDaysTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
@end

@implementation PXCuratedLibraryDaysTopHeaderSpec

- (PXCuratedLibraryDaysTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryDaysTopHeaderSpec;
  v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v8, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  if (v6)
  {
    +[PXCuratedLibrarySettings sharedInstance];
    objc_claimAutoreleasedReturnValue();
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setIsFloating:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setEllipsisButtonSpecialTreatment:a5 != 0];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 curatedLibraryEdgeToEdgeContentDefaultPadding];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v6, "setPadding:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 padding];
    PXEdgeInsetsForEdges();
  }
  return 0;
}

@end
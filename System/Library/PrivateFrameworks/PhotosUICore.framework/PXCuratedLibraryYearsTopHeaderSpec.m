@interface PXCuratedLibraryYearsTopHeaderSpec
- (PXCuratedLibraryYearsTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
@end

@implementation PXCuratedLibraryYearsTopHeaderSpec

- (PXCuratedLibraryYearsTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryYearsTopHeaderSpec;
  v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v9, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  v7 = v6;
  if (v6)
  {
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v6 setIsFloating:1];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v7 setEllipsisButtonSpecialTreatment:a5 != 0];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v7 curatedLibraryEdgeToEdgeContentDefaultPadding];
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v7, "setPadding:");
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v7 padding];
    PXEdgeInsetsForEdges();
  }
  return 0;
}

@end
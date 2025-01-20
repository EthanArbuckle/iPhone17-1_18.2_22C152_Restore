@interface UISheetPresentationController
- (NSArray)_maps_effectiveDetentValues;
@end

@implementation UISheetPresentationController

- (NSArray)_maps_effectiveDetentValues
{
  v2 = [(UISheetPresentationController *)self _detentValues];
  v3 = sub_100099700(v2, &stru_1012E8B70);

  return (NSArray *)v3;
}

@end
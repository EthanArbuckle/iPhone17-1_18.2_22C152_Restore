@interface PXPlacesGeotaggableSortDescriptor
- (int64_t)compareObject:(id)a3 toObject:(id)a4;
@end

@implementation PXPlacesGeotaggableSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  return [a3 compareTo:a4];
}

@end
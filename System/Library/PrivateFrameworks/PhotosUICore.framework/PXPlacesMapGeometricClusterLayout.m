@interface PXPlacesMapGeometricClusterLayout
- (BOOL)_shapeAtCoordinate:(CLLocationCoordinate2D)a3 overlapsShapeAtCoordinate:(CLLocationCoordinate2D)a4 forViewPort:(id)a5;
- (PXPlacesMapGeometricClusterLayout)init;
- (double)clusteringDistance;
- (id)_clusterGeotaggables:(id)a3 forViewPort:(id)a4;
- (id)_findClusterOverlappingGeotaggable:(id)a3 fromClusters:(id)a4 forViewPort:(id)a5;
- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4;
- (void)setClusteringDistance:(double)a3;
@end

@implementation PXPlacesMapGeometricClusterLayout

- (void)setClusteringDistance:(double)a3
{
  self->_clusteringDistance = a3;
}

- (double)clusteringDistance
{
  return self->_clusteringDistance;
}

- (BOOL)_shapeAtCoordinate:(CLLocationCoordinate2D)a3 overlapsShapeAtCoordinate:(CLLocationCoordinate2D)a4 forViewPort:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  CLLocationDegrees v7 = a3.longitude;
  CLLocationDegrees v8 = a3.latitude;
  id v10 = a5;
  [(PXPlacesMapGeometricClusterLayout *)self clusteringDistance];
  double v12 = v11;
  [v10 scale];
  double v14 = v13;

  v18.CLLocationDegrees latitude = v8;
  v18.CLLocationDegrees longitude = v7;
  MKMapPoint v15 = MKMapPointForCoordinate(v18);
  v19.CLLocationDegrees latitude = latitude;
  v19.CLLocationDegrees longitude = longitude;
  MKMapPoint v16 = MKMapPointForCoordinate(v19);
  return sqrt((v15.x - v16.x) * (v15.x - v16.x) + (v15.y - v16.y) * (v15.y - v16.y)) < v12 * v14 + v12 * v14;
}

- (id)_findClusterOverlappingGeotaggable:(id)a3 fromClusters:(id)a4 forViewPort:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        MKMapPoint v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "coordinate", (void)v25);
        double v18 = v17;
        double v20 = v19;
        [v8 coordinate];
        if (-[PXPlacesMapGeometricClusterLayout _shapeAtCoordinate:overlapsShapeAtCoordinate:forViewPort:](self, "_shapeAtCoordinate:overlapsShapeAtCoordinate:forViewPort:", v10, v18, v20, v21, v22))
        {
          id v23 = v16;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v23 = 0;
LABEL_11:

  return v23;
}

- (id)_clusterGeotaggables:(id)a3 forViewPort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA70] orderedSet];
  v32 = v6;
  v31 = [v6 allObjects];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  [v9 sortUsingComparator:&__block_literal_global_277299];
  while ([v9 count])
  {
    id v10 = [v9 firstObject];
    [v9 removeObjectAtIndex:0];
    id v11 = [(PXPlacesMapGeometricClusterLayout *)self _findClusterOverlappingGeotaggable:v10 fromClusters:v8 forViewPort:v7];
    uint64_t v12 = v11;
    if (v11)
    {
      [v11 addGeotaggable:v10];
    }
    else
    {
      uint64_t v13 = [PXPlacesMapLayoutItemImpl alloc];
      [v10 coordinate];
      uint64_t v14 = -[PXPlacesMapLayoutItemImpl initWithCoordinate:](v13, "initWithCoordinate:");
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [v15 addObject:v10];
      [v10 coordinate];
      MKMapPoint v16 = MKMapPointForCoordinate(v34);
      [(PXPlacesMapGeometricClusterLayout *)self clusteringDistance];
      double v18 = v16.x - v17 * 0.5;
      [(PXPlacesMapGeometricClusterLayout *)self clusteringDistance];
      double v20 = v16.y - v19 * 0.5;
      [(PXPlacesMapGeometricClusterLayout *)self clusteringDistance];
      double v22 = v21;
      [(PXPlacesMapGeometricClusterLayout *)self clusteringDistance];
      double v24 = v23;
      long long v25 = [(PXPlacesMapLayout *)self dataSource];
      long long v26 = objc_msgSend(v25, "findItemsInMapRect:", v18, v20, v22, v24);

      if (v26 && [v26 count])
      {
        long long v27 = [v26 allObjects];
        [v9 removeObjectsInArray:v27];

        [v15 unionSet:v26];
      }
      long long v28 = [MEMORY[0x1E4F1CAA0] orderedSetWithSet:v15];
      [(PXPlacesMapLayoutItemImpl *)v14 addGeotaggables:v28];

      [v8 addObject:v14];
    }
  }
  v29 = (void *)[v8 copy];

  return v29;
}

uint64_t __70__PXPlacesMapGeometricClusterLayout__clusterGeotaggables_forViewPort___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compareTo:a2];
}

- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PXPlacesMapGeometricClusterLayout.m" lineNumber:33 description:@"-[PXPlacesMapClusterLayout layout] viewPort cannot be nil"];
  }
  id v9 = [(PXPlacesMapLayout *)self dataSource];

  if (!v9)
  {
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PXPlacesMapGeometricClusterLayout.m" lineNumber:34 description:@"-[PXPlacesMapClusterLayout layout] dataSource cannot be nil"];
  }
  [v7 mapRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(PXPlacesMapLayout *)self dataSource];
  double v19 = objc_msgSend(v18, "findItemsInMapRect:", v11, v13, v15, v17);

  double v20 = [(PXPlacesMapGeometricClusterLayout *)self _clusterGeotaggables:v19 forViewPort:v7];
  double v21 = objc_alloc_init(PXPlacesMapLayoutResultImpl);
  [(PXPlacesMapLayoutResultImpl *)v21 addItems:v20];

  return v21;
}

- (PXPlacesMapGeometricClusterLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPlacesMapGeometricClusterLayout;
  result = [(PXPlacesMapGeometricClusterLayout *)&v3 init];
  if (result) {
    result->_clusteringDistance = 30.0;
  }
  return result;
}

@end
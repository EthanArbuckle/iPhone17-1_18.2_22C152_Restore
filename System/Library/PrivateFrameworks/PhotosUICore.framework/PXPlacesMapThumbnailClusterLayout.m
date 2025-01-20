@interface PXPlacesMapThumbnailClusterLayout
- (BOOL)_zoom:(double)a3 isEqualToZoom:(double)a4;
- (NSArray)geotaggablesSortDescriptors;
- (PXPlacesMapLayoutResult)currentMapLayoutResult;
- (double)horizontalClusteringDistancePixels;
- (double)verticalClusteringDistancePixels;
- (id)_clusterGeotaggables:(id)a3 fromMapRect:(id)a4 viewPort:(id)a5;
- (id)_clusterGeotaggables:(id)a3 usingHorizontalClusteringDistance:(double)a4 verticalClusteringDistance:(double)a5 viewPort:(id)a6 dataSource:(id)a7 primaryLayoutGeotaggables:(id)a8 maskToMapRect:(id)a9;
- (id)_clusterGeotaggablesInRect:(id)a3 forViewPort:(id)a4;
- (id)_clusterGeotaggablesInViewPort:(id)a3;
- (id)_mutableSortedOrderdGeotaggablesSetFromSet:(id)a3;
- (id)_primaryGeotaggleInLayoutItem:(id)a3;
- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4;
- (unint64_t)_viewPortChangeTypeFrom:(id)a3 to:(id)a4;
- (unint64_t)currentChangeType;
- (void)_sortGeotaggables:(id)a3;
- (void)setCurrentChangeType:(unint64_t)a3;
- (void)setCurrentMapLayoutResult:(id)a3;
- (void)setGeotaggablesSortDescriptors:(id)a3;
- (void)setHorizontalClusteringDistancePixels:(double)a3;
- (void)setVerticalClusteringDistancePixels:(double)a3;
@end

@implementation PXPlacesMapThumbnailClusterLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geotaggablesSortDescriptors, 0);
  objc_storeStrong((id *)&self->_currentMapLayoutResult, 0);
}

- (void)setGeotaggablesSortDescriptors:(id)a3
{
}

- (void)setCurrentChangeType:(unint64_t)a3
{
  self->_currentChangeType = a3;
}

- (unint64_t)currentChangeType
{
  return self->_currentChangeType;
}

- (void)setCurrentMapLayoutResult:(id)a3
{
}

- (PXPlacesMapLayoutResult)currentMapLayoutResult
{
  return self->_currentMapLayoutResult;
}

- (void)setVerticalClusteringDistancePixels:(double)a3
{
  self->_verticalClusteringDistancePixels = a3;
}

- (double)verticalClusteringDistancePixels
{
  return self->_verticalClusteringDistancePixels;
}

- (void)setHorizontalClusteringDistancePixels:(double)a3
{
  self->_horizontalClusteringDistancePixels = a3;
}

- (double)horizontalClusteringDistancePixels
{
  return self->_horizontalClusteringDistancePixels;
}

- (BOOL)_zoom:(double)a3 isEqualToZoom:(double)a4
{
  return vabdd_f64(a3, a4) < 0.01;
}

- (unint64_t)_viewPortChangeTypeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 pitch];
  double v9 = v8;
  [v6 pitch];
  if (v9 <= v10)
  {
    [v7 pitch];
    double v13 = v12;
    [v6 pitch];
    if (v13 >= v14)
    {
      [v6 zoomLevel];
      double v16 = v15;
      [v7 zoomLevel];
      if ([(PXPlacesMapThumbnailClusterLayout *)self _zoom:v16 isEqualToZoom:v17])
      {
        unint64_t v11 = 0;
      }
      else
      {
        [v6 scale];
        double v19 = v18;
        [v7 scale];
        if (v19 > v20) {
          unint64_t v11 = 1;
        }
        else {
          unint64_t v11 = 2;
        }
      }
    }
    else
    {
      unint64_t v11 = 4;
    }
  }
  else
  {
    unint64_t v11 = 3;
  }

  return v11;
}

- (NSArray)geotaggablesSortDescriptors
{
  v8[1] = *MEMORY[0x1E4F143B8];
  geotaggablesSortDescriptors = self->_geotaggablesSortDescriptors;
  if (!geotaggablesSortDescriptors)
  {
    v4 = objc_alloc_init(PXPlacesGeotaggableSortDescriptor);
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = self->_geotaggablesSortDescriptors;
    self->_geotaggablesSortDescriptors = v5;

    geotaggablesSortDescriptors = self->_geotaggablesSortDescriptors;
  }
  return geotaggablesSortDescriptors;
}

- (id)_primaryGeotaggleInLayoutItem:(id)a3
{
  v3 = [a3 geotaggables];
  v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_sortGeotaggables:(id)a3
{
}

uint64_t __55__PXPlacesMapThumbnailClusterLayout__sortGeotaggables___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compareTo:a2];
}

- (id)_mutableSortedOrderdGeotaggablesSetFromSet:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithSet:v5];

  [(PXPlacesMapThumbnailClusterLayout *)self _sortGeotaggables:v6];
  return v6;
}

- (id)_clusterGeotaggables:(id)a3 usingHorizontalClusteringDistance:(double)a4 verticalClusteringDistance:(double)a5 viewPort:(id)a6 dataSource:(id)a7 primaryLayoutGeotaggables:(id)a8 maskToMapRect:(id)a9
{
  double var0 = a9.var1.var0;
  double rect = a9.var1.var1;
  double var1 = a9.var0.var1;
  double v9 = a9.var0.var0;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  double v19 = (void *)MEMORY[0x1E4F1CAD0];
  double v20 = [v15 set];
  v21 = [v19 setWithSet:v20];

  id v22 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v66 = v16;
  [v16 scale];
  double v24 = v23 * a4 + v23 * a4;
  double v25 = v23 * a5 + v23 * a5;
  unint64_t v26 = 0x1E4F1C000uLL;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  double v73 = v25;
  double v74 = v24;
  double v71 = v25 * 0.5;
  double v72 = v24 * 0.5;
  v68 = v17;
  v69 = v15;
  id v67 = v27;
  while ([v18 count] || objc_msgSend(v15, "count"))
  {
    if ([v18 count]) {
      v28 = v18;
    }
    else {
      v28 = v15;
    }
    uint64_t v29 = [v28 firstObject];
    v30 = v28;
    v31 = (void *)v29;
    [v30 removeObjectAtIndex:0];
    v32 = [v22 objectForKey:v31];
    if (!v32)
    {
      [v31 coordinate];
      double latitude = v95.latitude;
      double longitude = v95.longitude;
      MKMapPoint v35 = MKMapPointForCoordinate(v95);
      v100.origin.double x = v9;
      v100.origin.double y = var1;
      v100.size.width = var0;
      v100.size.height = rect;
      BOOL v36 = MKMapRectContainsPoint(v100, v35);
      v32 = 0;
      if (v36)
      {
        id v37 = objc_alloc_init(*(Class *)(v26 + 2672));
        [v37 addObject:v31];
        v38 = -[PXPlacesMapLayoutItemImpl initWithCoordinate:]([PXPlacesMapLayoutItemImpl alloc], "initWithCoordinate:", latitude, longitude);
        v76 = v37;
        [(PXPlacesMapLayoutItemImpl *)v38 addGeotaggables:v37];
        [v22 setObject:v38 forKey:v31];
        v81 = v38;
        [v27 addObject:v38];
        v101.origin.double x = v35.x - v72;
        v101.origin.double y = v35.y - v71;
        v101.size.height = v73;
        v101.size.width = v74;
        v103.origin.double x = v9;
        v103.origin.double y = var1;
        v103.size.width = var0;
        v103.size.height = rect;
        MKMapRect v102 = MKMapRectIntersection(v101, v103);
        v39 = objc_msgSend(v17, "findItemsInMapRect:", v102.origin.x, v102.origin.y, v102.size.width, v102.size.height);
        v40 = v39;
        if (v39)
        {
          v75 = v39;
          uint64_t v41 = [v39 count];
          v40 = v75;
          if (v41)
          {
            v70 = v31;
            v42 = [(PXPlacesMapThumbnailClusterLayout *)self geotaggablesSortDescriptors];
            v43 = [v75 sortedArrayUsingDescriptors:v42];

            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v44 = v43;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v87 objects:v92 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v88;
              do
              {
                for (uint64_t i = 0; i != v46; ++i)
                {
                  if (*(void *)v88 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  v49 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  if ([v21 containsObject:v49]
                    && ([(PXPlacesMapThumbnailClusterLayout *)self currentChangeType] == 2
                     || ([v18 containsObject:v49] & 1) == 0))
                  {
                    v50 = [v22 objectForKey:v49];
                    if (v50)
                    {
                      id v51 = v18;
                      v52 = [(PXPlacesMapThumbnailClusterLayout *)self _primaryGeotaggleInLayoutItem:v50];
                      if (([v52 isEqual:v49] & 1) == 0)
                      {
                        [v50 coordinate];
                        MKMapPoint v53 = MKMapPointForCoordinate(v96);
                        [v49 coordinate];
                        MKMapPoint v98 = MKMapPointForCoordinate(v97);
                        double x = v98.x;
                        double y = v98.y;
                        double v56 = MKMetersBetweenMapPoints(v98, v35);
                        v99.double x = x;
                        v99.double y = y;
                        if (v56 < MKMetersBetweenMapPoints(v99, v53)) {
                          [v22 setObject:v81 forKey:v49];
                        }
                      }

                      id v18 = v51;
                    }
                    else
                    {
                      [v80 addObject:v49];
                      [v22 setObject:v81 forKey:v49];
                    }
                  }
                }
                uint64_t v46 = [v44 countByEnumeratingWithState:&v87 objects:v92 count:16];
              }
              while (v46);
            }

            id v17 = v68;
            id v15 = v69;
            id v27 = v67;
            unint64_t v26 = 0x1E4F1C000;
            v31 = v70;
            v40 = v75;
          }
        }

        v32 = 0;
      }
    }
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v57 = v80;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v84 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v83 + 1) + 8 * j);
        v63 = [v22 objectForKey:v62];
        v64 = v63;
        if (v63) {
          [v63 addGeotaggable:v62];
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v59);
  }

  return v67;
}

- (id)_clusterGeotaggables:(id)a3 fromMapRect:(id)a4 viewPort:(id)a5
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v7 = a4.var0.var1;
  double v8 = a4.var0.var0;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  double v12 = [(PXPlacesMapThumbnailClusterLayout *)self _mutableSortedOrderdGeotaggablesSetFromSet:a3];
  double v13 = [MEMORY[0x1E4F1CA70] orderedSet];
  double v14 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
  id v15 = [v14 layoutItems];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = -[PXPlacesMapThumbnailClusterLayout _primaryGeotaggleInLayoutItem:](self, "_primaryGeotaggleInLayoutItem:", *(void *)(*((void *)&v29 + 1) + 8 * i), (void)v29);
        [v21 coordinate];
        MKMapPoint v37 = MKMapPointForCoordinate(v36);
        v38.origin.double x = v8;
        v38.origin.double y = v7;
        v38.size.width = var0;
        v38.size.height = var1;
        if (MKMapRectContainsPoint(v38, v37)) {
          [v13 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }

  [(PXPlacesMapThumbnailClusterLayout *)self horizontalClusteringDistancePixels];
  double v23 = v22;
  [(PXPlacesMapThumbnailClusterLayout *)self verticalClusteringDistancePixels];
  double v25 = v24;
  unint64_t v26 = [(PXPlacesMapLayout *)self dataSource];
  id v27 = -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggables:usingHorizontalClusteringDistance:verticalClusteringDistance:viewPort:dataSource:primaryLayoutGeotaggables:maskToMapRect:](self, "_clusterGeotaggables:usingHorizontalClusteringDistance:verticalClusteringDistance:viewPort:dataSource:primaryLayoutGeotaggables:maskToMapRect:", v12, v11, v26, v13, v23, v25, v8, v7, var0, var1);

  return v27;
}

- (id)_clusterGeotaggablesInRect:(id)a3 forViewPort:(id)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  id v9 = a4;
  double v10 = [(PXPlacesMapLayout *)self dataSource];
  id v11 = objc_msgSend(v10, "findItemsInMapRect:", v7, v6, var0, var1);

  double v12 = -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggables:fromMapRect:viewPort:](self, "_clusterGeotaggables:fromMapRect:viewPort:", v11, v9, v7, v6, var0, var1);

  return v12;
}

- (id)_clusterGeotaggablesInViewPort:(id)a3
{
  id v4 = a3;
  [v4 mapRect];
  id v5 = -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggablesInRect:forViewPort:](self, "_clusterGeotaggablesInRect:forViewPort:", v4);

  return v5;
}

- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2 object:self file:@"PXPlacesMapThumbnailClusterLayout.m" lineNumber:53 description:@"-[PXPlacesMapThumbnailClusterLayout layout] viewPort cannot be nil"];
  }
  id v9 = [(PXPlacesMapLayout *)self dataSource];

  if (!v9)
  {
    uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2 object:self file:@"PXPlacesMapThumbnailClusterLayout.m" lineNumber:54 description:@"-[PXPlacesMapClusterLayout layout] dataSource cannot be nil"];
  }
  [(PXPlacesMapThumbnailClusterLayout *)self horizontalClusteringDistancePixels];
  if (v10 <= 0.0)
  {
    uint64_t v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2 object:self file:@"PXPlacesMapThumbnailClusterLayout.m" lineNumber:55 description:@"-[PXPlacesMapClusterLayout layout] horizontalClusteringDistancePixels cannot be <= 0"];
  }
  [(PXPlacesMapThumbnailClusterLayout *)self verticalClusteringDistancePixels];
  if (v11 <= 0.0)
  {
    uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2 object:self file:@"PXPlacesMapThumbnailClusterLayout.m" lineNumber:56 description:@"-[PXPlacesMapClusterLayout layout] verticalClusteringDistancePixels cannot be <= 0"];
  }
  if ([v8 hasChanges]) {
    [(PXPlacesMapThumbnailClusterLayout *)self setCurrentMapLayoutResult:0];
  }
  uint64_t v12 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
  if (v12)
  {
    double v13 = (void *)v12;
    double v14 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
    id v15 = [v14 viewPort];
    if ([v15 isEqual:v7])
    {
      char v16 = [v8 hasChanges];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
        goto LABEL_41;
      }
    }
    else
    {
    }
  }
  uint64_t v18 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
  uint64_t v19 = [v18 viewPort];
  unint64_t v20 = [(PXPlacesMapThumbnailClusterLayout *)self _viewPortChangeTypeFrom:v19 to:v7];

  [(PXPlacesMapThumbnailClusterLayout *)self setCurrentChangeType:v20];
  uint64_t v21 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
  if (!v21) {
    goto LABEL_33;
  }
  double v22 = (void *)v21;
  double v23 = [(PXPlacesMapThumbnailClusterLayout *)self currentMapLayoutResult];
  double v24 = [v23 layoutItems];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v27 = [v7 viewPortsBySplitingAt180thMerdian];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      id v48 = v7;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          switch(v20)
          {
            case 0uLL:
              goto LABEL_27;
            case 1uLL:
              id v33 = [(PXPlacesMapThumbnailClusterLayout *)self _handleZoomInToViewPort:*(void *)(*((void *)&v49 + 1) + 8 * i)];
              break;
            case 2uLL:
              id v33 = [(PXPlacesMapThumbnailClusterLayout *)self _handleZoomOutToViewPort:*(void *)(*((void *)&v49 + 1) + 8 * i)];
              break;
            case 3uLL:
              goto LABEL_28;
            case 4uLL:
              [*(id *)(*((void *)&v49 + 1) + 8 * i) pitch];
              if (v34 == 0.0)
              {
LABEL_27:
                id v33 = [(PXPlacesMapThumbnailClusterLayout *)self _handlePanToViewPort:v32 dataSourceChange:v8];
              }
              else
              {
LABEL_28:
                id v33 = [(PXPlacesMapThumbnailClusterLayout *)self _handlePitchChangeToViewPort:v32 dataSourceChange:v8];
              }
              break;
            default:
              id v33 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
              break;
          }
          MKMapPoint v35 = v33;
          [v26 unionOrderedSet:v33];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v29);
      id v7 = v48;
    }
  }
  else
  {
LABEL_33:
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v27 = [v7 viewPortsBySplitingAt180thMerdian];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v36 = [v27 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v27);
          }
          v40 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          [v40 mapRect];
          uint64_t v41 = -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggablesInRect:forViewPort:](self, "_clusterGeotaggablesInRect:forViewPort:", v40);
          [v26 unionOrderedSet:v41];
        }
        uint64_t v37 = [v27 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v37);
    }
  }
  v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithOrderedSet:v26];

  uint64_t v17 = objc_alloc_init(PXPlacesMapLayoutResultImpl);
  [(PXPlacesMapLayoutResultImpl *)v17 addItems:v42];
  [(PXPlacesMapLayoutResultImpl *)v17 setViewPort:v7];
  [(PXPlacesMapThumbnailClusterLayout *)self setCurrentMapLayoutResult:v17];

LABEL_41:
  return v17;
}

@end
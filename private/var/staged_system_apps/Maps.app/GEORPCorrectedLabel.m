@interface GEORPCorrectedLabel
- (void)populateWithLabelMarker:(id)a3;
@end

@implementation GEORPCorrectedLabel

- (void)populateWithLabelMarker:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [v4 featureHandles];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = sub_100581B2C(*(void **)(*((void *)&v19 + 1) + 8 * (void)v9));
        [(GEORPCorrectedLabel *)self addFeatureHandle:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  -[GEORPCorrectedLabel setUid:](self, "setUid:", [v4 featureID]);
  v11 = [v4 mapRegion];
  [(GEORPCorrectedLabel *)self setFeatureRegion:v11];

  id v12 = objc_alloc_init((Class)GEOLatLng);
  [(GEORPCorrectedLabel *)self setCoordinate:v12];

  [v4 coordinate];
  double v14 = v13;
  v15 = [(GEORPCorrectedLabel *)self coordinate];
  [v15 setLat:v14];

  [v4 coordinate];
  double v17 = v16;
  v18 = [(GEORPCorrectedLabel *)self coordinate];
  [v18 setLng:v17];
}

@end
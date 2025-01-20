@interface PXChangeAssetLocationAction
- (PXAnnotatedLocation)annotatedLocation;
- (PXChangeAssetLocationAction)initWithAssets:(id)a3 annotatedLocation:(id)a4 sourceType:(int64_t)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)analyticsActionString;
- (id)analyticsPlaceLevelString;
- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4;
- (int64_t)sourceType;
@end

@implementation PXChangeAssetLocationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotatedLocation, 0);
  objc_storeStrong((id *)&self->_preciseLocation, 0);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (PXAnnotatedLocation)annotatedLocation
{
  return self->_annotatedLocation;
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  if (a4) {
    *a4 = self->_shifted;
  }
  return self->_preciseLocation;
}

- (id)analyticsPlaceLevelString
{
  v2 = [(PXAnnotatedLocation *)self->_annotatedLocation placeAnnotation];
  v3 = [v2 placeLevelAsString];

  return v3;
}

- (id)analyticsActionString
{
  unint64_t v2 = [(PXChangeAssetLocationAction *)self sourceType];
  if (v2 > 3) {
    return @"unknown";
  }
  else {
    return *(&off_1E5DB0D20 + v2);
  }
}

- (id)actionNameLocalizationKey
{
  return @"PXChangeLocationActionName";
}

- (id)actionIdentifier
{
  return @"ChangeAssetsLocation";
}

- (PXChangeAssetLocationAction)initWithAssets:(id)a3 annotatedLocation:(id)a4 sourceType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9) {
    PXFilter();
  }
  id v10 = v8;
  v30.receiver = self;
  v30.super_class = (Class)PXChangeAssetLocationAction;
  v11 = [(PXAssetsAction *)&v30 initWithAssets:v10];
  v12 = v11;
  if (v11)
  {
    v11->_sourceType = a5;
    objc_storeStrong((id *)&v11->_annotatedLocation, a4);
    id v13 = [v9 location];
    v14 = v13;
    if (v13 && ([v13 horizontalAccuracy], v15 == 0.0))
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [v14 coordinate];
      double v18 = v17;
      double v20 = v19;
      [v14 altitude];
      double v22 = v21;
      [v14 verticalAccuracy];
      double v24 = v23;
      v25 = [v14 timestamp];
      v26 = (CLLocation *)objc_msgSend(v16, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v25, v18, v20, v22, 1.0, v24);
    }
    else
    {
      v26 = v14;
    }

    preciseLocation = v12->_preciseLocation;
    v12->_preciseLocation = v26;

    if (v12->_preciseLocation)
    {
      v28 = [v9 location];
      [v28 coordinate];
      v12->_shifted = objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:");
    }
    else
    {
      v12->_shifted = 0;
    }
  }

  return v12;
}

BOOL __75__PXChangeAssetLocationAction_initWithAssets_annotatedLocation_sourceType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 location];
  BOOL v3 = v2 != 0;

  return v3;
}

@end